Attribute VB_Name = "Module_����"
' ����

' ������_���������_5_������
Sub ������������_������_������_��_�������()
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
Dim monthInQuarter1, monthInQuarter2, monthInQuarter3 As String
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� � �������������")

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
    ThisWorkbook.Sheets("����").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "��", 10, Date)
    
    If CheckFormatReportResult = "OK" Then
      
      ' 1. �� ��������� ���������� �������� �������: monthInQuarter1, monthInQuarter2, monthInQuarter3 - ������  ��� ����
      monthInQuarter1 = Workbooks(ReportName_String).Sheets("��").Cells(2, 5).Value
      monthInQuarter2 = Workbooks(ReportName_String).Sheets("��").Cells(2, 6).Value
      monthInQuarter3 = Workbooks(ReportName_String).Sheets("��").Cells(2, 7).Value
      
      ' ������������ �����
      ' ���� �� 5-�� ������
      ' ��������� ������
      For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "���������"
          Case 2 ' �� �����������
            officeNameInReport = "����������"
          Case 3 ' �� ����������������
            officeNameInReport = "���������������"
          Case 4 ' �� ����������������
            officeNameInReport = "���������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�����-����"
        End Select

        rowCount = 3
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 4).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 4).Value, officeNameInReport) <> 0 Then
            
            ' ���� 1-�� ������
            ThisWorkbook.Sheets("����").Cells(5 + i, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter1, 1, 32)).Value = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 5).Value
            
            ' ���� 2-�� ������
            ThisWorkbook.Sheets("����").Cells(5 + i, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter2, 1, 32)).Value = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 6).Value
            
            ' ���� 3-�� ������
            ThisWorkbook.Sheets("����").Cells(5 + i, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter3, 1, 32)).Value = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 7).Value
            
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' 2. �������
      rowCount = 3
      Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 3).Value)
        
        ' ���� ��� ������� ���� �� "���������"
        If (InStr(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 3).Value, "���������") <> 0) Then
            
          ' ���� 1-�� ������
          ThisWorkbook.Sheets("����").Cells(15, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter1, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 4).Value
            
          ' ���� 2-�� ������
          ThisWorkbook.Sheets("����").Cells(15, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter2, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 5).Value
            
          ' ���� 3-�� ������
          ThisWorkbook.Sheets("����").Cells(15, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter3, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 6).Value
            
        End If
        
        ' ���� ��� ������� ���� ��2"����������"
        If (InStr(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 3).Value, "����������") <> 0) Then
            
          ' ���� 1-�� ������
          ThisWorkbook.Sheets("����").Cells(16, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter1, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 4).Value
            
          ' ���� 2-�� ������
          ThisWorkbook.Sheets("����").Cells(16, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter2, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 5).Value
            
          ' ���� 3-�� ������
          ThisWorkbook.Sheets("����").Cells(16, ColumnByNameAndNumber(ThisWorkbook.Name, "����", 4, monthInQuarter3, 1, 32)).Value = Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 6).Value
            
        End If
        
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "��: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      
      Loop
      
    
      ' ������� ����� ���������
      
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����").Range("A1").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D9")
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub

