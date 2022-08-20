Attribute VB_Name = "Module_����6"
' ����� Capacity
' ����� ���������:
' "���� �5",
' "��������� ���������� � ������� PA �� � �� � BASE\Clients: Capacity_PA_Date, Capacity_PA, Capacity_PA_CC_Date, Capacity_PA_CC"
' �������� "���-�� ������ �� ������" "���� ������ �� ������" � ����� ������
Sub �����_Capacity()
  
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult, allNameStr, currentNameStr_Range, cellSum As String
Dim i, rowCount, countClient, countCredCard, �������, �������_�_PA_��, ������_PA, �����_PA_��, �_��_PA_��, ������_��_PA_��, row_���������_��1, �������_�_PA, �������_���_��, ������_��, ����������_�����������, ����������_���_��, ����������_������_��, ����������_�����_��� As Integer
Dim rowForWriteInSheet6, currentNameStr_Row, currentNameStr_Column, row_�����_��_��� As Byte
Dim finishProcess As Boolean
' Dim  As Double
Dim dateReportCapacity As Date
        
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsb), *.xlsb", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� ������..."
  
    ' ���������� ������ ���������
    finishProcess = False

    ' ������� ��� ���� ������ �� ����� �����
    ReportName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����6").Activate
    ThisWorkbook.Sheets("����6").Range("A1").Select

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "������� (�����)", 7, Date)
    
    ' ���� ������ ������ ���������, �� ��������� ���������
    If CheckFormatReportResult = "OK" Then
      
      ' ��������� BASE\Clients
      OpenBookInBase ("Clients")
            
      ' ��������� ���� ������ Capacity. ���� "��� ��������". ������ "�� - �������� - ��� �������� - ��������� �������� - ��������".
      dateReportCapacity = dateReportFromCapacity(ReportName_String, "��� ��������")
      ' � B2 Jnxtn c __ �� ___
      ThisWorkbook.Sheets("����6").Range("B2").Value = "����� �����-������� � " + strDDMM(monthStartDate(dateReportCapacity)) + " �� " + CStr(dateReportCapacity) + " �."
      ' ������
      ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "������:", 100, 100) + 1).Value = WeekNumber(dateReportCapacity)
      ' ����:
      ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "����:", 100, 100) + 1).Value = ThisWorkbook.Sheets("����6").Range("B2").Value
      ' ������ �����������:
      ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)
      
      ' ���������� ��� ������� ������ �� �����������
      ThisWorkbook.Sheets("����6").Rows("6:20").EntireRow.Hidden = False

      ' ������� ������ ������
      Call clear�ontents2(ThisWorkbook.Name, "����6", "A6", "AI40")
      
      ' ���� �1 �������� �� �� �������� ������
            
      ' ���������� �������� ������ ������� �������
      ������_������_�������_����� = False
      ' ����� ������ ��� ������ �� ����� 6 (��� "������ �� �� ������" +2)
      rowForWriteInSheet6 = rowByValue(ThisWorkbook.Name, "����6", "������ �� �� ������", 100, 100) + 2
      ' ���� ������ �����������
      allNameStr = ""
      ' ����� ����� �� ������: �6+�11+...
      cellSum = ""
      
      ' ��������� �� ������� "������� (�����)" � ��������� ��� ������� �������
      Call openPivotTables_Capacity_�������_�����(ReportName_String)
                
      ' ������������ �����
      ' ���� �� 5-�� ������
      For i = 1 To 5
        
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ���������� "�� ""���������"""
            officeNameInReport = "�� ""���������""" ' "���������"
            officeNameInReport2 = "���������"
          Case 2 ' �� ����������� "��2""����������"""
            officeNameInReport = "��2""����������""" ' "����������"
            officeNameInReport2 = "����������"
          Case 3 ' �� ���������������� "��2 ""���������������"""
            officeNameInReport = "��2 ""���������������""" ' "���������������"
            officeNameInReport2 = "���������������"
          Case 4 ' �� ���������������� "��2""���������������"""
            officeNameInReport = "��2""���������������""" ' "���������������"
            officeNameInReport2 = "���������������"
          Case 5 ' �� ������-���� "��2 ""�����-����"""
            officeNameInReport = "��2 ""�����-����""" ' "�����-����"
            officeNameInReport2 = "�����-����"
        End Select
                
        ' ���� i
        ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 1).Value = CStr(i)
        ' ���� ������������
        ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).Value = getNameOfficeByNumber(i)
        ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).HorizontalAlignment = xlLeft
        
        ' ���� ���� ������
        ' Call setColorCells(ThisWorkbook.Name, "����6", rowForWriteInSheet6, 2, rowForWriteInSheet6, 26)
        Call setColorCells(ThisWorkbook.Name, "����6", rowForWriteInSheet6, 2, rowForWriteInSheet6, 34)
        
        ' �����
        If cellSum = "" Then
          cellSum = ConvertToLetter(3) + CStr(rowForWriteInSheet6)
        Else
          cellSum = cellSum + "+" + ConvertToLetter(3) + CStr(rowForWriteInSheet6)
        End If
        ' ����� ������ ������ �� ����� 6
        rowForWriteInSheet6 = rowForWriteInSheet6 + 1

        ' ��������� ������ ������� � ��� �� ����� �� Addr.Book
        rowCount = rowByValue(ThisWorkbook.Name, "Addr.Book", "���", 100, 100) + 2
        Do While ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value <> ""
          
          ' ���� ��� ��i � �������i ��� ���i + ��� ���i
          If (ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 4).Value = "��" + CStr(i)) And ((ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value = "�������" + CStr(i)) Or (ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value = "���" + CStr(i)) Or (ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value = "���" + CStr(i))) Then
            
            ' ������� � ���� 6
            ' ��� ����������
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).Value = �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 2).Value, 3)
            allNameStr = allNameStr + ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).Value + ","
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).HorizontalAlignment = xlRight
            
            ' ��������� ��� ���������� � ������� ����� ��� �������� ������� ������ �� � ��
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 35).Value = ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 2).Value
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 35).HorizontalAlignment = xlLeft
            
            ' �������
            ' ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 3).Value = 0
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 3).HorizontalAlignment = xlRight
            ' ������ ��
            ' ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 4).Value = 0
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 4).HorizontalAlignment = xlRight
            ' ����
            ' ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 5).Value = 0
            ThisWorkbook.Sheets("����6").Cells(rowForWriteInSheet6, 5).HorizontalAlignment = xlRight
            rowForWriteInSheet6 = rowForWriteInSheet6 + 1
          End If
         
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = "������������ ������� " + officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
                
        ' �������� �������� ������ �� ����� ��� � AQ2
        ThisWorkbook.Sheets("����6").Range("AQ2").Value = allNameStr
                
        ' ��������� ������
        ' ���-�� �������� (��)
        countClient = 0
        ' ���-�� ������ �� �� (��)
        countCredCard = 0
        
        ' �������� �� ������ "������/�������" +1
        rowCount = rowByValue(ReportName_String, "������� (�����)", "������/�������", 100, 100) + 1
        
        ' ���������� ������ �������� �� ����� "������� (�����)"
        Column_�����_�������� = ColumnByValue(ReportName_String, "������� (�����)", "���-�� ��������", 100, 100) ' 2
        Column_�����_������_��_�� = ColumnByValue(ReportName_String, "������� (�����)", "���-�� ������ �� ��", 100, 100) ' 3
        
        Column_�����_�� = ColumnByValue(ReportName_String, "������� (�����)", "����� ��", 100, 100) ' 9
        Column_�����������_�� = ColumnByValue(ReportName_String, "������� (�����)", " ����������� ��", 100, 100) ' 10
        Column_��_�������� = ColumnByValue(ReportName_String, "������� (�����)", " �� ��������", 100, 100) ' 11
        Column_��_�����_�� = ColumnByValue(ReportName_String, "������� (�����)", " �� ����� ��", 100, 100) ' 12
        Column_���������_�_����������� = ColumnByValue(ReportName_String, "������� (�����)", "��������� � ����������� ", 100, 100)  ' 13
        
        Column_�������������_����� = ColumnByValue(ReportName_String, "������� (�����)", "������������� �����", 100, 100)
        
        ' ������ ������ ��� ������ � �����
        beginWeekPeriod = False
        
        ' Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value)
        Do While InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, "����� ����") = 0
          
          ' ������ ������: ��� Capacity 11.03.2020 �.: 10.02.03.20-08.03.20, 11.09.03.20-15.03.20 (���� ����� � 5 �����)
          If rowOfWeekPeriod(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value) <> 0 Then
                        
            ' ������ ������ ��� ������ � �����
            If rowOfWeekPeriod(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value) = WeekNumber(Date) Then
              beginWeekPeriod = True
            End If
            
          End If
          
          ' ���� ��� ���� �� ������
          If InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, officeNameInReport) <> 0 Then
          ' If InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, officeNameInReport2) <> 0 Then
            countClient = countClient + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����_��������).Value
            countCredCard = countCredCard + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����_������_��_��).Value
          End If
                    
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
        
        ' ���������� ���������� - ����� ������ �� ������� "������� (�����)", ��� ���� "����� ����"
        rowCount_������������_�����_���� = rowCount
        
        Application.StatusBar = ""
        
        ' ������� ������ �� �����
        rowCount = rowByValue(ThisWorkbook.Name, "����6", getNameOfficeByNumber(i), 100, 100)
        ThisWorkbook.Sheets("����6").Cells(rowCount, 3).Value = countClient
        ThisWorkbook.Sheets("����6").Cells(rowCount, 3).HorizontalAlignment = xlCenter
        ThisWorkbook.Sheets("����6").Cells(rowCount, 4).Value = countCredCard
        ThisWorkbook.Sheets("����6").Cells(rowCount, 4).HorizontalAlignment = xlCenter
        If countClient <> 0 Then
          ThisWorkbook.Sheets("����6").Cells(rowCount, 5).Value = Round(countCredCard / countClient, 3)
        Else
          ThisWorkbook.Sheets("����6").Cells(rowCount, 5).Value = 0
        End If
        ' ThisWorkbook.Sheets("����6").Cells(RowCount, 5).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("����6").Cells(rowCount, 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 5).Value)
        ThisWorkbook.Sheets("����6").Cells(rowCount, 5).HorizontalAlignment = xlCenter

      Next i ' ��������� ����
      
      ' ������� ����� �� �����������
      ' �������� �� ������ "������/�������" +1
      rowCount = rowByValue(ReportName_String, "������� (�����)", "������/�������", 100, 100) + 1
      
      ' Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value)
      Do While InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, "����� ����") = 0
        
        ' ���� � ������ ��� ��������: ", �-�, -
        currentNameInCapacityStr = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value
        
        ' If (InStr(currentNameInCapacityStr, Chr(34)) = 0) And (InStr(currentNameInCapacityStr, "�-�") = 0) And (InStr(currentNameInCapacityStr, "-") = 0) Then
        ' ������� 2
        If (InStr(currentNameInCapacityStr, Chr(34)) = 0) And (InStr(currentNameInCapacityStr, "�-�") = 0) And (InStr(currentNameInCapacityStr, "-") = 0) And (currentNameInCapacityStr <> "") Then
          
          ' ���� ��� ���, �� ��������� � ��������� ���� ����������� ������
          currentNameInCapacityStr = �������_�_���(currentNameInCapacityStr, 3)
          
          ' �����
          ' If InStr(currentNameInCapacityStr, "�������") <> 0 Then
          '   t = 1
          ' End If
          
          If InStr(allNameStr, currentNameInCapacityStr) <> 0 Then
            '
            currentNameStr_Range = RangeByValue(ThisWorkbook.Name, "����6", currentNameInCapacityStr, 100, 100)
            currentNameStr_Row = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Row
            currentNameStr_Column = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Column
            
            ' ������� ������ �� ����������:
            ' �������
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 1).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 1).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����_��������).Value
            ' ������ ��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 2).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 2).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����_������_��_��).Value
            ' ����
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 3).Value = Round(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 2).Value / ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 1).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 3).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 3).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 3).Value)
            ' ������� ������ ��������: ����
            targetVar = (ThisWorkbook.Sheets("����6").Cells(3, 5).Value) * 100
            Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 3, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 1).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 2).Value, 3) * 100), targetVar)
             
            ' *** ���� ��������-����� ***
            ' ��������-����: ����� �� (�������, � ������� ���� ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 26).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 26).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����_��).Value ' ������� 9
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 26).HorizontalAlignment = xlRight
            
            ' (����� ��) � �.�. �� ��������
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 27).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 27).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_��_��������).Value ' ������� 11
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 27).HorizontalAlignment = xlRight
            
            ' (����� ��) � �.�. ��������� � �����������
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 28).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 28).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_���������_�_�����������).Value ' ������� 14
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 28).HorizontalAlignment = xlRight
            
            ' �� ����� ��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 29).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 29).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_��_�����_��).Value ' ������� 12
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 29).HorizontalAlignment = xlRight
            
            ' ����������� ��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�����������_��).Value ' ������� 10
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).HorizontalAlignment = xlRight
            
            ' ������� �� � 29.12 ������ ������, ��� ��� ����� ������� ��� � Capacity: ������� - ����� �� - ����������� ��
            ' ������-�� ���� � ��������, ���� ��������
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 1).Value - ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 26).Value - ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 27).Value ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 13).Value
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 30).HorizontalAlignment = xlRight
            ' *** ���� ��������-����� ***
            
            ' ������������� �����
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 32).Value = ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 32).Value + Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, Column_�������������_�����).Value ' ��� ������� 18
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 32).HorizontalAlignment = xlRight

           End If
        End If
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
      
      ' ����� �� ��� �������� � �� ������� � ������� C � D
      row_�����_��_��� = rowForWriteInSheet6
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 2).Value = "����� �� ���: "
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 3).Formula = "=SUM(" + cellSum + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 3).HorizontalAlignment = xlCenter
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 4).Formula = "=SUM(" + Replace(cellSum, "C", "D") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 4).HorizontalAlignment = xlCenter
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 5).Value = Round(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 4).Value / ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 3).Value, 2)
      '
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 5).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 5).Value)
      
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 5).HorizontalAlignment = xlCenter
      Application.StatusBar = ""
      
      ' --- ���� �1 �������� �� �� �������� ������ ---


      ' ���� �2 Pre-Approved �� �� �������� ������: ���� "PA_KK" ---
      
      ' ��������� �� ������� "PA_KK"
      Call openPivotTables_Capacity_PA_KK(ReportName_String)
      
      ' ����������� ��������
      ' ���-�� ��������
      Column_�����_�������� = ColumnByValue(ReportName_String, "PA_KK", "���-�� ��������", 100, 100) ' 2
      ' ������� � ��
      Column_�������_�_�� = ColumnByValue(ReportName_String, "PA_KK", "������� � ��", 100, 100) ' 3
      ' ������ �� ��
      Column_������_��_�� = ColumnByValue(ReportName_String, "PA_KK", "������ �� ��", 100, 100) ' 6
      '  �������� ��_��
      Column_��������_��_�� = ColumnByValue(ReportName_String, "PA_KK", " �������� ��_��", 100, 100) ' 8
      ' ������� � �����. �������� �� ��_��
      Column_�������_�_�����_��������_��_��_�� = ColumnByValue(ReportName_String, "PA_KK", "������� � �����. �������� �� ��_��", 100, 100) ' 9
      ' ������ PA_KK �����������
      Column_������_PA_KK_����������� = ColumnByValue(ReportName_String, "PA_KK", "������ PA_KK �����������", 100, 100) ' 10
      
      ' ��������� 1
      ' �������� �� ������ "������/��" +1
      rowCount = rowByValue(ReportName_String, "PA_KK", "������/��", 100, 100) + 1
      Do While InStr(Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value, "����� ����") = 0
        
        ' ���� � ������ ��� ��������: ", �-�, -, "", ������
        currentNameInCapacityStr = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value
        
        ' ��������� ���������� ������
        If (currentNameInCapacityStr <> "") And (InStr(currentNameInCapacityStr, Chr(34)) = 0) And (InStr(currentNameInCapacityStr, "�-�") = 0) And (InStr(currentNameInCapacityStr, "-") = 0) And (InStr(currentNameInCapacityStr, "������") = 0) And (InStr(currentNameInCapacityStr, "��") = 0) Then
          
          ' ���� ��� ���, �� ��������� � ��������� ���� ����������� ������
          currentNameInCapacityStr = �������_�_���(currentNameInCapacityStr, 3)
          If InStr(allNameStr, currentNameInCapacityStr) <> 0 Then
            '
            currentNameStr_Range = RangeByValue(ThisWorkbook.Name, "����6", currentNameInCapacityStr, 100, 100)
            currentNameStr_Row = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Row
            currentNameStr_Column = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Column
            ' ������� ������ �� ����������
            ' ���-�� �������� (�� B2) � ������� (� F5)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 4).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_�����_��������).Value ' 2
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 4).HorizontalAlignment = xlRight
            ' ������� � �� (�� B3) � � PA �� (� G6)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 5).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_�������_�_��).Value ' 3
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 5).HorizontalAlignment = xlRight
            ' ������ �� ��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 6).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_������_��_��).Value ' 6
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 6).HorizontalAlignment = xlRight
            
            ' ����
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 7).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 5).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 6).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 7).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 7).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 7).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 7).HorizontalAlignment = xlRight
            ' ��������
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 8).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_��������_��_��).Value ' 8
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 8).HorizontalAlignment = xlRight
            ' ������� � �����. �������� �� ��_�� (9)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 9).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_�������_�_�����_��������_��_��_��).Value ' 9
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 9).HorizontalAlignment = xlRight
            ' ������ PA_KK ����������� (10)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 10).Value = Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_������_PA_KK_�����������).Value ' 10
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 10).HorizontalAlignment = xlRight
            ' ���� 2()
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 11).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 9).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 10).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 11).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 11).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 11).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 11).HorizontalAlignment = xlRight
            
           End If
        End If
        
        ' ���� � ������ "��������� ��1", �� ���������� ������� ��� ����������� ��������� ��������� �������� - ����������� ����1
        If InStr(Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value, "��������� ��1") <> 0 Then
          
          row_���������_��1 = rowCount
                    
          ' Workbooks(ReportName_String).Activate ' !!!
          Workbooks(ReportName_String).Sheets("PA_KK").Cells(rowCount, Column_�������_�_��).ShowDetail = True ' 3
          
          ' Workbooks(ReportName_String).Sheets("PA_KK").Cells(RowCount, 3).ShowDetail = True
          '
          ' Range("�������1[[#Headers],[PA_KK]]").Select ' !!!
          
          ' ActiveSheet.ListObjects("�������1").Range.AutoFilter Field:=7, Criteria1:="1"
          
          ' �������� ����1 � Capacity - ��������� ��������
          ' PA_KK = "1"
          
          ' KK-GR = "1" - ��� �� ��������� ����, ��� ��� KK-GR=1 � PA_KK=1
          
          ' ������� �� ���� "PA_KK"
          ' Workbooks(ReportName_String).Sheets("PA_KK").Select
          
          ' ��������� �� ���� DB
          ThisWorkbook.Sheets("����6").Activate ' !!!
 
        End If
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop

      ' ��������� 2: ����� �� ������ � �� ��� (���� ����� �����)
      rowCount = rowByValue(ThisWorkbook.Name, "����6", "����� �� ���:", 100, 100) - 1
      ' ���������� ������ �� ��
      ������� = 0
      �������_�_PA_�� = 0
      ������_PA = 0
      �����_PA_�� = 0
      �_��_PA_�� = 0
      ������_��_PA_�� = 0
      '
      �����_�� = 0
      ���������_�� = 0
      ��_������� = 0
      ���_�� = 0
      �������_�� = 0
      ���������_����� = 0
      '
      �������������_����� = 0

      Do While ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value <> ""
        
        ' ���� � ������ "OO"
        If InStr(ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value, "��") <> 0 Then
          ' ������� �����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 6).Value = �������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 6).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 7).Value = �������_�_PA_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 7).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 8).Value = ������_PA
          ThisWorkbook.Sheets("����6").Cells(rowCount, 8).HorizontalAlignment = xlCenter
          ' ����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 9).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 7).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 8).Value, 3)
          ' ThisWorkbook.Sheets("����6").Cells(RowCount, 9).NumberFormat = "0.0%"
          ThisWorkbook.Sheets("����6").Cells(rowCount, 9).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 9).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 9).HorizontalAlignment = xlCenter
          '
          ThisWorkbook.Sheets("����6").Cells(rowCount, 10).Value = �����_PA_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 10).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 11).Value = �_��_PA_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 11).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 12).Value = ������_��_PA_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 12).HorizontalAlignment = xlCenter
          ' ����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 13).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 11).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 12).Value, 3)
          ' ThisWorkbook.Sheets("����6").Cells(RowCount, 13).NumberFormat = "0.0%"
          ThisWorkbook.Sheets("����6").Cells(rowCount, 13).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 13).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 13).HorizontalAlignment = xlCenter
          
          ' �� ������� ����� �� ��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 28).Value = �����_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 28).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 29).Value = ���������_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 29).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 30).Value = ��_�������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 30).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 31).Value = ���_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 31).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 32).Value = �������_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 32).HorizontalAlignment = xlCenter
          ThisWorkbook.Sheets("����6").Cells(rowCount, 33).Value = ���������_�����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 33).HorizontalAlignment = xlCenter
          
          ' �� ������� ����� �� ��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 34).Value = �������������_�����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 34).HorizontalAlignment = xlCenter
                    
          ' ������� � ���������� � DB (����8)
          ' ThisWorkbook.Sheets("����8").Range(Range_����8_��������_����(ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value)).Value = "Capacity: ������� " + CStr(�������_��) + ", ������. �������. " + CStr(���������_�����) + " �����: " + CStr(�������_�� + ���������_�����) + " ��."
                    
          ' �������� ����������
          ������� = 0
          �������_�_PA_�� = 0
          ������_PA = 0
          �����_PA_�� = 0
          �_��_PA_�� = 0
          ������_��_PA_�� = 0
          ' ��
          �����_�� = 0
          ���������_�� = 0
          ��_������� = 0
          ���_�� = 0
          �������_�� = 0
          ���������_����� = 0
          ' ��
          �������������_����� = 0
        
        Else
          ' ���������
          ������� = ������� + ThisWorkbook.Sheets("����6").Cells(rowCount, 6).Value
          �������_�_PA_�� = �������_�_PA_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 7).Value
          ������_PA = ������_PA + ThisWorkbook.Sheets("����6").Cells(rowCount, 8).Value
          �����_PA_�� = �����_PA_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 10).Value
          �_��_PA_�� = �_��_PA_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 11).Value
          ������_��_PA_�� = ������_��_PA_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 12).Value
          ' ��
          �����_�� = �����_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 28).Value
          ���������_�� = ���������_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 29).Value
          ��_������� = ��_������� + ThisWorkbook.Sheets("����6").Cells(rowCount, 30).Value
          ���_�� = ���_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 31).Value
          �������_�� = �������_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 32).Value
          ���������_����� = ���������_����� + ThisWorkbook.Sheets("����6").Cells(rowCount, 33).Value
          ' ��
          �������������_����� = �������������_����� + ThisWorkbook.Sheets("����6").Cells(rowCount, 34).Value
        
        End If
        
        ' ��������� ������
        rowCount = rowCount - 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
           
      ' ����� �� ���
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 6).Formula = "=SUM(" + Replace(cellSum, "C", "F") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 6).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 7).Formula = "=SUM(" + Replace(cellSum, "C", "G") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 7).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 8).Formula = "=SUM(" + Replace(cellSum, "C", "H") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 8).HorizontalAlignment = xlCenter
      ' ����
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 9).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 7).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 8).Value, 3)
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 9).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 9).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 9).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 9).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 10).Formula = "=SUM(" + Replace(cellSum, "C", "J") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 10).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 11).Formula = "=SUM(" + Replace(cellSum, "C", "K") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 11).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 12).Formula = "=SUM(" + Replace(cellSum, "C", "L") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 12).HorizontalAlignment = xlCenter
      ' ���� 2
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 13).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 11).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 12).Value, 3)
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 13).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 13).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 13).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 13).HorizontalAlignment = xlCenter
      
      ' �� ������� ����� �� ���
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 28).Formula = "=SUM(" + Replace(cellSum, "C", "AB") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 28).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 29).Formula = "=SUM(" + Replace(cellSum, "C", "AC") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 29).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 30).Formula = "=SUM(" + Replace(cellSum, "C", "AD") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 30).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 31).Formula = "=SUM(" + Replace(cellSum, "C", "AE") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 31).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 32).Formula = "=SUM(" + Replace(cellSum, "C", "AF") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 32).HorizontalAlignment = xlCenter
      '
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 33).Formula = "=SUM(" + Replace(cellSum, "C", "AG") + ")"
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 33).HorizontalAlignment = xlCenter
      
      
      ' �� ������� ����� �� ���
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 34).Formula = "=SUM(" + Replace(cellSum, "C", "AH") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 34).HorizontalAlignment = xlCenter

      
      ' --- ���� �3 �������� ���� ��������� �������� � PA �� � � �� PA �� � ��������� ���� ��� ���������� � ������ �����
      
      ' (���� ��������)
      
      ' --- ���� �2 Pre-Approved �� �� �������� ������ ---
      
      ' ���� �3 Pre-Approved �� �� �������� ������ ---
      
      ' �������� ������� ������ � Capacity �� ����� "Pre-Approved"
      Call openPivotTables_Capacity_PA_��(ReportName_String)

      ' --- ���� �3 Pre-Approved �� �� �������� ������ ---
      
      ' ���������� ������� �� ���� "Pre-Approved" � ����� Capacity
      Column_�����_�������� = ColumnByValue(ReportName_String, "Pre-Approved", "���-�� ��������", 100, 100) ' 2
      
      ' "�������� � Pre-Approved" (����� ������ �������� ������)
      ' Column_��������_�_PreApproved = ColumnByValue(ReportName_String, "Pre-Approved", "� Pre-Approved", 100, 100) ' 3
      ' Column_��������_�_PreApproved = ColumnByValue(ReportName_String, "Pre-Approved", "��������" + Chr(32) + "� Pre-Approved", 100, 100) ' 3
      ' �� ������� - ���� ������� ���� � ������
      Column_��������_�_PreApproved = Column_�����_�������� + 1
      
      ' "������ PA"
      Column_������_PA = ColumnByValue(ReportName_String, "Pre-Approved", "������ PA", 100, 100) ' 6
      
      ' ��������� 1 (Pre-Approved ��)
      ' �������� �� ������ "������/��" +1
      rowCount = rowByValue(ReportName_String, "Pre-Approved", "������/��", 100, 100) + 1
      Do While InStr(Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value, "����� ����") = 0
        
        ' ���� � ������ ��� ��������: ", �-�, -, "", ������
        currentNameInCapacityStr = Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value
        
        ' ��������� ���������� ������
        If (currentNameInCapacityStr <> "") And (InStr(currentNameInCapacityStr, Chr(34)) = 0) And (InStr(currentNameInCapacityStr, "�-�") = 0) And (InStr(currentNameInCapacityStr, "-") = 0) And (InStr(currentNameInCapacityStr, "������") = 0) And (InStr(currentNameInCapacityStr, "��") = 0) Then
          
          ' ���� ��� ���, �� ��������� � ��������� ���� ����������� ������
          currentNameInCapacityStr = �������_�_���(currentNameInCapacityStr, 3)
          
          If InStr(allNameStr, currentNameInCapacityStr) <> 0 Then
            '
            currentNameStr_Range = RangeByValue(ThisWorkbook.Name, "����6", currentNameInCapacityStr, 100, 100)
            currentNameStr_Row = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Row
            currentNameStr_Column = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Column
            ' ������� ������ �� ����������
            
            ' ���-�� �������� (Pre-Approved ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 12).Value = Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, Column_�����_��������).Value ' 2
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 12).HorizontalAlignment = xlRight
            ' �������� � Pre - Approved (Pre-Approved ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 13).Value = Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, Column_��������_�_PreApproved).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 13).HorizontalAlignment = xlRight
            ' ������ PA (Pre-Approved ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 14).Value = Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, Column_������_PA).Value ' 6
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 14).HorizontalAlignment = xlRight
            
            ' ���� (Pre-Approved ��) ����
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 15).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 13).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 14).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 15).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 15).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 15).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 15).HorizontalAlignment = xlRight
            
            ' ������� ������ ��������: ����
            targetVar = (ThisWorkbook.Sheets("����6").Cells(3, 17).Value) * 100 ' Pre-Approved ��
            Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 15, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 13).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 14).Value, 3) * 100), targetVar)
                   
           End If
        End If
        
        ' ���� � ������ "��������� ��1", �� ���������� ������� ��� ����������� ��������� ��������� ��������
        If InStr(Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value, "��������� ��1") <> 0 Then
          
          row_���������_��1 = rowCount
                  
          ' Workbooks(ReportName_String).Activate ' !!!
          Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 3).ShowDetail = True
          
          ' Workbooks(ReportName_String).Sheets("Pre-Approved").Cells(RowCount, 3).ShowDetail = True
          ' (Pre-Approved ��)
          ' Range("�������2[[#Headers],[PA]]").Select
          
          ' ActiveSheet.ListObjects("�������2").Range.AutoFilter Field:=4, Criteria1:="1"
          
          ' �������� ����2 � Capacity - ��������� ��������
          ' PA = "1"
          ' ID ������� (Retail) PA  Date of activ   ������ PA
          ' 8397429              1   20200303          1       - ��� ������ ��������� PA ��
                                           
          ' ��������� �� ���� DB
          ThisWorkbook.Sheets("����6").Activate ' !!!

        End If
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop

      ' ��� ����� ����� �������� �������� �������� �� �� � �� � ����1 ������� �������, ������ ��� � � ������ PA �� � PA KK - ���� �������� ����1 � ����2 � ���������� ������� ������
      
      ' ������� �������� ����� ��� �������� PA
      OutBookName = ThisWorkbook.Path + "\Out\Pre-Approved_" + strDDMMYYYY(dateReportCapacity) + ".xlsx"
      ' ��������2
      ThisWorkbook.Sheets("����6").Range("AO3").Value = OutBookName
      ' ������� ����
      Call createBook_out_PA(OutBookName)
      
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����6").Activate

      ' ===========================================================================================================================
      ' ����� PA �� ����1
      
          ' ������� - ������� ������ �� ����� � ������� ������� ������ ������� �� �����
          Column_ID_�������_Retail = ColumnByName(ReportName_String, "����1", 1, "ID ������� (Retail)") ' 4
          Column_PA = ColumnByName(ReportName_String, "����1", 1, "PA") ' 5
          Column_DateOfActiv = ColumnByName(ReportName_String, "����1", 1, "Date of activ") ' 6
          Column_������_PA = ColumnByName(ReportName_String, "����1", 1, "������ PA") ' 7
          Column_PA_KK = ColumnByName(ReportName_String, "����1", 1, "PA_KK") ' 8
          Column_������_��_�� = ColumnByName(ReportName_String, "����1", 1, "������_��_��") ' 9
          Column_chan = ColumnByName(ReportName_String, "����1", 1, "chan") ' 10
          Column_���_���������� = ColumnByName(ReportName_String, "����1", 1, "��� ����������") ' 11
          Column_������� = ColumnByName(ReportName_String, "����1", 1, "���. ����") ' 12
          Column_������� = ColumnByName(ReportName_String, "����1", 1, "���. ����") ' 13
          
          rowCount_����1 = 2
          Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, 1).Value)
            
            ' ��������� ��������� Capacity.����1
            If Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_�������).Value = "��������� ��1" Then
              
              ' ���� ��� PA ��� PA ��
              If (Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_PA).Value = "1") Or (Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_PA_KK).Value = "1") Then
              
                ' ��������� �������: ' ����: ID_�������_Retail, PA, DateOfActiv, ������_PA, PA_KK, ������_��_��, chan, ���_����������, �������, �������
                Call InsertRecordInBook(Dir(OutBookName), "����1", "ID_�������_Retail", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_ID_�������_Retail).Value, _
                                              "ID_�������_Retail", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_ID_�������_Retail).Value, _
                                                "PA", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_PA).Value, _
                                                  "DateOfActiv", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_DateOfActiv).Value, _
                                                    "������_PA", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_������_PA).Value, _
                                                      "PA_KK", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_PA_KK).Value, _
                                                        "������_��_��", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_������_��_��).Value, _
                                                          "chan", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_chan).Value, _
                                                            "���_����������", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_���_����������).Value, _
                                                              "�������", Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_�������).Value, _
                                                                "�������", cityOfficeName(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, Column_�������).Value), _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "", _
                                                                                    "", "")
                
                ' ��������� ���������� � ������� PA �� � �� � BASE\Clients: Capacity_PA_Date, Capacity_PA, Capacity_PA_CC_Date, Capacity_PA_CC

                                                                                    

              End If ' ���� ��� PA ��� PA ��
              
            End If ' ���� ��� ���� ���������
            
            rowCount_����1 = rowCount_����1 + 1
            Application.StatusBar = "��������� PA: " + CStr(rowCount_����1) + "..."
          Loop

      
      ' ===========================================================================================================================
      

      ' ��������� 2: ����� �� ������ � �� ��� (Pre-Approved ��) (���� ����� �����)
      rowCount = rowByValue(ThisWorkbook.Name, "����6", "����� �� ���:", 100, 100) - 1
      
      ' ���������� ������ �� �� (Pre-Approved ��)
      ������� = 0
      �������_�_PA = 0
      ������_PA = 0
      
      Do While ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value <> ""
        
        ' ���� � ������ "OO"
        If InStr(ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value, "��") <> 0 Then
          ' ������� ����� - ������� (��_��) (Pre-Approved ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 14).Value = �������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 14).HorizontalAlignment = xlCenter
          ' �������_�_PA (Pre-Approved ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 15).Value = �������_�_PA
          ThisWorkbook.Sheets("����6").Cells(rowCount, 15).HorizontalAlignment = xlCenter
          ' ������_PA (Pre-Approved ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 16).Value = ������_PA
          ThisWorkbook.Sheets("����6").Cells(rowCount, 16).HorizontalAlignment = xlCenter
          ' ���� (Pre-Approved ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 17).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 15).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 16).Value, 3)
          ' ThisWorkbook.Sheets("����6").Cells(RowCount, 17).NumberFormat = "0.0%"
          ThisWorkbook.Sheets("����6").Cells(rowCount, 17).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 17).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 17).HorizontalAlignment = xlCenter
          
          ' �������� ���������� (Pre-Approved ��)
          ������� = 0
          �������_�_PA = 0
          ������_PA = 0
        
        Else
        
          ' ��������� (Pre-Approved ��)
          ������� = ������� + ThisWorkbook.Sheets("����6").Cells(rowCount, 14).Value
          �������_�_PA = �������_�_PA + ThisWorkbook.Sheets("����6").Cells(rowCount, 15).Value
          ������_PA = ������_PA + ThisWorkbook.Sheets("����6").Cells(rowCount, 16).Value
          
        End If
        
        ' ��������� ������ (Pre-Approved ��)
        rowCount = rowCount - 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
           
      ' ����� �� ���
      ' ������� (Pre-Approved ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 14).Formula = "=SUM(" + Replace(cellSum, "C", "N") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 14).HorizontalAlignment = xlCenter
      ' ������� � PA (Pre-Approved ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 15).Formula = "=SUM(" + Replace(cellSum, "C", "O") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 15).HorizontalAlignment = xlCenter
      ' ������ PA (Pre-Approved ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 16).Formula = "=SUM(" + Replace(cellSum, "C", "P") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 16).HorizontalAlignment = xlCenter
      ' ���� (Pre-Approved ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 17).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 15).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 16).Value, 3)
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 17).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 17).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 17).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 17).HorizontalAlignment = xlCenter
      
      
      ' ���� �4 �� �� �������� ������ + ���� �5 ���������� �� �������� ������ ---
      
      ' �������� ������� ������ � Capacity �� ����� "���. ������ ��"
      Call openPivotTables_Capacity_���_������_��(ReportName_String)
      
      ' ��������� 1 (���. ������ ��)
      ' "�������� �����"
      Row_�����������_��������C���� = rowByValue(ReportName_String, "���. ������ ��", "�������� �����", 100, 100)
      
      ' ���������� ������ ��������:
      ' ���-�� �������� (���. ������ ��) Column_�����������_������������������
      Column_�����������_������������������ = ColumnByValue(ReportName_String, "���. ������ ��", "���������� ��������", 100, 100)
      
      ' ��� �� (���. ������ ��) Column_�����������_���DK
      Column_�����������_���DK = ColumnByValue(ReportName_String, "���. ������ ��", "��� DK", 100, 100)
      
      ' ������ �� (���. ������ ��) Column_�����������_����������
      Column_�����������_���������� = ColumnByValue(ReportName_String, "���. ������ ��", "������ �� ��", 100, 100)
      
      ' ����������_����������� Column_�����������_���������������������
      Column_�����������_��������������������� = ColumnByValue(ReportName_String, "���. ������ ��", "���������� �����������", 100, 100)
      
      ' ����������_���_�� Column_�����������_�������������������
      Column_�����������_������������������� = ColumnByValue(ReportName_String, "���. ������ ��", "��������� ����������", 100, 100)
      
      ' ����������_������_�� Column_�����������_��������������������������������
      Column_�����������_�������������������������������� = ColumnByValue(ReportName_String, "���. ������ ��", "������ ������������ ���������� ����", 100, 100)
      
      ' ����������_�����_��� Column_�����������_�����������������������
      Column_�����������_����������������������� = ColumnByValue(ReportName_String, "���. ������ ��", "���������� ��������� � ���", 100, 100)
      
      ' �������� �� ������ "�������� �����" +1
      ' RowCount = RowByValue(ReportName_String, "���. ������ ��", "�������� �����", 100, 100) + 1
      rowCount = Row_�����������_��������C���� + 1
      
      Do While InStr(Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "����� ����") = 0
        
        ' ���� � ������ ��� ��������: ", �-�, -, "", ������, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        ' (InStr(currentNameInCapacityStr, "0") = 0)And(InStr(currentNameInCapacityStr, "0") = 0)And(InStr(currentNameInCapacityStr, "1") = 0)And(InStr(currentNameInCapacityStr, "2") = 0)And(InStr(currentNameInCapacityStr, "3") = 0)And(InStr(currentNameInCapacityStr, "4") = 0)And(InStr(currentNameInCapacityStr, "5") = 0)And(InStr(currentNameInCapacityStr, "6") = 0)And(InStr(currentNameInCapacityStr, "7") = 0)And(InStr(currentNameInCapacityStr, "8") = 0)And(InStr(currentNameInCapacityStr, "9") = 0)
        currentNameInCapacityStr = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value
        
        ' ��������� ���������� ������
        If (currentNameInCapacityStr <> "") And (InStr(currentNameInCapacityStr, Chr(34)) = 0) And (InStr(currentNameInCapacityStr, "�-�") = 0) And (InStr(currentNameInCapacityStr, "-") = 0) And (InStr(currentNameInCapacityStr, "������") = 0) And (InStr(currentNameInCapacityStr, "0") = 0) And (InStr(currentNameInCapacityStr, "0") = 0) And (InStr(currentNameInCapacityStr, "1") = 0) And (InStr(currentNameInCapacityStr, "2") = 0) And (InStr(currentNameInCapacityStr, "3") = 0) And (InStr(currentNameInCapacityStr, "4") = 0) And (InStr(currentNameInCapacityStr, "5") = 0) And (InStr(currentNameInCapacityStr, "6") = 0) And (InStr(currentNameInCapacityStr, "7") = 0) And (InStr(currentNameInCapacityStr, "8") = 0) And (InStr(currentNameInCapacityStr, "9") = 0) Then
          
          ' ���� ��� ���, �� ��������� � ��������� ���� ����������� ������
          currentNameInCapacityStr = �������_�_���(currentNameInCapacityStr, 3)
          
          If InStr(allNameStr, currentNameInCapacityStr) <> 0 Then
            '
            currentNameStr_Range = RangeByValue(ThisWorkbook.Name, "����6", currentNameInCapacityStr, 100, 100)
            currentNameStr_Row = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Row
            currentNameStr_Column = ThisWorkbook.Sheets("����6").Range(currentNameStr_Range).Column
            
            ' ������� ������ �� ����������
            ' ���-�� �������� (���. ������ ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 16).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_������������������).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 16).HorizontalAlignment = xlRight
            ' ��� �� (���. ������ ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 17).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_���DK).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 17).HorizontalAlignment = xlRight
            ' ������ �� (���. ������ ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 18).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_����������).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 18).HorizontalAlignment = xlRight
            ' ���� (���. ������ ��)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 19).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 17).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 18).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 19).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 19).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 19).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 19).HorizontalAlignment = xlRight
            
            ' ������� ������ ��������
            Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 19, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 17).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 18).Value, 3) * 100), 15)
         
            ' ����������_�����������
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 20).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_���������������������).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 20).HorizontalAlignment = xlRight
            
            ' ����������_���_��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 21).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_�������������������).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 21).HorizontalAlignment = xlRight
            
            ' ����������_������_��
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 22).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_��������������������������������).Value
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 22).HorizontalAlignment = xlRight
            
            ' ����
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 23).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 21).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 22).Value, 3)
            ' ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 23).NumberFormat = "0.0%"
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 23).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 23).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 23).HorizontalAlignment = xlRight
            
            ' ������� ������ ��������
            Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 23, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 21).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 22).Value, 3) * 100), 15)
            
            ' ����������_�����_���
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value = Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, Column_�����������_�����������������������).Value
            
            ' ������ ����, ���� �� ���� ���������, ��� ��� � �������� ������ ������
            If IsEmpty(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value) Then
              ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value = 0
            End If
            
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).HorizontalAlignment = xlRight
            
            ' ���� ���� �� ����������� ���
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 25).Value = �����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 20).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value, 3)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 25).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 25).Value)
            ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 25).HorizontalAlignment = xlRight
            ' ������� ������ �������� - ������� 1 (������ � ������� ����, ��� � ������)
            ' If ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 25).Value = 0 Then
            '   Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 25, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 20).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value, 3) * 100), 20)
            ' End If
            ' ������� ������ �������� - ������� 2 (�������� �� ���� 20%)
            Call Full_Color_RangeII("����6", currentNameStr_Row, currentNameStr_Column + 25, (�����������(ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 20).Value, ThisWorkbook.Sheets("����6").Cells(currentNameStr_Row, currentNameStr_Column + 24).Value, 3) * 100), 20)
            
       
           End If
        End If
        
        ' ���� � ������ "��������� ��1", �� ���������� ������� ��� ����������� ��������� ��������� ��������
        If InStr(Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "��������� ��1") <> 0 Then
          
          ' ������� ��������� ����������� ��� ���?
          ' row_���������_��1 = RowCount
                  
          ' Workbooks(ReportName_String).Activate
          ' Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(RowCount, 3).Select  ' ���� 1
          ' Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(RowCount, 3).ShowDetail = True
          ' (Pre-Approved ��)
          ' Range("�������2[[#Headers],[PA]]").Select
          ' ActiveSheet.ListObjects("�������2").Range.AutoFilter Field:=4, Criteria1:="1"
                                        
          ' ��������� �� ���� DB
          ' ThisWorkbook.Sheets("����6").Activate

          ' ������� "���������� �����������" - ���������� ������� �������. ����� ��������� � ����� ������ ��������� ����� "����3"
          Workbooks(ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 11).ShowDetail = True
          ThisWorkbook.Sheets("����6").Activate
          
          ' ��������� ����������� �� ����1. ����: "ID ������� (Retail)", "���� ���������" (Integer), "���. ����", "��� ����������", "���������", "����� ���� �����", "����� ���� �����"
          ' ���� � BASE\Clients: �����_�������, ���� (���������, ����������, ���������������, ���������������, �����-����), Capacity_pens_Date, Capacity_pensioner, ���_����������, �����_����_�����, �����_����_�����
          ' ��������� ����1 � ���������� � ������� ��������
          
          ' ������� - ������� ������ �� ����� � ������� ������� ������ ������� �� �����
          Column_���_���� = 5
          Column_ID_�������_Retail = 13
          Column_����_��������� = 4
          Column_���_���� = 6
          Column_���_���������� = 10
          Column_��������� = 14
          Column_�����_����_����� = 16
          Column_�����_����_����� = 17
          
          RowCount_����3 = 2
          Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, 1).Value)
            
            ' ��������� ����������� �� Capacity.����1
            If Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_���������).Value = 1 Then
              
              ' ��������� ���������� � BASE\Clients
              Call InsertRecordInBook("Clients", "����1", "�����_�������", Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_ID_�������_Retail).Value, _
                                            "�����_�������", Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_ID_�������_Retail).Value, _
                                              "����", cityOfficeName(Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_���_����).Value), _
                                                "Capacity_pens_Date", CDate(Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_����_���������).Value), _
                                                  "Capacity_pensioner", "1", _
                                                    "���_����������", �������_�_���(Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_���_����������).Value, 3), _
                                                      "�����_����_�����", Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_�����_����_�����).Value, _
                                                        "�����_����_�����", Workbooks(ReportName_String).Sheets("����3").Cells(RowCount_����3, Column_�����_����_�����).Value, _
                                                          "", "", _
                                                            "", "", _
                                                              "", "", _
                                                                "", "", _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

              
            End If ' ���� ��� ���������
            
            RowCount_����3 = RowCount_����3 + 1
            Application.StatusBar = "��������� �����������: " + CStr(RowCount_����3) + "..."
          Loop
          

        End If ' ���� � ������ "��������� ��1", �� ���������� ������� ��� ����������� ��������� ��������� ��������
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      
      Loop
      

      ' ��������� 2: ����� �� ������ � �� ��� (���. ������ ��) (���� ����� �����)
      rowCount = rowByValue(ThisWorkbook.Name, "����6", "����� �� ���:", 100, 100) - 1
      
      ' ���������� ������ �� �� (���. ������ ��)
      ������� = 0
      �������_���_�� = 0
      ������_�� = 0
      '
      ����������_����������� = 0
      ����������_���_�� = 0
      ����������_������_�� = 0
      ����������_�����_��� = 0

      Do While ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value <> ""
        
        ' ���� � ������ "OO"
        If InStr(ThisWorkbook.Sheets("����6").Cells(rowCount, 2).Value, "��") <> 0 Then
          
          ' ������� ����� - ������� (���. ������ ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 18).Value = �������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 18).HorizontalAlignment = xlCenter
          
          ' �������_���_�� (���. ������ ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 19).Value = �������_���_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 19).HorizontalAlignment = xlCenter
          
          ' ������_�� (���. ������ ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 20).Value = ������_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 20).HorizontalAlignment = xlCenter
          
          ' ���� (���. ������ ��)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 21).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 19).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 20).Value, 3)
          ' ThisWorkbook.Sheets("����6").Cells(RowCount, 21).NumberFormat = "0.0%"
          ThisWorkbook.Sheets("����6").Cells(rowCount, 21).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 21).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 21).HorizontalAlignment = xlCenter
          
          ' ����������_�����������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 22).Value = ����������_�����������
          ThisWorkbook.Sheets("����6").Cells(rowCount, 22).HorizontalAlignment = xlCenter
          
          ' ����������_���_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 23).Value = ����������_���_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 23).HorizontalAlignment = xlCenter
          
          ' ����������_������_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 24).Value = ����������_������_��
          ThisWorkbook.Sheets("����6").Cells(rowCount, 24).HorizontalAlignment = xlCenter
          
          ' ����
          ThisWorkbook.Sheets("����6").Cells(rowCount, 25).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 23).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 24).Value, 3)
          ' ThisWorkbook.Sheets("����6").Cells(RowCount, 25).NumberFormat = "0.0%"
          ThisWorkbook.Sheets("����6").Cells(rowCount, 25).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 25).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 25).HorizontalAlignment = xlCenter
          
          ' ����������_�����_���
          ThisWorkbook.Sheets("����6").Cells(rowCount, 26).Value = ����������_�����_���
          ThisWorkbook.Sheets("����6").Cells(rowCount, 26).HorizontalAlignment = xlCenter
          
          ' ���� ���
          ThisWorkbook.Sheets("����6").Cells(rowCount, 27).Value = �����������(ThisWorkbook.Sheets("����6").Cells(rowCount, 22).Value, ThisWorkbook.Sheets("����6").Cells(rowCount, 26).Value, 3)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 27).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(rowCount, 27).Value)
          ThisWorkbook.Sheets("����6").Cells(rowCount, 27).HorizontalAlignment = xlCenter
       
          ' �������� ���������� (���. ������ ��)
          ������� = 0
          �������_���_�� = 0
          ������_�� = 0
          '
          ����������_����������� = 0
          ����������_���_�� = 0
          ����������_������_�� = 0
          ����������_�����_��� = 0
        
        Else
        
          ' ��������� (���. ������ ��)
          ������� = ������� + ThisWorkbook.Sheets("����6").Cells(rowCount, 18).Value
          �������_���_�� = �������_���_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 19).Value
          ������_�� = ������_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 20).Value
          '
          ����������_����������� = ����������_����������� + ThisWorkbook.Sheets("����6").Cells(rowCount, 22).Value
          ����������_���_�� = ����������_���_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 23).Value
          ����������_������_�� = ����������_������_�� + ThisWorkbook.Sheets("����6").Cells(rowCount, 24).Value
          ����������_�����_��� = ����������_�����_��� + ThisWorkbook.Sheets("����6").Cells(rowCount, 26).Value

          
        End If
        
        ' ��������� ������ (���. ������ ��)
        rowCount = rowCount - 1
        Application.StatusBar = "����������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
           
      ' ����� �� ���
      ' ������� (���. ������ ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 18).Formula = "=SUM(" + Replace(cellSum, "C", "R") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 18).HorizontalAlignment = xlCenter
      
      ' �������_���_�� (���. ������ ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 19).Formula = "=SUM(" + Replace(cellSum, "C", "S") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 19).HorizontalAlignment = xlCenter
      
      ' ������_�� (���. ������ ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 20).Formula = "=SUM(" + Replace(cellSum, "C", "T") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 20).HorizontalAlignment = xlCenter
      
      ' ���� (���. ������ ��)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 21).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 19).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 20).Value, 3)
      ' ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 21).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 21).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 21).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 21).HorizontalAlignment = xlCenter
      
      ' ����������_�����������
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 22).Formula = "=SUM(" + Replace(cellSum, "C", "V") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 22).HorizontalAlignment = xlCenter
      
      ' ����������_���_��
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 23).Formula = "=SUM(" + Replace(cellSum, "C", "W") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 23).HorizontalAlignment = xlCenter
      
      ' ����������_������_��
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 24).Formula = "=SUM(" + Replace(cellSum, "C", "X") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 24).HorizontalAlignment = xlCenter

      ' ����
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 25).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 23).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 24).Value, 3)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 25).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 25).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 25).HorizontalAlignment = xlCenter
      
      ' ����������_�����_���
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 26).Formula = "=SUM(" + Replace(cellSum, "C", "Z") + ")"
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 26).HorizontalAlignment = xlCenter
      
      ' ���� �����_��� � %
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 27).Value = �����������(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 22).Value, ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 26).Value, 3)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 27).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 25).Value)
      ThisWorkbook.Sheets("����6").Cells(row_�����_��_���, 27).HorizontalAlignment = xlCenter
      
      ' --- ���� �4 �� �� �������� ������ + ���� �5 ���������� �� �������� ������ ---
      
      ' --- ���� �5 ��������� ��� ��������-����� (��) ---
      ' �� ���! �� ������� "������� (�����)" �������� �� ����� � ������� �������� �� ������ ������ � � ������ ���������� ���������� ������ � ������������ �������� � �������� IB
      ' ������ ���: 1) ��������� �� "������� (�����)"
      '             2) ������� ������ rowCount_������������_�����_���� "����� ����" � ���������� ������� ������� � ������� Column_�����_�������� - ��� ����� ����4
      '             3) � ������� �������� ��������
      ' ���� ���� IB, �� �� ��������, �� ��� ��������� � �����������
      ' ������� ������ ���� � � ���� ���������: 1) �������� ��� �� ��� �� ���������, � 2) ��� ����, �� �� ������� IB
      ' ��� �� ������� � ���� Clients � ����: Capacity_IB, Capacity_IB_Active, Capacity_IB_DateUpdate

      
      ' ��������� ������� �������
      Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount_������������_�����_����, Column_�����_��������).ShowDetail = True
      ' ��������� �� ����6
      ThisWorkbook.Sheets("����6").Activate

      ' ������� �������� ����� ��� �������� ��
      OutBookName_IB = ThisWorkbook.Path + "\Out\IB_" + strDDMMYYYY(dateReportCapacity) + ".xlsx"
      ' ��������2
      ThisWorkbook.Sheets("����6").Range("AQ3").Value = OutBookName_IB
      ' ������� ����
      Call createBook_out_��(OutBookName_IB)

      ' ���������� �������
      Column_����4_������� = ColumnByName(ReportName_String, "����4", 1, "���. ����") ' "���. ����"
      Column_����4_ID_�������_Retail = ColumnByName(ReportName_String, "����4", 1, "ID ������� (Retail)") ' "ID ������� (Retail)"
      Column_����4_������� = ColumnByName(ReportName_String, "����4", 1, "���. ����") ' "���. ����"
      Column_����4_���_���������� = ColumnByName(ReportName_String, "����4", 1, "��� ����������") ' "��� ����������"
      Column_����4_���_�������2 = ColumnByName(ReportName_String, "����4", 1, "��� �������2") ' "��� �������2"
      Column_����4_IB = ColumnByName(ReportName_String, "����4", 1, "IB") ' "IB"
      Column_����4_Net_IB = ColumnByName(ReportName_String, "����4", 1, "Net IB") ' "Net IB"
      Column_����4_��_�������� = ColumnByName(ReportName_String, "����4", 1, "�� ��������") ' "�� ��������"

      ' �������� �������� �� � ����4 � �������� ����
      RowCount_����4 = 2
      Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, 1).Value)
            
            ' ��������� ��������� Capacity.����1
            If Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_�������).Value = "��������� ��1" Then
              
                ' ��������� ����������� ��
                If (Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_IB).Value = 1) And (Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_��_��������).Value = 0) Then
                  ���������_�����������_��_Var = 1
                Else
                  ���������_�����������_��_Var = 0
                End If
              
                ' ��������� �������:
                Call InsertRecordInBook(Dir(OutBookName_IB), "����1", "ID_�������_Retail", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_ID_�������_Retail).Value, _
                                              "ID_�������_Retail", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_ID_�������_Retail).Value, _
                                                "���", "", _
                                                  "���_�������", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_���_�������2).Value, _
                                                    "��", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_IB).Value, _
                                                      "��� ��", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_Net_IB).Value, _
                                                        "�� ��������", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_��_��������).Value, _
                                                          "��������� ����������� ��", ���������_�����������_��_Var, _
                                                            "���_����������", �������_�_���(Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_���_����������).Value, 3), _
                                                              "�������", Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_�������).Value, _
                                                                "�������", cityOfficeName(Workbooks(ReportName_String).Sheets("����4").Cells(RowCount_����4, Column_����4_�������).Value), _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "", _
                                                                                    "", "")
                
            End If ' ���� ��� ���� ���������
            
            RowCount_����4 = RowCount_����4 + 1
            Application.StatusBar = "��������� IB: " + CStr(RowCount_����4) + "..."
            DoEventsInterval (RowCount_����4)
          Loop

           

      ' --- ����� ���� �5 ��������� ��� ��������-����� (��) ---
      
      ' ��������� ���� BASE\Clients
      CloseBook ("Clients")
      
      ' ��������� �������� ����� � ��������� PA
      Workbooks(Dir(OutBookName)).Close SaveChanges:=True
      
      ' ��������� �������� ����� � ��������� IB
      Workbooks(Dir(OutBookName_IB)).Close SaveChanges:=True
      
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ���������� ���������� ���������
      finishProcess = True
      
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� �� ���� DB
    ' ��������� � ������ M2
    ' ThisWorkbook.Activate
    ThisWorkbook.Sheets("����6").Activate ' !!!
    ThisWorkbook.Sheets("����6").Range("A1").Select
    
    ' ������ �������
    Application.StatusBar = "���������� � �����������..."

    ' �������� � ��������� ����
    Call copyDBToSend_Sheet6

    ' ������ �������
    Application.StatusBar = ""


    ' ����������� ����� ���� �� ��������� ��������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �����-������� Capacity Model", 100, 100))
    
    ' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������
    Call ��������_Lotus_Notes_����6_Capacity
        
    ' �������� ������ � ���������� Pre-Approved_��������
    Call ��������_Lotus_Notes_����6_Pre_Approved
                
    ' �������� ������ � ���������� IB
    Call ��������_Lotus_Notes_����6_IB
                
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub


' �������� ������� ������ � Capacity �� ����� "������� (�����)"
Sub openPivotTables_Capacity_�������_�����(In_ReportName_String)
Dim ������_������_�������_����� As Boolean
        
  ' Workbooks(In_ReportName_String).Activate
  ' Sheets("������� (�����)").Select
                
          ' ��������� ��� ������ � "������ ������ ����������" � ������� A (1)
          rowCount = 1
          ������_������_�������_����� = False
          Do While (Workbooks(In_ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value <> "����� ����") And (������_������_�������_����� = False)
            ' ��������� ������
            If (Trim(Workbooks(In_ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value) = "������ ������ ����������") Or (Trim(Workbooks(In_ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value) = "������� ��������� ���������") Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).ShowDetail = True
              
              ' �������� ������� �������
              ' ActiveSheet.PivotTables("SASApp:TEMP.CAP_CROSS").PivotFields("���������").PivotItems("������ ������ ����������").ShowDetail = True
              ' ���������� �������� ������
              ������_������_�������_����� = True
            End If
            ' ��������� ������
            rowCount = rowCount + 1
          Loop

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����6").Activate

End Sub

' �������� ������� ������ � Capacity �� ����� "PA_KK"
Sub openPivotTables_Capacity_PA_KK(In_ReportName_String)

  ' Workbooks(In_ReportName_String).Activate
  ' Sheets("PA_KK").Select
      
      
      rowCount = 1
      
      Do While (Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value <> "����� ����")
        
        ' ��������� ��1
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "��������� ��1" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
        End If
        
        ' ��������� ������ - ���� ��� ��������� (��� ��1), ����������, ���������������, ���������������, �����-����
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "�� ""���������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("�� ""���������""").ShowDetail = True
        End If
        ' ����������
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "��2""����������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2""����������""").ShowDetail = True
        End If
        ' ���������������
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "��2 ""���������������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2 ""���������������""").ShowDetail = True
        End If
        ' ���������������
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "��2""���������������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2""���������������""").ShowDetail = True
        End If
        ' �����-����
        If Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).Value = "��2 ""�����-����""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("PA_KK").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2 ""�����-����""").ShowDetail = True
        End If
                   
        ' ��������� ������
        rowCount = rowCount + 1
      Loop

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����6").Activate

