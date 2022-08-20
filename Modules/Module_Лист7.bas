Attribute VB_Name = "Module_����7"
' ������������_�������_��_�����������
Sub ������������_�������_��_�����������()
  
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult, ID_RecVar As String
Dim i, rowCount, row_DP3_�����, column_TAB_OK, column_���, column_DP3_�����, column_DP4_�����, recIn����7, ����������_����� As Integer
Dim finishProcess As Boolean
Dim dateDB As Date
    
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
    ThisWorkbook.Sheets("����7").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "����������", 1, Date)
    If CheckFormatReportResult = "OK" Then
      
      ' ������������ ����� ������������ ���-� �� ������
      StringInSheet = "������������ ���-� �� ������"
      SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "4. ������������ ���-� �� ������"
      If SheetName_String <> "" Then
      
      ' ������� ������ ������
      Call clear�ontents2(ThisWorkbook.Name, "����7", "A9", "BK50")
      
      ' ���������
      ThisWorkbook.Sheets("����7").Cells(7, 6).Value = "�������1"
      ThisWorkbook.Sheets("����7").Cells(7, 11).Value = "�������2"
      ThisWorkbook.Sheets("����7").Cells(7, 16).Value = "�������3"
      ThisWorkbook.Sheets("����7").Cells(7, 21).Value = "�������4"
      ThisWorkbook.Sheets("����7").Cells(7, 26).Value = "�������5"
      ThisWorkbook.Sheets("����7").Cells(7, 31).Value = "�������6"
      ThisWorkbook.Sheets("����7").Cells(7, 36).Value = "�������7"
      ThisWorkbook.Sheets("����7").Cells(7, 41).Value = "�������8"
      ThisWorkbook.Sheets("����7").Cells(7, 46).Value = "�������9"
      ThisWorkbook.Sheets("����7").Cells(7, 51).Value = "�������10"
      ThisWorkbook.Sheets("����7").Cells(7, 56).Value = "�������11"

      ' ��������� BASE\Sales
      OpenBookInBase ("Sales")
            
      ' ��������� BASE\ActiveStaff
      OpenBookInBase ("ActiveStaff")


      ' �� ������� DB ����������:
      column_TAB_OK = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "TAB_OK", 100, 100) ' 1
      column_��� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���", 100, 100) ' 2
      row_DP3_����� = rowByValue(Workbooks(ReportName_String).Name, SheetName_String, "DP3_�����", 100, 100) ' 9
      column_DP3_����� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "DP3_�����", 100, 100) ' 4
      column_DP4_����� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "DP4_�����", 100, 100) ' 5
      
      recIn����7 = 8
      ����������_����� = 0
      
      ' ��������� ������ (�� A1 - ����� �� ��������� �� 07.07.2020)
      ThisWorkbook.Sheets("����7").Cells(5, 2).Value = "������������ ������� �� ����������� �� " + Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10) + " �."
      
     ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
      dateDB = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

      ' ��������: 10 ��.:
      
      ' 1. ������ ������������ � ���.���.
      column_������������_�������1 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "������ ������������", 100, 100) ' 7
      �������1_Product_Code = "��"
      �������1_Unit = "���. ���."
      
      ' ���� �� ������, �� ��������� "����_��, ��."
      If column_������������_�������1 = 0 Then
        column_������������_�������1 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "����_��, ��.", 100, 100) ' 7
        �������1_Product_Code = "��_��"
        �������1_Unit = "��."
      End If
      
      column_�������1_���� = column_������������_�������1 ' 7
      column_�������1_���� = column_������������_�������1 + 1 ' 8
      column_�������1_������� = column_������������_�������1 + 2 ' 9
      column_�������1_���_���� = column_������������_�������1 + 3 ' 10
      column_�������1_�������_���� = column_������������_�������1 + 4 ' 11
      
      ' 2. ��������� � ��
      column_������������_�������2 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "��������� � ��", 100, 100) ' 12
      column_�������2_���� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "����_��������� � ��, ���. ���. ", 100, 100) ' column_������������_�������2 ' 12
      column_�������2_���� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "����_��������� � ��, ���. ���. ", 100, 100) ' column_������������_�������2 + 1 ' 13
      column_�������2_������� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "�������_��������� � ��, ���. ���. ", 100, 100) ' column_������������_�������2 + 2 ' 14
      column_�������2_���_���� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "% ���_��������� � ��_����", 100, 100) ' column_������������_�������2 + 3 ' 15
      column_�������2_�������_���� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "% ���_��������� � ��_����", 100, 100) ' column_������������_�������2 + 4 ' 16

      ' 3. ��������� �����
      column_������������_�������3 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "��������� �����", 100, 100) ' 17
      column_�������3_���� = column_������������_�������3 ' 17
      column_�������3_���� = column_������������_�������3 + 1 ' 18
      column_�������3_������� = column_������������_�������3 + 2 ' 19
      column_�������3_���_���� = column_������������_�������3 + 3 ' 20
      column_�������3_�������_���� = column_������������_�������3 + 4 ' 21

      ' 4. ��������� �����
      column_������������_�������4 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "��������� �����", 100, 100)  ' 22
      column_�������4_���� = column_������������_�������4 ' 22
      column_�������4_���� = column_������������_�������4 + 1 ' 23
      column_�������4_������� = column_������������_�������4 + 2 '24
      column_�������4_���_���� = column_������������_�������4 + 3 ' 25
      column_�������4_�������_���� = column_������������_�������4 + 4 ' 26

      ' 5. �������� ����
      column_������������_�������5 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "�������� ����", 100, 100) ' 27
      column_�������5_���� = column_������������_�������5 ' 27
      column_�������5_���� = column_������������_�������5 + 1 ' 28
      column_�������5_������� = column_������������_�������5 + 2 ' 29
      column_�������5_���_���� = column_������������_�������5 + 3 ' 30
      column_�������5_�������_���� = column_������������_�������5 + 4 ' 31

      ' 6. �������� ��������, ���. ���. (����� - ������������� ����)
      column_������������_�������6 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "�������� ��������+���, ���. ���.", 100, 100) ' "�������� ��������, ���. ���.", 100, 100) ' ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "������������� ����", 10, 100) ' 32
      column_�������6_���� = column_������������_�������6 ' 32
      column_�������6_���� = column_������������_�������6 + 1 ' 33
      column_�������6_������� = 0 ' column_������������_�������6 + 2 ' 34
      column_�������6_���_���� = column_������������_�������6 + 2 ' column_������������_�������6 + 3 ' 35
      column_�������6_�������_���� = 0 ' column_������������_�������6 + 4 ' 36

      ' 7. ���_���� (������, ���.���.)
      column_������������_�������7 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���_���� (������, ���.���.)", 100, 100) ' 37
      column_�������7_���� = column_������������_�������7 ' 37
      column_�������7_���� = column_������������_�������7 + 1 ' 38
      column_�������7_������� = column_������������_�������7 + 2 ' 39
      column_�������7_���_���� = column_������������_�������7 + 3 ' 40
      column_�������7_�������_���� = column_������������_�������7 + 4 ' 41

      ' 8. ���_���� (������������ �����) ��� ���_���� (������, ���.���.)
      column_������������_�������8 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���_���� (������������ �����)", 100, 100) ' 42
      �������8_Product_Code = "���"
      �������8_Unit = "���. ���."
      If column_������������_�������8 = 0 Then
        column_������������_�������8 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���_���� (������, ���.���.)", 100, 100)
        �������8_Product_Code = "���_������"
        �������8_Unit = "���. ���."
      End If
      
      column_�������8_���� = column_������������_�������8 ' 42
      column_�������8_���� = column_������������_�������8 + 1 ' 43
      column_�������8_������� = column_������������_�������8 + 2 ' 44
      column_�������8_���_���� = column_������������_�������8 + 3 ' 45
      column_�������8_�������_���� = column_������������_�������8 + 4 ' 46

      ' 9. ���������� �����������
      column_������������_�������9 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���������� �����������", 100, 100) ' 47
      column_�������9_���� = column_������������_�������9 ' 47
      column_�������9_���� = column_������������_�������9 + 1 ' 48
      column_�������9_������� = column_������������_�������9 + 2 ' 49
      column_�������9_���_���� = column_������������_�������9 + 3 ' 50
      column_�������9_�������_���� = column_������������_�������9 + 4 ' 51

      ' 10. ���������� ����������� (��������� + ���� ������)
      column_������������_�������10 = 0 ' ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���������� ����������� (��������� + ���� ������)", 10, 100) ' 52
      column_�������10_���� = column_������������_�������10 ' 52
      column_�������10_���� = column_������������_�������10 + 1 ' 53
      column_�������10_������� = column_������������_�������10 + 2 ' 54
      column_�������10_���_���� = column_������������_�������10 + 3 ' 55
      column_�������10_�������_���� = column_������������_�������10 + 4 ' 56

      ' 11. ���������� �����������: "������ �������"+"�����24"
      t = "���������� �����������: " + �������() + "������ �������" + �������() + "+" + �������() + "�����24" + �������()
      column_������������_�������11 = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���������� �����������: " + �������() + "������ �������" + �������() + "+" + �������() + "�����24" + �������(), 100, 100)
      column_�������11_���� = column_������������_�������11
      column_�������11_���� = column_������������_�������11 + 1
      column_�������11_������� = column_������������_�������11 + 2
      column_�������11_���_���� = column_������������_�������11 + 3
      column_�������11_�������_���� = column_������������_�������11 + 4
      
      ' 12. ����� ������
      column_�����_������ = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���-�� ������ ����������", 100, 100)
      column_�����_������_���� = column_�����_������
      column_�����_������_���� = column_�����_������ + 1
      column_�����_������_������� = column_�����_������ + 2
      column_�����_������_���_���� = column_�����_������ + 3
      column_�����_������_�������_���� = column_�����_������ + 4
      
      
      ' ***                                            ***
      ' * ������� - ���������� ������� ������            *
      StringInSheet = " ������"
      SheetName_String_������ = FindNameSheet(ReportName_String, StringInSheet) ' "10. ������"
      If SheetName_String_������ <> "" Then

        ' ������������� ������ "�����"
        Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String_������, "�����")
      
        ' ������� "��������� ��1"
        row_���������_��1 = rowByValue(ReportName_String, SheetName_String_������, "��������� ��1", 300, 300) ' ���� 1000 1000
        row_������_���������_��1 = row_���������_��1
        column_���������_��1 = ColumnByValue(ReportName_String, SheetName_String_������, "��������� ��1", 300, 300)
        
        ' � 19.08.2021 ��� "��������� ��1"! ���������
        If row_���������_��1 <> 0 Then
          ' ��������� ������� �������
          Workbooks(ReportName_String).Sheets(SheetName_String_������).Cells(row_���������_��1, column_���������_��1 + 1).ShowDetail = True
        
          ' ������ ��������� ����1
        
          ' "����,���. ���." - ������� ���
          column_DB_����_���_��� = ColumnByValue(Workbooks(ReportName_String).Name, "����1", "����,���. ���.", 10, 100)
          ' "������, ��." - ����� �������� ���������� ������
          column_DB_������_�� = ColumnByValue(Workbooks(ReportName_String).Name, "����1", "������, ��.", 10, 100)
          ' "��������� �����" - ��������� ����� ����������
          column_DB_���������_����� = ColumnByValue(Workbooks(ReportName_String).Name, "����1", "��������� �����", 10, 100)
          ' "DP4_�����" - ����
          column_DB_DP4_����� = ColumnByValue(Workbooks(ReportName_String).Name, "����1", "DP4_�����", 10, 100)
        
        End If
        
      Else
        ' ���� � DB ���� �� ������ - ������� ���������
        MsgBox ("�� ������ ���� " + Chr(34) + StringInSheet + Chr(34)) ' + " � " + ReportName_String)
      End If
      
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����7").Activate
      
      ' *** �����: ������� - ���������� ������� ������ ***


      ' ������������ �������
      column_������������_������� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "������������ �������", 10, 100) ' 57
            
      ' ���-�� ���������
      column_���_��������� = ColumnByValue(Workbooks(ReportName_String).Name, SheetName_String, "���-�� ������ ����������", 10, 100) ' 58

      ' ������������ ����� ���� �� 5-�� ������
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

        rowCount = row_DP3_�����
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_DP3_�����).Value)
        
          ' ���� � ������� DP3_����� ���� ������� ����, �� ������� ����������
          If InStr(Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_DP4_�����).Value, officeNameInReport) <> 0 Then
          
            ' ����� ������ �� ����7 � ������
            recIn����7 = recIn����7 + 1
            ' ����� ����������
            ����������_����� = ����������_����� + 1
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 1).Value = CStr(����������_�����) + "."
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 1).NumberFormat = "@"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 1).HorizontalAlignment = xlCenter

            ' ����� ���������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_TAB_OK).Value
            ' ���
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 3).Value = �������_�_���(Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, 1)
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value = officeNameInReport
            
            ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
            curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)

            
            ' 1. ������ ������������ (��)
            ' -----------------
            ThisWorkbook.Sheets("����7").Cells(7, 6).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������1).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 5).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������1_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 5).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 5).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 6).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������1_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 6).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 6).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 7).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������1_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 7).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 7).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 8).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������1_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 8).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 8).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 9).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������1_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 9).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 9).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 9, ThisWorkbook.Sheets("����7").Cells(recIn����7, 9).Value, 1)
            
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' "Product_Code", "��" � "Unit", "���. ���."
            ' �������1_Product_Code = "��"
            ' �������1_Unit = "���. ���."

            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", �������1_Product_Code, _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 5).Value, _
                                                          "Unit", �������1_Unit, _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 6).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 7).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 8).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 9).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 6).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")


            
            
            
            ' 2. ��������� � �� (��)
            ' -----------------
            ThisWorkbook.Sheets("����7").Cells(7, 11).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������2).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 10).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 10).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 10).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 11).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 11).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 11).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 12).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 12).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 12).HorizontalAlignment = xlRight
            ' �������
            If column_�������2_������� <> 0 Then
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 13).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_�������).Value
            Else
              ' ������ ������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 13).Value = (ThisWorkbook.Sheets("����7").Cells(recIn����7, 10).Value / 100) * (Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_�������_����).Value * 100)
            End If
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 13).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 13).HorizontalAlignment = xlRight
            
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 14).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������2_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 14).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 14).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 14, ThisWorkbook.Sheets("����7").Cells(recIn����7, 14).Value, 1)

            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"

            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 10).Value, _
                                                          "Unit", "���. ���.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 11).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 12).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 13).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 14).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 11).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")


            ' 3. ��������� ����� (��)
            ' ------------------
            ThisWorkbook.Sheets("����7").Cells(7, 16).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������3).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 15).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������3_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 15).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 15).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 16).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������3_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 16).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 16).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 17).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������3_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 17).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 17).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 18).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������3_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 18).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 18).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 19).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������3_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 19).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 19).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 19, ThisWorkbook.Sheets("����7").Cells(recIn����7, 19).Value, 1)

            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 15).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 16).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 17).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 18).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 19).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 16).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")


            ' 4. ��������� ����� (��)
            ' ------------------
            ThisWorkbook.Sheets("����7").Cells(7, 21).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������4).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 20).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������4_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 20).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 20).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 21).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������4_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 21).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 21).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 22).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������4_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 22).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 22).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 23).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������4_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 23).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 23).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 24).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������4_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 24).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 24).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 24, ThisWorkbook.Sheets("����7").Cells(recIn����7, 24).Value, 1)

            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 20).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 21).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 22).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 23).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 24).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 21).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")


            ' 5. �������� ���� (��)
            ' ------------------
            ThisWorkbook.Sheets("����7").Cells(7, 26).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������5).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 25).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������5_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 25).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 25).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 26).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������5_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 26).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 26).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 27).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������5_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 27).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 27).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 28).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������5_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 28).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 28).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 29).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������5_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 29).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 29).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 29, ThisWorkbook.Sheets("����7").Cells(recIn����7, 29).Value, 1)

            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 25).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 26).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 27).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 28).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 29).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 26).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

            ' 6. �������� ��������, ���. ���. (����� ������������� ���� (��))
            ' ------------------
            If column_������������_�������6 <> 0 Then
            
            ThisWorkbook.Sheets("����7").Cells(7, 31).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������6).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 30).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������6_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 30).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 30).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 31).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������6_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 31).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 31).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������6_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).HorizontalAlignment = xlRight
            ' �������
            If column_�������6_������� <> 0 Then
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 33).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������6_�������).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 33).NumberFormat = "0"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 33).HorizontalAlignment = xlRight
            End If
            ' �������_����
            If column_�������6_�������_���� <> 0 Then
              ' ���������
              ThisWorkbook.Sheets("����7").Cells(8, 34).Value = "������� %"
              ' ��������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������6_�������_����).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).NumberFormat = "0%"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).HorizontalAlignment = xlRight
              ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
              Call Full_Color_RangeII("����7", recIn����7, 34, ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).Value, 1)
            Else
              ' ���������
              ThisWorkbook.Sheets("����7").Cells(8, 34).Value = "���. %"
              ' ��������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).Value = ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).NumberFormat = "0%"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).HorizontalAlignment = xlRight
              ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
              Call Full_Color_RangeII("����7", recIn����7, 34, ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).Value, 1)
              ' ������� � 32
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).Value = ""
              ThisWorkbook.Sheets("����7").Cells(8, 32).Value = ""
              ThisWorkbook.Sheets("����7").Cells(8, 33).Value = ""
            End If
    
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 30).Value, _
                                                          "Unit", "���.���.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 31).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 32).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 33).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 34).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 31).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
    
    
            End If ' ���� ������� �� ������
            
            ' 7. ���_���� (������, ���.���.)
            ' ------------------
            ThisWorkbook.Sheets("����7").Cells(7, 36).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������7).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 35).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������7_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 35).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 35).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 36).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������7_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 36).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 36).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 37).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������7_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 37).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 37).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 38).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������7_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 38).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 38).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 39).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������7_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 39).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 39).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 39, ThisWorkbook.Sheets("����7").Cells(recIn����7, 39).Value, 1)
    
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-���"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "���", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 35).Value, _
                                                          "Unit", "���. ���.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 36).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 37).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 38).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 39).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 36).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
    
            
            ' 8. ���_���� (������������ �����) ��� ���_���� (������, ���.���.)
            ' ------------------
            ThisWorkbook.Sheets("����7").Cells(7, 41).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������8).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 40).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������8_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 40).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 40).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 41).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������8_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 41).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 41).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 42).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������8_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 42).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 42).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 43).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������8_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 43).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 43).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 44).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������8_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 44).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 44).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 44, ThisWorkbook.Sheets("����7").Cells(recIn����7, 44).Value, 1)
            
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-���"
            
            ' �������8_Product_Code
            ' �������8_Unit
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", �������8_Product_Code, _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 40).Value, _
                                                          "Unit", �������8_Unit, _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 41).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 42).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 43).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 44).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 41).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
            
            
            ' 9. ���������� �����������
            ' -------------------------
            ThisWorkbook.Sheets("����7").Cells(7, 46).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������9).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 45).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������9_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 45).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 45).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 46).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������9_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 46).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 46).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 47).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������9_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 47).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 47).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 48).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������9_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 48).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 48).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 49).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������9_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 49).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 49).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 49, ThisWorkbook.Sheets("����7").Cells(recIn����7, 49).Value, 1)
            
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 45).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 46).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 47).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 48).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 49).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 46).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
            
            
            ' 10. ��� ' ���������� ����������� (��������� + ���� ������)
            ' -------------------------
            ' If column_������������_�������10 <> 0 Then
            If row_������_���������_��1 <> 0 Then
            
              ThisWorkbook.Sheets("����7").Cells(7, 51).Value = "���+��� �� (���. ���.)"
              ' ����
              ThisWorkbook.Sheets("����7").Cells(8, 50).Value = "" ' ' ���������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 50).Value = "" ' Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������10_����).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 50).NumberFormat = "0"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 50).HorizontalAlignment = xlRight
              
              ' ������� ��� ��������� ���-� � ���������� �� ����1 � DB �� ��=ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value
              �����_�������_���_����� = 0
              �����_�������_����_������_����� = 0
              
              rowCount_����1 = 2
              Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, column_DB_DP4_�����).Value)
              
                ' ���� ��� ��������� ����� ����������
                If Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, column_DB_���������_�����).Value = ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value Then
                  �����_�������_���_����� = �����_�������_���_����� + Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, column_DB_����_���_���).Value
                  �����_�������_����_������_����� = �����_�������_����_������_����� + Workbooks(ReportName_String).Sheets("����1").Cells(rowCount_����1, column_DB_������_��).Value
                End If
              
                ' ��������� ������
                rowCount_����1 = rowCount_����1 + 1
                Application.StatusBar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + " ������ ���..."
                DoEventsInterval (rowCount_����1)
          
              Loop

              
              ' ����
              ThisWorkbook.Sheets("����7").Cells(8, 51).Value = "" ' ' ���������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 51).Value = "" ' Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������10_����).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 51).NumberFormat = "0"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 51).HorizontalAlignment = xlRight
              ' ���_����
              ThisWorkbook.Sheets("����7").Cells(8, 52).Value = "" ' ' ���������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 52).Value = "" ' Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������10_���_����).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 52).NumberFormat = "0%"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 52).HorizontalAlignment = xlRight
              ' �������
              ThisWorkbook.Sheets("����7").Cells(8, 53).Value = "" ' ' ���������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 53).Value = "" ' Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������10_�������).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 53).NumberFormat = "0"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 53).HorizontalAlignment = xlRight
              ' ���� ' ex �������_����
              ThisWorkbook.Sheets("����7").Cells(8, 54).Value = "����" ' ' ���������
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 54).Value = �����_�������_���_����� ' Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������10_�������_����).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 54).NumberFormat = "#,##0" ' "0%"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 54).HorizontalAlignment = xlRight
              
              ' � ���������� ������� �����_�������_����_������_�����
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 63).Value = "���� " + ThisWorkbook.Sheets("����7").Cells(recIn����7, 62).Value + CStr(�����_�������_����_������_�����) + " ��."
              
              ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
              ' Call Full_Color_RangeII("����7", recIn����7, 54, ThisWorkbook.Sheets("����7").Cells(recIn����7, 54).Value, 1)
            
              '  ������������� ID_Rec:
              ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "���"
            
              ' ������ ������ � BASE\Sales �� ��.
              Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "���", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", "", _
                                                          "Unit", "���.���.", _
                                                            "Fact", �����_�������_���_�����, _
                                                              "Percent_Completion", "", _
                                                                "Prediction", "", _
                                                                  "Percent_Prediction", "", _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, �����_�������_���_�����, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
            End If
            
            
            ' 11. ���������� �����������: "������ �������"+"�����24"
            ThisWorkbook.Sheets("����7").Cells(7, 56).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells((row_DP3_����� - 2), column_������������_�������11).Value
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 55).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������11_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 55).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 55).HorizontalAlignment = xlRight
            ' ����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 56).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������11_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 56).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 56).HorizontalAlignment = xlRight
            ' ���_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 57).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������11_���_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 57).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 57).HorizontalAlignment = xlRight
            ' �������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 58).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������11_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 58).NumberFormat = "0"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 58).HorizontalAlignment = xlRight
            ' �������_����
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 59).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�������11_�������_����).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 59).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 59).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����7", recIn����7, 59, ThisWorkbook.Sheets("����7").Cells(recIn����7, 59).Value, 1)
            
            '  ������������� ID_Rec:
            ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-��_��_�24"
            
            ' ������ ������ � BASE\Sales �� ��.
            Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "��_��_�24", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", ThisWorkbook.Sheets("����7").Cells(recIn����7, 55).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", ThisWorkbook.Sheets("����7").Cells(recIn����7, 56).Value, _
                                                              "Percent_Completion", ThisWorkbook.Sheets("����7").Cells(recIn����7, 57).Value, _
                                                                "Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 58).Value, _
                                                                  "Percent_Prediction", ThisWorkbook.Sheets("����7").Cells(recIn����7, 59).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����7").Cells(recIn����7, 56).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
            
            
            ' ������������ ������� �� column_������������_�������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_������������_�������).Value
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).NumberFormat = "0%"
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).HorizontalAlignment = xlRight
            
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            ' Call Full_Color_RangeII("����7", recIn����7, 60, ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).Value, 1)
            
            ' ����� � ��������� �� 85 ������ ����
            ' Call Full_Color_RangeIII("����7", recIn����7, 60, ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).Value, 1, 80)
            
            ' ���� ��<50%, �� �������
            If ThisWorkbook.Sheets("����7").Cells(recIn����7, 60).Value < 0.5 Then
              Call Full_Color_RangeII("����7", recIn����7, 60, 0, 100)
            End If
            
            ' ���-�� ��������� �� column_���_���������
            If column_���_��������� <> 0 Then
              
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 61).Value = Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���_��������� + 1).Value
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 61).NumberFormat = "0"
              ThisWorkbook.Sheets("����7").Cells(recIn����7, 61).HorizontalAlignment = xlRight
              
              ' ��������� �
              '  ������������� ID_Rec:
              ID_RecVar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "-" + strMMYY(dateDB) + "-�����_������"
            
              ' ������ ������ � BASE\Sales �� ��.
              Call InsertRecordInBook("Sales", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                                "Saler_Name", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_���).Value, _
                                                  "�ffice", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
                                                    "Product_Code", "�����_������", _
                                                      "Update_Date", dateDB, _
                                                        "Plan", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_����).Value, _
                                                          "Unit", "��.", _
                                                            "Fact", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_����).Value, _
                                                              "Percent_Completion", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_���_����).Value, _
                                                                "Prediction", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_�������).Value, _
                                                                  "Percent_Prediction", Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_�������_����).Value, _
                                                                    "MMYY", strMMYY(dateDB), _
                                                                      curr_Day_Month, Workbooks(ReportName_String).Sheets(SheetName_String).Cells(rowCount, column_�����_������_����).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
              
            End If ' ���-�� ��������� �� column_���_���������

            ' ������� � BASE\ActiveStaff �������� ���������� �� ���������� ������
            Call InsertRecordInBook("ActiveStaff", "����1", "ID", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                            "ID", ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value, _
                                              "Name", ThisWorkbook.Sheets("����7").Cells(recIn����7, 3).Value, _
                                                "Office", ThisWorkbook.Sheets("����7").Cells(recIn����7, 4).Value, _
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


            ' ����� �� - ����� �� BASE\ActiveStaff ���� �� ���������� ����������. ����. - ������: ������, ������, ����������
            ThisWorkbook.Sheets("����7").Cells(recIn����7, 62).Value = getInfoFromActiveStaff(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value)
                               
          End If
                  
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
          
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' ������� ����� ���������
      
      ' ���������� ���������
      ThisWorkbook.Save
        
      ' ��������� BASE\Sales
      CloseBook ("Sales")
            
      ' ��������� BASE\ActiveStaff
      CloseBook ("ActiveStaff")
    
      ' ���������� ���������� ���������
      finishProcess = True
      
      Else
        ' ��������� � �������� ������� ������ ��� ����
        MsgBox ("�� ������ ���� '������������ ���-� �� ������'!")
      End If ' ����� ������������ ����� ������������ ���-� �� ������ (���, ��� ���� ������� +2 ������� )
      
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����7").Range("A1").Select
  
    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D9")
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
      
      ' ���� ������� ����������� �����������, �� ���������� ������������ ���
      If Weekday(Date, vbMonday) = 1 Then

        ' ��������� ������������ ��� �� ������?
        If MsgBox("��������� ������� ������������ ��� �� ������?", vbYesNo) = vbYes Then
          Call ������������_���
        End If
        
      End If
      
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub


' �������� ������� � �������� ������ �������, %
Sub �������������������7()
  
    ' Columns("E:H").Select
    ' Selection.Columns.Group

    ' 1. ��
    Columns("E:H").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 9).Value = "��"
    
    ' 2. ����
    Columns("J:M").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 14).Value = "����"
        
    ' 3. ��������� �����
    Columns("O:R").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 19).Value = "��"
    
    ' 4. ��������� �����
    Columns("T:W").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 24).Value = "��"
    
    ' 5. �������� ����
    Columns("Y:AB").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 29).Value = "��"
    
    ' 6. �������� �������� (����� ������������� ����)
    Columns("AD:AG").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 34).Value = "��" ' "��"
    
    ' 7. ���_���� (������, ���.���.)
    Columns("AI:AL").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 39).Value = "���"
    
    ' 8. ���_���� (������������ �����)
    Columns("AN:AQ").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 44).Value = "���"
    
    ' 9. ���������� �����������
    Columns("AS:AV").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 49).Value = "��"
    
    ' 10. ������ �������������� �����
    Columns("AX:BA").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 54).Value = "���" ' "��(�+B)"
    
    ' 11. ���������� �����������: "������ �������"+"�����24"
    Columns("BC:BF").Select
    Selection.EntireColumn.Hidden = True
    ThisWorkbook.Sheets("����7").Cells(7, 59).Value = "��+�24"

