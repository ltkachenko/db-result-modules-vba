Attribute VB_Name = "Module_DLL"
' ----------------------------------------------------------------------------------------------------------------
' ����� �������� ��� ���������������� ��������� � �������, ������� ����� ����� ��������� � ���������� *
'
' * �������� ���������: https://excelpedia.ru/bez-rubriki/kak-sozdat-polzovatelskuyu-funkciyu-v-excel-ispolzuya-vba
'
' ----------------------------------------------------------------------------------------------------------------

' 1. ����������� ���� ������ ������
Function weekStartDate(In_Date) As Date
  ' �������������� ����������
  weekStartDate = In_Date
  ' �� ������� ���� In_Date �������� ���� ����, ���� �� ������� �����������
  Do While Weekday(weekStartDate, vbMonday) <> 1
    weekStartDate = weekStartDate - 1
  Loop
End Function

' 2. ���� ����� ������
Function weekEndDate(In_Date) As Date
  ' �������������� ����������
  weekEndDate = In_Date
  ' �� ������� ���� In_Date �������� ���� ����, ���� �� ������� �����������
  Do While Weekday(weekEndDate, vbMonday) <> 7
    weekEndDate = weekEndDate + 1
  Loop
  ' �� ����� ������� �� ������� ���������� +1 ����
  ' weekEndDate = weekEndDate + 1
End Function

' 3. ��������� ��.�� �� ����
Function strDDMM(In_Date) As String
  strDDMM = Mid(CStr(In_Date), 1, 5)
End Function

' 4. ��������� �������� �� ����
Function strDDMMYYYY(In_Date) As String
  strDDMMYYYY = Mid(CStr(In_Date), 1, 2) + Mid(CStr(In_Date), 4, 2) + Mid(CStr(In_Date), 7, 4)
End Function

' 4. ��������� ������ �� ����
Function strDDMMYY(In_Date) As String
  strDDMMYY = Mid(CStr(In_Date), 1, 2) + Mid(CStr(In_Date), 4, 2) + Mid(CStr(In_Date), 9, 2)
End Function

' 4.1 ��������� ���� �� ����
Function strMMYY(In_Date) As String
  strMMYY = Mid(CStr(In_Date), 4, 2) + Mid(CStr(In_Date), 9, 2)
End Function

' 4.1 ��������� �� �� ����
Function strYY(In_Date) As String
  strYY = Mid(CStr(In_Date), 9, 2)
End Function

' 4.1.1 ���� ������ ������ �� ��������� ����
Function dateBeginFromStrMMYY(In_����) As Date
  dateBeginFromStrMMYY = CDate("01." + Mid(CStr(In_����), 1, 2) + ".20" + Mid(CStr(In_����), 3, 2))
End Function

' 4.1.2 ���� ����� ������ �� ��������� ����
Function dateEndFromStrMMYY(In_����) As Date
  dateEndFromStrMMYY = Date_last_day_month(CDate("01." + Mid(CStr(In_����), 1, 2) + ".20" + Mid(CStr(In_����), 3, 2)))
End Function

' 4.2. ������� firstMonthYear_strMMYY ���������� �� 06.08.2020 ������ "0120"
Function firstMonthYear_strMMYY(In_Date) As String
  firstMonthYear_strMMYY = "01" + Mid(CStr(In_Date), 9, 2)
End Function

' 4.3 ���� ������ 06.08.2020, �� ������� ������ 0720
Function pastMonth_strMMYY(In_Date) As String
  ����� = Month(In_Date)
  ' ����� ����������� ������
  ����� = ����� - 1
  ' C����� "0" ����� �������, ���� ����� �� 1 �� 9
  If ����� < 10 Then
    �����_str = "0" + CStr(�����)
  Else
    �����_str = CStr(�����)
  End If
  pastMonth_strMMYY = �����_str + Mid(CStr(In_Date), 9, 2)
End Function

' 4.4 ��������� ��-��-�� �� ����
Function str��_MM_YY(In_Date) As String
  str��_MM_YY = Mid(CStr(In_Date), 1, 2) + "-" + Mid(CStr(In_Date), 4, 2) + "-" + Mid(CStr(In_Date), 9, 2)
End Function

' 4.4.1 ��������� ��.��.�� �� ����
Function str��_MM_YY2(In_Date) As String
  str��_MM_YY2 = Mid(CStr(In_Date), 1, 2) + "." + Mid(CStr(In_Date), 4, 2) + "." + Mid(CStr(In_Date), 9, 2)
End Function

' 4.5 ��������� ��-��-���� �� ����
Function str��_MM_YYYY(In_Date) As String
  str��_MM_YYYY = Mid(CStr(In_Date), 1, 2) + "-" + Mid(CStr(In_Date), 4, 2) + "-" + Mid(CStr(In_Date), 7, 4)
End Function

' 5. ����������� ����� ������� ���� � ������ ������
Function Working_days_in_the_FullMonth(In_Date, In_working_days_in_the_week) As Integer
  ' ���������� ���� In_Date
  ' �����
  ����� = Month(In_Date)
  ' ���
  ��� = Year(In_Date)
  ' ������ ���� ���������� ������
  If ����� = 12 Then
    ����� = 0
    ��� = ��� + 1
  End If
  
  ������_����_����������_������ = CDate("01." + CStr(����� + 1) + "." + CStr(���))
  ' ���� ������ ������
  �������_����_�������� = CDate("01." + Mid(CStr(In_Date), 4, 7))
  
  ' ������ ������� �� �����
  Working_days_in_the_FullMonth = 0
  Do While �������_����_�������� < ������_����_����������_������
    ' ���� �������_����_�������� �� �������
    If In_working_days_in_the_week = 5 Then
      ' ���� ����������
      If (Weekday(�������_����_��������, vbMonday) <> 6) And (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_in_the_FullMonth = Working_days_in_the_FullMonth + 1
      End If
    Else
      ' ���� ����������� - In_working_days_in_the_week = 6
      If (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_in_the_FullMonth = Working_days_in_the_FullMonth + 1
      End If
    End If
    ' ��������� ����
    �������_����_�������� = �������_����_�������� + 1
  Loop ' ��������� ����
End Function

' 6. ����� ������� ���� ����� ����� ������
Function Working_days_between_dates(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
  ' ������������� �������� ����� ������� ����
  Working_days_between_dates = 0
  
  ' ���� ������ ������
  �������_����_�������� = In_DateStart
  
  ' ������ ������� �� �����
  Do While �������_����_�������� <= In_DateEnd
  
    ' ���� �������_����_�������� �� �������
    If In_working_days_in_the_week = 5 Then
      ' ���� ����������
      If (Weekday(�������_����_��������, vbMonday) <> 6) And (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_between_dates = Working_days_between_dates + 1
      End If
    Else
      ' ���� ����������� - In_working_days_in_the_week = 6
      If (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_between_dates = Working_days_between_dates + 1
      End If
    End If
    
    ' ��������� ����
    �������_����_�������� = �������_����_�������� + 1
  
  Loop ' ��������� ����
  
End Function

' 6.1. ����� ������� ���� ����� ����� ������ � ������ ����������
Function Working_days_between_datesII(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
  
  ' ������������� �������� ����� ������� ����
  Working_days_between_datesII = 0
  
  ' ��������� ������� ��������� ���� NonWorkingDays
  ' ��������� BASE\NonWorkingDays
  OpenBookInBase ("NonWorkingDays")

  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks("NonWorkingDays").Sheets("����1").AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks("NonWorkingDays").Sheets("����1").Cells(1, 1).AutoFilter
  End If


  ' ���� ������ ������
  �������_����_�������� = In_DateStart
  
  ' ������ ������� �� �����
  Do While �������_����_�������� <= In_DateEnd
  
    ' ��������� ����� - �������_����_�������� ���� � BASE\NonWorkingDays?
    Set searchResults = Workbooks("NonWorkingDays").Sheets("����1").Columns("A:A").Find(�������_����_��������, LookAt:=xlWhole)
  
    ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
    If searchResults Is Nothing Then
      ' ���� �� ������� - ���������
      �����������_���� = False
    Else
      ' ���� �������
      �����������_���� = True
    End If

    ' ���� �������_����_�������� �� �������
    If In_working_days_in_the_week = 5 Then
      
      ' ���� ����������
      If (Weekday(�������_����_��������, vbMonday) <> 6) And (Weekday(�������_����_��������, vbMonday) <> 7) Then
        
        If �����������_���� = False Then
          Working_days_between_datesII = Working_days_between_datesII + 1
        End If
      
      End If
    
    Else
      
      ' ���� ����������� - In_working_days_in_the_week = 6
      If (Weekday(�������_����_��������, vbMonday) <> 7) Then
        
        If �����������_���� = False Then
          Working_days_between_datesII = Working_days_between_datesII + 1
        End If
        
      End If
    
    End If
    
    ' ��������� ����
    �������_����_�������� = �������_����_�������� + 1
  
  Loop ' ��������� ����
  
  ' ��������� BASE\NonWorkingDays
  CloseBook ("NonWorkingDays")
  
End Function


' 7. ���� ���������� ��� ������. ��������� ���� ������
Function Date_last_day_month(In_Date) As Date
Dim ������_����_����������_������ As Date
  ' ���������� ���� In_DateNow
  ' �����
  ����� = Month(In_Date)
  ' ���
  ��� = Year(In_Date)
  ' ������ ���� ���������� ������
  If ����� = 12 Then
    ����� = 0
    ��� = ��� + 1
  End If
  ������_����_����������_������ = CDate("01." + CStr(����� + 1) + "." + CStr(���))
  Date_last_day_month = ������_����_����������_������ - 1
End Function

' 7.1 ���� ������� ��� ������ (������ ���� ������)
Function Date_begin_day_month(In_Date) As Date
Dim ������_����_����������_������ As Date
  ' ���������� ���� In_DateNow
  ' �����
  ����� = Month(In_Date)
  ' ���
  ��� = Year(In_Date)
  ' ���������� ���� ������� ��� ������
  Date_begin_day_month = CDate("01." + CStr(�����) + "." + CStr(���))
End Function


' 7.2.0 ���� ������� ��� ��������
Function Date_begin_day_quarter(In_Date) As Date
  
  ' ���������� ���� In_Date
  ' �����
  ����� = Month(In_Date)
  ' ���
  ��� = Year(In_Date)
  
  ' ����� ����������� � ������ ����� ��������
  Select Case �����
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          �����_str = "01"
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          �����_str = "04"
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          �����_str = "07"
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          �����_str = "10"
  End Select
  
  Date_begin_day_quarter = CDate("01." + �����_str + "." + CStr(���))
  
End Function

' 7.2.1 ���� ���������� ��� ��������
Function Date_last_day_quarter(In_Date) As Date
Dim ������_����_����������_������ As Date
  ' ���������� ���� In_Date
  ' �����
  ����� = Month(In_Date)
  ' ���
  ��� = Year(In_Date)
  
  ' ����� ����������� � ��������� ����� ��������
  Select Case �����
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          ����� = 3
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          ����� = 6
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          ����� = 9
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          ����� = 12
  End Select

  ' ������ ���� ���������� ������
  If ����� = 12 Then
    ����� = 0
    ��� = ��� + 1
  End If
  ������_����_����������_������ = CDate("01." + CStr(����� + 1) + "." + CStr(���))
  Date_last_day_quarter = ������_����_����������_������ - 1
End Function

' 7.3 �������������� ������ ������ �������� � ������: ����� ������ � ��������: 1-"", 2-"2", 3-"3"
Function Nom_mes_quarter_str(In_Date) As String
  
  ' �����
  ����� = Month(In_Date)
  
  ' ����� ����������� � ��������� ����� ��������
  Select Case �����
        ' 1-�� ����� � ��������
        Case 1, 4, 7, 10
          Nom_mes_quarter_str = ""
        ' 2-�� ����� � ��������
        Case 2, 5, 8, 11
          Nom_mes_quarter_str = "2"
        ' 3-�� ����� � ��������
        Case 3, 6, 9, 12
          Nom_mes_quarter_str = "3"
  
  End Select

End Function

' 7.4 ����� �������?
Function BookIsOpen(In_BookName) As Boolean
Dim wbBook As Workbook

  ' ����� ��� �������?
  BookIsOpen = False
  
  ' ����� �� ����� - ���� �� ����� ��������?
  For Each wbBook In Workbooks
    If Windows(wbBook.Name).Visible Then
      
      ' t = wbBook.Name
      
      ' If wbBook.Name = In_BookName Then BookIsOpen = True: Exit For
      
      If InStr(wbBook.Name, In_BookName + ".") <> 0 Then BookIsOpen = True: Exit For
      
    End If
    
  Next wbBook

End Function

' 8. �������� ����� �� �������� BASE\
Sub OpenBookInBase(In_BookName)
Dim wbBook As Workbook
  
  ' ����� ��� �������?
  �����_������� = False
  
  ' ����� �� ����� - ���� �� ����� ��������?
  For Each wbBook In Workbooks
    If Windows(wbBook.Name).Visible Then
      
      ' If wbBook.Name = wbName Then �����_������� = True: Exit For
      If InStr(wbBook.Name, In_BookName + ".") <> 0 Then �����_������� = True: Exit For
      
    End If
  Next wbBook
  
  
  ' ���� �� �������, �� ��������� �����
  If �����_������� = False Then
    
    ' ��������� ���� BASE\Indicators.xlsx
    ' Workbooks.Open (ThisWorkbook.Path + "\Base\" + In_BookName + ".xlsx")
    
    ' ��������� ���� BASE\Indicators.xlsx (UpdateLinks:=0)
    Workbooks.Open (ThisWorkbook.Path + "\Base\" + In_BookName + ".xlsx"), 0
    
    ' �������� ����� � ������� ������ - ��������, �� ��� ������� �������� ��������� ���� Excel, ����� ����������� ������ ��� �� ��������� - ������� ����� ����� ��� ���!
    ' Windows(In_BookName).Visible = True
    ThisWorkbook.Activate
  
    ' ���� � ����������� ����� ���� "����1", �� ������� �� ��� ���������� (�������� � ��. ��������� 2021 ������ ����� ���!)
    SheetName_String = FindNameSheet(In_BookName, "����1")
    If SheetName_String <> "" Then

      ' ������� ������, ����� ����� �� �� ���� �������
      If Workbooks(In_BookName).Sheets("����1").AutoFilterMode = True Then
        ' ��������� ����������
        Workbooks(In_BookName).Sheets("����1").Cells(1, 1).AutoFilter
      End If
  
    End If
  
  End If
  
End Sub

' 9. �������� ����� � �������� BASE\
Sub CloseBook(In_BookName)
Dim wbBook As Workbook

  ' ��������� - ������� �� �����?
  
  ' ����� �������?
  �����_������� = False
  
  ' ����� �� ����� - ���� �� ����� ��������?
  For Each wbBook In Workbooks
    If Windows(wbBook.Name).Visible Then
      
      ' If wbBook.Name = wbName Then �����_������� = True: Exit For
      If InStr(wbBook.Name, In_BookName + ".") <> 0 Then �����_������� = True: Exit For
      
    End If
  Next wbBook
  
  
  ' ���� �� �������, �� ��������� �����
  If �����_������� = True Then
  
    ' �������� �����
    Workbooks(In_BookName).Close SaveChanges:=True
    
  End If
  
End Sub

' 10. ������� ������ � �������� ����� �� 20 �����
Sub InsertRecordInBook(In_BookName, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_FieldValue1, In_FieldName2, In_FieldValue2, In_FieldName3, In_FieldValue3, In_FieldName4, In_FieldValue4, In_FieldName5, In_FieldValue5, In_FieldName6, In_FieldValue6, In_FieldName7, In_FieldValue7, In_FieldName8, In_FieldValue8, In_FieldName9, In_FieldValue9, In_FieldName10, In_FieldValue10, In_FieldName11, In_FieldValue11, In_FieldName12, In_FieldValue12, In_FieldName13, In_FieldValue13, In_FieldName14, In_FieldValue14, In_FieldName15, In_FieldValue15, In_FieldName16, In_FieldValue16, In_FieldName17, In_FieldValue17, In_FieldName18, In_FieldValue18, In_FieldName19, In_FieldValue19, In_FieldName20, In_FieldValue20)
Dim rowCount As Integer
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks(In_BookName).Sheets(In_Sheet).AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(1, 1).AutoFilter
  End If
 
  ' ��������� ������� ������ In_FieldKeyName - In_FieldKeyValue
  ������_������� = ConvertToLetter(ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName))
  Set searchResults = Workbooks(In_BookName).Sheets(In_Sheet).Columns(������_������� + ":" + ������_�������).Find(In_FieldKeyValue, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� ������� - ���������
    rowCount = 2
    ' t = ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName).Value
    Do While Not IsEmpty(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, 1))
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
  Else
    ' ���� �������, �� ��������
    rowCount = searchResults.Row
  End If

  ' ������� ������ - In_FieldName1
  If In_FieldName1 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName1)).Value = In_FieldValue1
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName1)).WrapText = False
  End If
  If In_FieldName2 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName2)).Value = In_FieldValue2
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName2)).WrapText = False
  End If
  If In_FieldName3 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName3)).Value = In_FieldValue3
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName3)).WrapText = False
  End If
  If In_FieldName4 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName4)).Value = In_FieldValue4
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName4)).WrapText = False
  End If
  If In_FieldName5 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName5)).Value = In_FieldValue5
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName5)).WrapText = False
  End If
  If In_FieldName6 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName6)).Value = In_FieldValue6
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName6)).WrapText = False
  End If
  If In_FieldName7 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName7)).Value = In_FieldValue7
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName7)).WrapText = False
  End If
  If In_FieldName8 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName8)).Value = In_FieldValue8
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName8)).WrapText = False
  End If
  If In_FieldName9 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName9)).Value = In_FieldValue9
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName9)).WrapText = False
  End If
  If In_FieldName10 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName10)).Value = In_FieldValue10
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName10)).WrapText = False
  End If
  If In_FieldName11 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName11)).Value = In_FieldValue11
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName11)).WrapText = False
  End If
  If In_FieldName12 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName12)).Value = In_FieldValue12
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName12)).WrapText = False
  End If
  If In_FieldName13 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName13)).Value = In_FieldValue13
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName13)).WrapText = False
  End If
  If In_FieldName14 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName14)).Value = In_FieldValue14
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName14)).WrapText = False
  End If
  If In_FieldName15 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName15)).Value = In_FieldValue15
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName15)).WrapText = False
  End If
  If In_FieldName16 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName16)).Value = In_FieldValue16
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName16)).WrapText = False
  End If
  If In_FieldName17 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName17)).Value = In_FieldValue17
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName17)).WrapText = False
  End If
  If In_FieldName18 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName18)).Value = In_FieldValue18
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName18)).WrapText = False
  End If
  If In_FieldName19 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName19)).Value = In_FieldValue19
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName19)).WrapText = False
  End If
  If In_FieldName20 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName20)).Value = In_FieldValue20
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName20)).WrapText = False
  End If
  
End Sub

' 10.1 ������� ������ � �������� ����� �� 28 �����
Sub InsertRecordInBook2(In_BookName, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_FieldValue1, In_FieldName2, In_FieldValue2, In_FieldName3, In_FieldValue3, In_FieldName4, In_FieldValue4, In_FieldName5, In_FieldValue5, In_FieldName6, In_FieldValue6, In_FieldName7, In_FieldValue7, In_FieldName8, In_FieldValue8, In_FieldName9, In_FieldValue9, In_FieldName10, In_FieldValue10, In_FieldName11, In_FieldValue11, In_FieldName12, In_FieldValue12, In_FieldName13, In_FieldValue13, In_FieldName14, In_FieldValue14, In_FieldName15, In_FieldValue15, In_FieldName16, In_FieldValue16, In_FieldName17, In_FieldValue17, In_FieldName18, In_FieldValue18, In_FieldName19, In_FieldValue19, In_FieldName20, In_FieldValue20, In_FieldName21, In_FieldValue21, In_FieldName22, In_FieldValue22, In_FieldName23, In_FieldValue23, In_FieldName24, In_FieldValue24, In_FieldName25, In_FieldValue25, In_FieldName26, In_FieldValue26, In_FieldName27, In_FieldValue27, In_FieldName28, In_FieldValue28)
Dim rowCount As Integer
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks(In_BookName).Sheets(In_Sheet).AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(1, 1).AutoFilter
  End If
  
  ' ��������� ������� ������ In_FieldKeyName - In_FieldKeyValue
  ������_������� = ConvertToLetter(ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName))
  Set searchResults = Workbooks(In_BookName).Sheets(In_Sheet).Columns(������_������� + ":" + ������_�������).Find(In_FieldKeyValue, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� ������� - ���������
    rowCount = 2
    ' t = ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName).Value
    Do While Not IsEmpty(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, 1))
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
  Else
    ' ���� �������, �� ��������
    rowCount = searchResults.Row
  End If

  ' ������� ������ - In_FieldName1
  If In_FieldName1 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName1)).Value = In_FieldValue1
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName1)).WrapText = False
  End If
  If In_FieldName2 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName2)).Value = In_FieldValue2
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName2)).WrapText = False
  End If
  If In_FieldName3 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName3)).Value = In_FieldValue3
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName3)).WrapText = False
  End If
  If In_FieldName4 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName4)).Value = In_FieldValue4
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName4)).WrapText = False
  End If
  If In_FieldName5 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName5)).Value = In_FieldValue5
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName5)).WrapText = False
  End If
  If In_FieldName6 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName6)).Value = In_FieldValue6
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName6)).WrapText = False
  End If
  If In_FieldName7 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName7)).Value = In_FieldValue7
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName7)).WrapText = False
  End If
  If In_FieldName8 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName8)).Value = In_FieldValue8
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName8)).WrapText = False
  End If
  If In_FieldName9 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName9)).Value = In_FieldValue9
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName9)).WrapText = False
  End If
  If In_FieldName10 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName10)).Value = In_FieldValue10
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName10)).WrapText = False
  End If
  If In_FieldName11 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName11)).Value = In_FieldValue11
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName11)).WrapText = False
  End If
  If In_FieldName12 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName12)).Value = In_FieldValue12
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName12)).WrapText = False
  End If
  If In_FieldName13 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName13)).Value = In_FieldValue13
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName13)).WrapText = False
  End If
  If In_FieldName14 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName14)).Value = In_FieldValue14
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName14)).WrapText = False
  End If
  If In_FieldName15 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName15)).Value = In_FieldValue15
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName15)).WrapText = False
  End If
  If In_FieldName16 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName16)).Value = In_FieldValue16
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName16)).WrapText = False
  End If
  If In_FieldName17 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName17)).Value = In_FieldValue17
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName17)).WrapText = False
  End If
  If In_FieldName18 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName18)).Value = In_FieldValue18
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName18)).WrapText = False
  End If
  If In_FieldName19 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName19)).Value = In_FieldValue19
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName19)).WrapText = False
  End If
  If In_FieldName20 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName20)).Value = In_FieldValue20
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName20)).WrapText = False
  End If
  If In_FieldName21 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName21)).Value = In_FieldValue21
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName21)).WrapText = False
  End If
  If In_FieldName22 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName22)).Value = In_FieldValue22
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName22)).WrapText = False
  End If
  If In_FieldName23 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName23)).Value = In_FieldValue23
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName23)).WrapText = False
  End If
  If In_FieldName24 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName24)).Value = In_FieldValue24
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName24)).WrapText = False
  End If
  If In_FieldName25 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName25)).Value = In_FieldValue25
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName25)).WrapText = False
  End If
  If In_FieldName26 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName26)).Value = In_FieldValue26
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName26)).WrapText = False
  End If
  If In_FieldName27 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName27)).Value = In_FieldValue27
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName27)).WrapText = False
  End If
  If In_FieldName28 <> "" Then
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName28)).Value = In_FieldValue28
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnByName(In_BookName, In_Sheet, 1, In_FieldName28)).WrapText = False
  End If
  
End Sub


' 11. ����� ������ � ���� �� ���� (�� ��������� ������ ���������, �� ���������� � ��������� ����� �� ������ ������ �������� 1)
Function WeekNumber(In_Date) As Integer
Dim CurrDate As Date
  ' ���� ������ ���� - ���� ������ ������
  CurrDate = CDate("01.01." + CStr(Year(In_Date)))
  
  ' � ��������� ������ ������ ������ �� �������� �� ���� � ������ ��� ��� ���������� - ���������, ��� ������! � ���������� ��������� ������ ������ ��������� � ������� ������������
  WeekNumber = 1
  
  Do While CurrDate <= In_Date
    ' ���� ������� ���� CurrDate ��� �����������, �� ������� ���� ������
    If Weekday(CurrDate, vbMonday) = 1 Then
      WeekNumber = WeekNumber + 1
    End If
    ' ��������� ����
    CurrDate = CurrDate + 1
  Loop
End Function

' 11.0 ���������� ������� �� �������
Function �����_������(In_Date) As Integer
  �����_������ = WeekNumber(In_Date)
End Function

' 11.1 ���� ������������ �� ������ ������
Function MondayDateByWeekNumber(In_WeekNumber, In_Year) As Date
Dim CurrDate As Date
Dim WeekNumber As Byte
  
  ' ����� 01 ������ �������� ���� - ��� ������ ������
  CurrDate = CDate("01.01." + CStr(In_Year))
  MondayDateByWeekNumber = CurrDate
  
  WeekNumber = 1
  
  Do While WeekNumber <= In_WeekNumber
    
    ' ���� ������� ���� CurrDate ��� �����������, �� ������� ���� ������
    If Weekday(CurrDate, vbMonday) = 1 Then
      WeekNumber = WeekNumber + 1
      '
      If WeekNumber = In_WeekNumber Then
        MondayDateByWeekNumber = CurrDate
      End If
      
    End If
    
    ' ��������� ����
    CurrDate = CurrDate + 1
    
  Loop
    
End Function


' 12. ������������ ��� ������ �� ����
Function ����������(In_Date) As String
  ' ���� ������
  Select Case Weekday(In_Date, vbMonday)
    Case 1
          ���������� = "�����������"
        Case 2
          ���������� = "�������"
        Case 3
          ���������� = "�����"
        Case 4
          ���������� = "�������"
        Case 5
          ���������� = "�������"
        Case 6
          ���������� = "�������"
        Case 7
          ���������� = "�����������"
      End Select
End Function

' 12.1 ������������ ��� ������ �� ����
Function ����_������(In_Date) As String
  
  ����_������ = ����������(In_Date)
  
End Function


' 12.1 ������� ������� ���� ������ - �������
Function remDayWorkWeek(In_Date) As String
  
  remDayWorkWeek = ""
  
  ' ���� ������
  Select Case Weekday(In_Date, vbMonday)
    Case 1
          remDayWorkWeek = "������"
        Case 2
          remDayWorkWeek = "4 ���"
        Case 3
          remDayWorkWeek = "3 ���"
        Case 4
          remDayWorkWeek = "2 ���������� ���"
        Case 5
          remDayWorkWeek = "�������"
        Case 6
          remDayWorkWeek = ""
        Case 7
          remDayWorkWeek = ""
      End Select
      
End Function


' 13. ������������ ������ �� ����
Function ���������(In_Date) As String
  ' �����
  Select Case Month(In_Date)
    Case 1
          ��������� = "������"
        Case 2
          ��������� = "�������"
        Case 3
          ��������� = "����"
        Case 4
          ��������� = "������"
        Case 5
          ��������� = "���"
        Case 6
          ��������� = "����"
        Case 7
          ��������� = "����"
        Case 8
          ��������� = "������"
        Case 9
          ��������� = "��������"
        Case 10
          ��������� = "�������"
        Case 11
          ��������� = "������"
        Case 12
          ��������� = "�������"
      End Select
End Function

' 13.2 ������������ ������ �� ����
Function ���������2(In_Date) As String
  ' �����
  Select Case Month(In_Date)
    Case 1
          ���������2 = "������"
        Case 2
          ���������2 = "�������"
        Case 3
          ���������2 = "�����"
        Case 4
          ���������2 = "������"
        Case 5
          ���������2 = "���"
        Case 6
          ���������2 = "����"
        Case 7
          ���������2 = "����"
        Case 8
          ���������2 = "�������"
        Case 9
          ���������2 = "��������"
        Case 10
          ���������2 = "�������"
        Case 11
          ���������2 = "������"
        Case 12
          ���������2 = "�������"
      End Select
End Function

' 13.3 ������������ ������ �� ����
Function ���������3(In_Date) As String
  ' �����
  Select Case Month(In_Date)
    Case 1
          ���������3 = "������"
        Case 2
          ���������3 = "�������"
        Case 3
          ���������3 = "����"
        Case 4
          ���������3 = "������"
        Case 5
          ���������3 = "���"
        Case 6
          ���������3 = "����"
        Case 7
          ���������3 = "����"
        Case 8
          ���������3 = "������"
        Case 9
          ���������3 = "��������"
        Case 10
          ���������3 = "�������"
        Case 11
          ���������3 = "������"
        Case 12
          ���������3 = "�������"
      End Select
End Function


' 13.2 ������������ ������ � ��� �� ����
Function ������������(In_Date) As String
  ������������ = ���������(In_Date) + " " + CStr(Year(In_Date)) + " �."
End Function

' 13.3 ������������ ������ � ��� �� ����
Function ������������(In_Date) As String
  ������������ = CStr(Day(In_Date)) + " " + ���������2(In_Date) + " " + CStr(Year(In_Date)) + " �."
End Function


' 14. DoEvents
Function DoEventsInterval(In_Value)
  ' If InStr(CStr(In_Value / 100), ",") = 0 Then
  ' �������� ������� �� ������� � ���� �� ����� ����, ��������� DoEvents
  If x Mod 100 = 0 Then
    DoEvents
  End If
End Function

' 15. ����������� ����� � ������
Sub �����������������������(In_Sheets, In_Range)
    ' ����������� ����� ���� �� ��������� ��������
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Name = "Calibri"
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.FontStyle = "����������"
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Size = 12
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Strikethrough = True
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Superscript = False
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Subscript = False
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.OutlineFont = False
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Shadow = False
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Underline = xlUnderlineStyleNone
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.ThemeColor = xlThemeColorLight1
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.TintAndShade = 0
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.ThemeFont = xlThemeFontMinor
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Bold = False
End Sub

' 16. ��������� ������ ������ � ������
Sub ����������������������������(In_Sheets, In_Range)
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Name = "Calibri"
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.FontStyle = "�������"
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Size = 12
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Strikethrough = False
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Superscript = False
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Subscript = False
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.OutlineFont = False
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Shadow = False
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Underline = xlUnderlineStyleNone
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.ThemeColor = xlThemeColorLight1
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.TintAndShade = 0
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.ThemeFont = xlThemeFontMinor
  ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Bold = True
End Sub

' 17. ��������� ������� ������ � ������
Sub �����������������������������(In_Sheets, In_Range)
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.Bold = False
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.ThemeColor = xlThemeColorDark1
    ThisWorkbook.Sheets(In_Sheets).Range(In_Range).Font.TintAndShade = -4.99893185216834E-02
End Sub

' 18. �������� ������
Sub send_Lotus_Notes(In_Subject, In_Address, In_AddressCopy, In_body, strpath As String)

  Dim Session As Object
  Dim Dir As Object
  Dim Doc As Object
  Dim Workspace As Object
  Dim EditDoc As Object
  Dim AttachME As Object
  Dim UserName As String
  Dim MailDbName As String

  Set Workspace = CreateObject("Notes.NotesUIWorkspace")
  Set Session = CreateObject("notes.NOTESSESSION")
  UserName = Session.UserName
  MailDbName = Left$(UserName, 1) & Right$(UserName, (Len(UserName) - InStr(1, UserName, " "))) & ".nsf"
  Set Dir = Session.CurrentDatabase
  If Dir.IsOpen = False Then Call Dir.OpenMail
  Set Doc = Dir.CREATEDOCUMENT

  ' ����
  Doc.Subject = In_Subject ' "����"
  ' �����
  Doc.SendTo = In_Address ' "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
  Doc.CopyTo = In_AddressCopy
  ' BlindCopyTo - ��� ���� �� �������, ���������!
  ' Doc.BlindCopyTo = ""
  
  ' ������
  Doc.body = In_body ' "������ ����!"

  Attachment = strpath
  If Attachment <> "" Then
      Set AttachME = Doc.CREATERICHTEXTITEM("Attachment" & i)
      Set EmbedObj = AttachME.EmbedObject(1454, "", Attachment, "Attachment")
  End If

  Doc.SAVEMESSAGEONSEND = SaveIt
  
  ' ���� ������� ��� - ����� ��������?
  Doc.send 0, In_Address ' "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"

  Set Session = Nothing
  Set Dir = Nothing
  Set Doc = Nothing
  Set Workspace = Nothing
  Set EditDoc = Nothing

End Sub

' 18.1 �������� ������
Sub send_Lotus_Notes2(In_Subject, In_Address, In_AddressCopy, In_AddressBlind, In_body, strpath As String)

  Dim Session As Object
  Dim Dir As Object
  Dim Doc As Object
  Dim Workspace As Object
  Dim EditDoc As Object
  Dim AttachME As Object
  Dim UserName As String
  Dim MailDbName As String

  Set Workspace = CreateObject("Notes.NotesUIWorkspace")
  Set Session = CreateObject("notes.NOTESSESSION")
  UserName = Session.UserName
  MailDbName = Left$(UserName, 1) & Right$(UserName, (Len(UserName) - InStr(1, UserName, " "))) & ".nsf"
  Set Dir = Session.CurrentDatabase
  If Dir.IsOpen = False Then Call Dir.OpenMail
  Set Doc = Dir.CREATEDOCUMENT

  ' ����
  Doc.Subject = In_Subject ' "����"
  ' �����
  Doc.SendTo = In_Address ' "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
  Doc.CopyTo = In_AddressCopy
  ' BlindCopyTo - ��� ���� �� �������, ���������!
  Doc.BlindCopyTo = In_AddressBlind
  
  ' ������
  Doc.body = In_body ' "������ ����!"

  Attachment = strpath
  If Attachment <> "" Then
      Set AttachME = Doc.CREATERICHTEXTITEM("Attachment" & i)
      Set EmbedObj = AttachME.EmbedObject(1454, "", Attachment, "Attachment")
  End If

  Doc.SAVEMESSAGEONSEND = SaveIt
  
  ' ���� ������� ��� - ����� ��������?
  Doc.send 0, In_Address ' "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"

  Set Session = Nothing
  Set Dir = Nothing
  Set Doc = Nothing
  Set Workspace = Nothing
  Set EditDoc = Nothing

End Sub


' 19 ������� ��� ������
Function ��������������() As String
  ' �������
  �������������� = �������������� + "" + Chr(13)
  �������������� = �������������� + "� ���������, ������� ������ ���������" + Chr(13)
  �������������� = �������������� + "����������� ������������� ���������" + Chr(13)
  �������������� = �������������� + "������������ ������������ ���� ����������" + Chr(13)
  �������������� = �������������� + "��� ��������������" + Chr(13)
  �������������� = �������������� + "e-mail: proschaevsf@ tyumen.psbank.ru" + Chr(13)
  �������������� = �������������� + "���.: ��. 71-5913" + Chr(13)
  �������������� = �������������� + "���.: +7 (922) 00-88-253" + Chr(13)
  ' �������������� = �������������� + "" + Chr(13)
End Function

' 20. ����� ������� � ������� �� "��������"
Function ColumnByName(In_Workbooks, In_Sheets, In_Row, In_ColumnName) As Integer
Dim i As Integer
  ColumnByName = 0
  ' ��������� ����� ������ �������
  i = 1
  ������_������� = False
  Do While (Not IsEmpty(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, i).Value)) And (������_������� = False)
    ' ��������� - �������� ������� � ��� ������� ����
    If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, i).Value) = Trim(In_ColumnName) Then
      ������_������� = True
      ColumnByName = i
    End If
    ' ��������� �������
    i = i + 1
  Loop
End Function

' 20.1 ����� ������� � ������� �� "��������" � �� ������ ������ �������� � ������: ����, ����, ����, ����
Function ColumnByNameAndNumber(In_Workbooks, In_Sheets, In_Row, In_ColumnName, In_ColumnNameCount, In_maxColumnInSheet) As Integer
Dim i As Integer
  ColumnByNameAndNumber = 0
  ' ��������� ����� ������ �������
  i = 1
  ������_������� = False
  ' ����� �������� �������� � ����� ������ (In_ColumnName)
  ��������������������� = 0
  Do While (i < In_maxColumnInSheet) And (������_������� = False)
    ' ��������� - �������� ������� � ��� ������� ����
    If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, i).Value) = Trim(In_ColumnName) Then
      ��������������������� = ��������������������� + 1
      ' ����� �������� ����� ��������
      If ��������������������� = In_ColumnNameCount Then
        ' ����������� �����
        ������_������� = True
      End If
      ColumnByNameAndNumber = i
    End If
    ' ��������� �������
    i = i + 1
  Loop
End Function

' 21. ����������� ������ ������ � ������� ��������� �������� �������� (�����)
Function rowByValue(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet) As Integer
  rowByValue = 0
  ColumnCount = 1
  �������_�������� = False
  
  ' ��������� ������� �� �������, ����� �� ������
  ' 23.12.2020 Do While (ColumnCount < In_maxColumnInSheet) And (�������_�������� = False)
  Do While (ColumnCount <= In_maxColumnInSheet) And (�������_�������� = False)
  
    ' �� ������
    rowCount = 1
    
    ' 23.12.2020 Do While (rowCount < In_maxRowInSheet) And (�������_�������� = False)
    Do While (rowCount <= In_maxRowInSheet) And (�������_�������� = False)
      ' t = Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value
      ' t2 = InStr(CStr(t), "Error")
      If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(In_Value) Then
      ' If Trim(t) = Trim(In_Value) Then
        rowByValue = rowCount
        �������_�������� = True
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function

' 21.1 ����������� ������ ������ � ������� ��������� �������� �������� (�����)
Function rowByValue2(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet, In_Count) As Integer
  rowByValue2 = 0
  ColumnCount = 1
  �������_�������� = False
  �����_��������� = 0
  
  ' ��������� ������� �� �������, ����� �� ������
  ' 23.12.2020 Do While (ColumnCount < In_maxColumnInSheet) And (�������_�������� = False)
  Do While (ColumnCount <= In_maxColumnInSheet) And (�������_�������� = False)
  
    ' �� ������
    rowCount = 1
    
    ' 23.12.2020 Do While (rowCount < In_maxRowInSheet) And (�������_�������� = False)
    Do While (rowCount <= In_maxRowInSheet) And (�������_�������� = False)
    
      If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value) = Trim(In_Value) Then
        rowByValue2 = rowCount
        �����_��������� = �����_��������� + 1
        If �����_��������� = In_Count Then
          �������_�������� = True
        End If
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function


' 22. ����������� ������� ������ � ������� ��������� �������� �������� (�����)
Function ColumnByValue(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet) As Integer
  ColumnByValue = 0
  ColumnCount = 1
  �������_�������� = False
  ' ��������� ������� �� �������, ����� �� ������
  Do While (ColumnCount <= In_maxColumnInSheet) And (�������_�������� = False)
    ' �� ������
    rowCount = 1
    Do While (rowCount <= In_maxRowInSheet) And (�������_�������� = False)
      ' If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value) = Trim(In_Value) Then
      If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(CStr(In_Value)) Then
        ColumnByValue = ColumnCount
        �������_�������� = True
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function

' 22.1 ����������� ������� ������ � ������� ��������� �������� �������� (�����) � �� ����� ����� �� ���� ��������� In_Count = 1-��, 2-�� � �.�.
Function ColumnByValue2(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet, In_Count) As Integer
  ColumnByValue2 = 0
  ColumnCount = 1
  �������_�������� = False
  �����_��������� = 0
  ' ��������� ������� �� �������, ����� �� ������
  Do While (ColumnCount <= In_maxColumnInSheet) And (�������_�������� = False)
    ' �� ������
    rowCount = 1
    Do While (rowCount <= In_maxRowInSheet) And (�������_�������� = False)
      
      ' If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value) = Trim(In_Value) Then
      If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(CStr(In_Value)) Then
        ColumnByValue2 = ColumnCount
        �����_��������� = �����_��������� + 1
        
        ' ��������� �� ����� ���� ������� ����� �� �����
        If �����_��������� = In_Count Then
          �������_�������� = True
        End If
        
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function

' 22.2 ����������� ������� ������ � ������� ��������� �������� �������� (�����) - �������� � ��������� ������� �� �������!
Function ColumnByValue3(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet) As Integer
  ColumnByValue3 = 0
  ColumnCount = 1
  �������_�������� = False
  ' ��������� ������� �� �������, ����� �� ������
  Do While (ColumnCount <= In_maxColumnInSheet) And (�������_�������� = False)
    ' �� ������
    rowCount = 1
    Do While (rowCount <= In_maxRowInSheet) And (�������_�������� = False)
      ' If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(CStr(In_Value)) Then
      If (CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = (CStr(In_Value)) Then
        ColumnByValue3 = ColumnCount
        �������_�������� = True
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function


' 23. ��������� ����� �� ������ ������� (����� �� ��������)
Function ConvertToLetter(iCol) As String
   Dim iAlpha As Integer
   Dim iRemainder As Integer
   iAlpha = Int(iCol / 27)
   iRemainder = iCol - (iAlpha * 26)
   If iAlpha > 0 Then
      ConvertToLetter = Chr(iAlpha + 64)
   End If
   If iRemainder > 0 Then
      ConvertToLetter = ConvertToLetter & Chr(iRemainder + 64)
   End If
End Function

' 24. ����������� ������ � ������� ��������� �������� �������� (�����), �������� G11
Function RangeByValue(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet) As String
  RangeByValue = ""
  ColumnCount = 1
  �������_�������� = False
  ' ��������� ������� �� �������, ����� �� ������
  Do While (ColumnCount < In_maxColumnInSheet) And (�������_�������� = False)
    ' �� ������
    rowCount = 1
    Do While (rowCount < In_maxRowInSheet) And (�������_�������� = False)
      
      ' If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RowCount, ColumnCount).Value) = Trim(In_Value) Then
      If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(In_Value) Then
        RangeByValue = ConvertToLetter(ColumnCount) + CStr(rowCount)
        �������_�������� = True
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function

' 24.1 ����������� ������ � ������� ��������� �������� �������� (�����), �������� G11. ���������� ���������� "row-column"
Function cellByValue(In_Workbooks, In_Sheets, In_Value, In_maxRowInSheet, In_maxColumnInSheet) As String
  cellByValue = ""
  ColumnCount = 1
  �������_�������� = False
  ' ��������� ������� �� �������, ����� �� ������
  Do While (ColumnCount < In_maxColumnInSheet) And (�������_�������� = False)
    ' �� ������
    rowCount = 1
    Do While (rowCount < In_maxRowInSheet) And (�������_�������� = False)
      
      ' If Trim(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RowCount, ColumnCount).Value) = Trim(In_Value) Then
      If Trim(CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(rowCount, ColumnCount).Value)) = Trim(In_Value) Then
        cellByValue = CStr(rowCount) + "-" + CStr(ColumnCount)
        �������_�������� = True
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
End Function

' 24.2 �� ���������� "row-column" �������� row
Function row_cellByValue(In_row_column) As Integer
  row_cellByValue = CInt(Mid(In_row_column, 1, InStr(In_row_column, "-") - 1))
End Function

' 24.3 �� ���������� "row-column" �������� column
Function column_cellByValue(In_row_column) As Integer
  column_cellByValue = CInt(Mid(In_row_column, InStr(In_row_column, "-") + 1, Len(In_row_column) - InStr(In_row_column, "-")))
End Function


' 25. ������ ����� �� ������
Function ������������(In_����������, In_����������, In_DateNow, In_WorkingDayInWeek)
Dim dateBeginWeek, dateEndWeek As Date
  ' ���� ������ ������
  dateBeginWeek = weekStartDate(In_DateNow)
  ' ���� ����� ������
  dateEndWeek = weekEndDate(In_DateNow)
  ' ����� ������� ���� � ������
  ' workingDaysMonth = Working_days_in_the_FullMonth(������������_����_������_�������, 6)
  ' ������ ������
  ������������ = (In_���������� - In_����������) / Working_days_between_dates(dateBeginWeek, Date_last_day_month(In_DateNow), In_WorkingDayInWeek) * Working_days_between_dates(dateBeginWeek, dateEndWeek, In_WorkingDayInWeek)
  ' ���� ���� �� ������ ������ ����, �� ��������� ���� �� ���� ������ �� ���� ������
  If ������������ < 0 Then
    ������������ = 0
  End If
End Function

' 25.1 ������ ����� �� ������ �� ����� ��������
Function ������������_Q(In_�����������, In_�����������, In_DateNow, In_WorkingDayInWeek)
Dim dateBeginWeek, dateEndWeek As Date
  
  ' ���� ������ ������
  dateBeginWeek = weekStartDate(In_DateNow)
  ' ���� ����� ������
  dateEndWeek = weekEndDate(In_DateNow)
  
  ' ����� ������� ���� � ������
  ' workingDaysMonth = Working_days_in_the_FullMonth(������������_����_������_�������, 6)
  
  ' ������ ������
  ������������_Q = (In_����������� - In_�����������) / Working_days_between_dates(dateBeginWeek, Date_last_day_quarter(In_DateNow), In_WorkingDayInWeek) * Working_days_between_dates(dateBeginWeek, dateEndWeek, In_WorkingDayInWeek)
  
  ' ***
  t0 = Working_days_between_dates(dateBeginWeek, Date_last_day_quarter(In_DateNow), In_WorkingDayInWeek)
  t01 = Date_last_day_quarter(In_DateNow)
  t02 = Working_days_between_dates(dateBeginWeek, dateEndWeek, In_WorkingDayInWeek)
  ' ***
  
  ' ���� ���� �� ������ ������ ����, �� ��������� ���� �� ���� ������ �� ���� ������
  If ������������_Q < 0 Then
    ������������_Q = 0
  End If
  
End Function


' 26. �������������� ��������� ���������� ������ ��������� (��: 12345678) => ���������� �.�. (��: 12345678)
Function ��������������������(In_���_�_��) As String
  �������������������� = ""
  �������_������_������ = InStr(In_���_�_��, "(")
  ���������_1 = Mid(In_���_�_��, 1, �������_������_������)
  ���������_2 = Mid(In_���_�_��, �������_������_������, Len(In_���_�_��) - �������_������_������ + 1)
  �������������������� = �������_�_���(���������_1, 3) + " " + ���������_2
End Function

' 26.1 �������������� ��������� ���������� ������ ��������� (��: 12345678) => 12345678
Function ��������������������2(In_���_�_��) As String
Dim �������_������_������, �������_������_������ As Byte
  ��������������������2 = ""
  �������_������_������ = InStr(In_���_�_��, "(")
  �������_������_������ = InStr(In_���_�_��, ")")
  ��������������������2 = Trim(Mid(In_���_�_��, �������_������_������ + 4, �������_������_������ - �������_������_������ - 4))
End Function

' 26.2 �������������� ��������� ���������� ������ ��������� (��: 12345678) => ����������
Function ��������������������3(In_���_�_��) As String

  ��������������������3 = Trim(Mid(In_���_�_��, 1, InStr(In_���_�_��, " ") - 1))
  
End Function

' 26.3 �������������� ��������� ���������� ������ ��������� (��: 12345678) => ������
Function ��������������������4(In_���_�_��) As String

  �������_������_������� = InStr(In_���_�_��, " ")
  ���_�������� = Mid(In_���_�_��, �������_������_������� + 1, Len(In_���_�_��) - �������_������_�������)
  ��������������������4 = Trim(Mid(���_��������, 1, InStr(���_��������, " ")))
  
End Function


' 26.4 �������������� ��������� ���������� ������ ��������� (��: 12345678) => ���������
Function ��������������������5(In_���_�_��) As String
Dim �������_������_������, �������_������_������ As Byte
  
  �������_������_������� = InStr(In_���_�_��, " ")
  ���_�������� = Mid(In_���_�_��, �������_������_������� + 1, Len(In_���_�_��) - �������_������_�������)
  �������_�������_������� = �������_������_������� + InStr(���_��������, " ")
  �������_������_������ = InStr(In_���_�_��, "(")
  �������_������_������ = InStr(In_���_�_��, ")")
  ��������������������5 = Trim(Mid(In_���_�_��, �������_�������_������� + 1, �������_������_������ - �������_�������_������� - 1))
  
End Function



' 27. ������ �_��� �� ���� ����
Sub set�_���In����(In_Workbooks, In_Sheets, In_�_���, In_�_���Value, In_�_���Date, In_Size, In_�_���Detailing)
Dim Range�_���, Id_TaskVar, PersonVar As String
Dim Range�_���_Row, Range�_���_Column, OfficeNumberVar As Byte
  
  ' �� �������� ���� ������� � ������ ������� "��������� ������:"
  ' ?
  
  ' ������� ������ (�������� G41), � ������� �������� �������� ���1
  Range�_��� = RangeByValue(In_Workbooks, In_Sheets, In_�_���, 100, 100)
  Range�_���_Row = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range�_���).Row
  Range�_���_Column = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range�_���).Column
  If In_�_���Detailing <> "" Then
      Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column - 5).Value = In_�_���Detailing
  End If
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 1).Value = In_�_���Date
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 2).Value = In_�_���Value
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 3).Value = In_Size
  
  ' ���������� ��������� � BASE\Tasks, ��� ���� Id_Task = ������-���-���i (10-2020-���1) - ����� ������
  ' ��������! ������ ���� ������� ������� BASE\Tasks
  ' ����� InsertRecordInBook
  Id_TaskVar = CStr(WeekNumber(In_�_���Date)) + "-" + CStr(Year(In_�_���Date)) + "-" + In_�_���
  ' ����� ����� (1..5)
  OfficeNumberVar = CInt(Mid(In_�_���, Len(In_�_���), 1))
  
  ' ������������� �� ��������� - ���� ��� ����� � 1 �� 5
  If OfficeNumberVar = 1 Then
    PersonVar = getFromAddrBook("�������1", 3)
  Else
    PersonVar = getFromAddrBook("���" + CStr(OfficeNumberVar), 3)
  End If
  ' ������������� �� ��������� - ���� ��� ��: ���1, ���2
  If Mid(In_�_���, 1, 3) = "���" Then
    PersonVar = getFromAddrBook("���", 3)
  End If
  
  ' ����� InsertRecordInBook
  Call InsertRecordInBook("Tasks", "����1", "Id_Task", Id_TaskVar, _
                                            "Date", In_�_���Date, _
                                              "Protocol", CStr(WeekNumber(In_�_���Date)) + "-" + strDDMMYYYY(In_�_���Date), _
                                                "Id_Task", Id_TaskVar, _
                                                  "Division", getNameOfficeByNumber(OfficeNumberVar), _
                                                    "Person", PersonVar, _
                                                      "Description_task", Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column - 5).Value, _
                                                        "�_���", In_�_���, _
                                                          "Value", In_�_���Value, _
                                                            "Unit", In_Size, _
                                                              "Date_finish", weekEndDate(In_�_���Date), _
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

  
End Sub

' 28. ������ ���� ���������� �_��� �� ���� ����
Sub current�_���In����(In_Workbooks, In_Sheets, In_�_���, In_�_���Date, In_�_���Value, In_Size)
Dim Range�_��� As String
Dim Range�_���_Row, Range�_���_Column As Byte
  
  ' ������� ������ (�������� G41), � ������� �������� �������� ���1
  Range�_��� = RangeByValue(In_Workbooks, In_Sheets, In_�_���, 100, 100)
  Range�_���_Row = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range�_���).Row
  Range�_���_Column = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range�_���).Column
  
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 4).Value = In_�_���Date
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 5).Value = In_�_���Value
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 6).Value = In_Size
  
  ' �����������������
  ' t = Round(�����������������(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 2).Value, In_�_���Value), 1)
  ' t2 = Round(�����������������(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 2).Value, In_�_���Value), 2)
  ' t3 = �����������������(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 2).Value, In_�_���Value)
  
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 7).Value = Round(�����������������(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(Range�_���_Row, Range�_���_Column + 2).Value, In_�_���Value), 2)
  
  ' ������ �������� ��� ��������� � BASE\Tasks, ��� ���� Id_Task = ������-���-���i (10-2020-���1): Last_Date, Last_Value, Status_persent, Status
  ' ��������! ������ ���� ������� ������� BASE\Tasks
  ' ����� InsertRecordInBook �������� �� ����� Id_Task
  Id_TaskVar = CStr(WeekNumber(In_�_���Date)) + "-" + CStr(Year(In_�_���Date)) + "-" + In_�_���
  Call InsertRecordInBook("Tasks", "����1", "Id_Task", Id_TaskVar, _
                                            "Last_Date", In_�_���Date, _
                                              "Last_Value", In_�_���Value, _
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
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
  
End Sub

' 29. ������� � % ����� ����� �������
Function �������_�_���������(In_Start, In_End) As Double
  ' ������� � ��������� ���������� % = (B-A)/A*100 A = �������� �������� B = �������� ��������
  If In_Start <> 0 Then
    �������_�_��������� = ((In_End - In_Start) / In_Start * 100) / 100
  Else
    �������_�_��������� = 1
  End If
End Function

' 30. ������� ���������� �� ����� � ����� (https://calc.by/math-calculators/percent-calculator.html)
Function �����������������(In_����, In_����) As String
  If In_���� > 0 Then
    ����������������� = (In_���� / In_����)
  Else
    ����������������� = 1
  End If
End Function

' 31. ������ �� ����N
Function �������������N(In_Sheet) As Integer
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
  ' ������� ������ � ������� �� ����� ���� �������� "������:"
  Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
  Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
  Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
  '
  �������������N = 0
  �������������N = CInt(ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value)
End Function

' 32. ��������� ini-���� � ��������� �������� ����������
Function param_from_ini(In_iniFile, In_ParamName) As String
   param_from_ini = ""
   f = FreeFile
   Open In_iniFile For Input As #f
   Do While Not EOF(f)
     Line Input #f, S
     ' ���� � ������ ���� ���� "="
     If InStr(S, "=") <> 0 Then
       ' ���������� ������� ����� "="
       �������_����� = InStr(S, "=")
       ' ���������� ������
       If Trim(Mid(S, 1, �������_����� - 1)) = In_ParamName Then
         ' �������_����� = InStr(s, "=")
         param_from_ini = Trim(Mid(S, �������_����� + 1, Len(S) - �������_�����))
       End If
     End If ' ���� � ������ ���� ���� "="
   Loop
   Close f
End Function

' 33. �������� ������ (����)
Sub ��������_Lotus_Notes()
Dim ����������� As String
  ' ����� ������
  ����������� = "��������� ����������," & Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + "����� ���������� �������� � ����������� �� ������." + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ' ������� (������� � ��., )
  ����������� = ����������� + ��������������()
  ' ������
  ����������� = ����������� + ThisWorkbook.Sheets("����3").Cells(2, 13).Value + Chr(13)
  ' �����
  Call send_Lotus_Notes(ThisWorkbook.Sheets("����3").Cells(2, 16).Value, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "C:\Users\proschaevsf\Documents\#DB_Result\Out\��������_����_���_��������.xlsx")
End Sub

' 34. �������� ������� ����������� �������
' ������� � ��������� ������ "Module_CheckFormatReport"
    
' 35. �������� ������� ����� � �������� ������ � ����� (��� ������)
Function Sheets_Exist2(In_Workbooks, In_Sheets) As Boolean
Dim wsSh As Worksheet
  On Error Resume Next
  Set wsSh = Workbooks(In_Workbooks).Sheets(In_Sheets)
  Sheets_Exist2 = Not wsSh Is Nothing
End Function

' 36. ������ �������������� �� �������� � ���� ������ � ����� ����, In_Status = 1 - ��������������, In_Status = 0 - �������������
Function ����������������_��_��������(In_Status) As String

Dim ���������_��_��������_Range, �����_��_��������_Range, ���������_�_���, ������_������������_str As String
Dim rowCount, ���������_��_��������_Row, ���������_��_��������_Column, �����_�������������, �����_������������, �����_��_��������_Row, �����_��_��������_Column As Byte
  
  ' ������������� ������
  ����������������_��_�������� = ""
  ' �� ����� "����" ������� ������ � ������� "���������_��_��������"
  ���������_��_��������_Range = RangeByValue(ThisWorkbook.Name, "����", "���������_��_��������", 100, 100)
  ���������_��_��������_Row = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Row
  ���������_��_��������_Column = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Column
  
  ' ������������ ������
  �����_������������� = 0
  rowCount = ���������_��_��������_Row + 1
  Do While ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column).Value <> "�����_��_��������"
    
    ' ��������� ������ 1 - ������������, 0 - �����������
    If ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column).Value = In_Status Then
       
      ' ��� <> 0
      If ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value <> 0 Then
      
        ���������_�_��� = ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 4).Value + " " + �������_�_���(ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value, 3)
      
        If �����_������������� <> 0 Then
          ����������������_��_�������� = ����������������_��_�������� + ", " + ���������_�_���
        Else
          ����������������_��_�������� = ���������_�_���
        End If
        �����_������������� = �����_������������� + 1
        
      End If
      
    End If
    ' ��������� ������
    rowCount = rowCount + 1
  Loop
  
  ' ���� ���������� ������ ��������������, �� ��������� � ������������ (���� ����)
  If In_Status = 1 Then
    
    ' ������ ������������ ����������:
    ������_������������_str = ""
    �����_������������ = 0
    
    �����_��_��������_Range = RangeByValue(ThisWorkbook.Name, "����", "�����_��_��������", 100, 100)
    �����_��_��������_Row = ThisWorkbook.Sheets("����").Range(�����_��_��������_Range).Row
    �����_��_��������_Column = ThisWorkbook.Sheets("����").Range(�����_��_��������_Range).Column
  
    rowCount = �����_��_��������_Row + 1
  
    Do While ThisWorkbook.Sheets("����").Cells(rowCount, �����_��_��������_Column).Value <> ""
      
      ' ��������� ������ 1 - ������������, 0 - �����������
      If ThisWorkbook.Sheets("����").Cells(rowCount, �����_��_��������_Column).Value = 1 Then
        
        ���������_�_��� = ThisWorkbook.Sheets("����").Cells(rowCount, �����_��_��������_Column + 4).Value + " " + �������_�_���(ThisWorkbook.Sheets("����").Cells(rowCount, �����_��_��������_Column + 1).Value, 3)
        
        If �����_������������ <> 0 Then
          ������_������������_str = ������_������������_str + ", " + ���������_�_���
        Else
          ������_������������_str = ���������_�_���
        End If
        �����_������������ = �����_������������ + 1
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
  
    ' ���� ������ ������������ �� ������ - �� ��������� � ������ ����������:
    If ������_������������_str <> "" Then
      ����������������_��_�������� = ����������������_��_�������� + ". ������������ ���������: " + ������_������������_str
    End If
  End If
  
  ' ���� ������ ������ - ���������� "-"
  If ����������������_��_�������� = "" Then
    ����������������_��_�������� = "-"
  End If
End Function

' 37. ������� � ��� �� ��� (��������: 1-������ ����, 2-������ �., 3-������ �.�., 4-������ � (��� �����), 5-������ )
Function �������_�_���(In_�������_���_��������, In_Type As Byte) As String
Dim ������_������, ������_������ As Byte
  
  If In_�������_���_�������� <> "" Then
    
    ' ����������� ��� �������:
    �������_�_��� = "_<���>_"
    
    ' ������ ������
    ������_������ = InStr(In_�������_���_��������, " ")
  
    ' ����� ���� � �������, ��������� �� ������ ��������
    ������_������ = InStr(������_������ + 1, In_�������_���_��������, " ")
    
    ' ���� In_Type=1 ������� ������ ����
    If In_Type = 1 Then
       �������_�_��� = Mid(In_�������_���_��������, 1, ������_������ - 1) + " " + Mid(In_�������_���_��������, ������_������ + 1, ������_������ - ������_������ - 1)
    End If
    ' ���� In_Type=2 ������� ������ �.
    If In_Type = 2 Then
       �������_�_��� = Mid(In_�������_���_��������, 1, ������_������ - 1) + " " + Mid(In_�������_���_��������, ������_������ + 1, 1) + "."
    End If
    ' ���� In_Type=3 ������� ������ �.�.
    If In_Type = 3 Then
       �������_�_��� = Mid(In_�������_���_��������, 1, ������_������ - 1) + " " + Mid(In_�������_���_��������, ������_������ + 1, 1) + "." + Mid(In_�������_���_��������, ������_������ + 1, 1) + "."
    End If
    ' ���� In_Type=4 ������� ������ � (��� �����)
    If In_Type = 4 Then
       �������_�_��� = Mid(In_�������_���_��������, 1, ������_������ - 1) + " " + Mid(In_�������_���_��������, ������_������ + 1, 1) ' + "."
    End If
    ' ���� In_Type=5 ������� ������ ������� ������
    If In_Type = 5 Then
       �������_�_��� = Mid(In_�������_���_��������, 1, ������_������ - 1) ' + " " + Mid(In_�������_���_��������, ������_������ + 1, 1) ' + "."
    End If
  Else
    �������_�_��� = ""
  End If
  
End Function

' 38. ������ ������ ������ �� ������ ������
Function lineHeight(In_Str, In_lineHeight, In_numberOfCharacters)
Dim ���������_������ As Integer
  
  ' 1-�� �������: ������������� ������� ���������� �� ������� � ��������� ������ ���, ��� ��� ����������� ������ ���� ����� ����� ��� ������� �����. VBA ����������� (�� �� ���������!) ����� ������� ������� ���������� ��������� �������������� �������. ��������, ��������� 22\5 � 24\5 ����� ����� ���� � ��� �� ��������� = 4.
  ' ���������_������ = (Len(Trim(In_Str)) \ In_numberOfCharacters) * In_lineHeight
  
  ' 2-�� �������:
  ���������_������ = (Len(Trim(In_Str)) \ In_numberOfCharacters) * In_lineHeight
  
  If ���������_������ < In_lineHeight Then
    lineHeight = In_lineHeight
  Else
    ' lineHeight = ���������_������
    lineHeight = ���������_������ + In_lineHeight
  End If
  
End Function

' 39. ��������� ������ �� ��������� �����
Function getFromAddrBook(In_�_���, In_TypeData) As String
Dim �_���_Range As String
Dim �_���_Row, �_���_Column, rowCount As Byte
  
  getFromAddrBook = ""
  
  ' ������� In_�_��� �� �����
  ' �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
  
  ' If �_���_Range <> "" Then
    
    ' In_TypeData = 1: ��������� (����) + ��� (����)
    If In_TypeData = 1 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
      �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
      getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 6).Value + " " + �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 1).Value, 3)
    End If
  
    ' In_TypeData = 2: ��� ������� ��� ��������, ������� ���� � ��������� ���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���,����,���,������
    If In_TypeData = 2 Then
      ' �_���Str1 = "���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���,����,���,������"
      rowCount = 7
      Do While ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value <> ""
        If InStr(In_�_���, ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 3).Value) <> 0 Then
          If getFromAddrBook = "" Then
            getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 10).Value
          Else
            getFromAddrBook = getFromAddrBook + ", " + ThisWorkbook.Sheets("Addr.Book").Cells(rowCount, 10).Value
          End If
        End If
        ' ��������� ������
        rowCount = rowCount + 1
      Loop
    End If
  
    ' In_TypeData = 3: ��� (����)
    If In_TypeData = 3 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      If �_���_Range <> "" Then
        �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
        �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
        getFromAddrBook = �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 1).Value, 3)
      End If
    End If

    ' In_TypeData = 4: ������� ��� ��������
    If In_TypeData = 4 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      If �_���_Range <> "" Then
        �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
        �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
        getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 1).Value
      End If
    End If
    
    ' In_TypeData = 5: ����� ����������� ����� (10-�� �������)
    If In_TypeData = 5 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      If �_���_Range <> "" Then
        �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
        �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
        getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 7).Value
      End If
    End If
    
    ' 6: ��� ��������� - ����� 1 (���)
    If In_TypeData = 6 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      If �_���_Range <> "" Then
        �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
        �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
        getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 12).Value
      End If
    End If
 
    ' 7: ��� �������� ��������� - ����� 2 (���)
    If In_TypeData = 7 Then
      ' ��������� ����� In_�_���
      �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_�_���, 100, 100)
      If �_���_Range <> "" Then
        �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
        �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
        getFromAddrBook = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 13).Value
      End If
    End If
 
  ' End If ' �_���_Range <> ""

End Function

' 39.1 ��������� ������ �� ��������� ����� �� ���������� ������
Function getFromAddrBook2(In_��������, In_TypeData) As String
Dim �_���_Range As String
Dim �_���_Row, �_���_Column, rowCount As Byte
  
  getFromAddrBook2 = ""
  
  ' In_TypeData = 1: ��������� (����) + ��� (����)
  If In_TypeData = 1 Then
    ' ��������� ����� In_��������
    �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_��������, 100, 100)
    �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
    �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
    getFromAddrBook2 = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 3).Value + " " + �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 4).Value, 3)
  End If
    
  ' In_TypeData = 2: ��� (����)
  If In_TypeData = 2 Then
    ' ��������� ����� In_��������
    �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_��������, 100, 100)
    �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
    �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
    getFromAddrBook2 = �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 4).Value, 3)
  End If

  ' In_TypeData = 3: ��������� ������ + ��� (����)
  If In_TypeData = 3 Then
    ' ��������� ����� In_��������
    �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_��������, 100, 100)
    If �_���_Range <> "" Then
      �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
      �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
      getFromAddrBook2 = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 2).Value + " " + �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 4).Value, 3)
    End If
  End If

  ' In_TypeData = 4: ��������� (����) + ��� (����)
  If In_TypeData = 4 Then
    ' ��������� ����� In_��������
    �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_��������, 100, 100)
    �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
    �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
    getFromAddrBook2 = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 3).Value + " " + �������_�_���(ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column - 4).Value, 3)
  End If

  ' In_TypeData = 5: ��������� ������
  If In_TypeData = 5 Then
    ' ��������� ����� In_��������
    �_���_Range = RangeByValue(ThisWorkbook.Name, "Addr.Book", In_��������, 100, 100)
    If �_���_Range <> "" Then
      �_���_Row = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Row
      �_���_Column = ThisWorkbook.Sheets("Addr.Book").Range(�_���_Range).Column
      getFromAddrBook2 = ThisWorkbook.Sheets("Addr.Book").Cells(�_���_Row, �_���_Column + 2).Value
    End If
  End If


End Function

' 39.2 ��������� ������ ����� �� ��������� ����� �� ������� ��� ������ ���� ��������
Function getFromAddrBook3(In_���) As String
  
  getFromAddrBook3 = "����� LotusNotes �� ��������� (����� �� ���)!"
  
  ' ������� ������ � ��� � Addr.Book
  row_In_AddrBook = rowByValue(ThisWorkbook.Name, "Addr.Book", In_���, 100, 100)
  
  ' ���� ������ ���� �������
  If row_In_AddrBook <> 0 Then
    getFromAddrBook3 = ThisWorkbook.Sheets("Addr.Book").Cells(row_In_AddrBook, 10).Value
  End If
  