End Sub

' �������� ������� ������ � Capacity �� ����� "Pre-Approved"
Sub openPivotTables_Capacity_PA_��(In_ReportName_String)

  ' Workbooks(In_ReportName_String).Activate
  ' Sheets("Pre-Approved").Select
      
      rowCount = 1
      ' ������_������_�������_����� = False
      Do While (Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value <> "����� ����")
        
        
        ' ��������� ������� ������ "��������� ��1"
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "��������� ��1" Then
          
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("�� ""���������""").ShowDetail = True
          
        End If
        
        
        ' ��������� ������ - ���� ��� ��������� (��� ��1), ����������, ���������������, ���������������, �����-����
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "�� ""���������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("�� ""���������""").ShowDetail = True
        End If
        ' ����������
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "��2""����������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2""����������""").ShowDetail = True
        End If
        ' ���������������
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "��2 ""���������������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2 ""���������������""").ShowDetail = True
        End If
        ' ���������������
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "��2""���������������""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2""���������������""").ShowDetail = True
        End If
        ' �����-����
        If Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).Value = "��2 ""�����-����""" Then
          ' ���������� ������� �������
          Workbooks(In_ReportName_String).Sheets("Pre-Approved").Cells(rowCount, 1).ShowDetail = True
          ' �������� ������� �������
          ' ActiveSheet.PivotTables("SASApp:TEMP.CAPACITY_PA").PivotFields("���. ����").PivotItems("��2 ""�����-����""").ShowDetail = True
        End If
                   
        ' ��������� ������
        rowCount = rowCount + 1
      Loop

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����6").Activate