End Sub

' ���������� ������� - �������� ���
Sub ���������������������7()
Attribute ���������������������7.VB_ProcData.VB_Invoke_Func = " \n14"
    
    ' 1. ��
    ' ThisWorkbook.Sheets("����7").Columns("C:BF").Select
    ThisWorkbook.Sheets("����7").Columns("E:H").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 9).Value = ""
    
    ' 2. ����
    Columns("J:M").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 14).Value = ""
        
    ' 3. ��������� �����
    Columns("O:R").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 19).Value = ""
    
    ' 4. ��������� �����
    Columns("T:W").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 24).Value = ""
    
    ' 5. �������� ����
    Columns("Y:AB").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 29).Value = ""
    
    ' 6. ������������� ����
    Columns("AD:AG").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 34).Value = ""
    
    ' 7. ���_���� (������, ���.���.)
    Columns("AI:AL").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 39).Value = ""
    
    ' 8. ���_���� (������������ �����)
    Columns("AN:AQ").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 44).Value = ""
    
    ' 9. ���������� �����������
    Columns("AS:AV").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 49).Value = ""
    
    ' 10. ���������� ����������� (��������� + ���� ������)
    Columns("AX:BA").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 54).Value = ""
     
    ' 11.
    Columns("BC:BG").Select
    Selection.EntireColumn.Hidden = False
    ThisWorkbook.Sheets("����7").Cells(7, 59).Value = ""
     

    ThisWorkbook.Sheets("����7").Range("C2").Select
    