End Function


' 40. ��������� ������������ ����� �� ����� ����������� ������ 1 - ������, 2 - ������, 3 - �������������, 4 - ����� �������, 5 - �����-����
Function getNameOfficeByNumber(In_Number) As String
  getNameOfficeByNumber = "���� �� ���������!"
  Select Case In_Number
    Case 1 ' �� ����������
      getNameOfficeByNumber = "�� ����������"
    Case 2 ' �� �����������
      getNameOfficeByNumber = "�� �����������"
    Case 3 ' �� ����������������
      getNameOfficeByNumber = "�� ����������������"
    Case 4 ' �� ����������������
      getNameOfficeByNumber = "�� ����������������"
    Case 5 ' �� ������-����
      getNameOfficeByNumber = "�� ������-����"
    Case 0 ' ����� �� ��� ����������
      getNameOfficeByNumber = "����� �� ��� ����������"
      
  End Select
End Function

' 40. ��������� ������������ ����� �� ����� ����������� ������ 1 - ������, 2 - ������, 3 - �������������, 4 - ����� �������, 5 - �����-����
Function getNameOfficeByNumber2(In_Number) As String
  getNameOfficeByNumber2 = "���� �� ���������!"
  Select Case In_Number
    Case 1 ' �� ����������
      getNameOfficeByNumber2 = "���������"
    Case 2 ' �� �����������
      getNameOfficeByNumber2 = "����������"
    Case 3 ' �� ����������������
      getNameOfficeByNumber2 = "���������������"
    Case 4 ' �� ����������������
      getNameOfficeByNumber2 = "���������������"
    Case 5 ' �� ������-����
      getNameOfficeByNumber2 = "�����-����"
  End Select
End Function


' 40.1 ��������� ������������ ����� �� ������ ������, 2 - ������, 3 - �������������, 4 - ����� �������, 5 - �����-����
Function getNameOfficeByCity(In_City) As String
  getNameOfficeByCity = "���� �� ���������!"
  Select Case In_Number
    Case "������" ' �� ����������
      getNameOfficeByCity = "�� ����������"
    Case "������" ' �� �����������
      getNameOfficeByCity = "�� �����������"
    Case "���������������" ' �� ����������������
      getNameOfficeByCity = "�� ����������������"
    Case "����� �������" ' �� ����������������
      getNameOfficeByCity = "�� ����������������"
    Case "�����-����" ' �� ������-����
      getNameOfficeByCity = "�� ������-����"
  End Select
End Function

' 40.2 ��������� ������ ����� �� ������������ 1 - ���������, 2 - ����������, 3 - ���������������, 4 - ���������������, 5 - �����-����
Function getNumberOfficeByName(In_Office) As Byte
  getNumberOfficeByName = 0
  Select Case In_Office
    Case "���������"
      getNumberOfficeByName = 1
    Case "����������"
      getNumberOfficeByName = 2
    Case "���������������"
      getNumberOfficeByName = 3
    Case "���������������"
      getNumberOfficeByName = 4
    Case "�����-����"
      getNumberOfficeByName = 5
  End Select
End Function

' 40.3 ��������� ������ ����� �� ������������ 1 - ���������, 2 - ����������, 3 - ���������������, 4 - ���������������, 5 - �����-����
' ������� getNumberOfficeByName2 ������������ ��2 "�����-����"
Function getNumberOfficeByName2(In_Office) As Byte
  
  getNumberOfficeByName2 = 0
  
  If InStr(In_Office, "���������") <> 0 Then
    getNumberOfficeByName2 = 1
  End If
      
  If InStr(In_Office, "����������") <> 0 Then
    getNumberOfficeByName2 = 2
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    getNumberOfficeByName2 = 3
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    getNumberOfficeByName2 = 4
  End If
      
  If InStr(In_Office, "�����-����") <> 0 Then
    getNumberOfficeByName2 = 5
  End If

End Function

' 40.3 ��������� ������������ �����: ���������, ����������, ���������������, ���������������, �����-����
' ������� getShortNameOfficeByName ������������ ��2 "�����-����"
Function getShortNameOfficeByName(In_Office) As String
  
  getShortNameOfficeByName = 0
  
  If InStr(In_Office, "���������") <> 0 Then
    getShortNameOfficeByName = "���������"
  End If
      
  If InStr(In_Office, "����������") <> 0 Then
    getShortNameOfficeByName = "����������"
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    getShortNameOfficeByName = "���������������"
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    getShortNameOfficeByName = "���������������"
  End If
      
  If InStr(In_Office, "�����-����") <> 0 Then
    getShortNameOfficeByName = "�����-����"
  End If

End Function

' 40.4 ��������� ������������ �����: �� ����������, �� �����������, �� ����������������, �� ����������������, �� ������-����
Function updateNameOfficeByName(In_Office) As String
  
  updateNameOfficeByName = ""
  
  If InStr(In_Office, "���������") <> 0 Then
    updateNameOfficeByName = "�� ����������"
  End If
      
  If InStr(In_Office, "����������") <> 0 Then
    updateNameOfficeByName = "�� �����������"
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    updateNameOfficeByName = "�� ����������������"
  End If
      
  If InStr(In_Office, "���������������") <> 0 Then
    updateNameOfficeByName = "�� ����������������"
  End If
      
  If InStr(In_Office, "�����-����") <> 0 Then
    updateNameOfficeByName = "�� ������-����"
  End If

End Function


' 41. ���� ��������� (������) �� ����� ����� � ���������� - ����� �� G2 "10-02032020"
Function dateProtocol(In_ProtocolNumber) As Date
Dim ������������ As Byte
Dim str_dateProtocol
  ' ������� ��������� �� "-"
  ������������ = InStr(In_ProtocolNumber, "-")
  str_dateProtocol = Mid(In_ProtocolNumber, ������������ + 1, Len(In_ProtocolNumber) - ������������)
  ' ��������� ����, ����� � ��� ������
  dateProtocol = CDate(Mid(str_dateProtocol, 1, 2) + "." + Mid(str_dateProtocol, 3, 2) + "." + Mid(str_dateProtocol, 5, 4))
End Function

' 42. ������� ������ � �����0 P13 ������: 08.03.2020 10:06 => 832106
Function createHashTag(In_Letter)
Dim �����, �����, ���, ����, ������ As String
  ' �����
  ����� = Mid(CStr(Date), 1, 2)
  If CInt(�����) < 10 Then
    ����� = Replace(�����, "0", "")
  End If
  ' �����
  ����� = Mid(CStr(Date), 4, 2)
  If CInt(�����) < 10 Then
    ����� = Replace(�����, "0", "")
  End If
  ' ��� 2020 -> "2", 2021 -> "21", 2022 -> "22"
  ��� = Replace(Mid(Year(Date), 3, 2), "0", "")
  ' ���� = Replace(Mid(CStr(Time), 1, 2), "0", "")
  ���� = Mid(CStr(Time), 1, 2)
  If CInt(����) < 10 Then
    ���� = Replace(����, "0", "")
  End If
  ' ������
  ������ = Mid(CStr(Time), 4, 2)
  If CInt(������) < 10 Then
    ������ = Replace(������, "0", "")
  End If
  ' ��������� �������
  createHashTag = "#" + In_Letter + ����� + ����� + ��� + ���� + ������
End Function

' 43. ���� ���������� ����������� (��� �� �������)
Function Next_sunday_date(In_Date) As Date
Dim �������_����_�������� As Date
  ' ����� ���������� ����. ���� In_Date - �����������, �� ������� � ������������
  If Weekday(In_Date, vbMonday) = 7 Then
    �������_����_�������� = In_Date + 1
  Else
    �������_����_�������� = In_Date
  End If
  ' ������� ��� �� ������� �����������
  Do While Weekday(�������_����_��������, vbMonday) < 6
    ' ��������� ����
    �������_����_�������� = �������_����_�������� + 1
  Loop
  Next_sunday_date = �������_����_�������� + 1
End Function

' 44. ���������� ����� ������� ���� � �������� ��� �� ����� ������ (������������ �� �������)
Function Working_days_in_the_month(In_DateNow, In_working_days_in_the_week, In_�������_�������) As Integer
  ' ���������� ���� In_DateNow
  ' �����
  ����� = Month(In_DateNow)
  ' ���
  ��� = Year(In_DateNow)
  ' ������ ���� ���������� ������
  If ����� = 12 Then
    ����� = 0
    ��� = ��� + 1
  End If
  ������_����_����������_������ = CDate("01." + CStr(����� + 1) + "." + CStr(���))
  ' ���� ������� ����������� ����
  If In_�������_������� = True Then
    �������_����_�������� = In_DateNow
  Else
    �������_����_�������� = In_DateNow + 1
  End If
  ' ������ ������� �� �����
  Working_days_in_the_month = 0
  Do While �������_����_�������� < ������_����_����������_������
    ' ���� �������_����_�������� �� �������
    If In_working_days_in_the_week = 5 Then
      ' ���� ����������
      If (Weekday(�������_����_��������, vbMonday) <> 6) And (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_in_the_month = Working_days_in_the_month + 1
      End If
    Else
      ' ���� ����������� - In_working_days_in_the_week = 6
      If (Weekday(�������_����_��������, vbMonday) <> 7) Then
        Working_days_in_the_month = Working_days_in_the_month + 1
      End If
    End If
    ' ��������� ����
    �������_����_�������� = �������_����_�������� + 1
  Loop ' ��������� ����
End Function

' 45. ��������� % ���������� �� ������� � BASE\Tasks
Sub setStatusInTasks(In_BookName, In_Sheet, In_Last_Date, In_�_���, In_Protocol)

Dim rowCount As Integer
Dim column_�_���, column_Last_Date, column_Value, column_Last_Value, column_Status_persent, column_Status, column_Description_status, column_Date_finish, column_Protocol As Byte

  ' ����� ������� Last_Date
  column_Last_Date = ColumnByName(In_BookName, In_Sheet, 1, "Last_Date")
  ' ����� ������� �_���
  column_�_��� = ColumnByName(In_BookName, In_Sheet, 1, "�_���")
  ' ����� ������� Value
  column_Value = ColumnByName(In_BookName, In_Sheet, 1, "Value")
  ' ����� ������� Last_Value
  column_Last_Value = ColumnByName(In_BookName, In_Sheet, 1, "Last_Value")
  ' ����� ������� Status_persent
  column_Status_persent = ColumnByName(In_BookName, In_Sheet, 1, "Status_persent")
  ' ����� ������� Status
  column_Status = ColumnByName(In_BookName, In_Sheet, 1, "Status")
    ' ����� ������� Description_status
  column_Description_status = ColumnByName(In_BookName, In_Sheet, 1, "Description_status")
  ' ����� ������� Date_finish
  column_Date_finish = ColumnByName(In_BookName, In_Sheet, 1, "Date_finish")
  ' ����� ������� Protocol
  column_Protocol = ColumnByName(In_BookName, In_Sheet, 1, "Protocol")
  
  ' ����� �� ������ �������� - �������, ��� ������� ����������
  If In_Protocol = "" Then
  
    rowCount = 2
    Do While Not IsEmpty(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, 1))
    
      ' ���� ��� ������ � In_Last_Date � In_�_���
      If (Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Last_Date).Value = In_Last_Date) And (InStr(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_�_���).Value, In_�_���) <> 0) Then
      
        ' ������ ������ Status_persent � %: Last_Value � Value
        If Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Value).Value > 0 Then
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value = Round(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Last_Value).Value / Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Value).Value, 2)
        Else
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value = 1
        End If
        
        ' ������ 0-� ������ 1-��������� �������� 10 - �� ��������� 11 - ���������
        If Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value < 1 Then
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status).Value = 0
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Description_status).Value = "� ������"
        Else
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status).Value = 1
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Description_status).Value = "���������"
        End If
      
      End If
    
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
  Else
    
    ' ���� �������� ������, �� ��������� ���
    rowCount = 2
    Do While Not IsEmpty(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, 1))
    
      ' ���� ��� ������ � Protocol � In_�_���
      If (Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Protocol).Value = In_Protocol) And (InStr(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_�_���).Value, In_�_���) <> 0) Then
      
        ' ������ ������ Status_persent � %: Last_Value � Value
        If Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Value).Value > 0 Then
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value = Round(Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Last_Value).Value / Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Value).Value, 2)
        Else
          ' ���� �� ������ ��� 0, �� ������ 100%
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value = 1
        End If
        
       
        ' ������ 0/1
        If Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status_persent).Value < 1 Then
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status).Value = 10
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Description_status).Value = "�� ���������"
        Else
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Status).Value = 11
          Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_Description_status).Value = "���������"
        End If
      
      End If
    
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    
  End If
  
End Sub

' 46. �������� ����� �������������
Function ��������_�����_�������������(In_������, In_�����������, In_������, In_�����) As String
Dim i, �������_������, �������_����� As Integer
Dim �������_���������_������������ As Byte

  ��������_�����_������������� = In_������
  ' ������; ��������� �������; �. ������; ��. ��������; ���:7;
  If Len(In_������) <> 0 Then
    ��������_�����_������������� = ""
    �������_������ = 0
    �������_����� = 0
    �������_���������_������������ = 0
    ' �������
    For i = 1 To Len(In_������)
      If Mid(In_������, i, 1) = In_����������� Then
        �������_���������_������������ = �������_���������_������������ + 1
        ' ���� ��� ������
        If �������_���������_������������ = In_������ Then
          �������_������ = i
        End If
        ' ���� ��� �����
        If �������_���������_������������ = In_����� Then
          �������_����� = i
        End If
      End If
    Next i
    ' ���� ������� ������ � ����� �� �������
    If (�������_������ <> 0) And (�������_����� <> 0) Then
      ��������_�����_������������� = Mid(In_������, (�������_������ + 1), (�������_����� - �������_������ - 1))
    End If
  End If
  
End Function

' 47. �������� �������� ��������: 10 � ��� ������� ������ 13
Function delSym(In_Str) As String
  delSym = Replace(In_Str, Chr(10), "")
  ' ������� ���
  delSym = Replace(delSym, Chr(13), "")
End Function

' 48. ���������� ������� �������� ������
Function createBlankStr(In_Count) As String
  ' �������������
  createBlankStr = ""
  ' ��������� ������� �����
  For i = 1 To In_Count
    createBlankStr = createBlankStr + Chr(13)
  Next i
End Function

' 49. ��������� ������ ������ �� ������� ������: ��� Capacity 11.03.2020 �.: 10.02.03.20-08.03.20, 11.09.03.20-15.03.20 (���� ����� � 5 �����)
Function rowOfWeekPeriod(In_CellWeekPeriod) As Byte
Dim �������_�����_1, �������_�����_2, �������_�����_3, �������_�����_4, �������_�����_5, �������_����� As Byte
  ' �������������
  rowOfWeekPeriod = 0
  '
  �������_�����_1 = InStr(In_CellWeekPeriod, ".")
  If �������_�����_1 <> 0 Then
    �������_�����_2 = InStr(Mid(In_CellWeekPeriod, �������_�����_1 + 1, Len(In_CellWeekPeriod) - �������_�����_1), ".")
    �������_�����_3 = InStr(Mid(In_CellWeekPeriod, �������_�����_2 + 1, Len(In_CellWeekPeriod) - �������_�����_2), ".")
    �������_�����_4 = InStr(Mid(In_CellWeekPeriod, �������_�����_3 + 1, Len(In_CellWeekPeriod) - �������_�����_3), ".")
    �������_�����_5 = InStr(Mid(In_CellWeekPeriod, �������_�����_4 + 1, Len(In_CellWeekPeriod) - �������_�����_4), ".")
    �������_����� = InStr(In_CellWeekPeriod, "-")
    ' ��������� ��������
    If (�������_�����_1 <> 0) And (�������_�����_2 <> 0) And (�������_�����_3 <> 0) And (�������_�����_4 <> 0) And (�������_�����_5 <> 0) And (�������_����� <> 0) Then
      ' ����� ����� ������
      rowOfWeekPeriod = CInt(Mid(In_CellWeekPeriod, 1, �������_�����_1 - 1))
    End If
  End If
  
End Function

' 50. ������� ������ ������ - ��������� �����, ���� ������ clear�ontents2
Sub clear�ontents(In_BookName, In_Sheet, In_StartRange, In_EndRange)
Dim rowCount, ColumnCount, startRow, endRow, startColumn, endColumn As Byte
  '
  startRow = Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange).Row
  endRow = Workbooks(In_BookName).Sheets(In_Sheet).Range(In_EndRange).Row
  startColumn = Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange).Column
  endColumn = Workbooks(In_BookName).Sheets(In_Sheet).Range(In_EndRange).Column
    
  ' ��������� ������� �� �������, ����� �� ������
  ColumnCount = startColumn
  Do While (ColumnCount <= endColumn)
    
    ' �� ������
    rowCount = startRow
    Do While (rowCount <= endRow)
      Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnCount).Value = ""
      Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnCount).HorizontalAlignment = xlLeft
      ' ������� �������
      Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnCount).Interior.Pattern = xlNone
      Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnCount).Interior.TintAndShade = 0
      Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, ColumnCount).Interior.PatternTintAndShade = 0
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    ' ��������� �������
    ColumnCount = ColumnCount + 1
  Loop
  
End Sub

' 51. ������� ������ ������ - ���������� �����
Sub clear�ontents2(In_BookName, In_Sheet, In_StartRange, In_EndRange)
  '
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Value = ""
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).HorizontalAlignment = xlLeft
  ' ������� �������
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Interior.Pattern = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Interior.TintAndShade = 0
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Interior.PatternTintAndShade = 0
  ' ������� ����� �� �������
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlDiagonalDown).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlEdgeLeft).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlEdgeTop).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(In_StartRange + ":" + In_EndRange).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub

' 51.2 ������� ������ ������ - ���������� �����
Sub clear�ontents3(In_BookName, In_Sheet, In_StartRow, In_StartColumn, In_EndRow, In_EndColumn)
' Dim In_StartRange, In_EndRange As Range
  '
  ' In_StartRange = Workbooks(In_BookName).Cells(In_StartRow, In_StartColumn).Range
  ' In_EndRange = Workbooks(In_BookName).Cells(In_EndRow, In_EndColumn).Range
  '
  Workbooks(In_BookName).Sheets(In_Sheet).Range(Cells(In_StartRow, In_StartColumn), Cells(In_EndRow, In_EndColumn)).Value = ""
  ' Workbooks(In_BookName).Sheets(In_Sheet).Range(Cells(In_StartRow, In_StartColumn), Cells(In_EndRow, In_EndColumn)).HorizontalAlignment = xlLeft
  ' ������� �������
  Workbooks(In_BookName).Sheets(In_Sheet).Range(Cells(In_StartRow, In_StartColumn), Cells(In_EndRow, In_EndColumn)).Interior.Pattern = xlNone
  Workbooks(In_BookName).Sheets(In_Sheet).Range(Cells(In_StartRow, In_StartColumn), Cells(In_EndRow, In_EndColumn)).Interior.TintAndShade = 0
  Workbooks(In_BookName).Sheets(In_Sheet).Range(Cells(In_StartRow, In_StartColumn), Cells(In_EndRow, In_EndColumn)).Interior.PatternTintAndShade = 0
End Sub


' 52. ������� ������ ������:
Sub setColorCells(In_BookName, In_Sheet, In_RowStart, In_ColumnStart, In_RowEnd, In_ColumnEnd)
Dim RangeStart, RangeEnd As String
  ' ����������� ���������
  RangeStart = ConvertToLetter(In_ColumnStart) + CStr(In_RowStart)
  RangeEnd = ConvertToLetter(In_ColumnEnd) + CStr(In_RowEnd)
  ' ������� ���������
  Workbooks(In_BookName).Sheets(In_Sheet).Range(RangeStart + ":" + RangeEnd).Interior.Pattern = xlSolid
  Workbooks(In_BookName).Sheets(In_Sheet).Range(RangeStart + ":" + RangeEnd).Interior.PatternColorIndex = xlAutomatic
  Workbooks(In_BookName).Sheets(In_Sheet).Range(RangeStart + ":" + RangeEnd).Interior.ThemeColor = xlThemeColorAccent5
  Workbooks(In_BookName).Sheets(In_Sheet).Range(RangeStart + ":" + RangeEnd).Interior.TintAndShade = 0.599963377788629
  Workbooks(In_BookName).Sheets(In_Sheet).Range(RangeStart + ":" + RangeEnd).Interior.PatternTintAndShade = 0
End Sub

' 53. ���� (����� � ���������� ������� 3)
Function �����������(In_����, In_����, In_Dec) As Double
  If In_���� > 0 Then
    ����������� = Round((In_���� / In_����), In_Dec)
  Else
    ����������� = 0
  End If
End Function

' 54. ������ ���������
Function cellsNumberFormat(In_Value) As String
Dim ValueVar As Double
  cellsNumberFormat = "0.0%"
  
  ' �������� �� 100 � �����������
  ValueVar = In_Value * 100

  ' ���� 0%
  If In_Value = 0 Then
    cellsNumberFormat = "0%"
  End If
  
  ' ���� ����� 5,0, ���� 1,1-1,0, ��
  If ((ValueVar) - Int(ValueVar)) = 0 Then
    cellsNumberFormat = "0%"
  End If
  
End Function

' 55. ��������� ������� ��� ������������ ������ �� �������
Sub setPriodReport(In_Sheet, In_Date)
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
  ' ���� ��� ������ (����3) ��� ���������������� (����10)
  If (In_Sheet = "����3") Or (In_Sheet = "����10") Then
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    ' ��������� ���� � ___ �� ____
    ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value = YearStartDate(In_Date)
    ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 3).Value = In_Date - 1
  End If
  
  ' ���� ��� �����
  If In_Sheet = "����5" Then
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    ' ��������� ���� � ___ �� ____
    ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value = YearStartDate(In_Date)
    ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 3).Value = In_Date
  End If
  
End Sub

' 56. ����������� ���� ������ ���� �� ������� ����
Function YearStartDate(In_Date) As Date
Dim ��� As Integer
  ' ���
  ��� = Year(In_Date)
  YearStartDate = CDate("01.01." + CStr(���))
End Function

' 58. "������ ��" �� �����
' ������: 01.01.2020  ��  06.07.2020 periodFromSheet -> ���������� 06.07.2020
Function periodFromSheet(In_Sheet) As Date
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    periodFromSheet = CDate(ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 3).Value)
    
End Function

' ������: 01.01.2020  ��  06.07.2020  -> periodFromSheet2("����3", 1) ���������� 01.01.2020. periodFromSheet2("����3", 2) ���������� 06.07.2020
Function periodFromSheet2(In_Sheet, In_Period) As Date
Dim Range_str As String
Dim Range_Row, Range_Column, �������� As Byte
    
  ' ��������:
  �������� = 3
  
  Select Case Weekday(In_Date, vbMonday)
    Case 1
      �������� = 1
    Case 2
      �������� = 3
  End Select

    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    periodFromSheet2 = CDate(ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + ��������).Value)
    
End Function