End Sub

' �������� ������� ������� openPivotTables_Capacity_���_������_��
Sub openPivotTables_Capacity_���_������_��(In_ReportName_String)
Dim ������_������_�������_����� As Boolean
                
  ' Workbooks(In_ReportName_String).Activate
  ' Sheets("���. ������ ��").Select
                  
          ' ��������� ��� ������ � "������ ������ ����������" � ������� A (1)
          rowCount = 1
          ������_������_�������_����� = False
          Do While (Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value <> "����� ����") And (������_������_�������_����� = False)
            
            ' ��������� ������ - ������ ������ ����������
            If (Trim(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value) = "������ ������ ����������") Or ((Trim(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value) = "������� ��������� ���������")) Then
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' �������� ������� �������
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���������").PivotItems("������ ������ ����������").ShowDetail = True
            End If

            ' ��������� ������ 2 - ��������� ��1
            If Trim(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value) = "��������� ��1" Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("��������� ��1").ShowDetail = True
              
              ' ���������� �������� ������
              ' ���� ������� - ������_������_�������_����� = True
            
            End If
            
            ' ����� ����� �� ������� ������� �����
            ' �� "���������"
            If InStr(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "�� ""���������""") <> 0 Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("�� ""���������""").ShowDetail = True
            
            End If
            
            ' ��2"����������"
            If InStr(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "��2""����������""") <> 0 Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("��2""����������""").ShowDetail = True
            
            End If
            
            ' ��2 "���������������"
            If InStr(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "��2 ""���������������""") <> 0 Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("��2 ""���������������""").ShowDetail = True
            
            End If
            
            ' ��2"���������������"
            If InStr(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "��2""���������������""") <> 0 Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("��2""���������������""").ShowDetail = True
            
            End If
            
            ' ��2 "�����-����"
            If InStr(Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).Value, "��2 ""�����-����""") <> 0 Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("���. ������ ��").Cells(rowCount, 1).ShowDetail = True
              ' ActiveSheet.PivotTables("SASApp:TEMP.DET_OF_CLIENT").PivotFields("���. ����").PivotItems("��2 ""�����-����""").ShowDetail = True
            
            End If
            
    
            ' ��������� ������
            rowCount = rowCount + 1
          Loop

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����6").Activate

End Sub

      
' ��������� ���� ������ Capacity. ���� "��� ��������". ������ "�� - �������� - ��� �������� - ��������� �������� - ��������".
Function dateReportFromCapacity(In_Workbooks, In_Sheet) As Date
Dim ������_��_��������, ����_Column, ColumnCount As Byte

  ' ������ � �� - �������� - ��� �������� - ��������� �������� - ��������
  ������_��_�������� = rowByValue(In_Workbooks, In_Sheet, "�� - �������� - ��� �������� - ��������� �������� - ��������", 100, 100)
  
  ' ������� ����
  ����_Column = ColumnByValue(In_Workbooks, In_Sheet, "����", 100, 100)
  
  ' ��������� �������
  ColumnCount = ColumnByValue(In_Workbooks, In_Sheet, "�� - �������� - ��� �������� - ��������� �������� - ��������", 100, 100) + 1
  
  Do While ColumnCount < ����_Column
    
    ' ���� � ������ �� �����
    ' If Workbooks(In_Workbooks).Sheets(In_Sheet).Cells(������_��_��������, ColumnCount).Value <> "" Then
    If Not IsEmpty(Workbooks(In_Workbooks).Sheets(In_Sheet).Cells(������_��_��������, ColumnCount).Value) Then
      
      dateReportFromCapacity = CDate(Workbooks(In_Workbooks).Sheets(In_Sheet).Cells(������_��_��������, ColumnCount).Value)
      
    End If
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
  
  ' t = dateReportFromCapacity
  