End Sub

' ����������� � �����
Sub Sheet7_to_rigth_Table()
  ThisWorkbook.Sheets("����7").Range("BJ2").Select
End Sub

' ����������� � ������
Sub Sheet7_to_left_Table()
  ThisWorkbook.Sheets("����7").Range("A1").Select
End Sub

' ������������ ���
Sub ������������_���()
Dim rowCount As Integer

  ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
  dateDB = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

  ' ������ �� ������������ ���
  If MsgBox("������������ ��� �� " + ������������(dateDB) + "?", vbYesNo) = vbYes Then
    
    Count��� = 0
    
    ' ====
    rowCount = 9
    ' Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
    Do While ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value <> ""
            
      Count��� = Count��� + 1
            
      ' ��������� ������ ���
      Workbooks.Open (ThisWorkbook.Path + "\Templates\���.xlsx")
         
      ' ������� �� ����7
      ThisWorkbook.Sheets("����7").Activate
         
      ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
      dateDB = Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10)
         
      ' ��� ����� � ���
      ' FileIPZName = "��� _ ��� ���������_" + ������������(dateDB) + "_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 2) + ".xlsx"
      ' FileIPZName = "��� _ ��� ���������_" + ������������(dateDB) + "_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 4) + ".xlsx"
      ' Workbooks("���.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileIPZName, FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
 
      ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
      FileIPZName = "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(ThisWorkbook.Path + "\Out\" + FileIPZName)
     
      Workbooks("���.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileIPZName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
        
      '   FileCopy FileIPZName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 5) + CStr(dateDB) + ".xlsx"

    
      ' ��������� + ���
      Workbooks(FileIPZName).Sheets("����1").Range("F8").Value = getFromAddrBook2(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value, 3) ' �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 2)
      ' ���
      Workbooks(FileIPZName).Sheets("����1").Range("H30").Value = �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 2)
      ' ����
      Workbooks(FileIPZName).Sheets("����1").Range("F9").Value = "�� �" + ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value + "�"
      ' ��������� �����
      Workbooks(FileIPZName).Sheets("����1").Range("F10").Value = "��������� �����: " + CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value)
      ' ���� - "17" ���� 2020 �.
      Workbooks(FileIPZName).Sheets("����1").Range("G12").Value = ������������(dateDB)
      ' ����� ���
      Workbooks(FileIPZName).Sheets("����1").Range("A14").Value = "               � ����� ���������� ������ " + quarterName(dateDB) + " ���������� ������� ��� ���������� ����� ������� � ���������� �������������� �������� ������� �� " + ������������(dateDB) + ":"
      
      ' ������� ����� �� ���������
      ' 1. ��
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B18").Value = ThisWorkbook.Sheets("����7").Cells(7, 6).Value ' "��������������� �������"
      Workbooks(FileIPZName).Sheets("����1").Range("B18").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E18").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F18").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G18").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 5).Value
           
      ' 2. ��
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B19").Value = ThisWorkbook.Sheets("����7").Cells(7, 11).Value ' "����������������"
      Workbooks(FileIPZName).Sheets("����1").Range("B19").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E19").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F19").Value = "���.���."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G19").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 10).Value
      ' Workbooks(FileIPZName).Sheets("����1").Range("G19").Value = "80% �� ��"
           
      ' 3. ��
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B20").Value = ThisWorkbook.Sheets("����7").Cells(7, 16).Value ' "��������� ����� (��������)"
      Workbooks(FileIPZName).Sheets("����1").Range("B20").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E20").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F20").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G20").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 15).Value
           
      ' 4. ��������� �����
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B21").Value = ThisWorkbook.Sheets("����7").Cells(7, 21).Value ' "��������� ����� (��������)"
      Workbooks(FileIPZName).Sheets("����1").Range("B21").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E21").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F21").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G21").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 20).Value
           
      ' 5. �������� ����
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B22").Value = ThisWorkbook.Sheets("����7").Cells(7, 26).Value ' "��������-����"
      Workbooks(FileIPZName).Sheets("����1").Range("B22").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E22").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F22").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G22").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 25).Value
           
      ' 6. ������������� �����
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B23").Value = ThisWorkbook.Sheets("����7").Cells(7, 31).Value ' "�������� ��������"
      Workbooks(FileIPZName).Sheets("����1").Range("B23").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E23").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F23").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G23").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 30).Value
           
      ' 7. ���
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B24").Value = ThisWorkbook.Sheets("����7").Cells(7, 36).Value ' "��� (������)"
      Workbooks(FileIPZName).Sheets("����1").Range("B24").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E24").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F24").Value = "���.���."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G24").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 35).Value
           
      ' 8. ���
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B25").Value = ThisWorkbook.Sheets("����7").Cells(7, 41).Value ' "��� (������)"
      Workbooks(FileIPZName).Sheets("����1").Range("B25").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E25").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F25").Value = "���.���."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G25").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 40).Value
           
      ' 9. ���������� �����������
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B26").Value = ThisWorkbook.Sheets("����7").Cells(7, 46).Value ' "���������� �����������, ������� ��.���������� ������� �������"
      Workbooks(FileIPZName).Sheets("����1").Range("B26").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E26").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F26").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G26").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 45).Value
           
      ' 10. ������ �������������� �����
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B27").Value = ThisWorkbook.Sheets("����7").Cells(7, 51).Value ' "������ �������������� �����"
      Workbooks(FileIPZName).Sheets("����1").Range("B27").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E27").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F27").Value = "���.���."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G27").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 50).Value
           
      ' 11. ���������� �����������: "������ �������"+"�����24"
      ' ������������ ������ �����
      Workbooks(FileIPZName).Sheets("����1").Range("B28").Value = ThisWorkbook.Sheets("����7").Cells(7, 56).Value ' "������ �������������� �����"
      Workbooks(FileIPZName).Sheets("����1").Range("B28").RowHeight = 45
      ' ����������
      Workbooks(FileIPZName).Sheets("����1").Range("E28").Value = "�����"
      ' �����-��
      Workbooks(FileIPZName).Sheets("����1").Range("F28").Value = "��."
      ' ��������
      Workbooks(FileIPZName).Sheets("����1").Range("G28").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 55).Value
           
           
      ' �������� �����
      Workbooks(FileIPZName).Close SaveChanges:=True
    
      ' ��������� ������
      rowCount = rowCount + 1
      Application.StatusBar = CStr(Count���) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + "..."
      DoEventsInterval (rowCount)

    Loop
    
    ' =====
    
    MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ������������!")
    
    ' ��������� ���� ��������� � ������� ����? - https://www.excel-vba.ru/chto-umeet-excel/kak-sredstvami-vba-pereimenovatperemestitskopirovat-fajl/
    If MsgBox("����������� ����� ��� ����������� � ������� ���� (�������������� �������)?", vbYesNo) = vbYes Then
  
      ' ������ �������
      Application.StatusBar = "����������� � ������� ���� ..."
    
      Count��� = 0
    
      ' ====
      rowCount = 9
      Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
            
        Count��� = Count��� + 1
        
        ' ��� ����� � ���
        FileIPZName = ThisWorkbook.Path + "\Out\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"

        ' ������ �������
        Application.StatusBar = CStr(Count���) + " ����������� " + FileIPZName + "..."
           
        ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
        FileCopy FileIPZName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"
   
        Application.StatusBar = "�����������!"
      
        ' ��������� ������
        rowCount = rowCount + 1
        DoEventsInterval (rowCount)
  
      Loop
  
      ' �������� ���
      Call ��������_Lotus_Notes_����7_���
  
      ' ������ �������
      Application.StatusBar = ""

      ' ���������
      MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ���������� � ������� ����!")

    End If ' ������� � ����

    
  End If ' ������ �� ������������

  