' 59. "������" �� �����
Function hashTagFromSheet(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    hashTagFromSheet = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
      
End Function

' 59.1 "������2" �� �����
Function hashTagFromSheetII(In_Sheet, In_Number) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������" + CStr(In_Number) + ":", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    hashTagFromSheetII = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
      
End Function


' 60. ����: �� �����
Function subjectFromSheet(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "����:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "����:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    subjectFromSheet = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
      
End Function

' 60.1 ����2: �� �����
Function subjectFromSheetII(In_Sheet, In_Number) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "����:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "����" + CStr(In_Number) + ":", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    subjectFromSheetII = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
      
End Function


' 61. ���� ������ �� ����� �����, ��������: ���������� ����_���� 15.03.2020. ��������� - ��� String, ����� ������������ ���� ���� ��� � �����!
Function getDateReportFromFileName(In_ReportName_String) As String
Dim ���_����� As Byte
  
  ' �������������
  getDateReportFromFileName = ""
  
  ' ������� ������� ������ �����
  ���_����� = InStr(In_ReportName_String, ".")
  
  getDateReportFromFileName = Mid(In_ReportName_String, ���_����� - 2, 10)
  
End Function

' 62. ���� ������ ������ dateBeginMonth (��� ������� ������ �� monthStartDate, ��� ��� ����� ��� �������������� ��� ���������� dateBeginMonth (�� ����3))
Function monthStartDate(In_Date) As Date
    ' ���� ������ ������
    monthStartDate = CDate("01." + Mid(CStr(In_Date), 4, 7))
End Function

' 63. ��������� ���� �� ������: "����� �������� �� 20.03.2020 �� 20.03.2020 (16.30)" ��� "����� �������� �� 23.03.2020 �� 20-22.03.2020 (������ ����)"
Function getDate_�����_����_����_��_���������_���_���(In_StringWithDate) As Date
Dim �������_������ As Byte
  �������_������ = InStr(In_StringWithDate, "(")
  getDate_�����_����_����_��_���������_���_��� = CDate(Mid(In_StringWithDate, �������_������ - 11, 10))
End Function

' 64. "������2" �� �����
Function hashTagFromSheet2(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    ' ������� ������ "������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������2:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    hashTagFromSheet2 = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
End Function

' 65. ����2: �� �����
Function subjectFromSheet2(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "����:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "����2:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    subjectFromSheet2 = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 1).Value
      
End Function

' 66. ������ �����������: �� �����
Function recipientList(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "������ �����������:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������ �����������:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    recipientList = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 2).Value
      
End Function

' 66.2 ������ �����������2: �� �����
Function recipientList2(In_Sheet) As String
Dim Range_str As String
Dim Range_Row, Range_Column As Byte
    
    ' ������� ������ "������ �����������2:"
    Range_str = RangeByValue(ThisWorkbook.Name, In_Sheet, "������ �����������2:", 100, 100)
    Range_Row = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Row
    Range_Column = Workbooks(ThisWorkbook.Name).Sheets(In_Sheet).Range(Range_str).Column
    '
    recipientList2 = ThisWorkbook.Sheets(In_Sheet).Cells(Range_Row, Range_Column + 2).Value
      
End Function

' 67. ����� �� ������������ �����
' Function cityOfficeName(In_Office2_Name As String) As String
Function cityOfficeName(In_Office2_Name) As String

  cityOfficeName = In_Office2_Name
  ' ������
  If InStr(In_Office2_Name, "���������") <> 0 Then
    cityOfficeName = "������"
  End If
  ' ������
  If InStr(In_Office2_Name, "����������") <> 0 Then
    cityOfficeName = "������"
  End If
  ' �������������
  If InStr(In_Office2_Name, "���������������") <> 0 Then
    cityOfficeName = "�-��������"
  End If
  ' ����� �������
  If InStr(In_Office2_Name, "���������������") <> 0 Then
    cityOfficeName = "�-�������"
  End If
  ' �����-����
  If InStr(In_Office2_Name, "�����-����") <> 0 Then
    cityOfficeName = "�����-����"
  End If
End Function

' 67.2 ����� �� ������������ �����
Function cityOfficeNameByNumber(In_NumberOffice) As String

          Select Case In_NumberOffice
          Case 1 ' �� ����������
            cityOfficeNameByNumber = "������"
          Case 2 ' �� �����������
            cityOfficeNameByNumber = "������"
          Case 3 ' �� ����������������
            cityOfficeNameByNumber = "�-��������"
          Case 4 ' �� ����������������
            cityOfficeNameByNumber = "�-�������"
          Case 5 ' �� ������-����
            cityOfficeNameByNumber = "�����-����"
        End Select


End Function


' 68. ���� ������ �������� (��� �������� ������������� �� ��������)
Function quarterStartDate(In_Date) As Date

  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          quarterStartDate = CDate("01.01." + CStr(Year(In_Date)))
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          quarterStartDate = CDate("01.04." + CStr(Year(In_Date)))
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          quarterStartDate = CDate("01.07." + CStr(Year(In_Date)))
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          quarterStartDate = CDate("01.10." + CStr(Year(In_Date)))
      End Select
  
End Function

' 68.1 ���� ������ ������� ������ ��������
Function quarterSecondMonthStartDate(In_Date) As Date

  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          quarterSecondMonthStartDate = CDate("01.02." + CStr(Year(In_Date)))
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          quarterSecondMonthStartDate = CDate("01.05." + CStr(Year(In_Date)))
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          quarterSecondMonthStartDate = CDate("01.08." + CStr(Year(In_Date)))
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          quarterSecondMonthStartDate = CDate("01.11." + CStr(Year(In_Date)))
      End Select
  
End Function


' 69. ������������ �������� (�� ����)
Function quarterName(In_Date) As String

  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          quarterName = "1 ��. " + CStr(Year(In_Date)) + " �."
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          quarterName = "2 ��. " + CStr(Year(In_Date)) + " �."
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          quarterName = "3 ��. " + CStr(Year(In_Date)) + " �."
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          quarterName = "4 ��. " + CStr(Year(In_Date)) + " �."
      End Select
  
End Function

' 69.1 ������������ �������� (�� ����)
Function quarterName2(In_Date) As String

  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          quarterName2 = "1Q " + CStr(Year(In_Date)) + " �."
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          quarterName2 = "2Q " + CStr(Year(In_Date)) + " �."
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          quarterName2 = "3Q " + CStr(Year(In_Date)) + " �."
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          quarterName2 = "4Q " + CStr(Year(In_Date)) + " �."
      End Select
  
End Function

' 69.2 ������������ �������� (�� ����)
Function quarterName3(In_Date) As String

  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          quarterName3 = "1Q " + CStr(Year(In_Date))
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          quarterName3 = "2Q " + CStr(Year(In_Date))
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          quarterName3 = "3Q " + CStr(Year(In_Date))
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          quarterName3 = "4Q " + CStr(Year(In_Date))
      End Select
  
End Function


' 69.3 ��������� ������� + ��� "1Q20" �� ����
Function strNQYY(In_Date) As String
  
  ' �����
  Select Case Month(In_Date)
        ' 1 ��. - 01.01.YYYY
        Case 1, 2, 3
          strNQYY = "1Q" + Mid(CStr(Year(In_Date)), 3, 2)
        ' 2 ��. - 01.04.YYYY
        Case 4, 5, 6
          strNQYY = "2Q" + Mid(CStr(Year(In_Date)), 3, 2)
        ' 3 ��. - 01.07.YYYY
        Case 7, 8, 9
          strNQYY = "3Q" + Mid(CStr(Year(In_Date)), 3, 2)
        ' 4 ��. - 01.10.YYYY
        Case 10, 11, 12
          strNQYY = "4Q" + Mid(CStr(Year(In_Date)), 3, 2)
      End Select
  
  
End Function


' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
Sub Full_Color_RangeII(In_list, In_Row, In_Column, In_Value, In_Target)
  
  ' In_Value = In_Value * 100
  
  In_Value_tmp = (In_Value / In_Target) * 100
  
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = xlNone
  ' ���� ������ - ������
  ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Font.Color = vbBlack
  ' �� 100% � ���� - �������
  If (In_Value_tmp >= 100) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbGreen
  End If
  ' �� 90%-100% - ������
  If (In_Value_tmp >= 90) And (In_Value_tmp < 100) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbYellow
  End If
  ' �� 0% - 90% - �������
  If (In_Value_tmp < 90) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbRed
  End If
  
End Sub

' 70.1 ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %. In_Yelow - ������� ������ ����: 85% ��� 90%, �������� ����������: 85 ��� 90
Sub Full_Color_RangeIII(In_list, In_Row, In_Column, In_Value, In_Target, In_Yelow)
  
  ' In_Value = In_Value * 100
  
  In_Value_tmp = (In_Value / In_Target) * 100
  
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = xlNone
  ' ���� ������ - ������
  ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Font.Color = vbBlack
  
  ' �� 100% � ���� - �������
  If (In_Value_tmp >= 100) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbGreen
  End If
  
  ' �� In_Yelow%-100% - ������
  If (In_Value_tmp >= In_Yelow) And (In_Value_tmp < 100) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbYellow
  End If
  ' �� 0% - In_Yelow% - �������
  If (In_Value_tmp < In_Yelow) Then
    ThisWorkbook.Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbRed
  End If
  
End Sub

' 70.2 ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %. In_Yelow - ������� ������ ����: 85% ��� 90%, �������� ����������: 85 ��� 90
Sub Full_Color_RangeIV(In_Book, In_list, In_Row, In_Column, In_Value, In_Target, In_Yelow)
  
  ' In_Value = In_Value * 100
  
  ' ���� �� ���� (����� ��������� ������ ��� ������� �� ����)
  If In_Target <> 0 Then
  
    In_Value_tmp = (In_Value / In_Target) * 100
  
    ' ���� �� ����� ������ ���� ������� - ���������� ����
    Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = xlNone
    ' ���� ������ - ������
    Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Font.Color = vbBlack
  
    ' �� 100% � ���� - �������
    If (In_Value_tmp >= 100) Then
      Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbGreen
    End If
  
    ' �� In_Yelow%-100% - ������
    If (In_Value_tmp >= In_Yelow) And (In_Value_tmp < 100) Then
      Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbYellow
    End If
    
    ' �� 0% - In_Yelow% - �������
    If (In_Value_tmp < In_Yelow) Then
      Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbRed
    End If
  
  End If ' ���� �� ���� (����� ��������� ������)
  
End Sub

' 70.3 ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
Sub Full_Color_RangeV(In_Book, In_list, In_Row, In_Column, In_Value, In_Target)
  
  ' In_Value = In_Value * 100
  
  In_Value_tmp = (In_Value / In_Target) * 100
  
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = xlNone
  ' ���� ������ - ������
  Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Font.Color = vbBlack
  ' �� 100% � ���� - �������
  If (In_Value_tmp >= 100) Then
    Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbGreen
  End If
  ' �� 90%-100% - ������
  If (In_Value_tmp >= 90) And (In_Value_tmp < 100) Then
    Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbYellow
  End If
  ' �� 0% - 90% - �������
  If (In_Value_tmp < 90) Then
    Workbooks(In_Book).Sheets(In_list).Cells(In_Row, In_Column).Interior.Color = vbRed
  End If
  
End Sub


' 71. ��������� ����� ���� �� ����� �� ����� "����": ����� (1-12), ���� (1-5)
Sub setResultValue(In_Month, In_Office, In_Value)
  
  ' ������ � ������
  row_N = In_Office + 5
  
  ' ����� - � ������ ������ ���������� 3
  ' column_n = (2 * In_Month) + 2
  Select Case In_Month
      Case 1
        column_n = 4
      Case 2
        column_n = 6
      Case 3
        column_n = 8
      Case 4
        column_n = 12
      Case 5
        column_n = 14
      Case 6
        column_n = 16
      Case 7
        column_n = 20
      Case 8
        column_n = 22
      Case 9
        column_n = 24
      Case 10
        column_n = 28
      Case 11
        column_n = 30
      Case 12
        column_n = 32
  End Select
  
  ' ������� ��������
  ThisWorkbook.Sheets("����").Cells(row_N, column_n).Value = In_Value
    
End Sub

' 72. ��������� ���������� �� ����������� ����������� �� ������� BASE\ActiveStaff getInfoFromActiveStaff
Function getInfoFromActiveStaff(In_TabNumber) As String
Dim rowCount As Integer

  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks("ActiveStaff").Sheets("����1").AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks("ActiveStaff").Sheets("����1").Cells(1, 1).AutoFilter
  End If

  ' �������������� ����������
  getInfoFromActiveStaff = ""
  
  ' ��������� ������� ������
  Set searchResults = Workbooks("ActiveStaff").Sheets("����1").Columns("A:A").Find(In_TabNumber, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    
    ' ���� �� ������� - ���������. �� ��������!
    ' MsgBox (Workbooks("ActiveStaff").Sheets("����1").CountA(Columns(1))) - ����� ����� ����� ����������� ������� ����� CountA
    
  Else
    
    ' ���� �������:
    ' ���� ����������
    If Workbooks("ActiveStaff").Sheets("����1").Cells(searchResults.Row, 5).Value <> "" Then
      getInfoFromActiveStaff = "������ " + CStr(Workbooks("ActiveStaff").Sheets("����1").Cells(searchResults.Row, 5).Value) + " �."
    End If
     
  End If
  
  
End Function

' 73. ������������� "MMYY" � ����� ������ (Int)
Function decodeMMYY(In_MMYY) As Byte
  decodeMMYY = CInt(Mid(In_MMYY, 1, 2))
End Function

' 74. "MMYY" � ����� ������ � ������ 2020
Function decodeMMYY2(In_MMYY) As String
  decodeMMYY2 = ���������(CDate("01." + Mid(In_MMYY, 1, 2) + ".2020")) + " 20" + Mid(In_MMYY, 3, 2)
End Function

' 75. ������ �� ������ ������ (����� �� �������� http://www.excelworld.ru/forum/10-4692-1)
' �������� - ������ ������, ���� � ������� ������ ������ ���
Function ClipboardText()
    With GetObject("New:{1C3B4210-F441-11CE-B9EA-00AA006B1A69}")
        .GetFromClipboard
        ClipboardText = .GetText
    End With
End Function

' 76. ������ � ����� ������ (����� �� �������� http://www.excelworld.ru/forum/10-4692-1)
Sub SetClipboardText(ByVal txt$)
    With GetObject("New:{1C3B4210-F441-11CE-B9EA-00AA006B1A69}")
        .SetText txt$
        .PutInClipboard
    End With
End Sub

' 77. ��������� ����� ����� �� DB
Function FindNameSheet(In_Workbooks, In_StringInSheet) As String
Dim i As Integer

  FindNameSheet = ""
    
  For i = 1 To Workbooks(In_Workbooks).Sheets.Count
       
    ' � Dashboard_new_��_09.09.2021 "�������� ������ ������ ��� ������ �� ������������������� ���" �� ����� � �������� 5
    If i <> 5 Then
    
      t = Workbooks(In_Workbooks).Sheets.Count
      t2 = Workbooks(In_Workbooks).Sheets(i).Visible
      t3 = InStr(Workbooks(In_Workbooks).Sheets(i).Name, In_StringInSheet)
      t4 = InStr(Workbooks(In_Workbooks).Sheets(i).Name, ".")
      t5 = Workbooks(In_Workbooks).Sheets(i).Name
    
      ' ���� � ����� ����� ��������� + ������� 06.11 ����� ".", ������ ��� ��� "���� ����� ������"
      If (InStr(Workbooks(In_Workbooks).Sheets(i).Name, In_StringInSheet) <> 0) And ((InStr(Workbooks(In_Workbooks).Sheets(i).Name, ".") <> 0)) Then
      
        ' ���������  - ������� �� ���� ����? � DB ����� ����� ������� ������ � ����������� ����������
        If Workbooks(In_Workbooks).Sheets(i).Visible = xlSheetVisible Then
          FindNameSheet = Workbooks(In_Workbooks).Sheets(i).Name
        End If
      
      End If
    
    End If
    
  Next
End Function

' 78. ���������� �� �������� ��� �������� <1
Function ����������������(In_Value) As Integer
  ' ������� ����������
  ���������������� = Round(In_Value, 0)
  ' ���� �������� <1, �� ��������� �� 1
  If (In_Value > 0) And (In_Value < 1) Then
    ���������������� = 1
  End If
  ' ���� �������� <0, �� ������ ������ 0
  If (In_Value <= 0) Then
    ���������������� = 0
  End If
End Function

' 79. ������� ������ � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays)
Function �������_������(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
  
  ����_������_������ = Date_begin_day_month(In_Date)
  
  ����_�����_������ = Date_last_day_month(In_Date)
  
  �����_���������_���_���� = Working_days_between_dates(����_������_������, In_Date, 5)
  
  If In_NonWorkingDays = 1 Then
    �����_���_����_����� = Working_days_between_datesII(����_������_������, ����_�����_������, 5)
  Else
    �����_���_����_����� = Working_days_between_dates(����_������_������, ����_�����_������, 5)
  End If
  
  �������_������ = (In_Fact / �����_���������_���_����) * �����_���_����_�����

End Function

' 79.1 ������� �������� � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays)
Function �������_��������(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
  
  ����_������_�������� = quarterStartDate(In_Date)
  
  ����_�����_�������� = Date_last_day_quarter(In_Date)
  
  �����_���������_���_���� = Working_days_between_dates(����_������_��������, In_Date, 5)
  
  If In_NonWorkingDays = 1 Then
    �����_���_����_������� = Working_days_between_datesII(����_������_��������, ����_�����_��������, 5)
  Else
    �����_���_����_������� = Working_days_between_dates(����_������_��������, ����_�����_��������, 5)
  End If
  
  �������_�������� = (In_Fact / �����_���������_���_����) * �����_���_����_�������

End Function

' 79.2 ������� �������� � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays)
Function �������_��������_����(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
  
  ����_������_�������� = quarterStartDate(In_Date)
  
  ����_�����_�������� = Date_last_day_quarter(In_Date)
  
  �����_���������_���_���� = Working_days_between_dates(����_������_��������, In_Date, 5)
  
  If In_NonWorkingDays = 1 Then
    �����_���_����_������� = Working_days_between_datesII(����_������_��������, ����_�����_��������, 5)
  Else
    �����_���_����_������� = Working_days_between_dates(����_������_��������, ����_�����_��������, 5)
  End If
  
  �������_��������_����� = (In_Fact / �����_���������_���_����) * �����_���_����_�������
  
  �������_��������_���� = �����������(In_Plan, �������_��������_�����, 3)

End Function

' 79.2.1 ������� ������ � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays)
Function �������_������_����(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
  
  ����_������_������ = Date_begin_day_month(In_Date)
  
  ����_�����_������ = Date_last_day_month(In_Date)
  
  �����_���������_���_���� = Working_days_between_dates(����_������_������, In_Date, 5)
  
  If In_NonWorkingDays = 1 Then
    �����_���_����_����� = Working_days_between_datesII(����_������_������, ����_�����_������, 5)
  Else
    �����_���_����_����� = Working_days_between_dates(����_������_������, ����_�����_������, 5)
  End If
  
  �������_������_����� = (In_Fact / �����_���������_���_����) * �����_���_����_�����
  
  �������_������_���� = �����������(In_Plan, �������_������_�����, 3)

End Function


' 79.3 ���� �� ����, ����� ���������� �������� ��������
Function ����_��_����_���_��������_��������(In_Date, In_Plan, In_��������_��������_����, In_working_days_in_the_week, In_NonWorkingDays) As Double
  
  ����_������_�������� = quarterStartDate(In_Date)
  
  ����_�����_�������� = Date_last_day_quarter(In_Date)
  
  �����_���������_���_���� = Working_days_between_dates(����_������_��������, In_Date, 5)
  
  If In_NonWorkingDays = 1 Then
    �����_���_����_������� = Working_days_between_datesII(����_������_��������, ����_�����_��������, 5)
  Else
    �����_���_����_������� = Working_days_between_dates(����_������_��������, ����_�����_��������, 5)
  End If
  
  ' �������_��������_����� = (In_Fact / �����_���������_���_����) * �����_���_����_�������

  ����_��_����_���_��������_�������� = (In_��������_��������_���� * �����_���������_���_���� * In_Plan) / �����_���_����_�������

End Function


' 80. �������� ������ �� ���� �����
Sub setValueInBookSheet(In_Workbooks, In_Sheets, In_RowKey, In_Column, In_Value, In_maxRowInSheet, In_maxColumnInSheet)
  
End Sub

' ������� � �������� �� ������ �� ��������, � ����� ������� "/" ��� �������� � ���������
Sub goToURL()
  
  SheetsVar = ThisWorkbook.ActiveSheet.Name
  rowVar = rowByValue(ThisWorkbook.Name, SheetsVar, "������:", 100, 100)
  columnVar = ColumnByValue(ThisWorkbook.Name, SheetsVar, "������:", 100, 100) + 1
  
  ' ThisWorkbook.FollowHyperlink ("http://isrb.psbnk.msk.ru/inf/6601/6622/ejednevnii_otchet_po_prodajam/")
  ThisWorkbook.FollowHyperlink (ThisWorkbook.Sheets(SheetsVar).Cells(rowVar, columnVar).Value)
  
End Sub

' ������� � �������� �� ������ �� ��������, � ����� ������� "/" ��� �������� � ���������
Sub goToURL2()
  
  SheetsVar = ThisWorkbook.ActiveSheet.Name
  rowVar = rowByValue(ThisWorkbook.Name, SheetsVar, "������2:", 100, 100)
  columnVar = ColumnByValue(ThisWorkbook.Name, SheetsVar, "������2:", 100, 100) + 1
  
  ' ThisWorkbook.FollowHyperlink ("http://isrb.psbnk.msk.ru/inf/6601/6622/ejednevnii_otchet_po_prodajam/")
  ThisWorkbook.FollowHyperlink (ThisWorkbook.Sheets(SheetsVar).Cells(rowVar, columnVar).Value)
  
End Sub


' 81. ����������� � 6 �� 12 ����� � ����; � 12 �� 18 ����� � ����; � 18 �� 24 ����� � �����. Time() � ���������� ������� ��������� �����
Function ������_����_����_�����(In_Time, In_�_�) As String
  
  ������_����_����_����� = ""

  If (In_Time >= "00:00:00") And ((In_Time <= "12:00:00")) Then
    ������_����_����_����� = In_�_� + "����� ����"
  End If

  If (In_Time >= "12:00:01") And ((In_Time <= "18:00:00")) Then
    ������_����_����_����� = In_�_� + "����� ����"
  End If

  If (In_Time >= "18:00:01") And ((In_Time <= "23:59:59")) Then
    ������_����_����_����� = In_�_� + "����� �����"
  End If


End Function

' 82. ���� DB � ����7
Function dateDB_����_7() As Date
  
  dateDB_����_7 = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

End Function


' 83. ���� DB � ����8
Function dateDB_����_8() As Date
  
  dateDB_����_8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

End Function

' 84. ������� ���� ���� �� ����
Sub deleteFile(In_fileName)

  If Dir(In_fileName) <> "" Then
    ' ������� ������ ����� �� �����
    Kill In_fileName
  End If

End Sub

' 85. ���������� ����������� �������� � �������� ���
Function Product_Name_to_Product_Code(In_Product_Name) As String
  
  Product_Name_to_Product_Code = ""
  
  ' 20.06.2021 � BASE\Products ������� ������� � ������� ����� ���������� ��� �������� ProductName, ProductCode
  
  ' ��������� - ���� BASE\Products �� �������, �� ���������
  If BookIsOpen("Products") = True Then
    �����_����_������� = True
  Else
    �����_����_������� = False
    ' ��������� BASE\Products
    OpenBookInBase ("Products")
  End If
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks("Products").Sheets("����1").AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks("Products").Sheets("����1").Cells(1, 1).AutoFilter
  End If
  
  ' ��������� �����
  Set searchResults = Workbooks("Products").Sheets("����1").Columns("A:A").Find(In_Product_Name, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� �������
    Product_Name_to_Product_Code = ""
  Else
    ' ���� �������
    Product_Name_to_Product_Code = Workbooks("Products").Sheets("����1").Cells(searchResults.Row, 2).Value
  End If

  
  ' Select Case In_Product_Name
  '       Case "���������� ����� 18+"
  '         Product_Name_to_Product_Code = "��"
  '       Case "�������� �� 18+, ��._������� "
  '         Product_Name_to_Product_Code = "��������_��"
  '       Case "��������������� �������"
  '         Product_Name_to_Product_Code = "��"
  '       Case "��������� ����� (�����.)"
  '         Product_Name_to_Product_Code = "��"
  '       Case "������������ �����"
  '         Product_Name_to_Product_Code = "��"
  '       Case "�������"
  '         Product_Name_to_Product_Code = "�������"
  '       Case "Orange Premium Club"
  '         Product_Name_to_Product_Code = "OPC"
  '       Case "������"
  '         Product_Name_to_Product_Code = "���"
  '       Case "������ ������ ������"
  '         Product_Name_to_Product_Code = "���_��"
  '
  ' End Select
  
  ' ���� BASE\Products ���� ������� �� ������ ������ Product_Name_to_Product_Code, �� �� ��������� ��
  If �����_����_������� = False Then
    ' ��������� BASE\Products
    CloseBook ("Products")
  End If
  
  ' ���������
  If Product_Name_to_Product_Code = "" Then
    MsgBox ("� Product_Name_to_Product_Code �� ������ " + In_Product_Name + "!")
  End If

End Function

' ��������� ������� ��������� �� ��������
Function Product_Name_to_Unit(In_Product_Name) As String
  
  Product_Name_to_Unit = ""
  
  ' 20.06.2021 � BASE\Products ������� ������� � ������� ����� ���������� ��� �������� ProductName, ProductCode
  
  ' ��������� - ���� BASE\Products �� �������, �� ���������
  If BookIsOpen("Products") = True Then
    �����_����_������� = True
  Else
    �����_����_������� = False
    ' ��������� BASE\Products
    OpenBookInBase ("Products")
  End If
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks("Products").Sheets("����1").AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks("Products").Sheets("����1").Cells(1, 1).AutoFilter
  End If
  
  ' ��������� �����
  Set searchResults = Workbooks("Products").Sheets("����1").Columns("A:A").Find(In_Product_Name, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� �������
    Product_Name_to_Unit = ""
  Else
    ' ���� �������
    Product_Name_to_Unit = Workbooks("Products").Sheets("����1").Cells(searchResults.Row, 3).Value
  End If

  ' ���� BASE\Products ���� ������� �� ������ ������ Product_Name_to_Unit, �� �� ��������� ��
  If �����_����_������� = False Then
    ' ��������� BASE\Products
    CloseBook ("Products")
  End If
  
  ' ���������
  If Product_Name_to_Unit = "" Then
    MsgBox ("� Product_Name_to_Unit �� ������ " + In_Product_Name + "!")
  End If

End Function


' 85. ������������ �������� ��� � ����������� ��������
Function Product_Code_to_Product_Name(In_Product_Code) As String
  
  Product_Code_to_Product_Name = ""
  
  ' 20.06.2021 � BASE\Products ������� ������� � ������� ����� ���������� ��� �������� ProductName, ProductCode
  
  ' ��������� - ���� BASE\Products �� �������, �� ���������
  If BookIsOpen("Products") = True Then
    �����_����_������� = True
  Else
    �����_����_������� = False
    ' ��������� BASE\Products
    OpenBookInBase ("Products")
  End If
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks("Products").Sheets("����1").AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks("Products").Sheets("����1").Cells(1, 1).AutoFilter
  End If
  
  ' ��������� �����
  Set searchResults = Workbooks("Products").Sheets("����1").Columns("B:B").Find(In_Product_Code, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� �������
    Product_Code_to_Product_Name = ""
  Else
    ' ���� �������
    Product_Code_to_Product_Name = Workbooks("Products").Sheets("����1").Cells(searchResults.Row, 1).Value
  End If

  
  ' Select Case In_Product_Name
  '       Case "���������� ����� 18+"
  '         Product_Code_to_Product_Name = "��"
  '       Case "�������� �� 18+, ��._������� "
  '         Product_Code_to_Product_Name = "��������_��"
  '       Case "��������������� �������"
  '         Product_Code_to_Product_Name = "��"
  '       Case "��������� ����� (�����.)"
  '         Product_Code_to_Product_Name = "��"
  '       Case "������������ �����"
  '         Product_Code_to_Product_Name = "��"
  '       Case "�������"
  '         Product_Code_to_Product_Name = "�������"
  '       Case "Orange Premium Club"
  '         Product_Code_to_Product_Name = "OPC"
  '       Case "������"
  '         Product_Code_to_Product_Name = "���"
  '       Case "������ ������ ������"
  '         Product_Code_to_Product_Name = "���_��"
  '
  ' End Select
  
  ' ���� BASE\Products ���� ������� �� ������ ������ Product_Code_to_Product_Name, �� �� ��������� ��
  If �����_����_������� = False Then
    ' ��������� BASE\Products
    CloseBook ("Products")
  End If
  
  ' ���������
  If Product_Code_to_Product_Name = "" Then
    MsgBox ("� Product_Code_to_Product_Name �� ������ " + In_Product_Name + "!")
  End If

End Function


' 86. ������ ������� ������ ������
Sub ������_�������_������(In_Workbooks, In_Sheets, In_Row, In_Col)
    
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Interior.Pattern = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Interior.TintAndShade = 0
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Interior.PatternTintAndShade = 0

End Sub

' 87. ��������� �������� ������ �� ������� �������� BASE\"Workbook"
Function getDataFrom_BASE_Workbook(In_BookName, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_���������_���������_BookName)
    
  getDataFrom_BASE_Workbook = "not found"
  
  ' ���� In_���������_���������_BookName = 1 �� ����� ������� ������� getDataFrom_BASE_Workbook ��������� �������
  If In_���������_���������_BookName = 1 Then
    ' ��������� BASE\Sales
    OpenBookInBase (In_BookName)
  End If
  
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks(In_BookName).Sheets(In_Sheet).AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(1, 1).AutoFilter
  End If
  
  ' ��������� ����� �� �����
  ' ��������� ������� ������ In_FieldKeyName - In_FieldKeyValue
  ������_������� = ConvertToLetter(ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName))
  Set searchResults = Workbooks(In_BookName).Sheets(In_Sheet).Columns(������_������� + ":" + ������_�������).Find(In_FieldKeyValue, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� �������
    getDataFrom_BASE_Workbook = "not found"
  Else
    ' ���� �������, �� ������ ����� �������� ������
    rowCount = searchResults.Row
    column_In_FieldName1 = ColumnByValue(In_BookName, In_Sheet, In_FieldName1, 1, 500)
    getDataFrom_BASE_Workbook = Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_In_FieldName1).Value
  End If
  
  ' ���� In_���������_���������_BookName = 1 �� ����� ������� ������� getDataFrom_BASE_Workbook ��������� �������
  If In_���������_���������_BookName = 1 Then
    ' ��������� BASE\Sales
    CloseBook (In_BookName)
  End If
End Function

' 88. ��������� �������� ������ �� ������� �������� BASE\"Workbook" � ��������� ��������/��������. �������� In_���������_���������_BookName - �� ������������!
Function getDataFrom_BASE_Workbook2(In_BookName, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_���������_���������_BookName)
    
  getDataFrom_BASE_Workbook2 = "not found"
  
  ' ��������� - ���� BASE\... �� �������, �� ���������
  If BookIsOpen(In_BookName) = True Then
    �����_����_������� = True
  Else
    �����_����_������� = False
    ' ��������� BASE\Products
    OpenBookInBase (In_BookName)
  End If
    
  ' ������� ������, ����� ����� �� �� ���� �������
  If Workbooks(In_BookName).Sheets(In_Sheet).AutoFilterMode = True Then
    ' ��������� ����������
    Workbooks(In_BookName).Sheets(In_Sheet).Cells(1, 1).AutoFilter
  End If
    
  ' ��������� ����� �� �����
  ' ��������� ������� ������ In_FieldKeyName - In_FieldKeyValue
  ������_������� = ConvertToLetter(ColumnByName(In_BookName, In_Sheet, 1, In_FieldKeyName))
  Set searchResults = Workbooks(In_BookName).Sheets(In_Sheet).Columns(������_������� + ":" + ������_�������).Find(In_FieldKeyValue, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� �������
    getDataFrom_BASE_Workbook2 = "not found"
  Else
    ' ���� �������, �� ������ ����� �������� ������
    rowCount = searchResults.Row
    column_In_FieldName1 = ColumnByValue(In_BookName, In_Sheet, In_FieldName1, 1, 500)
    getDataFrom_BASE_Workbook2 = Workbooks(In_BookName).Sheets(In_Sheet).Cells(rowCount, column_In_FieldName1).Value
  End If
  
  
  
  ' ���� BASE\Products ���� ������� �� ������ ������ �������, �� �� ��������� ��
  If �����_����_������� = False Then
    ' ��������� BASE\Products
    CloseBook (In_BookName)
  End If
  
End Function


' 88. ��������� ����� �� ������� �� �������� �� ������� �������� BASE\"Sales_Office". ���� ����� ��� � Date_DD, �� ���������� 0!
Function ����_Q_��_����(In_OfficeNumber, In_Product_Code, In_Date) As Double

  �����_���� = Month(In_Date)
  ���_���� = Year(In_Date)
  
  ' ������������� ID_Rec ��� In_Date:
  ID_RecVar = CStr(CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code)

  ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
  Column_Date_DD = "Date_" + Mid(In_Date, 1, 2)
  
  ' ���������� ��������� � ���������� ��� ��������
  result_�����_getDataFrom_BASE_Workbook2 = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, Column_Date_DD, 0)
  
  ' ���� ��������� �� ������ - ���������, ����� ����������� ����� ������� � �� ���� �� ���������� "not found", � �������� Empty. ���� 12.08.2021 ��� ���������� �������� ��� �� DB �� 10.08.2021
  If result_�����_getDataFrom_BASE_Workbook2 <> "" Then
  
    ' ��������� ��������� ������ ������ � BASE\Sales_Office �� ������
    If result_�����_getDataFrom_BASE_Workbook2 <> "not found" Then

      ' ����� ���� �� Date_��
      ' ����_Q_��_���� = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, Column_Date_DD, 0)
      ����_Q_��_���� = result_�����_getDataFrom_BASE_Workbook2

      ' ���� ���������� ���� �� ���� <>0
      ' If ����_Q_��_���� <> 0 Then

        ' ���� ����� ���������:
        ' - 1-�� ������ Q
        ' If (�����_���� = 1) Or (�����_���� = 4) Or (�����_���� = 7) Then
          ' ����� ���� �� Date_��
          ' ����_Q_��_���� = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, Column_Date_DD, 0)
        ' End If
  
        ' ���� In_Datr ��������� � 2-�� ������ Q
        If (�����_���� = 2) Or (�����_���� = 5) Or (�����_���� = 8) Or (�����_���� = 11) Then
          ' ����� ���� �� Date_��
          '
          ' ������������� ID_Rec ��� 1 ������ Q:
          ID_RecVar = CStr(CStr(In_OfficeNumber) + "-" + strMMYY(Date_begin_day_quarter(In_Date)) + "-" + In_Product_Code)
          
          ' ���������� ���� 1 ������
          result_getDataFrom_BASE_Workbook2_Fact = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          If result_getDataFrom_BASE_Workbook2_Fact <> "not found" Then
            ����_Q_��_���� = ����_Q_��_���� + result_getDataFrom_BASE_Workbook2_Fact ' getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          End If
          
        End If
  
        ' ���� In_Datr ��������� � 3-�� ������ Q
        If (�����_���� = 3) Or (�����_���� = 6) Or (�����_���� = 9) Or (�����_���� = 12) Then
    
          ' ����� ���� �� Date_��
          '
          ' ������������� ID_Rec ��� 1 ������ Q:
          ID_RecVar = CStr(CStr(In_OfficeNumber) + "-" + strMMYY(Date_begin_day_quarter(In_Date)) + "-" + In_Product_Code)
          ' ���������� ���� 1 ������
          resilt_getDataFrom_BASE_Workbook2_Fact = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          If resilt_getDataFrom_BASE_Workbook2_Fact <> "not found" Then
            ����_Q_��_���� = ����_Q_��_���� + resilt_getDataFrom_BASE_Workbook2_Fact ' getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          End If
    
          ' ������������� ID_Rec ��� 2 ������ Q:
          ID_RecVar = CStr(CStr(In_OfficeNumber) + "-" + strMMYY(CDate("01." + CStr(�����_���� - 1) + "." + CStr(���_����))) + "-" + In_Product_Code)
          ' ���������� ���� 2 ������
          result_getDataFrom_BASE_Workbook2_Fact = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          If result_getDataFrom_BASE_Workbook2_Fact <> "not found" Then
            ����_Q_��_���� = ����_Q_��_���� + result_getDataFrom_BASE_Workbook2_Fact ' getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 0)
          End If
          
        End If
  
      ' End If ' ���� ���������� ���� �� ���� <>0

    Else
      ����_Q_��_���� = 0
    End If ' ��������� ��������� �� ����������� ��������� �� ������� ������
 
    ' ��������� ��������� ��������
    If result_�����_getDataFrom_BASE_Workbook2 = "not found" Then
      
      '  ������������� ID_Rec ��� ����������� ������:
      ID_RecVar = CStr(CStr(In_OfficeNumber) + "-" + strNQYY(In_Date) + "-" + In_Product_Code)
                        
      ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
      ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
      M_num = Nom_mes_quarter_str(In_Date)
      Column_DateN_DD = "Date" + M_num + "_" + Mid(In_Date, 1, 2)
      
      result_getDataFrom_BASE_Workbook2_Column_DateN_DD = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, Column_DateN_DD, 0)
      If result_getDataFrom_BASE_Workbook2_Column_DateN_DD <> "not found" Then
        ����_Q_��_���� = result_getDataFrom_BASE_Workbook2_Column_DateN_DD ' getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, Column_DateN_DD, 0)
      End If
    End If

  Else
    ����_Q_��_���� = 0
  End If ' ���� ��������� �� ������ - ���������, ����� ����������� ����� ������� � �� ���� �� ���������� "not found", � �������� Empty. ���� 12.08.2021 ��� ���������� �������� ��� �� DB �� 10.08.2021
  


End Function

' 89. ������_�����������_��_����(Date)
Function ������_�����������_��_����(In_Date) As Date
  
  ' ����� ������� ����
  �������_���� = In_Date + 1
  
  ' ���������� ��������
  �����������_������ = False
  
  Do While �����������_������ = False
    
    ' ��������� ���� ������
    If Weekday(�������_����, vbMonday) = 1 Then
      ������_�����������_��_���� = �������_����
      �����������_������ = True
    Else
      ' ����� ����� ��������� ����
      �������_���� = �������_���� + 1
    End If
    
  Loop
  
End Function

' 90. �������
Function �������() As String
  ������� = Chr(34)
End Function

' 91. ������� ����� � ������
Sub �������_�����(In_Workbooks, In_Sheets, In_Row, In_Col)
  
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Font.Bold = False
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalDown).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalUp).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeLeft).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeTop).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeBottom).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeRight).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideVertical).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub


' 92. ���������� ����� � ������
Sub ����������_�����(In_Workbooks, In_Sheets, In_Row, In_Col)

  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Font.Bold = True
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalDown).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalUp).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeLeft).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeTop).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeBottom).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeRight).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideVertical).LineStyle = xlNone
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideHorizontal).LineStyle = xlNone
  

