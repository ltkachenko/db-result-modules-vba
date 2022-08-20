Attribute VB_Name = "Module_����5"
' ���� 5 ����������� ������-������� (��������� ��������) �� ��.��.����

' ��������_���������_�_���������_���� ������
Sub ��������_���������_�_���������_����()
Attribute ��������_���������_�_���������_����.VB_ProcData.VB_Invoke_Func = " \n14"

Dim maxDateInReport, dateBeginMonth, dateBeginWeek, dateEndWeek As Date
Dim rowCount, countDayDebetCard, countWeekDebetCard, countMonthDebetCard, countDayCreditCard, countWeekCreditCard, countMonthCreditCard, workingDaysMonth, ����������_�����_����� As Integer
Dim planDayDebetCard, planDayCreditCard, lagDebetCard, lagCreditCard As Double
Dim ������������������ As Boolean
Dim officeNameInReport, ���������_�������_����� As String
' ��� ������ (�������� G41) � ������� �������� �������� �_��� (�������� ���1)
Dim Range�_��� As String
Dim Range�_���_Row, Range�_���_Column As Byte
' �������� ������ �������� set�_���In����, current�_���In����
Dim call_set�_���In����, call_current�_���In���� As Boolean
Dim finishProcess As Boolean
Dim CheckFormatReportResult As String
Dim DateTimeStart, DateTimeEnd As Date

  ' ������ - ������� ����������� (��������� ����) - ����������� ����� �� ���� �������?
  ' �������
  ' If Weekday(Date, vbMonday) = 1 Then
  '   MsgBox ("������� �����������, ������������ ����� � ��������� �� ������!")
  '  ' ������������� O8=1 P8=Date:
  '   ThisWorkbook.Sheets("����5").Cells(8, 15).Value = 1
  '   ThisWorkbook.Sheets("����5").Cells(8, 16).Value = Date
  ' Else
    ' ������������� O8=0
  '   ThisWorkbook.Sheets("����5").Cells(8, 15).Value = 0
  ' End If

  ' ����� ���������� �������� � ����������� �� ������
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xml), *.xml", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� ������..."
  
    DateTimeStart = Now
    ThisWorkbook.Sheets("����5").Cells(15, 19).Value = CStr(DateTimeStart)
  
    ' ������� ��� ���� ������ �� ����� �����
    DBstrName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0

    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����5").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(DBstrName_String, "������", 5, periodFromSheet("����5"))
    
    If CheckFormatReportResult = "OK" Then

    ' ���������� �������� ���������
    finishProcess = True

    ' ��������� BASE\Cards
    OpenBookInBase ("Cards")

    ' ��������� BASE\Tasks
    OpenBookInBase ("Tasks")
    
    ' ��������� BASE\Clients
    OpenBookInBase ("Clients")

    ' ������������ �����
    maxDateInReport = CDate(Mid(Workbooks(DBstrName_String).Sheets("������").Cells(2, 1).Value, 28, 10)) - 1
    ' ������� ����� ���� ������
    ' maxDateInReport = CDate(Mid(Workbooks(DBstrName_String).Sheets("������").Cells(2, 1).Value, 28, 10))
    
    ' ���������� maxDateInReport: ���� ������� �����������, �� ����� ����������� ����, ���� ����� ������ ����, �� ����� �� ������ �������
    ' If ThisWorkbook.Sheets("����5").Cells(8, 15).Value = 1 Then
      ' ����� ���� �� ������ P8
    ' maxDateInReport = CDate(ThisWorkbook.Sheets("����5").Cells(8, 16).Value)
    ' Else
      ' ����� ������������ ���� �� ������ �2=" �� ������ � 01.01.2020 �� 12.02.2020" �  �������� ���� ����!
      ' maxDateInReport = CDate(Mid(Workbooks(DBstrName_String).Sheets("������").Cells(2, 1).Value, 28, 10)) - 1
      ' �� ������ ���������� - ����� ���� 10.02.2020
      ' maxDateInReport = CDate("17.02.2020")
    ' End If
        
    ' maxDateInReport = CDate("21.02.2020")
    ' MsgBox ("��������! ����� �������, ������������ ������ ���� " + CStr(maxDateInReport))
        
    ' ���� ������ ������
    dateBeginMonth = CDate("01." + Mid(CStr(maxDateInReport), 4, 7))
    
    ' ���� ������ ������
    dateBeginWeek = weekStartDate(maxDateInReport)
    
    ' ���� ����� ������
    dateEndWeek = weekEndDate(maxDateInReport)
    
    ' ����� ������� ���� � ������ - MsgBox ("����� ������� ���� � ������ " + CStr(workingDaysMonth))
    workingDaysMonth = Working_days_in_the_FullMonth(maxDateInReport, 6)
    
    ' ������� ������ � ���������
    ' ������
    ThisWorkbook.Sheets("����5").Cells(2, 10).Value = CStr(WeekNumber(maxDateInReport))
    
    ' ThisWorkbook.Sheets("����5").Cells(5, 7).Value = "��������� �����, ������ � " + strDDMM(dateBeginWeek) + " �� " + strDDMM(dateEndWeek)
    ' ��������� �����,           ������ (48) � 10.02 �� 16.02
    ThisWorkbook.Sheets("����5").Cells(5, 7).Value = "��������� �����,           ������ (" + CStr(WeekNumber(maxDateInReport)) + ") � " + strDDMM(dateBeginWeek) + " �� " + strDDMM(dateEndWeek)
    
    ' ThisWorkbook.Sheets("����5").Cells(5, 9).Value = "��������� �����, ������ � " + strDDMM(dateBeginWeek) + " �� " + strDDMM(dateEndWeek)
    ' ��������� �����,           ������ (48) � 10.02 �� 16.02
    ThisWorkbook.Sheets("����5").Cells(5, 9).Value = "��������� �����,           ������ (" + CStr(WeekNumber(maxDateInReport)) + ") � " + strDDMM(dateBeginWeek) + " �� " + strDDMM(dateEndWeek)
    
    '
    ThisWorkbook.Sheets("����5").Cells(2, 2).Value = "����������� ������-������� (��������� ��������) �� " + CStr(maxDateInReport) + " �."
    ThisWorkbook.Sheets("����5").Cells(5, 11).Value = "������ �� " + Mid(CStr(maxDateInReport), 1, 5)
    ThisWorkbook.Sheets("����5").Cells(2, 18).Value = "����������� ������-������� (��������� ��������) �� " + CStr(maxDateInReport) + " �."

    ' �������� ������ �������� set�_���In����, current�_���In����
    call_set�_���In���� = False
    call_current�_���In���� = False

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

      ' ��������� ������
      rowCount = 5
      countDayDebetCard = 0
      countDayCreditCard = 0
      countWeekDebetCard = 0
      countWeekCreditCard = 0
      countMonthDebetCard = 0
      countMonthCreditCard = 0
      ����������_�����_����� = 0
      
      Do While Not IsEmpty(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 1).Value)
        
        ' ���� ���������� ������ (11)
        ' If CDate(Workbooks(DBstrName_String).Sheets("������").Cells(RowCount, 11).Value) = maxDateInReport Then
          
          ' ���������� �������� ����� � BASE\Cards
          ������������������ = False
          ' ������ �������
          Application.StatusBar = "��������� ������: " + officeNameInReport + " " + CStr(rowCount)

          ' ���� ��� ������� ���� - ������������� ������������ (10)
          If (InStr(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 10).Value, officeNameInReport) <> 0) Then
            
            ' ����� ������ (19): ����� ����� �����, ???, ������ ����� ������������� �������
            If (Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 19).Value = "����� ����� �����") Or (Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 19).Value = "???") Or (Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 19).Value = "������ ����� ������������� �������") Then
            
              ' ��������� �������
              ���������_�������_����� = Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 4).Value
            
              ' ��������� ����� - ��������� ������� (4): � ��������, ������� ����������, ���������� �����, ��������� ����� "����� ���� ��� ������", ���� ���, ���� ������
              If (���������_�������_����� = "� ��������") Or (���������_�������_����� = "������� ����������") Or (���������_�������_����� = "���������� �����") Or (InStr(���������_�������_�����, "����� ���� ��� ������") <> 0) Or (���������_�������_����� = "���� ���") Or (���������_�������_����� = "���� ������") Then
              
                ' ���� ���������� ������ (11)
                ' ����
                If CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) = maxDateInReport Then
                  countDayDebetCard = countDayDebetCard + 1
                End If
                ' ������
                If (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) >= dateBeginWeek) And (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) <= maxDateInReport) Then
                  countWeekDebetCard = countWeekDebetCard + 1
                End If
                ' �����
                If (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) >= dateBeginMonth) And (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) <= maxDateInReport) Then
                  countMonthDebetCard = countMonthDebetCard + 1
                  ������������������ = True
                  ' ���������� ����� � ������ ������
                  If ���������_�������_����� = "���������� �����" Then
                    ����������_�����_����� = ����������_�����_����� + 1
                  End If
                End If ' �����
                
                ' ������� ���������� � BASE\Clients
                If (���������_�������_����� = "���������� �����") Then
                
                  ��_������� = ��������������������2(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 16).Value)
                
                  Call InsertRecordInBook("Clients", "����1", "�����_�������", ��_�������, _
                                            "�����_�������", ��_�������, _
                                              "����", cityOfficeName(officeNameInReport), _
                                                "���", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 14).Value, _
                                                  "�������", ��������������������3(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 14).Value), _
                                                    "���", ��������������������4(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 14).Value), _
                                                      "��������", ��������������������5(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 14).Value), _
                                                        "��������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 15).Value, _
                                                          "Cards_Pensioner_Date", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 13).Value, _
                                                            "Cards_Pensioner", ���������_�������_�����, _
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
                End If ' ������� ���������� � BASE\Clients
                
              End If ' ��������� �����
            
              ' ��������� ����� - ��������� ������� (4): ������� ������, ��������� ����� 100+, "��������� ����� "��������", ����������
              ' If (Workbooks(DBstrName_String).Sheets("������").Cells(RowCount, 4).Value = "������� ������") Or (Workbooks(DBstrName_String).Sheets("������").Cells(RowCount, 4).Value = "��������� ����� 100+") Or (InStr(Workbooks(DBstrName_String).Sheets("������").Cells(RowCount, 4).Value, "��������") <> 0) Or (Workbooks(DBstrName_String).Sheets("������").Cells(RowCount, 4).Value = "����������") Then
              If (���������_�������_����� = "������� ������") Or (���������_�������_����� = "��������� ����� 100+") Or (InStr(���������_�������_�����, "��������") <> 0) Or (���������_�������_����� = "����������") Then
                ' ����
                If CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) = maxDateInReport Then
                  countDayCreditCard = countDayCreditCard + 1
                End If
                ' ������
                If (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) >= dateBeginWeek) And (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) <= maxDateInReport) Then
                  countWeekCreditCard = countWeekCreditCard + 1
                End If
                ' �����
                If (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) >= dateBeginMonth) And (CDate(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value) <= maxDateInReport) Then
                  countMonthCreditCard = countMonthCreditCard + 1
                  ������������������ = True
                End If
                
              End If ' ��������� �����
              
              ' �������� ����� � ����
              If ������������������ = True Then
                ' ������� � BASE\Cards
                Call InsertRecordInBook("Cards", "����1", "�����_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 1).Value, _
                                            "����_����������_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 11).Value, _
                                              "�������������_������������", officeNameInReport, _
                                                "�����_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 1).Value, _
                                                  "�����_�����", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 2).Value, _
                                                    "�����_��������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 3).Value, _
                                                      "���������_�������", ���������_�������_�����, _
                                                        "���������_�������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 5).Value, _
                                                          "������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 6).Value, _
                                                            "�����_������������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 7).Value, _
                                                              "���������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 8).Value, _
                                                                "�����_���������_�����", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 9).Value, _
                                                                  "����_����������_���������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 12).Value, _
                                                                    "����_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 13).Value, _
                                                                      "��������_�����", ��������������������(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 14).Value), _
                                                                        "���������_�����", ��������������������(Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 16).Value), _
                                                                          "�����_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 18).Value, _
                                                                            "�����_������", Workbooks(DBstrName_String).Sheets("������").Cells(rowCount, 19).Value, _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
                                                                     
              End If ' �������� ����� � ����
              
            End If ' ����� ������
          
          End If
        
        ' End If
      
        ' ��������� ������
        DoEventsInterval (rowCount)
        rowCount = rowCount + 1
      Loop
   
      ' ������� ������ �� �����:
      
      ' ��
      ThisWorkbook.Sheets("����5").Cells(6 + i, 4).Value = countMonthDebetCard
      ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value = countWeekDebetCard
      ThisWorkbook.Sheets("����5").Cells(6 + i, 11).Value = countDayDebetCard
      ' ��
      ThisWorkbook.Sheets("����5").Cells(6 + i, 6).Value = countMonthCreditCard
      ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value = countWeekCreditCard
      ThisWorkbook.Sheets("����5").Cells(6 + i, 12).Value = countDayCreditCard
      
      ' ���� �� 1 ���� - ����� 12-03
      ' planDayDebetCard = ThisWorkbook.Sheets("����5").Cells(6 + i, 3).Value / workingDaysMonth
      ' planDayCreditCard = ThisWorkbook.Sheets("����5").Cells(6 + i, 5).Value / workingDaysMonth
      
      ' ���������� �� ������ ������ - ����� 12-03
      ' lagDebetCard = planDayDebetCard * Working_days_between_dates(dateBeginMonth, dateBeginWeek - 1, 6) - (ThisWorkbook.Sheets("����5").Cells(6 + i, 4).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value)
      
      ' MsgBox ("���������� �� ������ ������ ��: " + CStr(lagDebetCard)) - ����� 12-03
      ' lagCreditCard = planDayCreditCard * Working_days_between_dates(dateBeginMonth, dateBeginWeek - 1, 6) - (ThisWorkbook.Sheets("����5").Cells(6 + i, 6).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value)
      
      ' ���� �� ������ �� ��
      ' ThisWorkbook.Sheets("����5").Cells(6 + i, 7).Value = Round((planDayDebetCard * Working_days_between_dates(dateBeginWeek, dateEndWeek, 6)) + ((lagDebetCard / Working_days_between_dates(dateBeginWeek, Date_last_day_month(maxDateInReport), 6)) * Working_days_between_dates(dateBeginWeek, dateEndWeek, 6)), 0)
      ' ���� �� ������ �� ��
      ' ThisWorkbook.Sheets("����5").Cells(6 + i, 9).Value = Round((planDayCreditCard * Working_days_between_dates(dateBeginWeek, dateEndWeek, 6)) + ((lagCreditCard / Working_days_between_dates(dateBeginWeek, Date_last_day_month(maxDateInReport), 6)) * Working_days_between_dates(dateBeginWeek, dateEndWeek, 6)), 0)
            
      ' ���� �� ������ �� �� (������� 2) - 6 ����
      ' ThisWorkbook.Sheets("����5").Cells(6 + i, 7).Value = Round(������������(ThisWorkbook.Sheets("����5").Cells(6 + i, 3).Value, ThisWorkbook.Sheets("����5").Cells(6 + i, 4).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value, maxDateInReport, 6), 0)
      ' ���� �� ������ �� �� (������� 2) - 5 ����
      ThisWorkbook.Sheets("����5").Cells(6 + i, 7).Value = Round(������������(ThisWorkbook.Sheets("����5").Cells(6 + i, 3).Value, ThisWorkbook.Sheets("����5").Cells(6 + i, 4).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value, maxDateInReport, 5), 0)
      
      ' ���� �� ������ �� �� (������� 2) - 6 ����
      ' ThisWorkbook.Sheets("����5").Cells(6 + i, 9).Value = Round(������������(ThisWorkbook.Sheets("����5").Cells(6 + i, 5).Value, ThisWorkbook.Sheets("����5").Cells(6 + i, 6).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value, maxDateInReport, 6), 0)
      ' ���� �� ������ �� �� (������� 2) - 5 ����
      ThisWorkbook.Sheets("����5").Cells(6 + i, 9).Value = Round(������������(ThisWorkbook.Sheets("����5").Cells(6 + i, 5).Value, ThisWorkbook.Sheets("����5").Cells(6 + i, 6).Value - ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value, maxDateInReport, 5), 0)
            
      ' ����� �� ���������� ���������� ����
      ' ����������_�����_�����
      ThisWorkbook.Sheets("����5").Cells(6 + 16 + i, 3).Value = ����������_�����_�����
            
      ' ������� ��������� � ���� "����"
      ' ���� �� ������ �� ������� �� ������ ��
      If �������������N("����") = WeekNumber(maxDateInReport) Then
        ThisWorkbook.Sheets("����").Cells(6 + i, 7).Value = ThisWorkbook.Sheets("����5").Cells(6 + i, 7).Value
        ' ��������� ����� �� ���i
        Call set�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), ThisWorkbook.Sheets("����5").Cells(6 + i, 7).Value, dateBeginWeek, "��.", "")
        ' ����������, ��� ��������� set�_���In���� ��������
        call_set�_���In���� = True
      End If
      
      ' ���� �� ������� �� ������
      If �������������N("����") = WeekNumber(maxDateInReport) Then
        ThisWorkbook.Sheets("����").Cells(6, 8).Value = "���� ���.(" + CStr(WeekNumber(maxDateInReport)) + ")"
        ThisWorkbook.Sheets("����").Cells(6 + i, 8).Value = ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value
        ' --- ������� ���� ���������� ����
        Call current�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), maxDateInReport, ThisWorkbook.Sheets("����5").Cells(6 + i, 8).Value, "��.")
        ' ����������, ��� ��������� current�_���In���� ��������
        call_current�_���In���� = True
        ' --- ����� ������� ���� ���������� ����
      End If
      
      ' ���� �� ������� �� ������
      If �������������N("����") = WeekNumber(maxDateInReport) Then
        ThisWorkbook.Sheets("����").Cells(6, 10).Value = "���� ���.(" + CStr(WeekNumber(maxDateInReport)) + ")"
        ThisWorkbook.Sheets("����").Cells(6 + i, 10).Value = ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value
      End If
      
      ' ���� �� ������ �� ������� �� ������ ��
      If �������������N("����") = WeekNumber(maxDateInReport) Then
        ThisWorkbook.Sheets("����").Cells(6 + i, 9).Value = ThisWorkbook.Sheets("����5").Cells(6 + i, 9).Value
        ' ��������� ����� ��� (������ ������� �� ���i) ���i
        Call set�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), ThisWorkbook.Sheets("����5").Cells(6 + i, 9).Value, dateBeginWeek, "��.", "")
        ' ����������, ��� ��������� set�_���In���� ��������
        call_set�_���In���� = True
      End If
      
      ' --- ������� ���� ���������� ����
      If �������������N("����") = WeekNumber(maxDateInReport) Then
        Call current�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), maxDateInReport, ThisWorkbook.Sheets("����5").Cells(6 + i, 10).Value, "��.")
        ' ����������, ��� ��������� current�_���In���� ��������
        call_current�_���In���� = True
      End If
      ' --- ����� ������� ���� ���������� ����
      
    Next i ' ��������� ����

    ' ��������� ������ ��� �������� (� "������ �����������:"):
    ' ThisWorkbook.Sheets("����5").Cells(rowByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���", 2)
    ThisWorkbook.Sheets("����5").Cells(rowByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,����,����,���", 2)

    ' ��������� BASE\Cards
    CloseBook ("Cards")

    ' ��������� ���� BASE\Tasks
    CloseBook ("Tasks")

    ' ��������� ���� BASE\Clients
    CloseBook ("Clients")

    ' ������ �������
    Application.StatusBar = "���������� ..."

    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����5").Cells(4, 15).Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    
    ' ��������� ������������ � ����������� �� ����������
    If (ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������ �����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������ �����:", 100, 100) + 4).Value = "(�����������)") Or (CStr(ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100) + 2).Value) = "1") Then
      ' ���� ��� ����� �� ������ "����������� ������� �� ������� �� ������", �.�.: ����0-F2 = "(�����������)" ��� ����0-L2 = "1"
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� ����� �� ������", 100, 100))
    Else
      ' ���� ��� ����� �� ������� ���� ������
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� �����", 100, 100))
    End If

    ' ���������� ���������
    ThisWorkbook.Save

    ' ���������� �������� ���������
    finishProcess = True

    DateTimeEnd = Now
    ThisWorkbook.Sheets("����5").Cells(16, 19).Value = CStr(DateTimeEnd)
    ThisWorkbook.Sheets("����5").Cells(17, 19).Value = CStr(DateTimeEnd - DateTimeStart)
    
    Else
      
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    
    End If ' �������� ����� ������

   

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(DBstrName_String) + " �� " + CStr(maxDateInReport) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If



  End If


End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����5_�����()
Dim ����������, �����������, hashTag As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����5").Cells(RowByValue(ThisWorkbook.Name, "����5", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����5")
    
    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����5").Cells(RowByValue(ThisWorkbook.Name, "����5", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����5")

    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����5").Cells(rowByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "������ �� ��������� � ��������� �����." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub

' �������� ������ (����� ����)
Sub ��������_������_��_�������()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xml), *.xml", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����3").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "������", 5, Date)
    
    If CheckFormatReportResult = "OK" Then
      
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

        rowCount = 0
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, 1).Value)
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' ������� ����� ���������
      
      ' ����������� ����� ���� �� ��������� ��������
      ' Call �����������������������("����0", "D9")
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� �����", 100, 100))
       
      ' ���������� ���������� ���������
      finishProcess = True
    
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����3").Range("L78").Select

    ' ������ �������
    Application.StatusBar = ""

    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������


End Sub

' ����� Cards_emisssion
Sub Cards_emisssion()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm", , "�������� ����� � ������� Cards_emisssion")

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
    ThisWorkbook.Sheets("����5").Activate

    ' ��������� ������ ��� �������� (� "������ �����������:"):
    ThisWorkbook.Sheets("����5").Cells(rowByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,����,����,���", 2)

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "F1", 12, Date)
    If CheckFormatReportResult = "OK" Then
      
      ' ���� ������ Cards_emisssion_29_07_20_(2019)_2
      dateReport_CardsEmission = CDate(Mid(ReportName_String, 17, 2) + "." + Mid(ReportName_String, 20, 2) + ".20" + Mid(ReportName_String, 23, 2))
      ThisWorkbook.Sheets("����5").Range("B35").Value = "������� ���������� ���� �� " + CStr(dateReport_CardsEmission) + " �."
      ThisWorkbook.Sheets("����5").Range("R35").Value = "������� ���� � ������ � ��������� ��� ��������� �� " + CStr(dateReport_CardsEmission) + " �."
    
      ' ������� 1-�� ���� ��������� � ������� � �����
      OutBookName = ThisWorkbook.Path + "\Out\CardsInSafe_" + strDDMMYYYY(dateReport_CardsEmission) + ".xlsx"
      Call createBook_CardsInSafe(OutBookName)
      ThisWorkbook.Sheets("����5").Range("R36").Value = OutBookName
            
      ' ������� 2-�� ���� ��������� � ������� ��� ���������
      OutBookName2 = ThisWorkbook.Path + "\Out\CardsForActive_" + strDDMMYYYY(dateReport_CardsEmission) + ".xlsx"
      Call createBook_CardsForActive(OutBookName2)
      ThisWorkbook.Sheets("����5").Range("T36").Value = OutBookName2
      
      ' ����� ����� � �������� OutBookName
      rowCount3 = 1
      
      
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


        rowCount = 7
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����� � ������").Cells(rowCount, 2).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("����� � ������").Cells(rowCount, 2).Value, officeNameInReport) <> 0 Then
            
            ' ���������� ������� 6-�� F "����� ����"
            Workbooks(ReportName_String).Sheets("����� � ������").Cells(rowCount, 6).ShowDetail = True
          
            ' ��������� �� ���� DB
            ThisWorkbook.Sheets("����5").Activate
          
            ' ������ �������� - ���������� ���������:
            ' ���� - DP4_����� (6) �����
            Column_DP4 = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "DP4_�����")
            ' �����_������� - CLIENTPSBID (1) �����
            Column_CLIENTPSBID = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CLIENTPSBID")
            ' ����_������� - DATE_ISSUE (23) ����
            Column_DATE_ISSUE = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "DATE_ISSUE")
            ' �����_�������� - CONTRACT_NUMBER (3)
            Column_CONTRACT_NUMBER = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CONTRACT_NUMBER")
            ' ����� - TARIFFID (8)
            Column_TARIFFID = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "TARIFFID")
            ' ������� - product_name (10)
            column_Product_Name = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "product_name")
            ' �����_������� - Month_ISSUE (13)
            Column_Month_ISSUE = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "Month_ISSUE")
            ' ���_������� - Year (14)
            Column_Month_Year = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "Year")
            ' ���_������ - ORDERMODE (15)
            Column_ORDERMODE = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "ORDERMODE")
            ' ClaimID - CLAIMID (2)
            Column_CLAIMID = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CLAIMID")
            ' ������ - CARDSTATUS (16)
            Column_CARDSTATUS = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CARDSTATUS")
            ' ����_������� - CARDSORT (17)
            Column_CARDSORT = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CARDSORT")
            ' ClaimStatus - CLAIMSTATUS (19)
            Column_CLAIMSTATUS = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CLAIMSTATUS")
            ' CardType - CARDTYPE (20)
            Column_CARDTYPE = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "CARDTYPE")
            ' SalesChannel - SALESCHANNEL (22)
            Column_SALESCHANNEL = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(i), 1, "SALESCHANNEL")
                      
            ' ����� �� � �� � �����
            countDC = 0
            countCC = 0
          
            ' ������������ � ������� � OutBookName �����, ����������� � ������ ������. ��� ����� ��������� - ����1, ������ - ����2, ������������� - ����3, ����� ������� - ����4, �����-���� - ����5
            rowCount2 = 2
            Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, 1).Value)
              
              ' ������ � �������� OutBookName
              rowCount3 = rowCount3 + 1
                            
              ' ���� - DP4_����� (6) �����
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 1).Value = cityOfficeName(Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_DP4).Value)
              ' �����_������� - CLIENTPSBID (1) �����
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 2).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CLIENTPSBID).Value
              ' ����_������� - DATE_ISSUE (23) ����
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 3).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_DATE_ISSUE).Value
              ' �����_�������� - CONTRACT_NUMBER (3)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 4).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CONTRACT_NUMBER).Value
              ' ����� - TARIFFID (8)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 5).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_TARIFFID).Value
              ' ������� - product_name (10)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 6).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, column_Product_Name).Value
              ' �����_������� - Month_ISSUE (13)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 7).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_Month_ISSUE).Value
              ' ���_������� - Year (14)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 8).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_Month_Year).Value
              ' ���_������ - ORDERMODE (15)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 9).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_ORDERMODE).Value
              ' ClaimID - CLAIMID (2)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 10).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CLAIMID).Value
              ' ������ - CARDSTATUS (16)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 11).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CARDSTATUS).Value
              ' ����_������� - CARDSORT (17)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 12).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CARDSORT).Value
              ' ClaimStatus - CLAIMSTATUS (19)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 13).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CLAIMSTATUS).Value
              ' CardType - CARDTYPE (20)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 14).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_CARDTYPE).Value
              ' SalesChannel - SALESCHANNEL (22)
              Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 15).Value = Workbooks(ReportName_String).Sheets("����" + CStr(i)).Cells(rowCount2, Column_SALESCHANNEL).Value

              ' ������� ����� �� ����
              If Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 14).Value = "���������" Then
                countDC = countDC + 1
              End If
              '
              If Workbooks(Dir(OutBookName)).Sheets("����1").Cells(rowCount3, 14).Value = "���������" Then
                countCC = countCC + 1
              End If

              
              ' ��������� ������
              rowCount2 = rowCount2 + 1
              Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + " (" + CStr(rowCount2) + ")..."
              DoEventsInterval (rowCount)
            
            Loop
            
            ' ������� � ������� �� "����5"
            ' ����� ��������� ���� � �����
            ThisWorkbook.Sheets("����5").Cells(38 + i, 3).Value = countDC
            
            ' ����� ��������� ���� � �����
            ThisWorkbook.Sheets("����5").Cells(38 + i, 4).Value = countCC
            
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          ' Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      Application.StatusBar = ""
      
      ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
      Workbooks(Dir(FileName)).Close SaveChanges:=False ' - ������� �� ���������
        
      ' ��������� ������ �������������� ����� � ������� � �����
      Workbooks(Dir(OutBookName)).Close SaveChanges:=True
            
      ' ������� ����� ���������
      
      ' ******** ������ ���� ��������� *********
      
      ' ��������� ����� ����� Card_Emission
      ' ��������� ��������� ����� (UpdateLinks:=0)
      Workbooks.Open FileName, 0
      
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����5").Activate

      
      ' ******** �� ����� "������������� ��� ���������" ��������� ������� "���" (� �� � ��)
      Workbooks(ReportName_String).Sheets("������������� ��� ���������").PivotTables("SASApp:CARDS.TRUKHACHEV_EMISS_ACT_ISSUE").PivotFields("Tip").ClearAllFilters
      Workbooks(ReportName_String).Sheets("������������� ��� ���������").PivotTables("SASApp:CARDS.TRUKHACHEV_EMISS_ACT_ISSUE").PivotFields("Tip").CurrentPage = "(All)"
      ' ********
      
      ' ����� ������ � �������� ����� � ������� ��� ���������
      rowCount3 = 1
      ' ����� ������������ ����� � PivotTables
      �����_����� = 0
            
      ' ���� �� 5-�� ������ (������ ��� ���������� ��� ���������)
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

      
        ' 1. ������ ���� ��������� "������������� ��� ���������"
        ������_���� = rowByValue(Workbooks(ReportName_String).Name, "������������� ��� ���������", "����", 100, 100) ' 12
        �������_���� = ColumnByValue(Workbooks(ReportName_String).Name, "������������� ��� ���������", "����", 100, 100) ' 2
        �������_�����_������ = ColumnByValue(Workbooks(ReportName_String).Name, "������������� ��� ���������", "����� ������", 100, 100) ' 4
        
        ' ����� ����, ������������� ��� ��������� � ����� �� �����:
        countDC = 0
        countCC = 0
      
        rowCount = ������_���� + 1
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������������� ��� ���������").Cells(rowCount, �������_����).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("������������� ��� ���������").Cells(rowCount, �������_����).Value, officeNameInReport) <> 0 Then
            
            
            ' �������� �� ����������� ������ �� ������ ������
            ColumnCount = �������_�����_������
            Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������������� ��� ���������").Cells(rowCount, ColumnCount).Value)
            
            
              ' ���������� �������
              Workbooks(ReportName_String).Sheets("������������� ��� ���������").Cells(rowCount, ColumnCount).ShowDetail = True
              ' ����� ������������ �����: ����1, ����2, ����3, ...
              �����_����� = �����_����� + 1
              ' ��������� �� ���� DB
              ThisWorkbook.Sheets("����5").Activate

              ' ������ �������� - ���������� ���������:
              ' ���� (1) - DP4 (16)
              Column_DP4 = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "DP4")
              ' �����_������� (2) - CLIENTPSBID (13)
              Column_CLIENTPSBID = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "CLIENTPSBID")
              ' ����_������ (3) - DATEISSUEONHAND (9)
              Column_DATEISSUEONHAND = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "DATEISSUEONHAND")
              ' �����_�������� (4) - CONTRACTNUMBER (14)
              Column_CONTRACTNUMBER = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "CONTRACTNUMBER")
              ' ����� (5) - TARIFFID (8)
              Column_TARIFFID = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "TARIFFID")
              ' ������� (6) - product_name (12)
              column_Product_Name = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "product_name")
              ' �����_������ (7) - ����� ������ (1)
              Column_�����_������ = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "����� ������")
              ' CardType (8) - Tip (10)
              Column_Tip = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "Tip")
              ' SalesChannel (9) - ����� ������ (11)
              Column_�����_������ = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "����� ������")
              ' SalesChannel2 (10) - SALESCHANNEL (22)
              Column_SALESCHANNEL = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "SALESCHANNEL")
              ' ��������� (11) - NAMEUSR3 (20)
              Column_NAMEUSR3 = ColumnByName(Workbooks(ReportName_String).Name, "����" + CStr(�����_�����), 1, "NAMEUSR3")

              ' ������������ ������� ����������� ���� � ������� �����_����� � ������� ����� �� ������ ��������� �������
              rowCount2 = 2
              Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, 1).Value)
            
                ' ����� ������ � �������� ����� � ������� ��� ���������
                rowCount3 = rowCount3 + 1
                  
                ' ���� (1) - DP4 (16)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 1).Value = cityOfficeName(Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_DP4).Value)
                ' �����_������� (2) - CLIENTPSBID (13)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 2).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_CLIENTPSBID).Value
                ' ����_������ (3) - DATEISSUEONHAND (9)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 3).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_DATEISSUEONHAND).Value
                ' �����_�������� (4) - CONTRACTNUMBER (14)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 4).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_CONTRACTNUMBER).Value
                ' ����� (5) - TARIFFID (8)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 5).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_TARIFFID).Value
                ' ������� (6) - product_name (12)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 6).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, column_Product_Name).Value
                ' �����_������ (7) - ����� ������ (1)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 7).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_�����_������).Value
                ' CardType (8) - Tip (10)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 8).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_Tip).Value
                ' SalesChannel (9) - ����� ������ (11)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 9).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_�����_������).Value
                ' SalesChannel2 (10) - SALESCHANNEL (22)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 10).Value = Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_SALESCHANNEL).Value
                ' ��������� (11) - NAMEUSR3 (20)
                Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 11).Value = �������_�_���(Workbooks(ReportName_String).Sheets("����" + CStr(�����_�����)).Cells(rowCount2, Column_NAMEUSR3).Value, 2)
        
                ' ��� ���������� (12) - ���� ����������� ���������

                ' ��� ���������� (13) - ����������
                
                ' ������� ����� �� ����
                If Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 8).Value = "���������" Then
                  countDC = countDC + 1
                End If
                '
                If Workbooks(Dir(OutBookName2)).Sheets("����1").Cells(rowCount3, 8).Value = "���������" Then
                  countCC = countCC + 1
                End If

                ' ��������� ������ � ����N
                rowCount2 = rowCount2 + 1
                Application.StatusBar = "������������� ��� ��������� " + officeNameInReport + ": " + CStr(rowCount2) + "..."
                DoEventsInterval (rowCount2)
              Loop

              ' ��������� ������
              ColumnCount = ColumnCount + 1
              ' Application.StatusBar = "������������� ��� ��������� " + officeNameInReport + ": " + CStr(rowCount) + "..."
              DoEventsInterval (rowCount)
            Loop

          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          ' Application.StatusBar = "������������� ��� ��������� " + officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
        
        ' ������� � ������� �� "����5"
        ' ����� ��������� ���� ��� ���������
        ThisWorkbook.Sheets("����5").Cells(38 + i, 6).Value = countDC
        ' ����� ��������� ���� ��� ���������
        ThisWorkbook.Sheets("����5").Cells(38 + i, 7).Value = countCC

      Next i ' ��������� ����
      
      Application.StatusBar = "���������� ..."
      
      ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
      Workbooks(Dir(FileName)).Close SaveChanges:=False ' - ������� �� ���������
      
      ' ��������� �������������� ������ �������������� ���� - ��������� ��� ���������
      Workbooks(Dir(OutBookName2)).Close SaveChanges:=True

      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����5").Range("P42").Select
    ' Workbooks("DB_Result").Sheets("����5").Range("P42").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' ����������� �� �����
    Call �����_�_������
    Call �����_�_Cards_emisssion
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub

' ������� � ������ ����� �� ��
Sub �����_�_������()
  ThisWorkbook.Sheets("����5").Cells(3, 13).Select
End Sub

' ������� � ����� 2 ����� �� �����
Sub �����_�_Cards_emisssion()
  ThisWorkbook.Sheets("����5").Activate
  Call �����_�_������
  ActiveWindow.SmallScroll Down:=32
  ThisWorkbook.Sheets("����5").Cells(56, 13).Select
End Sub

' �������� ����� � ��������� � �����
Sub createBook_CardsInSafe(In_OutBookName)

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    ' ���� - DP4_����� (6) �����
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").HorizontalAlignment = xlCenter
    
    ' �����_������� - CLIENTPSBID (1) �����
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "�����_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").HorizontalAlignment = xlCenter
    
    ' ����_������� - DATE_ISSUE (23) ���� (NumberFormat = "m/d/yyyy")
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "����_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 16
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").NumberFormat = "m/d/yyyy"
   
    ' �����_�������� - CONTRACT_NUMBER (3)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "�����_��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 18
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").HorizontalAlignment = xlCenter
        
    ' ����� - TARIFFID (8)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "�����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").HorizontalAlignment = xlCenter
    
    ' ������� - product_name (10)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 32
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").HorizontalAlignment = xlCenter

    ' �����_������� - Month_ISSUE (13)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "�����_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 8
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlLeft
    
    ' ���_������� - Year (14)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "���_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 8
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlLeft

    ' ���_������ - ORDERMODE (15)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "���_������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").HorizontalAlignment = xlCenter
    
    ' ClaimID - CLAIMID (2)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "ClaimID"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").HorizontalAlignment = xlCenter
    
    ' ������ - CARDSTATUS (16)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).Value = "������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").HorizontalAlignment = xlCenter
    
    ' ����_������� - CARDSORT (17)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).Value = "����_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("L:L").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("L:L").HorizontalAlignment = xlCenter
    
    ' ClaimStatus - CLAIMSTATUS (19)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).Value = "ClaimStatus"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("M:M").EntireColumn.ColumnWidth = 21
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("M:M").HorizontalAlignment = xlCenter
    
    ' CardType - CARDTYPE (20)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 14).Value = "CardType"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("N:N").EntireColumn.ColumnWidth = 12
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 14).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("N:N").HorizontalAlignment = xlCenter
    
    ' SalesChannel - SALESCHANNEL (22)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 15).Value = "SalesChannel"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("O:O").EntireColumn.ColumnWidth = 12
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 15).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("O:O").HorizontalAlignment = xlCenter
        
    ' ��� ���������� - ���� ����������� ������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 16).Value = "���� ����������� ������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("P:P").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 16).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("P:P").HorizontalAlignment = xlCenter

    ' ��� ���������� - ����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 17).Value = "�����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("Q:Q").EntireColumn.ColumnWidth = 60
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 17).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("Q:Q").HorizontalAlignment = xlCenter
    
    
    ' ActiveCell.Offset(0, -4).Columns("A:A").EntireColumn.Select
    ' Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("C:C").Select
    ' ��������
    ' Selection.NumberFormat = "0"
    ' ���������
    ' Selection.NumberFormat = "@"

    ' ��������� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1:Q1").Select
    Selection.AutoFilter
    