End Sub

' ������������ ���
Sub ������������_���()
Dim rowCount, Count��� As Integer

  ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
  dateDB = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

  ' ������ �� ������������ ���
  If MsgBox("������������ �������������� ���� �������� (���) �� " + ������������(dateDB) + "?", vbYesNo) = vbYes Then
    
    ' ����� �������������� ���
    Count��� = 0
    
    ' ��������� BASE\ProductCode
    OpenBookInBase ("ProductCode")

    ' ��������� BASE\Sales
    OpenBookInBase ("Sales")

    ' ====
    rowCount = 9
    Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
                        
      ' ��������� ������ ���
      Workbooks.Open (ThisWorkbook.Path + "\Templates\���.xlsx")
         
      ' ��������� ������ ����� ������
      Workbooks.Open (ThisWorkbook.Path + "\Templates\�������.xlsx")
                  
      ' ������� �� ����7
      ThisWorkbook.Sheets("����7").Activate
         
      ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
      dateDB = Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10)
         
      ' ���� ��������� �����������
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 62).Value = "" Then
         
        Count��� = Count��� + 1
         
        ' ��� ����� � ���
        ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
        FileIPRName = "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"
        Workbooks("���.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileIPRName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
        
        ' ��� ����� � ��������� (.xlsx)
        FileSale = "�������_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"
        Workbooks("�������.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileSale, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
        
        ' ���
        Workbooks(FileIPRName).Sheets("���").Range("C2").Value = getFromAddrBook2(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value, 2)
        Workbooks(FileSale).Sheets("����1").Range("B2").Value = Workbooks(FileIPRName).Sheets("���").Range("C2").Value
        
        ' ���������
        Workbooks(FileIPRName).Sheets("���").Range("C3").Value = getFromAddrBook2(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value, 5)
        Workbooks(FileSale).Sheets("����1").Range("B3").Value = Workbooks(FileIPRName).Sheets("���").Range("C3").Value
        
        ' ��������� �����
        Workbooks(FileIPRName).Sheets("���").Range("C4").Value = "��������� �����: " + CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value)
        Workbooks(FileSale).Sheets("����1").Range("B4").Value = CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value)
        
        ' �����
        Workbooks(FileIPRName).Sheets("���").Range("B5").Value = cityOfficeName(ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value)
        
        ' ������������� (����)
        Workbooks(FileIPRName).Sheets("���").Range("C6").Value = "�� �" + ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value + "�"
        Workbooks(FileSale).Sheets("����1").Range("B1").Value = Workbooks(FileIPRName).Sheets("���").Range("C6").Value
        
        ' ��� ������������
        '
        ' ���� - "17" ���� 2020 �.
        Workbooks(FileIPRName).Sheets("���").Range("G18").Value = ������������(dateDB)
      
        ' ������������
        ' � �������
        Workbooks(FileSale).Sheets("����1").Range("B5").Value = getFromAddrBook(���������������(ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value), 1)
        ' � ���
        Workbooks(FileIPRName).Sheets("���").Range("C7").Value = Workbooks(FileSale).Sheets("����1").Range("B5").Value
      
        ' ���
        Workbooks(FileSale).Sheets("����1").Range("B6").Value = Year(dateDB)
        
        ' ��������� � ����� ProductCode � ������������ ���������� ������ �� ������� �������� �� ������ � 0120-0620
        ' ���� ������ - ������ ����� ���� �� ���� DB
        beginPeriod = firstMonthYear_strMMYY(CDate(dateDB)) ' "0120" strMMYY �� dateDB ��.��.����
        
        
        ' ���� ��� �������, �� ����� 1220
        If Month(dateDB) = 12 Then
                
          endPeriod = strMMYY(dateDB)
                
        Else
          
          ' ���� ��������� ������� - �� �������� ������ (DB) ����� 1
          endPeriod = pastMonth_strMMYY(CDate(dateDB))   ' "0620"
        
        End If
        
        rowCount2 = 2
        Do While Not IsEmpty(Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value)
   
          ' ����� ����������� �� ���
          �����_����_��_�������� = 0
          �����_����_��_�������� = 0
   
          ' ������ �������� - ��������� � ����� Sales � �������� ������� �� ����� �������� �� ������ � "0120" �� "0620". ������ ����=0 ������� ��� 1 ����.
          '-----------------------------------------------------------------------------------------------------------------------------------------------
          rowCount3 = 2
          ����������_������ = 0
          Do While Not IsEmpty(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 1).Value)
            
         
            ' ���� ��� ������� �������� �������� �� ����7, �� �������� ������ � �� �������� �������� �� ProductCode
            ' If (Workbooks("Sales").Sheets("����1").Cells(rowCount3, 2).Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value) And (CInt(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) >= CInt(beginPeriod)) And (CInt(endPeriod) >= CInt(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value)) And (Workbooks("Sales").Sheets("����1").Cells(rowCount3, 7).Value = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value) Then
            
            If (Workbooks("Sales").Sheets("����1").Cells(rowCount3, 2).Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value) And _
                 (dateBeginFromStrMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) >= dateBeginFromStrMMYY(beginPeriod)) And _
                   (dateEndFromStrMMYY(endPeriod) >= dateEndFromStrMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value)) And _
                     (Workbooks("Sales").Sheets("����1").Cells(rowCount3, 7).Value = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value) Then
                            
              ' ���� � ������� ������ �� ���� ������ ������ (10-�� ������� Fact = 0)
              If CDbl(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 10).Value) = 0 Then
                ����������_������ = ����������_������ + 1
              End If
              
              ' ������� � ���� �������:
              
              ' ����
              Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2)).Value = Workbooks("Sales").Sheets("����1").Cells(rowCount3, 8).Value
              �����_����_��_�������� = �����_����_��_�������� + Workbooks("Sales").Sheets("����1").Cells(rowCount3, 8).Value
              
              ' ����
              Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2) + 1).Value = Workbooks("Sales").Sheets("����1").Cells(rowCount3, 10).Value
              �����_����_��_�������� = �����_����_��_�������� + Workbooks("Sales").Sheets("����1").Cells(rowCount3, 10).Value
              
              ' % ���.
              Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2) + 2).Value = Workbooks("Sales").Sheets("����1").Cells(rowCount3, 11).Value
              
              ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
              Call Full_Color_RangeIV(FileSale, "����1", decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2) + 2, Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2) + 1).Value, Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, rowCount2_toColumn(rowCount2)).Value, 90)

              ' ���������� Working_days �� Norm_days
              Workbooks(FileSale).Sheets("����1").Cells(decodeMMYY(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 5).Value) + 8, 32).Value = "���������� " + CStr(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 15).Value) + " �� " + CStr(Workbooks("Sales").Sheets("����1").Cells(rowCount3, 17).Value) + " ����"
              
            End If
            
            ' ��������� ������ � Sales
            rowCount3 = rowCount3 + 1
            Application.StatusBar = CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 1).Value) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + " " + CStr(rowCount2) + "-" + CStr(rowCount3) + "..."
            DoEventsInterval (rowCount3)

          Loop
            
          ' ��������� ������ �� �������� �� �������� �������� ���������
          ' ������� �������� ���� � ProductCode.No_Sales_tmp
          Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 6).Value = ����������_������
          Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 7).Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value
          
          ' ����� �� �������� � ����� "�������" (���� �������)
          ' ����� ����
          Workbooks(FileSale).Sheets("����1").Cells(21, rowCount2_toColumn(rowCount2)).Value = �����_����_��_��������
          ' ����� ����
          Workbooks(FileSale).Sheets("����1").Cells(21, rowCount2_toColumn(rowCount2) + 1).Value = �����_����_��_��������
          ' % ���.
          Workbooks(FileSale).Sheets("����1").Cells(21, rowCount2_toColumn(rowCount2) + 2).Value = �����������(�����_����_��_��������, �����_����_��_��������, 2)
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeIV(FileSale, "����1", 21, rowCount2_toColumn(rowCount2) + 2, �����_����_��_��������, �����_����_��_��������, 90)
          
          
          ' ��������� ������ � ProductCode
          rowCount2 = rowCount2 + 1
          ' Application.StatusBar = CStr(Count���) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + "..."
          DoEventsInterval (rowCount2)

        Loop
   
        
   
        ' ������ �������� - ����������� ProductCode � �������� 3 ������ ���������� � ������ �� � ���
        '-------------------------------------------------------------------------------------------
        add_to_course = ""
        Product = ""
        Full_Product_Name = ""
        PSB_University_course = ""
        PSB_University_URL = ""
        
        For i = 1 To 3
        
          rowCount2 = 2
          max_0 = 0
          curr_product = ""
          Do While Not IsEmpty(Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value)
           
            If (CInt(Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 6).Value) > max_0) And (InStr(add_to_course, Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value) = 0) Then
              
              max_0 = CInt(Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 6).Value)
              curr_product = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 1).Value
              Full_Product_Name = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 3).Value
              PSB_University_course = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 4).Value
              PSB_University_URL = Workbooks("ProductCode").Sheets("����1").Cells(rowCount2, 5).Value
              
            End If
           
            ' ��������� ������ � ProductCode
            rowCount2 = rowCount2 + 1
            ' Application.StatusBar = CStr(Count���) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + " " + CStr(rowCount2)
            Application.StatusBar = CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 1).Value) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + " " + CStr(rowCount2)
            DoEventsInterval (rowCount2)

          Loop
                                      
          ' ������ �������� �� �������� - ������� � ����
          add_to_course = add_to_course + curr_product + " "
          
          ' ������� � ���
          ' ������� ��������
          Workbooks(FileIPRName).Sheets("���").Cells(8 + (2 * i), 5).Value = Full_Product_Name + ". ���������� ������ � " + CStr(max_0) + " ������. �������� � " + decodeMMYY2(beginPeriod) + " �� " + decodeMMYY2(endPeriod)
          ' �����������
          Workbooks(FileIPRName).Sheets("���").Cells(8 + (2 * i), 8).Value = PSB_University_course + " " + PSB_University_URL
          ' ����
          Workbooks(FileIPRName).Sheets("���").Cells(8 + (2 * i), 10).Value = CStr(Date + 14)
          
        Next ' i
                                      
        ' �������� �����
        Workbooks(FileIPRName).Close SaveChanges:=True
        ' ��������� ������ ����� ������
        Workbooks(FileSale).Close SaveChanges:=True
    
      End If ' ���� ��������� �����������
    
      ' ��������� ������
      rowCount = rowCount + 1
      ' Application.StatusBar = CStr(Count���) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + "..."
      DoEventsInterval (rowCount)

    Loop
    
    ' =====
    Application.StatusBar = ""
    
    ' ��������� BASE\ProductCode
    CloseBook ("ProductCode")

    ' ��������� BASE\Sales
    CloseBook ("Sales")
   
    MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ������������!")
    
    ' ��������� ���� ��������� � ������� ����? - https://www.excel-vba.ru/chto-umeet-excel/kak-sredstvami-vba-pereimenovatperemestitskopirovat-fajl/
    If MsgBox("����������� ����� ��� ����������� � ������� ���� (�������������� �������)?", vbYesNo) = vbYes Then
  
      ' ������ �������
      Application.StatusBar = "����������� � ������� ���� ..."
    
      Count��� = 0
    
      ' ====
      rowCount = 9
      Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
            
        Count��� = Count��� + 1
        
        ' ��� ����� � ���
        FileIPRName = ThisWorkbook.Path + "\Out\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"

        ' ������ �������
        Application.StatusBar = CStr(Count���) + " ����������� " + FileIPRName + "..."
           
        ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
        FileCopy FileIPRName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xlsx"
   
        Application.StatusBar = "�����������!"
      
        ' ��������� ������
        rowCount = rowCount + 1
        DoEventsInterval (rowCount)
  
      Loop
  
      ' ������ �������
      Application.StatusBar = ""

      ' ���������
      MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ���������� � ������� ����!")

    End If ' ������� � ����

    
  End If ' ������ �� ������������

  
End Sub


' ������������ ��� - ��������� ������ "���������� 2. ��� ���"
Sub ������������_���()
Dim FileLCOName As String
Dim rowCount As Integer

  ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
  dateDB = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

  ' ���� ������ ������
  ����_������_������ = weekStartDate(Date)
  ' ����_������_������ = weekStartDate(CDate("02.11.2020")) ' ������� !!!
    
  ' ���� ��������� ������
  ����_���������_������ = ����_������_������ + 4

  ' ���������� ������� �� ����7
  column_����7_���� = ColumnByValue(ThisWorkbook.Name, "����7", "����.", 300, 300)


  ' ������ �� ������������ ���
  If MsgBox("������������ ��� � " + CStr(����_������_������) + " �� " + CStr(����_���������_������) + "?", vbYesNo) = vbYes Then
    
    Count��� = 0
    
    ' ====
    rowCount = 9
    ' Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
    Do While ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value <> ""
    
      ' ���� � ������� "����." ���� "������", �� �� ��������� ��� �� ����������
      If InStr(ThisWorkbook.Sheets("����7").Cells(rowCount, column_����7_����).Value, "������") = 0 Then
      
      Count��� = Count��� + 1
            
      ' ��������� ������ ���
      Workbooks.Open (ThisWorkbook.Path + "\Templates\���������� 2. ��� ���.xls")
      LCOSheetsName = "���� ������� ����������"
         
      ' ������� �� ����7
      ThisWorkbook.Sheets("����7").Activate
                  
      ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
      ' dateDB = Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10)
         
      ' ��� ����� � ���
      ' FileLCOName = "��� _ ��� ���������_" + ������������(dateDB) + "_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 2) + ".xlsx"
      ' FileLCOName = "��� _ ��� ���������_" + ������������(dateDB) + "_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 4) + ".xlsx"
      ' Workbooks("���.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileLCOName, FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
    
      
    
      ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
      FileLCOName = "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xls"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(ThisWorkbook.Path + "\Out\" + FileLCOName)
      
      ' Workbooks("���������� 2. ��� ���.xls").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileLCOName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
      Workbooks("���������� 2. ��� ���.xls").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileLCOName, createBackUp:=False
        
      '   FileCopy FileLCOName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 5) + CStr(dateDB) + ".xlsx"

    
      ' ��������� + ���
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E1").Value = getFromAddrBook2(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value, 3) ' �������_�_���(ThisWorkbook.Sheets("����7").Cells(RowCount, 3).Value, 2)
      ' ���
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D1").Value = "��� ����������: " + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 2)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D1").Font.Name = "Calibri"
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D1").Font.Size = 18

      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G1").Value = "����: " + "�� �" + ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value + "�"
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G1").Font.Name = "Calibri"
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G1").Font.Size = 18
      
      ' ��������� �����
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F10").Value = "��������� �����: " + CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 2).Value)
      ' ���� - "17" ���� 2020 �.
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G12").Value = ������������(dateDB)
      ' ����� ���
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("A14").Value = "               � ����� ���������� ������ " + quarterName(dateDB) + " ���������� ������� ��� ���������� ����� ������� � ���������� �������������� �������� ������� �� " + ������������(dateDB) + ":"
      
      ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dates(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
      �������_�������_���� = Working_days_between_dates(����_������_������, Date_last_day_month(����_������_������), 5)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K1").Value = "������� ������� ����: " + CStr(�������_�������_����)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K1").Font.Name = "Calibri"
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K1").Font.Size = 18
      
      
      ' ����������� B16
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B16").Value = ������������(����_������_������)
      ' ������� B30
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B30").Value = ������������(����_������_������ + 1)
      ' ����� B45
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B45").Value = ������������(����_������_������ + 2)
      ' ������� B58
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B58").Value = ������������(����_������_������ + 3)
      ' ������� B71
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B71").Value = ������������(����_������_������ + 4)
      
      ' ���� �� ����� (����������� ������)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K2").Value = "����  �� ����� (����������� ����) �� " + CStr(����_������_������)
      
      ' ������� ����� �� ���������
      ' 1. ��
      ' ������������ ������ �����
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value = "��������������� �������, ���.���."
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value = "��������������� �������, ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D5", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J5").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J5", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D19").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D19", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D33").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D33", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D47").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D47", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D60").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D60", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D73").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D5").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D73", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B18").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E18").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F18").Value = "���.���."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 5).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E5", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 6).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K5", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "F19", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F33", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F47").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F47", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F60").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F47").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F60", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F73").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K5").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F47").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F60").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F73", "Calibri", 18)
      
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G5").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F47").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F60").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F73").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G5", "Calibri", 18)

      
      ' 2. ��
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value = "����������������, ���.���."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D6", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J6").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J6", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D20").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D20", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D34").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D34", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D48").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D48", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D61").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D61", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D74").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D6").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D74", "Calibri", 12)
      

      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B19").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E19").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value = "���.���."
      ' ��������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G19").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 10).Value
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E6").Value = "80% �� ��"
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E6").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 10).Value, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E6").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "E6", "Calibri", 18)
      
      ' ���� �����
      ����_�����_Var = ThisWorkbook.Sheets("����7").Cells(rowCount, 10).Value
      ' ���� �����
      ����_�����_Var = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 11).Value, 0)
      ' ���� �� ����� ������
      �������_��_�����_������ = ����_�����_Var - ����_�����_Var
      ' ���� �� ����
      ����_��_���� = Round(�������_��_�����_������ / �������_�������_����, 0)
      
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K6").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 11).Value, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K6").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "K6", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E20").Value = Round((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F19").Value / 100) * 80, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E20").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E20", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E34").Value = Round((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F33").Value / 100) * 80, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E34").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E34", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E48").Value = Round((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F47").Value / 100) * 80, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E48").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E48", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E61").Value = Round((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F60").Value / 100) * 80, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E61").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E61", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E74").Value = Round((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F73").Value / 100) * 80, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E74").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E74", "Calibri", 18)
      
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G6").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E20").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E34").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E48").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E61").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E74").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G6", "Calibri", 18)
     
           
      ' 3. �������� ����
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value = "��������-����, ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D7", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J7").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J7", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D21").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D21", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D35").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D35", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D49").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D49", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D62").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D62", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D75").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D7").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D75", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B22").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E22").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 25).Value
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "E7", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 26).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K7", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E21", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E35").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E35", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E49").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E35").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E49", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E62").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E35").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E49").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E62", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E75").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K7").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E35").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E49").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E62").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E75", "Calibri", 18)
           
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G7").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E35").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E49").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E62").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E75").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G7", "Calibri", 18)
           
      ' 4. ��������� �����
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value = "��������� ����� (��������), ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D8", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J8").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J8", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D22").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D22", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D36").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D36", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D50").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D50", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D63").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D63", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D76").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D8").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D76", "Calibri", 12)

      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B21").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E21").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F21").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 20).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E8", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 21).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K8", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "F22", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F36").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F36", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F50").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F36").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F50", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F63").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F36").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F50").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F63", "Calibri", 18)
      
      ' �� �������� �� ���� - ������� (� ������ ����������)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F76").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K8").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F36").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F50").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F63").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F76", "Calibri", 18)
      
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G8").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F22").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F36").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F50").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F63").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F76").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G8", "Calibri", 18)
      
           
      ' 5. ��
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value = "��������� ����� (��������), ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D9", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J9").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J9", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D23").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D23", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D37").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D37", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D51").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D51", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D64").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D64", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D77").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D9").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D77", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B20").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E20").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F20").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 15).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E9", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 16).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K9", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "F23", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F37").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F37", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F51").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F37").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F51", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F64").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F37").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F51").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F64", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F77").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K9").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F37").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F51").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F64").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "F77", "Calibri", 18)
        
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G9").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F37").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F51").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F64").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F77").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G9", "Calibri", 18)
        
        
      ' 6. ������������� �����
      ' ������������ ������ �����
      If False Then
      
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value = "������������� �����, ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D10", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J10").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J10", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D24").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D24", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D38").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D38", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D52").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D52", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D65").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D65", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D78").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D78", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B23").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E23").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 30).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E10", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 31).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K10", "Calibri", 18)
      
      ' �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E24", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E38", "Calibri", 18)
      
      ' �� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E52", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E65").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E65", "Calibri", 18)
      
      ' �� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E78").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E65").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E78", "Calibri", 18)
     
      ' �� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G10").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E65").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E78").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G10", "Calibri", 18)
      
      Else
        
        ' ������� � �����
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J10").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D24").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D38").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D52").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D65").Value = ""
        Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D78").Value = ""
        
      End If
       
      ' 6. �������� ��������+���, ���. ���.
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value = "�������� ��������+���, ���. ���."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D10", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J10").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J10", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D24").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D24", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D38").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D38", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D52").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D52", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D65").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D65", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D78").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D10").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D78", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B23").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E23").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F23").Value = "��."
      ' �������� ��������+��� ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 30).Value
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E10").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "E10", "Calibri", 18)
      
      ' ���� �����
      ����_�����_Var = ThisWorkbook.Sheets("����7").Cells(rowCount, 30).Value
      ' ���� �����
      ����_�����_Var = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 31).Value, 0)
      ' ���� �� ����� ������
      �������_��_�����_������ = ����_�����_Var - ����_�����_Var
      ' ���� �� ����
      ����_��_���� = Round(�������_��_�����_������ / �������_�������_����, 0)
      
      ' �������� ��������+��� ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 31).Value, 0)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K10").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "K10", "Calibri", 18)
      
      ' �������� ��������+��� �� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E24", "Calibri", 18)
      
      ' �������� ��������+��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E38", "Calibri", 18)
      
      ' �������� ��������+��� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E52", "Calibri", 18)
      
      ' �������� ��������+��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E65").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E65", "Calibri", 18)
      
      ' �������� ��������+��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E78").Value = ����_��_����
      Call setFontInRange(FileLCOName, LCOSheetsName, "E78", "Calibri", 18)
     
      ' �������� ��������+��� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G10").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E38").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E52").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E65").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E78").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G10", "Calibri", 18)
       
     
      ' 7. ���
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value = "��� (������), ���.���."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D11", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J11").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J11", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D25").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D25", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D39").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D39", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D53").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D53", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D66").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D53", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D79").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D11").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D79", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B24").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E24").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F24").Value = "���.���."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 35).Value
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").NumberFormat = "#,##0"
      Call setFontInRange(FileLCOName, LCOSheetsName, "E11", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 36).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K11", "Calibri", 18)
      
      ' ��� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E25", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E39").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E39", "Calibri", 18)
      
      ' ��� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E53").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E39").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E53", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E66").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E39").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E53").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E66", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E79").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K11").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E39").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E53").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E66").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E79", "Calibri", 18)
      
      ' ��� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G11").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E39").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E53").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E66").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E79").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G11", "Calibri", 18)
      
      
      ' 8. ���
      ' ������������ ������ �����
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value = "��� (������������ �����), ���.���."
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value = "��� (������), ���.���."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D12", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J12").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J12", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D26").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D26", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D40").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D40", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D54").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D54", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D67").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D67", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D80").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D12").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D80", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B25").RowHeight = 15
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E25").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F25").Value = "���.���."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 40).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E12", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 41).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K12", "Calibri", 18)
      
      ' ��� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E26", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E40").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E40", "Calibri", 18)
      
      ' ��� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E54").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E40").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E54", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E67").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E40").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E54").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E67", "Calibri", 18)
      
      ' ��� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E80").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K12").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E40").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E54").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E67").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E80", "Calibri", 18)
      
      ' ��� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G12").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E40").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E54").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E67").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E67").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G12", "Calibri", 18)
      
      
      ' 9. ���������� �����������
      ' ������������ ������ �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value = "���������� �����������, ��."
      Call setFontInRange(FileLCOName, LCOSheetsName, "D13", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J13").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J13", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D27").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D27", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D41").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D41", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D55").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D55", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D68").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D68", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D81").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D13").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D81", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B26").RowHeight = 45
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F26").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 45).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E13", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 46).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K13", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E27", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E41").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E41", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E55").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E41").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E55", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E68").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E41").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E55").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E68", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - ������� (� ������ ����������)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E81").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K13").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E41").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E55").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E68").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E81", "Calibri", 18)
           
      ' ���������� ����������� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G13").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E41").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E55").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E68").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E81").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G13", "Calibri", 18)
           
           
      ' 10. ���������� �����������
      ' �
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C14").Value = ""
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C28").Value = ""
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C42").Value = ""
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C56").Value = ""
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C69").Value = ""
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C82").Value = ""
      
      ' ������������ ������ �����
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B27").Value = "���������� ����������� ����������, ����� ������"
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B27").RowHeight = 45
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E27").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F27").Value = "��."
      ' ��������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G27").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 50).Value
           
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value = "�������: ������ �������+�����24"
      Call setFontInRange(FileLCOName, LCOSheetsName, "D14", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("J14").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "J14", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D28").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D28", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D42").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D42", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D56").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D56", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D69").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D69", "Calibri", 12)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D82").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("D14").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "D82", "Calibri", 12)
      
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("B26").RowHeight = 45
      ' ����������
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E26").Value = "�����"
      ' �����-��
      ' Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("F26").Value = "��."
      ' ��������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value = ThisWorkbook.Sheets("����7").Cells(rowCount, 55).Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "E14", "Calibri", 18)
      ' ����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value = Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 56).Value, 0)
      Call setFontInRange(FileLCOName, LCOSheetsName, "K14", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �����������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value) / �������_�������_����)
      Call setFontInRange(FileLCOName, LCOSheetsName, "E28", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E42").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value) / (�������_�������_���� - 1))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E42", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �����
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E56").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E42").Value) / (�������_�������_���� - 2))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E56", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - �������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E69").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E42").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E56").Value) / (�������_�������_���� - 3))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E69", "Calibri", 18)
      
      ' ���������� ����������� �������� �� ���� - ������� (� ������ ����������)
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E82").Value = ����������������((Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("K14").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E42").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E56").Value - Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E69").Value) / (�������_�������_���� - 4))
      Call setFontInRange(FileLCOName, LCOSheetsName, "E82", "Calibri", 18)
           
      ' ���������� ����������� ���� �� ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("G14").Value = Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E28").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E42").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E56").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E69").Value + Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("E82").Value
      Call setFontInRange(FileLCOName, LCOSheetsName, "G14", "Calibri", 18)
           
           
      ' ===========================================================================================================================
           
      ' ������� � ������
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Activate
      Workbooks(FileLCOName).Sheets(LCOSheetsName).Range("C2").Select
           
      ' �������� �����
      Workbooks(FileLCOName).Close SaveChanges:=True
    
      ' ������� �� ����7
      ThisWorkbook.Sheets("����7").Activate

      End If ' ���� � "����" ���� "������"

      ' ��������� ������
      rowCount = rowCount + 1
      Application.StatusBar = CStr(Count���) + ". " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + "..."
      DoEventsInterval (rowCount)

    Loop
    
    ' =====
    
    ' �������� ��������� � �����
    ' Call ��������_����7_���_�_�����
    
    ' ������ �������
    Application.StatusBar = ""
    

    ' ���������
    MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ������������!")
    
    ' ��������� ���� ��������� � ������� ����? - https://www.excel-vba.ru/chto-umeet-excel/kak-sredstvami-vba-pereimenovatperemestitskopirovat-fajl/
    If MsgBox("����������� ����� ��� ����������� � ������� ���� (�������������� �������)?", vbYesNo) = vbYes Then
  
      ' ������ �������
      Application.StatusBar = "����������� � ������� ���� ..."
    
      Count��� = 0
    
      ' ====
      rowCount = 9
      ' Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
      Do While ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value <> ""
            
        
        ' ���� � ������� "����." ���� "������", �� �� ��������� ��� �� ����������
        If InStr(ThisWorkbook.Sheets("����7").Cells(rowCount, column_����7_����).Value, "������") = 0 Then

          Count��� = Count��� + 1
        
          ' ��� ����� � ���
          FileLCOName = ThisWorkbook.Path + "\Out\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xls"

          ' ������ �������
          Application.StatusBar = CStr(Count���) + " ����������� " + FileLCOName + "..."
           
          ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
          FileCopy FileLCOName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "���_" + �������_�_���(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value, 5) + "_" + CStr(dateDB) + ".xls"
   
          Application.StatusBar = "�����������!"
      
        End If
      
        ' ��������� ������
        rowCount = rowCount + 1
        DoEventsInterval (rowCount)
  
      Loop
  
      ' ������ �������
      Application.StatusBar = ""

      ' ���������
      MsgBox ("��� � ���������� " + CStr(Count���) + " ��. ���������� � ������� ����!")

    End If ' ������� � ����


    ' ��������� ��� � �����?
    If MsgBox("��������� ����� ��� ����������� � �����?", vbYesNo) = vbYes Then
    
      ' ��������
      Call ��������_Lotus_Notes_����7_���
    
    End If ' ��������� ��� � �����?

  End If ' ������ �� ������������

  
  