End Sub

' 93. ������ ����� � ������
Sub ������_�����(In_Workbooks, In_Sheets, In_Row, In_Col)
  
    
  
End Sub


' 94. ������ �����
Sub ������_�����(In_Workbooks, In_Sheets, In_Row, In_Col)
  
  ' Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Font.Bold = False
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalDown).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeLeft).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeTop).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub

' 95. ���� ������ �� �������� �� ���� "Fact", �� In_Date ���������� ������ ����� ������ � ���
Function ����_�(In_Date, In_OfficeNumber, In_Product_Code) As Double
  
  ����_� = 0
    
  ' ���������� ID_Rec
  If In_Product_Code <> "��" Then
    ' ������������� ID_Rec � ������� 5-0119-��
    ID_RecVar = CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code
  Else
    ' ��� 3, 6, 9, 12 �������
    If (Month(In_Date) = 3) Or (Month(In_Date) = 6) Or (Month(In_Date) = 9) Or (Month(In_Date) = 12) Then
      ' ������������� ID_Rec � ������� 1-1Q19-�� ��� Product_Code=��
      ID_RecVar = CStr(In_OfficeNumber) + "-" + strNQYY(In_Date) + "-" + In_Product_Code
    Else
      ' ��������� ��� ��� ������, ��������� ����� 0
      ' ������������� ID_Rec � ������� 5-0119-��
      ID_RecVar = CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code
    End If
  End If
  
  ' ��������� �����
  result_getDataFrom_BASE_Workbook2 = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Fact", 1)
  
  ' ����������� ��������� ������
  If result_getDataFrom_BASE_Workbook2 <> "not found" Then
    ����_� = result_getDataFrom_BASE_Workbook2
  Else
    ����_� = 0
  End If
  
End Function

' 96. ���� ������ �� �������� �� ���� "Plan", �� In_Date ���������� ������ ����� ������ � ���
Function ����_�(In_Date, In_OfficeNumber, In_Product_Code) As Double
  
  ����_� = 0
  
  ' ������������� ID_Rec � ������� 5-0119-��
  ' ID_RecVar = CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code
  
  ' ���������� ID_Rec
  If In_Product_Code <> "��" Then
    ' ������������� ID_Rec � ������� 5-0119-��
    ID_RecVar = CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code
  Else
    ' ��� 3, 6, 9, 12 �������
    If (Month(In_Date) = 3) Or (Month(In_Date) = 6) Or (Month(In_Date) = 9) Or (Month(In_Date) = 12) Then
      ' ������������� ID_Rec � ������� 1-1Q19-�� ��� Product_Code=��
      ID_RecVar = CStr(In_OfficeNumber) + "-" + strNQYY(In_Date) + "-" + In_Product_Code
    Else
      ' ��������� ��� ��� ������, ��������� ����� 0
      ' ������������� ID_Rec � ������� 5-0119-��
      ID_RecVar = CStr(In_OfficeNumber) + "-" + strMMYY(In_Date) + "-" + In_Product_Code
    End If
  End If
  
  
  ' ��������� �����
  result_getDataFrom_BASE_Workbook2 = getDataFrom_BASE_Workbook2("Sales_Office", "����1", "ID_Rec", ID_RecVar, "Plan", 1)
  
  ' ����������� ��������� ������
  If result_getDataFrom_BASE_Workbook2 <> "not found" Then
    ����_� = result_getDataFrom_BASE_Workbook2
  Else
    ����_� = 0
  End If
  
End Function

' 97. �������� ������� ������
Function CheckData(In_Value) As Double

  ' ���������, ���� �� �����
  If (In_Value <> "") And (In_Value <> "not found") Then
    ' ��������� = ��.���������
    CheckData = In_Value
  Else
    ' ����� 0
    CheckData = 0
  End If
  
End Function

' 98. ��������� ������ �� ������ - �� ������ Function ����_Q_��_����(In_OfficeNumber, In_Product_Code, In_Date) As Double - ���� �� ������� �� �������� �� ������� �������� BASE\"Sales_Office". ���� ����� ��� � Date_DD, �� ���������� 0!
Function �������_Q_��_������(In_OfficeNumber, In_Product_Code, In_DateStart, In_DateEnd) As Double
  
  ����_Q_��_����_DateEnd = CheckData(����_Q_��_����(In_OfficeNumber, In_Product_Code, In_DateEnd))
  
  ����_Q_��_����_DateStart = CheckData(����_Q_��_����(In_OfficeNumber, In_Product_Code, In_DateStart))
  
  �������_Q_��_������ = ����_Q_��_����_DateEnd - ����_Q_��_����_DateStart
  
End Function

' 99. ���� �� "12.08.2021-19.08.2021"
Function ����1(In_DateStr) As Date
  
  ����1 = CDate(Mid(In_DateStr, 1, 10))
  
End Function

' 99. ���� �� "12.08.2021-19.08.2021"
Function ����2(In_DateStr) As Date
  
  ����2 = CDate(Mid(In_DateStr, 12, 10))
  
End Function