End Function


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����6_Capacity()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������������
  If MsgBox("��������� ���� ������ ������ � ��������� Capacity Model?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = subjectFromSheet("����6")

    ' hashTag - ������:
    hashTag = hashTagFromSheet("����6")
    
    ' ����-�������� �� "��������1"
    attachmentFile = ThisWorkbook.Sheets("����6").Range("AM3").Value
 
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������ �������� �� �������� ������ � ������ ������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)

    ' ���������
    MsgBox ("������ ����������!")
          
  End If
  
End Sub

' �������� ����� � PA
Sub createBook_out_PA(In_OutBookName)

    ' ����: ID_�������_Retail, PA, DateOfActiv, ������_PA, PA_KK, ������_��_��, chan, ���_����������, �������, �������

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "ID_�������_Retail"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    
    ' ���
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "���"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    
    ' PA
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "PA"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
 
    ' DateOfActiv
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "DateOfActiv"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
    
    ' ������_PA
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "������_PA"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    
    ' PA_KK
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "PA_KK"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    
    ' ������_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "������_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlCenter
    
    ' chan
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "chan"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlCenter
    
    ' ���_����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "���_����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    
    ' �������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlCenter
    
    ' �������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).HorizontalAlignment = xlCenter

End Sub

' �������� ����� ��� �������� � �����
Sub copyDBToSend_Sheet6()
Dim TemplatesFile As String

  Application.StatusBar = "�����������..."

  ' ��������� "����� �����-�������.xlsx"
  If Dir(ThisWorkbook.Path + "\Templates\" + "����� �����-�������.xlsx") <> "" Then
    ' ��������� ������ Templates\���������� ����� �� ��������
    TemplatesFileName = "����� �����-�������"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����6").Activate

  ' ��������� ������ �����������
  ' ThisWorkbook.Sheets("����8").Cells(rowByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100) + 2).Value = _
  '   getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���", 2)

  ' ��� ������ �����
  FileCapacityName = Replace(Mid(ThisWorkbook.Sheets("����6").Range("B2").Value, 1, 41), ".", "-") + ".xlsx"
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileCapacityName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  ' ��������1
  ThisWorkbook.Sheets("����6").Range("AM3").Value = ThisWorkbook.Path + "\Out\" + FileCapacityName
            
  ' *** ����������� ������ ***
   
  ' ����� �����-������� � �� �.
  ThisWorkbook.Sheets("����6").Range("B1").Copy Destination:=Workbooks(FileCapacityName).Sheets("Capacity Model").Range("B1")
   
  ' �������� ����
  For j = 1 To 34
    ThisWorkbook.Sheets("����6").Cells(3, j).Copy Destination:=Workbooks(FileCapacityName).Sheets("Capacity Model").Cells(3, j)
  Next j
      
  ' �������� ������ �� ������
  For i = 6 To 40
      
    For j = 1 To 34
      ThisWorkbook.Sheets("����6").Cells(i, j).Copy Destination:=Workbooks(FileCapacityName).Sheets("Capacity Model").Cells(i, j)
    Next j
      
  Next i
  
  ' ***
                    
  ' �������� �����
  Workbooks(FileCapacityName).Close SaveChanges:=True

  ' ����������� ���������
  Application.StatusBar = "�����������!"

End Sub

' ��������_Lotus_Notes_����6_Pre_Approved �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����6_Pre_Approved()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������������
  If MsgBox("��������� ���� ������ ������ � ��������� Pre-Approved?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = "������� � Pre-Approved �� " + Mid(ThisWorkbook.Sheets("����6").Range("B2").Value, 32, 10)

    ' hashTag - ������:
    hashTag = hashTagFromSheet("����6") + " #Pre-Approved"
    
    ' ����-�������� �� "��������2"
    attachmentFile = ThisWorkbook.Sheets("����6").Range("AO3").Value
 
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������ �������� � ���������� �������� ��������� �� �������������� � ��." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ������������ ��������� � ���� �� " + CStr(weekEndDate(Date) - 2) + " � ���������� �� ����� " + CStr(ThisWorkbook.Sheets("����6").Range("Q3").Value * 100) + "% " + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)

    ' ���������
    MsgBox ("������ ����������!")
          
  End If
  
End Sub

' ��������� ������ � ������� ���������� ����������� �� ����8 ��� In_officeName �� ��������-���� (��)
Function Range_����8_��������_����(In_officeName)
        
        Select Case In_officeName
          Case "�� ����������"
            Range_����8_��������_���� = "M15"
          Case "�� �����������"
            Range_����8_��������_���� = "M53"
          Case "�� ����������������"
            Range_����8_��������_���� = "M91"
          Case "�� ����������������"
            Range_����8_��������_���� = "M129"
          Case "�� ������-����"
            Range_����8_��������_���� = "M167"
        End Select
  
End Function

' �������� ����� � ��
Sub createBook_out_��(In_OutBookName)

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    
    ' ID_�������_Retail
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "ID_�������_Retail"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    
    ' ���
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "���"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    
    ' ���_�������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "���_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 18
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    
    ' IB
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 8
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
 
    ' Net IB
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "��� ��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 12
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    
    ' �� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "�� ��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    
    ' ��������� ����������� ��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "��������� ����������� ��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 30
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlCenter
    
    ' ���_����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "���_����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlCenter
    
    ' �������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    
    ' �������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlCenter

    ' �����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).Value = "�����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").EntireColumn.ColumnWidth = 50
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).HorizontalAlignment = xlCenter


End Sub

' ��������_Lotus_Notes_����6_IB
Sub ��������_Lotus_Notes_����6_IB()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������������
  If MsgBox("��������� ���� ������ ������ � ��������� IB?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = "������� � ����������� ����������� ��������-����� �� " + Mid(ThisWorkbook.Sheets("����6").Range("B2").Value, 32, 10)

    ' hashTag - ������:
    hashTag = hashTagFromSheet("����6") + " #IB"
    
    ' ����-�������� �� "��������2"
    attachmentFile = ThisWorkbook.Sheets("����6").Range("AQ3").Value
 
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����6", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������ �������� � ����������� ����������� � ����������� ��." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ���������� �������� �� ��������:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "- ������� " + Chr(34) + "��" + Chr(34) + " = 0 - �������, ������� ����� ���������� ��" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "- ������� " + Chr(34) + "��������� ����������� ��" + Chr(34) + " = 1 - ������� � ������� �������� ����������� ��" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)

    ' ���������
    MsgBox ("������ ����������!")
          
  End If
  
End Sub