End Sub



' �������������� ����� ������ ProductCode � ������� ����� ������ (�� � ��, �� � �� � ��)
Function rowCount2_toColumn(In_rowCount2) As Integer
rowCount2_toColumn = 0
        Select Case In_rowCount2
          Case 2 ' ������ ������������
            rowCount2_toColumn = 2
          Case 3 ' ��������� � ��
            rowCount2_toColumn = 5
          Case 4 ' ��������� �����
            rowCount2_toColumn = 8
          Case 5 ' ��������� �����
            rowCount2_toColumn = 11
          Case 6 ' �������� ����
            rowCount2_toColumn = 14
          Case 7 ' ������������� ����
            rowCount2_toColumn = 17
          Case 8 ' ���_���� (������, ���.���.)
            rowCount2_toColumn = 20
          Case 9 ' ���_���� (������������ �����)
            rowCount2_toColumn = 23
          Case 10 ' ���������� �����������
            rowCount2_toColumn = 26
          Case 11 ' ���������� ����������� (��������� + ���� ������)
            rowCount2_toColumn = 29
        End Select
End Function

' ������������ ���
Function ���������������(In_City) As String
        
        ��������������� = ""
        
        Select Case In_City
          Case "���������"
            ��������������� = "�������1"
          Case "����������"
            ��������������� = "���2"
          Case "���������������"
            ��������������� = "���3"
          Case "���������������"
            ��������������� = "���4"
          Case "�����-����"
            ��������������� = "���5"
        End Select
        