End Sub

' �������� ����� � ������� ��� ���������
Sub createBook_CardsForActive(In_OutBookName)

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    ' ���� - DP4 (16)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").HorizontalAlignment = xlCenter
    
    ' �����_������� - CLIENTPSBID (13)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "�����_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").HorizontalAlignment = xlCenter
    
    ' ����_������ - DATEISSUEONHAND (9)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "����_������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").NumberFormat = "m/d/yyyy"
   
    ' �����_�������� - CONTRACTNUMBER (14)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "�����_��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").HorizontalAlignment = xlCenter
        
    ' ����� - TARIFFID (8)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "�����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").HorizontalAlignment = xlCenter
    
    ' ������� - product_name (12)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 32
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").HorizontalAlignment = xlCenter

    ' �����_������ - ����� ������ (1)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "�����_������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").HorizontalAlignment = xlCenter
    
    ' CardType - Tip (10)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "CardType"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").HorizontalAlignment = xlCenter
    
    ' SalesChannel - ����� ������ (11)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "SalesChannel"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").HorizontalAlignment = xlCenter
        
    ' SalesChannel2 - SALESCHANNEL (22)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "SalesChannel2"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").HorizontalAlignment = xlCenter
        
    ' ��������� - NAMEUSR3 (20)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).Value = "���������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").HorizontalAlignment = xlLeft
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).HorizontalAlignment = xlCenter
        
    ' ��� ���������� - ���� ����������� ���������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).Value = "���� ����������� ���������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("L:L").EntireColumn.ColumnWidth = 30
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("P:P").HorizontalAlignment = xlCenter

    ' ��� ���������� - ����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).Value = "�����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("M:M").EntireColumn.ColumnWidth = 60
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("Q:Q").HorizontalAlignment = xlCenter
    
    
    ' ActiveCell.Offset(0, -4).Columns("A:A").EntireColumn.Select
    ' Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("C:C").Select
    ' ��������
    ' Selection.NumberFormat = "0"
    ' ���������
    ' Selection.NumberFormat = "@"

    ' ��������� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1:Q1").Select
    Selection.AutoFilter

    
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����5_Cards_emisssion()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����5").Cells(RowByValue(ThisWorkbook.Name, "����5", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheetII("����5", 2)
    
    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����5").Cells(RowByValue(ThisWorkbook.Name, "����5", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheetII("����5", 2)

    ' ����-�������� (!!!)
    ' attachmentFile = ThisWorkbook.Sheets("����5").Range("R36").Value ' ������ ���� ���� �������� + " " + ThisWorkbook.Sheets("����5").Range("T36").Value
    attachmentFile = ""
    
    ' ���������:  * - ��� ��������� ����� ���������� �������������� Welcome-����� � ������� ������ � 300 ���. �� ������ ������ � 1000 ���. � ���. ������ 14 ���� (����� ����������� � � ������ ����� ������� ����������� ���� ������������ ��� ��).
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����5").Cells(rowByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����5", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ���������� �� �������� ���� � ������ �� " + Mid(ThisWorkbook.Sheets("����5").Range("B35").Value, 28, 13) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "�� ������ ������� ����������:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "1. ������ ����� �� ������ ��������:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "2. �� �������� ������, �� �� �������������� - �������� ������ �� �� ���������:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "3. �� ���������������� ������ - �������� ����������� (�� ���� 1 ���� � �����)" + Chr(13)
    ����������� = ����������� + "" + Chr(13)

    ' ����������� = ����������� + "����: ��������� ������� ����� �� ���� ��������� ���� � �������� �� �����" + Chr(13)
    
    ' For i = 39 To 43
      
    '  ��
    '   If ThisWorkbook.Sheets("����5").Cells(i, 9).Value > 0 Then
        
    '   End If
    '  ��
    '   If ThisWorkbook.Sheets("����5").Cells(i, 10).Value > 0 Then
    '
    '   End If
      
      ' ������� � ����� ������
      ' ����������� = ����������� + "- " + ThisWorkbook.Sheets("����5").Cells(i, 2).Value + " �� ��., �� ��." + Chr(13)
      
    ' Next i
    
    ����������� = ����������� + "" + Chr(13)
    
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    ' �����
    ' Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub

