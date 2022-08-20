Attribute VB_Name = "Module_����4"
' ���� 4 ����� ������� �� ����

' ����� ������� �� ����
Sub �����_�������()
  
Dim ����_����������_�����������, ����_�������_������������_��_����_������������, ����_�����_������ As Date
Dim �����_�������_������_��, �����_�������_�����_������_�_��_�����_������_�� As Integer
Dim �����_�������_������_���, �����_�������_�����_������_�_��_�����_������_��� As Double
Dim rowCount, RecCount_In_OutBookName As Integer
Dim dateBeginWeek, dateEndWeek As Date
' �������� ������ �������� set�_���In����, current�_���In����
Dim call_set�_���In����, call_current�_���In���� As Boolean
       
  ' ����� ���������
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xls), *.xls", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� ������"

    ' ������� ��� ���� ������ �� ����� �����
    DBstrName_String = Dir(FileName)
  
    ' ����-�����: � "S3"
    ThisWorkbook.Sheets("����4").Range("S3").Value = FileName
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
        
    ' ��������� BASE\Tasks
    OpenBookInBase ("Tasks")

    ' ��������� ������� �����
    ThisWorkbook.Sheets("����4").Activate
               
    ' ��������� ������
    ' ����� ������� �� ������ � 10.02 �� 16.02 (� ������������ ��� � �� ���������� �����������)
    
    ' ���� ������ ������
    dateBeginWeek = weekStartDate(Date)
    
    ' ���� ����� ������
    dateEndWeek = weekEndDate(Date)

    ' ������
    ThisWorkbook.Sheets("����4").Cells(2, 10).Value = CStr(WeekNumber(Date))

    ' �������� ������ �������� set�_���In����, current�_���In����
    call_set�_���In���� = False
    call_current�_���In���� = False

    ' ������� ���� � ���������
    ThisWorkbook.Sheets("����4").Cells(2, 2).Value = "����� ������� �� " + CStr(Date) + " �."
    ����_����������_����������� = Next_sunday_date(Date)
    ThisWorkbook.Sheets("����4").Cells(4, 3).Value = "����� ������� �� ������ (" + CStr(WeekNumber(Date)) + ")                           � " + Mid(CStr(Date), 1, 5) + " �� " + Mid(CStr(����_����������_�����������), 1, 5)
    ����_�������_������������_��_����_������������ = ����_����������_����������� + 1
    
    ' ����_�����_������ = Date_last_day_month(Date)
    ����_�����_������ = Date_last_day_month(����_�������_������������_��_����_������������)
    ThisWorkbook.Sheets("����4").Cells(4, 5).Value = "����� �������                             � " + Mid(CStr(����_�������_������������_��_����_������������), 1, 5) + " �� " + Mid(CStr(����_�����_������), 1, 5)
    
    ' ��������� ������� ���� (������)
    If �������������N("����") = WeekNumber(Date) Then
      ' �� ��� ��������� �� ���� 4 (���������� ���� � ����� ����)
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 2, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 3).Value = "���� ���.(" + CStr(WeekNumber(Date)) + ")"
      ' ����
      ThisWorkbook.Sheets("����").Cells(6, 6).Value = "���� ���.(" + CStr(WeekNumber(Date)) + ")"
    End If
    
    ' ���� (���������� ������) (!!!)
    ThisWorkbook.Sheets("����4").Cells(2, 16).Value = "��������� ��� ��������� ���/���/������� c " + Mid(CStr(Date), 1, 5) + " �� " + Mid(CStr(����_����������_�����������), 1, 5)
    
    ' ������� �������� ����� ��� �������� �������
    OutBookName = ThisWorkbook.Path + "\Out\DepositsFinish_" + Mid(CStr(Date), 1, 5) + "_" + Mid(CStr(����_����������_�����������), 1, 5) + ".xlsx"
    Call createBook_out_DepositsFinish(OutBookName)
    
    ' ����-�������� (!!!)
    ThisWorkbook.Sheets("����4").Cells(3, 17).Value = OutBookName
    
    ' ������� ������� � ����� OutBookName
    RecCount_In_OutBookName = 1
    
    ' ��������� ������� �����
    ThisWorkbook.Sheets("����4").Activate
        
    ' ��������� ������
    For i = 1 To 5
      ' ������ ������ �� 1 �� 5
      Select Case i
        Case 1
          ' �� ����������
          officeNameInReport = "���������"
        Case 2
          ' �� �����������
          officeNameInReport = "����������"
        Case 3
        ' �� ����������������
          officeNameInReport = "���������������"
        Case 4
        ' �� ����������������
          officeNameInReport = "���������������"
        Case 5
        ' �� ������-����
          officeNameInReport = "�����-����"
      End Select
      ' ��������� ����������
      �����_�������_������_��� = 0
      �����_�������_������_�� = 0
      �����_�������_�����_������_�_��_�����_������_��� = 0
      �����_�������_�����_������_�_��_�����_������_�� = 0
      ' ��������� ������
      ' 1 - ����� � ���.�����������:
      ' ---------
      ' 2 - "���.����:"
      ' 7 - ���������/����������/...
      ' ---------
      ' 1 - ����� ��������
      ' 5 - ���
      ' 9 - ����
      ' 10 - ��� ������
      ' 14 - ����
      ' 15 - �����

      �������_��_����� = False
      rowCount = 1
      Do While (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 1).Value, "����� � ���.�����������:") = 0)
        
        ' ���� ������ ������� ����
        If (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 2).Value, "���.����:") <> 0) And (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 7).Value, officeNameInReport) <> 0) Then
          ' ������� ����������
          �������_��_����� = True
        End If
        ' ���� ���� ������ ����
        If (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 2).Value, "���.����:") <> 0) And (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 7).Value, officeNameInReport) = 0) Then
          ' ������� ����������
          �������_��_����� = False
        End If
        
        ' ��������� ������ - ���� � 3-� ������� ���� ���� 423*
        If (InStr(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 9).Value, "423") <> 0) Then
          
          ' ���� ����� ����������� �� ������
          If (�������_��_����� = True) And (CDate(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 14).Value) >= Date) And (CDate(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 14).Value) <= ����_����������_�����������) Then
            �����_�������_������_��� = �����_�������_������_��� + CDbl(Replace(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 15).Value, ".", ","))
            �����_�������_������_�� = �����_�������_������_�� + 1
            RecCount_In_OutBookName = RecCount_In_OutBookName + 1
            ' ��������� ����� � ����� ��������� ��������� ��� ������
            Call insert_to_DepositsFinish(OutBookName, _
                                            RecCount_In_OutBookName, _
                                              CDate(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 14).Value), _
                                                Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 1).Value, _
                                                  Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 9).Value, _
                                                    Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 5).Value, _
                                                      CDbl(Replace(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 15).Value, ".", ",")), _
                                                        officeNameInReport)
          End If
          
          ' ���� ����� ����������� ����� ������ � �� ����� ������
          If (�������_��_����� = True) And (CDate(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 14).Value) >= ����_�������_������������_��_����_������������) And (CDate(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 14).Value) <= ����_�����_������) Then
            �����_�������_�����_������_�_��_�����_������_��� = �����_�������_�����_������_�_��_�����_������_��� + CDbl(Replace(Workbooks(DBstrName_String).Sheets("Page 1").Cells(rowCount, 15).Value, ".", ","))
            �����_�������_�����_������_�_��_�����_������_�� = �����_�������_�����_������_�_��_�����_������_�� + 1
          End If
          
        End If
        
        ' ��������� ������
        rowCount = rowCount + 1
      Loop ' While
      
      ' ������� �����
      ThisWorkbook.Sheets("����4").Cells(5 + i, 3).Value = �����_�������_������_��
      ThisWorkbook.Sheets("����4").Cells(5 + i, 4).Value = Round(�����_�������_������_��� / 1000, 2)
      '
      ThisWorkbook.Sheets("����4").Cells(5 + i, 5).Value = �����_�������_�����_������_�_��_�����_������_��
      ThisWorkbook.Sheets("����4").Cells(5 + i, 6).Value = Round(�����_�������_�����_������_�_��_�����_������_��� / 1000, 2)
      
      ' ���� - ���� �� ������
      If �������������N("����") = WeekNumber(Date) Then
        ' ���� �� ������
        ThisWorkbook.Sheets("����").Cells(6 + i, 5).Value = Round((ThisWorkbook.Sheets("����4").Cells(5 + i, 4).Value / 100) * 18, 0)
        ' ��������� ����� ������i
        Call set�_���In����(ThisWorkbook.Name, "����", "������" + CStr(i), ThisWorkbook.Sheets("����").Cells(6 + i, 5).Value, dateBeginWeek, "���.���.", "��� � ��������� ������� �� ������ 18% (����� " + CStr(�����_�������_������_��) + " ��. �� ����� " + CStr(Round(ThisWorkbook.Sheets("����4").Cells(5 + i, 4).Value, 0)) + " ���.���.)")
        ' ����������, ��� ��������� set�_���In���� ��������
        call_set�_���In���� = True
      End If
      
    Next i ' ��������� ����
    
    ' ������� �����
    
    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
            
    ' ��������� �������� ����� � ���������
    Call sort_OutBookName_ByDate(OutBookName)
    Workbooks(Dir(OutBookName)).Close SaveChanges:=True
                        
    ' ��������� ���� BASE\Tasks
    CloseBook ("Tasks")
                                               
    ' ��������� ������ ��� �������� (� "������ �����������:"):
    ThisWorkbook.Sheets("����4").Cells(rowByValue(ThisWorkbook.Name, "����4", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����4", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,���1", 2)
                                                                                              
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����4").Cells(2, 13).Select

    ' ������ �������
    Application.StatusBar = ""
    
    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D5")
    ' ����� �� ������ ���������� �� ������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �� ������ ���������� �� ������", 100, 100))
    
    MsgBox ("��������� " + DBstrName_String + " ���������!")

    ' ������ �� �������� ������� ������
    If MsgBox("��������� ������ ������ �� ����������?", vbYesNo) = vbYes Then
      
      Call ��������_Lotus_Notes_����4_������
      
    End If


  End If ' ���� ���� ��� ������

End Sub



' �������� ����� � ���������� ��������
Sub createBook_out_DepositsFinish(In_OutBookName)

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "����_���������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "�����_��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 21
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "�����_�����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 22
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 50
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "�����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 18
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "���"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "�������: 1(��)/ 0(���)"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "�� �������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    '
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "������ � CRM"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 50
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlCenter

    ' ActiveCell.Offset(0, -4).Columns("A:A").EntireColumn.Select
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("C:C").Select
    ' ��������
    ' Selection.NumberFormat = "0"
    ' ���������
    Selection.NumberFormat = "@"

    ' ��������� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1:J1").Select
    Selection.AutoFilter
    
End Sub

' ���������� ������ � ����� � ���������� ��������
Sub insert_to_DepositsFinish(In_OutBookName, In_RecCount, In_DateEnd, In_NumberDoc, In_NumberAcc, In_Client, In_Sum, In_Office)
  
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 1).Value = In_DateEnd
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 2).Value = In_NumberDoc
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 3).Value = In_NumberAcc
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 4).Value = In_Client
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 5).Value = In_Sum
  Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(In_RecCount, 6).Value = In_Office
    
End Sub

' ���������� ������ �� ����
Sub sort_OutBookName_ByDate(In_OutBookName)

    ' ��������� �� ����� � ���������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate

    ' ActiveCell.Offset(0, -7).Columns("A:A").EntireColumn.Select
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").Select
    
    ' ActiveWorkbook.Worksheets("����1").Sort.SortFields.Clear
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Sort.SortFields.Clear
    
    ' ActiveWorkbook.Worksheets("����1").Sort.SortFields.Add Key:=ActiveCell.Offset(-1, 0).Range("A1"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Sort.SortFields.Add Key:=Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With Workbooks(Dir(In_OutBookName)).Sheets("����1").Sort
        .SetRange ActiveCell.Range("A2:F53")
        .Header = xlNo
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
    
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1").Select

    ' ��������� ������� � ������� �����
    ThisWorkbook.Sheets("����4").Activate

End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����4_������()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����4").Cells(RowByValue(ThisWorkbook.Name, "����4", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����4", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����4")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����4").Cells(RowByValue(ThisWorkbook.Name, "����4", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����4", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����4")

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����4").Cells(3, 17).Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����4").Cells(rowByValue(ThisWorkbook.Name, "����4", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����4", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������ ������� �� ����� ������. ����� � ���� �� " + CStr(Next_sunday_date(Date)) + " ������������ ������ �� ����������� � ���/���/������� � ���������� ��������� �� ����� 18%. ������ ���������� �� ��������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
  ' End If
  
End Sub

' ����� ����/���� �� 18.03.2020 �� ��������� ���_���
Sub �����_����_����_��_���������_���_���()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult, ���_����4_Range_str As String
Dim i, rowCount As Integer
Dim finishProcess, officeWasFound As Boolean
Dim column_������, column_��, column_����, column_����, ���_����4_Range_Row, ���_����4_Range_Column As Byte
Dim date_�����_����_����_��_���������_���_��� As Date

  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����4").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "�����", 8, Date)
    
    If CheckFormatReportResult = "OK" Then
      
      ' ��������� BASE\Tasks
      OpenBookInBase ("Tasks")
    
      ' ��������� ������� ������� �� ��� (����1) � ��� (����2)
      openPivotTables_�����_����_����_��_���������_���_��� (ReportName_String)
      
      ' ������� ������ � ������� "���, ���. ���." �� ����4
      ���_����4_Range_str = RangeByValue(ThisWorkbook.Name, "����4", "���, ���. ���.", 100, 100)
      ���_����4_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����4").Range(���_����4_Range_str).Row
      ���_����4_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����4").Range(���_����4_Range_str).Column

      ' ���� ������: "����� �������� �� 20.03.2020 �� 20.03.2020 (16.30)" ��� "����� �������� �� 23.03.2020 �� 20-22.03.2020 (������ ����)"
      ' date_�����_����_����_��_���������_���_��� = CDate(Mid(Workbooks(ReportName_String).Sheets("�����").Range("E2").Value, 33, 10))
      date_�����_����_����_��_���������_���_��� = getDate_�����_����_����_��_���������_���_���(Workbooks(ReportName_String).Sheets("�����").Range("E2").Value)
      
      ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row - 2, ���_����4_Range_Column - 1).Value = "����������� ������-������� �� ��������� ���, ��� �� " + CStr(date_�����_����_����_��_���������_���_���) + " �."
      
      ' ������������ �����
      ' ���� �� 5-�� ������
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

        ' 1-�� ������ �� ������� �������: ��������� ����_���� ��� �� ����1
        ' ������� ������ ��������:
        column_������ = ColumnByName(ReportName_String, "����1", 1, "������")
        column_�� = ColumnByName(ReportName_String, "����1", 1, "��")
        column_���� = ColumnByName(ReportName_String, "����1", 1, "����")
        column_���� = ColumnByName(ReportName_String, "����1", 1, "����")
        '
        rowCount = 2
        officeWasFound = False
        Do While (Not IsEmpty(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, 1).Value)) And (officeWasFound = False)
        
          ' ��������� ������
          If InStr(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��).Value, officeNameInReport) <> 0 Then
            
            ' ������� ������ �� ����4
            
            ' ��� ����
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column).Value = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_����).Value
            ' ��� ����
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 1).Value = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_����).Value
            ' % ����������
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 2).Value = �����������(ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column).Value, ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 1).Value, 3)
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 2).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 2).Value)

            ' ������� ���� ���������� ����
            If �������������N("����") = WeekNumber(date_�����_����_����_��_���������_���_���) Then
              Call current�_���In����(ThisWorkbook.Name, "����", "������" + CStr(i), date_�����_����_����_��_���������_���_���, ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 1).Value, "���.���.")
            End If

            ' ���� ��� ������
            officeWasFound = True
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        
        Loop ' �� ���
         
        ' 2-�� ������ �� ������� �������: ��������� ����_���� ��� �� ����2
        ' ������� ������ ��������:
        column_������ = ColumnByName(ReportName_String, "����2", 1, "������")
        column_�� = ColumnByName(ReportName_String, "����2", 1, "��")
        column_���� = ColumnByName(ReportName_String, "����2", 1, "����")
        column_���� = ColumnByName(ReportName_String, "����2", 1, "����")
        '
        rowCount = 2
        officeWasFound = False
        Do While (Not IsEmpty(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, 1).Value)) And (officeWasFound = False)
        
          ' ��������� ������
          If InStr(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_��).Value, officeNameInReport) <> 0 Then
            
            ' ������� ������ �� ����4
            
            ' ��� ����
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 3).Value = Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����).Value
            ' ��� ����
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 4).Value = Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����).Value
            ' % ����������
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 5).Value = �����������(ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 3).Value, ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 4).Value, 3)
            ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����4").Cells(���_����4_Range_Row + 1 + i, ���_����4_Range_Column + 5).Value)

            ' ���� ��� ������
            officeWasFound = True
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        
        Loop ' �� ���
      
      Next i ' ��������� ����
      
      ' ������� ����� ���������
      
      ' ���������� ���������� ���������
      finishProcess = True
      
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� ���� BASE\Tasks
    CloseBook ("Tasks")
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����4").Range("L1").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� ����-���� �� ��������� ���_���", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub

' �������� ������� ������ � "����� ����/���� �� ��.��.���� �� ��������� ���_���"
Sub openPivotTables_�����_����_����_��_���������_���_���(In_ReportName_String)
Dim rowCount As Integer
Dim ������_������ As Boolean
Dim Range_str, ������� As String
Dim Range_Row, Range_Column, i As Byte

  ' ������� �� ����� "�����" ������ "���" (����� ������ "���")
  For i = 1 To 2
        ' ��� ��������
        Select Case i
          Case 1 ' ���
            ������� = "���"
          Case 2 ' ���
            ������� = "���"
  End Select
  
  ' ������� �� ����� �������
  Range_str = RangeByValue(In_ReportName_String, "�����", �������, 100, 100)
  Range_Row = Workbooks(In_ReportName_String).Sheets("�����").Range(Range_str).Row
  Range_Column = Workbooks(In_ReportName_String).Sheets("�����").Range(Range_str).Column

                
          ' ��������� ��� ������ � "������ ������ ����������" � ������� A (1)
          rowCount = Range_Row + 3
          ������_������ = False
          
          Do While (Workbooks(In_ReportName_String).Sheets("�����").Cells(rowCount, Range_Column - 1).Value <> "����� ����") And (������_������ = False)
            
            ' ��������� ������
            If Trim(Workbooks(In_ReportName_String).Sheets("�����").Cells(rowCount, Range_Column - 1).Value) = "������ ������ ����������" Then
              
              ' ���������� ������� �������
              Workbooks(In_ReportName_String).Sheets("�����").Cells(rowCount, Range_Column).ShowDetail = True
              
              ' ���������� �������� ������
              ������_������ = True
              
            End If
            
            ' ��������� ������
            rowCount = rowCount + 1
        
          Loop

  Next i


  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����4").Activate

End Sub