End Function

' ���������� ������ (�����)
Sub ���������_������()
  
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
Dim ��_���������_���� As String
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.XLS), *.XLS", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����7").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
      
      ' ��������� BASE\Sales
      OpenBookInBase ("Sales")
      
      ' ��������� BASE\TimeSheets
      OpenBookInBase ("TimeSheets")
      
      ' ��������� BASE\��. ��������� ����
      ' OpenBookInBase ("��. ��������� 2020")
      
      ' ������������ �����
      ' ���� �� 5-�� ������
      ' ��������� ������
      ' For i = 1 To 5
        ' ������ ������ �� 1 �� 5
      '  Select Case i
      '    Case 1 ' �� ����������
      '      officeNameInReport = "���������"
      '    Case 2 ' �� �����������
      '      officeNameInReport = "����������"
      '    Case 3 ' �� ����������������
      '      officeNameInReport = "���������������"
      '    Case 4 ' �� ����������������
      '      officeNameInReport = "���������������"
      '    Case 5 ' �� ������-����
      '      officeNameInReport = "�����-����"
      '  End Select

        ' Row ��������� �����
        Row_���������_����� = rowByValue(ReportName_String, "������", "��������� �����", 1000, 1000)
        
        ' Column ��������� �����
        column_���������_����� = ColumnByValue(ReportName_String, "������", "��������� �����", 1000, 1000)

        ' �������, ��������, ��������� (���������)
        �olumn_��� = ColumnByValue(ReportName_String, "������", "�������, ��������, ��������� (���������)", 1000, 1000)

        ' ���������� ��
        �olumn_���������� = ColumnByValue(ReportName_String, "������", "���������� ��", 1000, 1000)

        ' �������� ������
        Row_��������_������ = rowByValue(ReportName_String, "������", "�������� ������", 1000, 1000)
        �olumn_��������_������ = ColumnByValue(ReportName_String, "������", "�������� ������", 1000, 1000)

        ' ����� � ��� ������
        period_MMYY = strMMYY(CDate(Workbooks(ReportName_String).Sheets("������").Cells(Row_��������_������ + 2, �olumn_��������_������).Value))

        ' ��������� ��������������� ���������������� ��������� BASE\��. ��������� ����
        ��_���������_���� = "��. ��������� " + CStr(Year(CDate(Workbooks(ReportName_String).Sheets("������").Cells(Row_��������_������ + 2, �olumn_��������_������).Value)))
        OpenBookInBase (��_���������_����)

        ' ����� ��������� Norm_hours, Norm_days ��� period_MMYY �� ����������������� ���������
        Norm_hours = ����������������_���������(��_���������_����, "�����", ���������3(CDate(Workbooks(ReportName_String).Sheets("������").Cells(Row_��������_������ + 2, �olumn_��������_������).Value)), "hours")
        Norm_days = ����������������_���������(��_���������_����, "�����", ���������3(CDate(Workbooks(ReportName_String).Sheets("������").Cells(Row_��������_������ + 2, �olumn_��������_������).Value)), "days")
        
        ' ��������� ������
        rowCount = Row_���������_����� + 9
        ' Do While InStr(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, �olumn_���).Value, "������������� ����") = 0
        Do While (InStr(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, �olumn_���).Value, "������������� ����") = 0) Or (rowCount > 500)
        
          ' ���� ��� ��������� �����
          If Not IsEmpty(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, column_���������_�����).Value) Then
            
            ' �������, ��������,
            FullName = Workbooks(ReportName_String).Sheets("������").Cells(rowCount, �olumn_���).Value
            
            ' ��������� (���������)
            Position = Workbooks(ReportName_String).Sheets("������").Cells(rowCount + 2, �olumn_���).Value
            
            ' ��������� �����
            Personnel_Number = Workbooks(ReportName_String).Sheets("������").Cells(rowCount, column_���������_�����).Value
            
            ' ���������� ��, ���
            Working_days = CInt(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, �olumn_���������� + 1).Value)
                        
            ' ���������� ��, ����
            Working_hours = CDbl(Workbooks(ReportName_String).Sheets("������").Cells(rowCount + 1, �olumn_���������� + 1).Value)
            
            '  ������������� ID_Rec:
            ID_RecVar = CStr(Personnel_Number) + "-" + period_MMYY ' ������: 5100313-0120

            ' �������� BASE\Sales
            Call UpdateSales(Personnel_Number, period_MMYY, Working_hours, Working_days, Norm_hours, Norm_days)
            
            ' ���� ����� �� BASE\Sales
            Office_Var = getOfficeFromSales(Personnel_Number)
            
            ' ��������� ������ � BASE\TimeSheets
            Call InsertRecordInBook("TimeSheets", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "Personnel_Number", Personnel_Number, _
                                                "Name", FullName, _
                                                  "Office", Office_Var, _
                                                    "MMYY", period_MMYY, _
                                                      "Working_hours", Working_hours, _
                                                        "Working_days", Working_days, _
                                                          "Norm_days", Norm_days, _
                                                            "Norm_hours", Norm_hours, _
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

                
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = "��������� " + CStr(Personnel_Number) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      ' Next i ' ��������� ����
      
      ' ������� ����� ���������
      
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
    
    ' ��������� BASE\Sales
    CloseBook ("Sales")
        
    ' ��������� BASE\TimeSheets
    CloseBook ("TimeSheets")
        
    ' ��������� BASE\��. ��������� 2020
    CloseBook (��_���������_����)
        
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����7").Range("A1").Select

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

' ������� ��������� ������ �� ����������������� ���������
Function ����������������_���������(In_Book, In_Sheet, In_Month, In_Params) As Double
  
  ' �������������
  ����������������_��������� = 0
  
  ' Row ��������� �����
  Row_����� = rowByValue(In_Book, In_Sheet, In_Month, 100, 100)
        
  ' Column ��������� �����
  Column_����� = ColumnByValue(In_Book, In_Sheet, In_Month, 100, 100)
  
  ' ���� ���� ���
  If In_Params = "days" Then
    ����������������_��������� = CDbl(Workbooks(In_Book).Sheets(In_Sheet).Cells(Row_����� + 3, Column_�����).Value)
  End If
  
  ' ���� ���� ����
  If In_Params = "hours" Then
    ����������������_��������� = CDbl(Workbooks(In_Book).Sheets(In_Sheet).Cells(Row_����� + 6, Column_�����).Value)
  End If
  
End Function

' �������� BASE\Sales
Sub UpdateSales(In_Personnel_Number, In_MMYY, In_Working_hours, In_Working_days, In_Norm_hours, In_Norm_days)
  
  ' ��������� ������
  rowCount = 2
  Do While Not IsEmpty(Workbooks("Sales").Sheets("����1").Cells(rowCount, 1).Value)
    
    ' ��������
    If (Workbooks("Sales").Sheets("����1").Cells(rowCount, 2).Value = In_Personnel_Number) And (Workbooks("Sales").Sheets("����1").Cells(rowCount, 5).Value = In_MMYY) Then
      
      ' Working_hours
      Workbooks("Sales").Sheets("����1").Cells(rowCount, 14).Value = In_Working_hours
      ' Working_days
      Workbooks("Sales").Sheets("����1").Cells(rowCount, 15).Value = In_Working_days
      ' Norm_hours
      Workbooks("Sales").Sheets("����1").Cells(rowCount, 16).Value = In_Norm_hours
      ' Norm_days
      Workbooks("Sales").Sheets("����1").Cells(rowCount, 17).Value = In_Norm_days

    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop

End Sub


' ���� ����� �� BASE\Sales
Function getOfficeFromSales(In_Personnel_Number)

  getOfficeFromSales = ""
  
  ' ���� ����������
  
  ' ��������� ������� ������ In_FieldKeyName - In_FieldKeyValue
  ' ������_������� = ConvertToLetter(ColumnByName(In_BookName, In_Sheet, 1, "Personnel_Number"))
  ' Set searchResults = Workbooks(In_BookName).Sheets(In_Sheet).Columns(������_������� + ":" + ������_�������).Find(In_FieldKeyValue, LookAt:=xlWhole)
  
  Set searchResults = Workbooks("Sales").Sheets("����1").Columns("B:B").Find(In_Personnel_Number, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    ' ���� �� ������� - ���������
  Else
    ' ���� �������, �� ��������
    ' rowCount = searchResults.Row
    getOfficeFromSales = Workbooks("Sales").Sheets("����1").Cells(searchResults.Row, 4).Value
  End If


End Function

' ��������� ������ � ������
Sub setFontInRange(In_FileLCOName, In_LCOSheetsName, In_Range, In_FontName, In_FontSize)
      
  Workbooks(In_FileLCOName).Sheets(In_LCOSheetsName).Range(In_Range).Font.Name = In_FontName
  Workbooks(In_FileLCOName).Sheets(In_LCOSheetsName).Range(In_Range).Font.Size = In_FontSize
  Workbooks(In_FileLCOName).Sheets(In_LCOSheetsName).Range(In_Range).NumberFormat = "#,##0"
  Workbooks(In_FileLCOName).Sheets(In_LCOSheetsName).Range(In_Range).Font.ThemeColor = xlThemeColorLight1

End Sub

' ������������ ��������� �� ������ ��� ������� � ���
Sub createTaskFroWeekOffice()
  
  ' ������ �� ������������ ���
  If MsgBox("������������ ��������� �� " + CStr(weekEndDate(Date) - 2) + " ��� ������� � ���?", vbYesNo) = vbYes Then
    
    ' ====
    currOffice = ""
    ' �������� ����������
    �������_������_������������ = 0
    
    ' ������ ������ �����������
    rowCount = 9
    Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
    
      ' ������� ����
      If currOffice <> ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value Then
        
        ' ���� currOffice <> ""
        If currOffice <> "" Then
          
          ' *** ������� ��������� �� ����� ***
          ' 1) ��
          If �������_������_������������ > 0 Then
            Call �������_������_�_���������_����������("������ �.", Date, "������ ������ �� " + currOffice + " �� ����� " + CStr(Round(�������_������_������������, 0)))
          End If
          
          ' �������� ����������
          �������_������_������������ = 0
        End If
        
        ' ����� �������� �����
        currOffice = ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value
      End If
      
      ' ���� ������ ������ �������� �����, �� ��������� �������
      If currOffice = ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value Then
          
          ' ������ ������ �������� �� ���������:
          ' 1) ��
          �������_������_������������ = �������_������_������������ + (ThisWorkbook.Sheets("����7").Cells(rowCount, 5).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 6).Value)
          
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
      Application.StatusBar = "������ " + CStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 1).Value) + "..."
      DoEventsInterval (rowCount)

    Loop
    
    ' ������� ��������� �� ���������� �����
    Call �������_������_�_���������_����������("������ �.", Date, "������ ������ �� " + currOffice + " �� ����� " + CStr(Round(�������_������_������������, 0)))
         
    Application.StatusBar = ""
    
    
    ' ��������� � �������� ������� ������ ��� ����
    MsgBox ("��������� ������������!")

  End If
  
End Sub

' ������������ ��������� �� ������ ��� ������� � ��� (������ �������)
Sub createTaskFroWeekOffice2()
  
  ' ��������� � �������� ������� ������ ��� ����
  MsgBox ("��������! ���������� �������� Cadr Emission ����� �������!")
  
  ' ������ �� ������������ ���
  If MsgBox("������������ ��������� �� �������� ������ �� " + CStr(weekEndDate(Date) - 2) + " ��� ������� � ���?", vbYesNo) = vbYes Then
    
    
    ' ������� ���������
    �������_��������� = 0
    
    ' ���� �� 5-�� ������
    For i = 1 To 5
      
      ' ������ ������ �� 1 �� 5
      Select Case i
        Case 1 ' �� ����������
          officeNameInReport = "���������"
          responsibleName = getFromAddrBook("�������1", 3)
          row_��_����8 = getRowFromSheet8("���������", "� �.�. ��������� � ��") ' 25 ' � �.�. ��������� � ��
          row_��������_����8 = getRowFromSheet8("���������", "������ �� ��������� �����") ' 43
          row_�����_�_�����_����5 = 39
        Case 2 ' �� �����������
          officeNameInReport = "����������"
          responsibleName = getFromAddrBook("���2", 3)
          row_��_����8 = getRowFromSheet8("����������", "� �.�. ��������� � ��") ' 63 � �.�. ��������� � ��
          row_��������_����8 = getRowFromSheet8("����������", "������ �� ��������� �����") ' 81
          row_�����_�_�����_����5 = 40
        Case 3 ' �� ����������������
          officeNameInReport = "���������������"
          responsibleName = getFromAddrBook("�������3", 3)
          row_��_����8 = getRowFromSheet8("���������������", "� �.�. ��������� � ��") ' 101 ' � �.�. ��������� � ��
          row_��������_����8 = getRowFromSheet8("���������������", "������ �� ��������� �����") ' 119
          row_�����_�_�����_����5 = 41
        Case 4 ' �� ����������������
          officeNameInReport = "���������������"
          responsibleName = getFromAddrBook("�������4", 3)
          row_��_����8 = getRowFromSheet8("���������������", "� �.�. ��������� � ��") ' 139 ' � �.�. ��������� � ��
          row_��������_����8 = getRowFromSheet8("���������������", "������ �� ��������� �����") ' 157
          row_�����_�_�����_����5 = 42
        Case 5 ' �� ������-����
          officeNameInReport = "�����-����"
          responsibleName = getFromAddrBook("�������5", 3)
          row_��_����8 = getRowFromSheet8("�����-����", "� �.�. ��������� � ��") ' 177 ' � �.�. ��������� � ��
          row_��������_����8 = getRowFromSheet8("�����-����", "������ �� ��������� �����") ' 195
          row_�����_�_�����_����5 = 43
      End Select
    
    
    ' �������� ����������
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_��� = 0
    ����_������_��_������ = 0
    
    ' ������ ������ �����������
    rowCount = 9
    Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
    
      ' ���� ��� ������� ����
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value = officeNameInReport Then
        
        ' ������ �������� �� ���������
        ' 1) ��
        �������_�� = �������_�� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 5).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 6).Value)
        ' 2) ��������� �����
        �������_�� = �������_�� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 15).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 16).Value)
        ' 3) ��������� �����
        �������_�� = �������_�� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 20).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 21).Value)
        ' 4) ��
        �������_�� = �������_�� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 25).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 26).Value)
        ' 5) ��
        �������_�� = �������_�� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 30).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 31).Value)
        ' 6) ���
        �������_��� = �������_��� + (ThisWorkbook.Sheets("����7").Cells(rowCount, 45).Value - ThisWorkbook.Sheets("����7").Cells(rowCount, 46).Value)
        
        
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
      Application.StatusBar = "������ " + officeNameInReport + ": " + CStr(rowCount) + "..."
      DoEventsInterval (rowCount)

    Loop
    
    Application.StatusBar = "������������ ������ ��������� " + CStr(i) + "..."

    ' ���� ������ ������
    ����_������_������ = weekStartDate(Date)
    ' ���� ��������� ������
    ����_���������_������ = ����_������_������ + 4
    ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dates(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
    �������_�������_���� = Working_days_between_dates(����_������_������, Date_last_day_month(����_������_������), 5)
          
    ' ������� ��������� �� �������� �����
    ' 1) ��
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ������ ��������������� �������� � ������� ������ �� ����� �� ����� " + CStr(����_��_������) + " ���.���.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 2) ��
    ' ������ �� �� �����
    �������_������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 10).Value, 0)
    ����_������_��_������ = Round(�������_������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_������_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "������� ������ �� ��������� ����� �� ����� " + CStr(����_������_��_������) + " ��.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' ������ ����� �� ����� row_�����_�_�����_����5
    
    
    ' ��������� �� ����
    ' ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    ' If ����_��_������ > 0 Then
    '   Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ��������� ��������� ���� �� ����� " + CStr(����_��_������) + " ��. ������ ������ � �� �� ����� 50%.")
      ' ������� ���������
    '   �������_��������� = �������_��������� + 1
    ' End If
     
    
    ' 3) ��
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ��������� ������ ��������� ���� �� ����� " + CStr(����_��_������) + " ��.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 4) ��
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ����������� ��������-����� � ���-�� �� ����� " + CStr(����_��_������) + " ��.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 5) ��
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "������� ������������� ����� �� ����� " + CStr(����_��_������) + " ��.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    ' 6) ���
    ����_���_������ = Round(�������_��� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ������� ��� �� ����� " + CStr(����_���_������) + " ��.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    ' 7) �� ' (�� ����8 ����� �� ������� ����� 5 ������� ������� row_��_����8 = 177 ���� ' � �.�. ��������� � ��)
    �������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_��_����8, 9).Value _
                   + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 1, 9).Value _
                     + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 2, 9).Value _
                       + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 3, 9).Value _
                         + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 4, 9).Value _
                           - (ThisWorkbook.Sheets("����8").Cells(row_��_����8, 10).Value _
                               + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 1, 10).Value _
                                 + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 2, 10).Value _
                                   + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 3, 10).Value _
                                     + ThisWorkbook.Sheets("����8").Cells(row_��_����8 + 4, 10).Value), 0)

                           
    
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ��������� ������������� ������ �� ����� " + CStr(����_��_������) + " ���.���.")
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
              
    Application.StatusBar = ""
              
              
    Next i
         
    Application.StatusBar = ""
        
    ' ��������� � �������� ������� ������ ��� ����
    MsgBox ("��������� � ���������� " + CStr(�������_���������) + " ������������!")

    ' ������� �� ���� ����
    Call goToSheet����
  
    ' ������� � ����� ����� � �����������
    ThisWorkbook.Sheets("����").Range("AF77").Select

  End If
  
End Sub

' ������ ����� �� ����� � �������� �� ����7
Function getDataFromSheet7(In_Office, In_ProductName_����7)
  
  ' �������� ��������
  getDataFromSheet7 = 0
  
  ' ����� � ����� �� ����������
  rowCount = rowByValue(ThisWorkbook.Name, "����7", "����� 7.1", 100, 100) + 3
  
  ' ������� ������� � ���������
  ColumnCount = ColumnByValue(ThisWorkbook.Name, "����7", In_ProductName_����7, 100, 100)
  
  ' ������������ ���� - ���� ������� ����, ���� ������� ����, �� ���� ������� � ������������� ��������
  Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 1).Value)
    
    ' ��������� ����
    If InStr(ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value, In_Office) <> 0 Then
      ' ��������� �������� ��������
      getDataFromSheet7 = getDataFromSheet7 + ThisWorkbook.Sheets("����7").Cells(rowCount, ColumnCount).Value
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop
    
End Function


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����7_���()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������ � ���..."
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "����� ������� ���������� ���/���� �� ������� �������� " + strDDMM(Date) + "-" + strDDMM(Date + 4) ' str��_MM_YY2(Date + 4)

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#��� #���_������"

    ' ����-�������� (!!!)
    attachmentFile = ""
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("�������1,���2,�������2,���3,�������3,���4,�������4,���5,�������5", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� �������������� ����� ������� ���������� (���) ��� ���/���� �� �������� ��������� �� ������ � " + strDDMM(Date) + " �� " + strDDMM(Date + 4) + " *. " + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ������� ��������� � ������, ������ ���������� ������ �� " + strDDMM(Date) + " � ��������� �������������� ����������!" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "* - ��� ������������ �� ������ ����� ������ �� ������������� �������� �� " + ((Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))) + " �." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ����������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
    ' ������ �������
    Application.StatusBar = ""
     
  ' End If
  
End Sub

' �������� ��� � �����
Sub ��������_����7_���_�_�����()

    ' ��������� ��� � �����?
    If MsgBox("��������� ��� � �����?", vbYesNo) = vbYes Then
    
      ' ��������
      Call ��������_Lotus_Notes_����7_���
    
    End If ' ��������� ��� � �����?


End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����7_���()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������ � ���..."
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "�������������� �������� ������� ���/���� �� ������� �������� �� " + ������������(CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10)))

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#��� #���_�����"

    ' ����-�������� (!!!)
    attachmentFile = ""
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("�������1,���2,�������2,���3,�������3,���4,�������4,���5,�������5", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� �������������� �������� ������� (���) ��� ���/���� �� �������� ��������� �� " + ������������(CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ������� �� ������� ����������." + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ����������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
    ' ������ �������
    Application.StatusBar = ""
     
  ' End If
  
End Sub

' �������� ��� � �����
Sub ��������_����7_���_�_�����()

    ' ��������� ��� � �����?
    If MsgBox("��������� ��� � �����?", vbYesNo) = vbYes Then
    
      ' ��������
      Call ��������_Lotus_Notes_����7_���
    
    End If ' ��������� ��� � �����?


End Sub

' ����� ����������� � ����� �� �����7
Function �����_�����������_�_�����_����7(In_NumberOffice) As Integer
  
  �����_�����������_�_�����_����7 = 0
  
  ' "����� 7.1"
  row_�����_7_1 = rowByValue(ThisWorkbook.Name, "����7", "����� 7.1", 10, 10)
  
  ' 1 - ���������
  getNameOfficeByNumber2_Var = getNameOfficeByNumber2(In_NumberOffice)
  
  rowCount_����7 = row_�����_7_1 + 3
  Do While (ThisWorkbook.Sheets("����7").Cells(rowCount_����7, 1).Value) <> ""
  
    ' t1 = ThisWorkbook.Sheets("����7").Cells(rowCount_����7, 4).Value
  
    If InStr(ThisWorkbook.Sheets("����7").Cells(rowCount_����7, 4).Value, getNameOfficeByNumber2_Var) <> 0 Then
      �����_�����������_�_�����_����7 = �����_�����������_�_�����_����7 + 1
    End If
  
    ' ��������� ������
    rowCount_����7 = rowCount_����7 + 1
    ' Application.StatusBar = CStr(ThisWorkbook.Sheets("����7").Cells(recIn����7, 2).Value) + "..."
    ' DoEventsInterval (rowCount_����1)
          
  Loop
  
  ' t = 0
  
End Function

' ���� �� ����������� � ����� (���/����)
Function ����_����_���_����(In_NumberOffice) As Integer
  
  ����_����_���_���� = 0
  
  Select Case In_NumberOffice
    Case 1
      ����_����_���_���� = 3
    Case 2
      ����_����_���_���� = 2
    Case 3
      ����_����_���_���� = 2
    Case 4
      ����_����_���_���� = 3
    Case 5
      ����_����_���_���� = 3
  End Select

  
End Function

