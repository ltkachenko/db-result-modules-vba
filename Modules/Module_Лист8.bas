Attribute VB_Name = "Module_����8"
' *** ���� 8 ***

' *** ���������� ���������� ***
Public numStr_����8 As Integer
Public ����������_�����_��������_��_����8 As Byte
Public ����������_�����_��������_�����_��_����8 As Byte
Public ������_���_�����_�_DB As String
Public ������_���_�������_��_�����_�_DB As String
Public dateDB As Date
Public ������_����_������ As Boolean
Public ������_����_������_Date As Date


' ***                       ***

' ���������� �� DB
Sub ����������_��_DB()
      
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult, ID_RecVar, StringInSheet, SheetName_String, ������������_�������_���� As String
Dim i, rowCount, row_DP3_�����, column_TAB_OK, column_���, column_DP3_�����, column_DP4_�����, recIn����7, ����������_�����, ���_���_���� As Integer
Dim finishProcess As Boolean
' Dim dateDB As Date
        
        
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
    ThisWorkbook.Sheets("����8").Activate
    
    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "����������", 1, Date)
    If CheckFormatReportResult = "OK" Then
      
      ' ���� ���������
      dateDB = CDate(Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
      dateDB_����7 = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))

      ' ���������� - ���� "�� ������:" � "M9"
      Call ����_��_������_����8
      ' � N9
      ThisWorkbook.Sheets("����8").Range("N9").Value = "���.������"

      ' ��������� ������ (�� A1 - ����� �� ��������� �� 07.07.2020)
      ThisWorkbook.Sheets("����8").Cells(5, 2).Value = "���������� ����� �� �������� (Dashboard_��_New) �� " + Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10) + " �."
      ThisWorkbook.Sheets("����8").Range("P2").Value = Replace(ThisWorkbook.Sheets("����8").Cells(5, 2).Value, " (Dashboard_��_New)", "")
            
      ' � M8 ������� ���� �� ������� ����
      ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dates(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
      �������_�������_���� = Working_days_between_dates(Date, Date_last_day_month(Date), 5)
      '
      ThisWorkbook.Sheets("����8").Range("M8").Value = "����: " + CStr(�������_�������_����)
        
      ' ������ �� ������� ����
      ThisWorkbook.Sheets("����8").Range("L5").Value = WeekNumber(Date)
        
      ' ������������� ����������
      ������_���_�����_�_DB = ""
      ������_���_�������_��_�����_�_DB = ""
        
      ' ��������� ��������� �� ������
      ' �������� - �����
      ' ThisWorkbook.Sheets("����8").Range("O9").Value = PreviousWeek(dateDB)
      ' �������� - Q
      ThisWorkbook.Sheets("����8").Range("O9").Value = PreviousWeek2(dateDB)
        
      ' ������� ������ ������
      ' ������� (���� A-M, ������ �� T)
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") + 3), "T" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") - 2))
      
      ' 1. �� ����������
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("�� ����������", "�� ����������") + 3), "T" + CStr(getRowFromSheet8("�� �����������", "�� �����������") - 1))
      
      ' 2. �� �����������
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("�� �����������", "�� �����������") + 3), "T" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
      
      ' 3. �� ����������������
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "T" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
      
      ' 4. �� ����������������
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "T" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") - 1))
      
      ' 5. �� ������-����
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") + 3), "T" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") - 2))
      
      ' 6. ��� ���������
      Call clear�ontents2(ThisWorkbook.Name, "����8", "A" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + 3), "T" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + (getRowFromSheet8("�� �����������", "�� �����������") - getRowFromSheet8("�� ����������", "�� ����������"))))
      
      ' ��������� �������� �������� �� ������ � ���
      Call ���������_��������_��������_��_������_�_���
              
      ' �������� ������ ��� �� ����� "������������ �������_�������"?
      StringInSheet = "������������ �������_�������"
      SheetName_String = FindNameSheet(ReportName_String, StringInSheet)
      If SheetName_String <> "" Then
    
        ' ��������� �� ����� "3. ������������ �������_�������" ������ �� ������ ��
        Workbooks(ReportName_String).Sheets(SheetName_String).PivotTables("������� �������1").PivotFields("DP3_�����_new").PivotItems("��������� ��1").ShowDetail = True
        
        ' ��������� ������� "����1" �� �����������
        row_���������_��1 = rowByValue(ReportName_String, SheetName_String, "��������� ��1", 100, 100)
        column_���������_��1 = ColumnByValue(ReportName_String, SheetName_String, "��������� ��1", 300, 300)
        Workbooks(ReportName_String).Sheets(SheetName_String).Cells(row_���������_��1, column_���������_��1 + 1).ShowDetail = True
        
      Else
        ' ���� � DB ���� �� ������
        Call �_DB_����_��_������(StringInSheet)
      End If
        
      ' ���������
      For i = 1 To 6
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
          Case 6 ' ����� �� ��� ����������
            officeNameInReport = "����� �� ��� ����������"
            
        End Select
        
        ' ������� ����� ������ � ������������� �����
        row_���� = getRowFromSheet8(officeNameInReport, officeNameInReport)
        
        ThisWorkbook.Sheets("����8").Cells(row_���� + 1, 5).Value = quarterName(CDate(Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))) ' 3 ��. 2020 �.
        ThisWorkbook.Sheets("����8").Cells(row_���� + 1, 9).Value = "����� (" + ���������(CDate(Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))) + ")" '����� (��������)
        ThisWorkbook.Sheets("����8").Cells(row_���� + 2, 6).Value = "���� �� " + Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 5)
        ThisWorkbook.Sheets("����8").Cells(row_���� + 2, 10).Value = ThisWorkbook.Sheets("����8").Cells(9, 6).Value
        
      Next i
      
      ' ��������� BASE\Sales
      OpenBookInBase ("Sales_Office")
            
      ' ��������� BASE\Sales
      OpenBookInBase ("Sales")
            
      ' ��������� BASE\Products
      OpenBookInBase ("Products")
            
            
      ' ������� ����� ������ � ������������� �����
      row_��_��������� = getRowFromSheet8("�� ����������", "�� ����������")
      row_��_���������� = getRowFromSheet8("�� �����������", "�� �����������")
      ������_�����_����� = row_��_���������� - row_��_���������
            
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

        ' ���������� ����� ������ � ����� ����� (���������� � ���� ��� ������� ������ �����)
        ���_���_���� = 0
      
        ' ��������� �������������� ����� ��������� ������� ����������������
        ����������_�����_��������_��_����8 = 0
      
        ' ���������� �1 ���������� ����� (���_���_���� = 1)
        StringInSheet = "���������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.11 ���������� �����"
        If SheetName_String <> "" Then
          
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("���������� ����� 18+"), _
                                             "���������� ����� 18+", _
                                               "��", _
                                                 "��.", _
                                                    0, _
                                                     "", _
                                                       "������� �� 18+, ��._������� ", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("���������� ����� 18+"), _
                                             "�������� �� 18+, ��._������� ", _
                                               "��������_��", _
                                                 "��.", _
                                                   0.2, _
                                                     "", _
                                                       "�������� �� 18+, ��._������� ", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
          ' ������� StringInSheet � ���������� ������_���_�����_�_DB
          ' Call �_DB_����_��_������(StringInSheet)
        End If

        
        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------

        ' ���������� �2 �� (���_���_���� = 2)
        StringInSheet = "���������������  �������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.1 ���������������  �������"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������������� �������"), _
                                             "��������������� �������", _
                                               "��", _
                                                 "���.���.", _
                                                   0.2, _
                                                     "������, ���.���._�����", _
                                                       "������, ���.���._�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          
          ' � �.�. �� DSA
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("� �.�. �� DSA"), _
                                             "� �.�. �� DSA", _
                                               "��_DSA", _
                                                 "���.���.", _
                                                    0, _
                                                     " DSA_������, ���.���._�����", _
                                                       " DSA ������, ���.���._�������", _
                                                         6, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
          ' �� ������, ��.
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ ��"), _
                                             "������ ��", _
                                               "������_��_��", _
                                                 "��.", _
                                                    0, _
                                                     "������, ��._�����", _
                                                       "������, ��._�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)

          
          ' (3) ������ ������ ����/���� �� �������� ����� � ����7 � ������� ������ ��� �������� officeNameInReport
          ' ���� ���������
          If False Then
          
            ���_���_���� = ���_���_���� + 1 ' (3)
            ' ��������� ������� - ���� ��������� ��������� �� ����7 = ����8
            ' If dateDB = dateDB_����7 Then
          
            Call ����_����_��_����7(officeNameInReport, _
                                      (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                        "2.1", _
                                          dateDB)
          
            ' (3) ������ ������ ����/���� �� ������� �� BASE\Sales � ������� ������ ��� �������� officeNameInReport
            Call ����_����_Q_��_Sales(officeNameInReport, _
                                      (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                        "2.1", _
                                          dateDB)
          End If
        
          
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   
                                                                   
                                                                   
        ' ���������� "������ ��"
        StringInSheet = "���������������  �������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.1 ���������������  �������"
        If SheetName_String <> "" Then
        
          ' ���� �� ����� "���������������  �������" ������� " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", �� ��� ����� ������ ������
          If ColumnByValue(ReportName_String, SheetName_String, " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", 1000, 1000) <> 0 Then

            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ ��"), _
                                             "������ ��", _
                                               "������_��", _
                                                 "��.", _
                                                   0, _
                                                     "������_�����", _
                                                       "������_�������", _
                                                         0, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          End If
          
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
             
             
        ' ���������� "�� PA_�������_�������" - ������ � DB � ����� ��� - ������ ���� 2021
        ' StringInSheet = "���������������  �������"
        ' SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.1 ���������������  �������"
        ' If SheetName_String <> "" Then
        
        '   ' ���� �� ����� "���������������  �������" ������� " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", �� ��� ����� ������ ������
        '   If ColumnByValue(ReportName_String, SheetName_String, " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", 1000, 1000) <> 0 Then
        
        '     ���_���_���� = ���_���_���� + 1
        '     Call DB_UniversalSheetInDB(ReportName_String, _
        '                              SheetName_String, _
        '                                officeNameInReport, _
        '                                  (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
        '                                    ����������������("�� PA_�������_�������"), _
        '                                      "�� PA_�������_�������", _
        '                                        "��_PA_���_���", _
        '                                          "��.", _
        '                                            0, _
        '                                              "PA_������� �������", _
        '                                                "", _
        '                                                  0, _
        '                                                    "������", _
        '                                                      0, _
        '                                                        0, _
        '                                                          0, _
        '                                                            0, 1, 1)
        '   End If
          
        ' Else
          ' ���� � DB ���� �� ������
        '   Call �_DB_����_��_������(StringInSheet)
        ' End If

        ' ���������� "������������� ��������� � ��"
        StringInSheet = "���������������  �������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.1 ���������������  �������"
        If SheetName_String <> "" Then
        
          ' ���� �� ����� "���������������  �������" ������� " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", �� ��� ����� ������ ������
          If ColumnByValue(ReportName_String, SheetName_String, " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", 1000, 1000) <> 0 Then

            ���_���_���� = ���_���_���� + 1
            ' Call DB_UniversalSheetInDB(ReportName_String, _
            '                          SheetName_String, _
            '                           officeNameInReport, _
            '                             (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
            '                               ����������������("������������� ���� � ��"), _
            '                                 "������������� ���� � ��", _
            '                                   "����_��_%", _
            '                                     "%", _
            '                                       0, _
            '                                         " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����)", _
            '                                           " % ������������� ���������_����� * (������ ����-������ ����+������ ����-������ ��+������ ��-������ ����) ", _
            '                                             0, _
            '                                               "������", _
            '                                                 -1, _
            '                                                   19, _
            '                                                     85, _
            '                                                       85, 1, 1)
            
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������������� ���� � ��"), _
                                             "������������� ���� � ��", _
                                               "����_��_%", _
                                                 "%", _
                                                   0, _
                                                     "������_�������", _
                                                       "������_�������", _
                                                         0, _
                                                           "��������� ��1", _
                                                              34, _
                                                                47, _
                                                                  85, _
                                                                    85, 1, 1)
          
          End If
          
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� " AR %_���� " (�����)
        StringInSheet = "���������������  �������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          ����������������_��_AR_���� = ����������������("�� AR ����")
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������_��_AR_����, _
                                                             "�� AR ����", _
                                                               " AR %_���� ", _
                                                                 "��_AR_����", _
                                                                   "%", _
                                                                     0, _
                                                                      "�����")
          
          Call DB_getParamFromUniversalSheetInDB2(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������_��_AR_����, _
                                                             "�� AR ����", _
                                                               " AR %_���� ", _
                                                                 "��_AR_����", _
                                                                   "%", _
                                                                     0, _
                                                                      "�������", _
                                                                        14)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "���������� ������ %"
        StringInSheet = "���������������  �������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("���������� ������ %"), _
                                                             "���������� ������ ��", _
                                                               " ���������� ������ %", _
                                                                 "����������_������_��", _
                                                                   "%", _
                                                                     0, _
                                                                      "�������")
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------
            
            
        ' ���������� "��������� �����"
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.2 ��������� �����": "�������������� �����, ��._�����", "�������������� �����, ��._�������"
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������� ����� (�����.)"), _
                                             "��������� ����� (�����.)", _
                                               "��", _
                                                 "��.", _
                                                   0.1, _
                                                     "�������������� �����, ��._�����_�����", _
                                                       "�������������� �����, ��._�������_�����", _
                                                        4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������� ����� (�����.)"), _
                                             "� �.�. �� ����", _
                                               "��_����", _
                                                 "��.", _
                                                   0, _
                                                     "�������������� �����, ��._�����_���� (� �.�. CRM, DIGITAL, ��)", _
                                                       "�������������� �����, ��._�������_���� (� �.�. CRM, DIGITAL, ��)", _
                                                        6, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������� ����� (�����.)"), _
                                             "           �� DSA", _
                                               "��_DSA", _
                                                 "��.", _
                                                   0, _
                                                     "�������������� �����, ��._�����_DSA", _
                                                       "�������������� �����, ��._�������_DSA", _
                                                        4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������� ����� (�����.)"), _
                                             "           �� OPC", _
                                               "��_OPC", _
                                                 "��.", _
                                                   0, _
                                                     "�������������� �����, ��._�����_OPC", _
                                                       "�������������� �����, ��._�������_OPC", _
                                                        4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("�� � �� (�����.)"), _
                                             "           �� � ��", _
                                               "��_��_�����", _
                                                 "��.", _
                                                    0, _
                                                     "�������������� �����, ��._�����_�� � ��", _
                                                       "�������������� �����, ��._�������_�� � ��", _
                                                        4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("�� � �� (�����.)"), _
                                             "           �� � �������", _
                                               "��_�������", _
                                                 "��.", _
                                                    0, _
                                                     "�������������� �����, ��._�����_�� � �������", _
                                                       "�������������� �����, ��._�������_�� � �������", _
                                                        4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� "������ � ��" - ������
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.2 ��������� �����"
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ � ��"), _
                                             "������ � ��", _
                                               "��_��", _
                                                 "��.", _
                                                    0, _
                                                     "������ � ��_�����", _
                                                       "������ � ��_�������", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "������ � ��" (��) - ���������
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.2 ��������� �����"
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ � �� (�����.)"), _
                                             "������ � �� (�����.)", _
                                               "��_��_�����", _
                                                 "��.", _
                                                    0, _
                                                     "������ � ��_�����", _
                                                       "������ � ��_�������", _
                                                        0, _
                                                          "��������� ��1", _
                                                             1, _
                                                               1, _
                                                                 0, _
                                                                   0, 2, 2)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� "������ ��"
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.2 ��������� �����"
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ �� ��������� �����"), _
                                             "������ �� ��������� �����", _
                                               "������_��", _
                                                 "��.", _
                                                    0, _
                                                     "������_�����", _
                                                       "������_�������", _
                                                         4, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "�� ���-�� ���� � ����� "
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�� ���-�� ���� � �����"), _
                                                             "�� ���-�� ���� � �����", _
                                                               "���-�� ���� � ����� ", _
                                                                 "��_����_�����", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
            
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� �� ���-�� �������� ���� �� ����� (���_���_����=40) & ' ���������� �28 �� ���-�� �������� ���� �� ������� (���_���_����=40) - ���� ��?
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�� ���-�� ��������"), _
                                                             "�� ���-�� ��������", _
                                                               "���-�� �������� ���� �� �����", _
                                                                 "��_������_�����", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------

            
        ' ���������� ��
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.3 ��������� �����"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          ' Call DB_UniversalSheetInDB(ReportName_String, _
          '                            SheetName_String, _
          '                              officeNameInReport, _
          '                                (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
          '                                  ����������������("��������� ����� (�����.)"), _
          '                                    "��������� ����� (�����.)", _
          '                                      "��", _
          '                                        "��.", _
          '                                          0, _
          '                                            "�������������� �����, ��._�����", _
          '                                              "�������������� �����, ��._�������", _
          '                                                4, _
          '                                                  "��������� ��1", _
          '                                                    0, _
          '                                                      0, _
          '                                                        0, _
          '                                                          0, 1, 1)
        
          ' Call DB_UniversalSheetInDB(ReportName_String, _
          '                           SheetName_String, _
          '                             officeNameInReport, _
          '                               (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
          '                                 ����������������("��������� ����� (�����.)"), _
          '                                   "��������� ����� (�����.)", _
          '                                     "��", _
          '                                       "��.", _
          '                                         0, _
          '                                           "�����", _
          '                                             "�������", _
          '                                               4, _
          '                                                 "��������� ��1", _
          '                                                   5, _
          '                                                     5, _
          '                                                       0, _
          '                                                         0, 1, 1)
        
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������� ����� (�����.)"), _
                                             "��������� ����� (�����.)", _
                                               "��", _
                                                 "��.", _
                                                   0, _
                                                     "�������������� �����, ��._�����  ", _
                                                       "�������������� �����, ��._������� ", _
                                                         4, _
                                                           "��������� ��1", _
                                                             15, _
                                                               15, _
                                                                 0, _
                                                                   0, 1, 1)
        
    
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "��� �������������� ���������� ������"
        StringInSheet = "���"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' 8.13 ���
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1

          ' ������ ������� - ����� DB_getParamFromUniversalSheetInDB - ��������! Sub DB_getParamFromUniversalSheetInDB(In_ReportName_String, In_Sheets, In_���������_�������_�����, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Param_Name_In_DB, In_Product_Code, In_Unit, In_Weight, In_Period)
          ' Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
          '                                          SheetName_String, _
          '                                            "��������� ��1", _
          '                                              officeNameInReport, _
          '                                                (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
          '                                                  ����������������("���"), _
          '                                                    "���", _
          '                                                      "���������� ���, ��. (�� ������� ���������� ����)", _
          '                                                        "���", _
          '                                                          "��.", _
          '                                                            0, _
          '                                                             "�������")
        

          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("���"), _
                                             "���", _
                                               "���", _
                                                 "��.", _
                                                    0, _
                                                     "", _
                                                       "������ ��, ��. (�� ������� ���������� ����)", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)


        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� "������ �� ��������� �����"
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.3 ��������� �����"
        If SheetName_String <> "" Then
                
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ �� ��������� �����"), _
                                             "������ �� ��������� �����", _
                                               "������_��", _
                                                 "��.", _
                                                    0, _
                                                     "������_�����", _
                                                       "������_�������", _
                                                         0, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If




        ' ���������� "�� ���-�� ���� � ����� "
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�� ���-�� ���� � �����"), _
                                                             "�� ���-�� ���� � �����", _
                                                               "���-�� ���� � ����� ", _
                                                                 "��_����_�����", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
            
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "�� ���-�� �������� ���� �� �����"  & ' ���������� "�� ���-�� �������� ���� �� �������" - ���� ��?
        StringInSheet = "��������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�� ���-�� ��������"), _
                                                             "�� ���-�� ��������", _
                                                               "���-�� �������� ���� �� �����", _
                                                                 "��_������_�����", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
            
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        

        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------

        
        ' ���������� �5 (6) �� (���_���_����=6)
        StringInSheet = "��"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.10 ��"
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("��������-����"), _
                                             "��������-����", _
                                               "��", _
                                                 "��.", _
                                                   0, _
                                                     "��_�����", _
                                                       "��_�������", _
                                                         4, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


            
        ' ���������� ��
        StringInSheet = "������������� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.5 ������������� �����"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                      SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������������� �����"), _
                                             "������������� �����", _
                                               "��", _
                                                 "��.", _
                                                   0, _
                                                     "������������� �����, �������� � �����, ��._�����", _
                                                       "������������� �����, �������� � �����, ��._�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------


        ' ���������� �7 (8) OPC (���_���_����=8)
        StringInSheet = "OPC"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.9 OPC"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("Orange Premium Club"), _
                                             "Orange Premium Club", _
                                               "OPC", _
                                                 "��.", _
                                                   0, _
                                                     "OPC, ��._�����", _
                                                       "OPC, ��._�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB2(ReportName_String, _
                                                   SheetName_String, _
                                                     "��������� ��1", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("OPC_��������"), _
                                                             "�������� OPC", _
                                                               "OPC, ��._�������", _
                                                                 "OPC_��������", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�������", _
                                                                        6)

          
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------
       
                                                               
        
        ' ���������� �12 (13) ������� ������ (���_���_����=13) - �������� �� ������� � "����3"
        ' StringInSheet = "������� ������"
        ' SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.4 ������� ������"
        ' If SheetName_String <> "" Then
        
        '   ���_���_���� = ���_���_���� + 1
        '   Call DB_UniversalSheetInDB(ReportName_String, _
        '                              SheetName_String, _
        '                                officeNameInReport, _
        '                                  (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
        '                                    ����������������("������� ������"), _
        '                                      "������� ������", _
        '                                        "���", _
        '                                          "���.���.", _
        '                                            0, _
        '                                              "��������, ���.���._�����", _
        '                                                "��������, ���.���._�������", _
        '                                                  0, _
        '                                                    "��������� ��1", _
        '                                                      0, _
        '                                                        0, _
        '                                                          0, _
        '                                                            0, 1, 1)
        '
        '
        ' Else
        '   ' ���� � DB ���� �� ������
        '   Call �_DB_����_��_������(StringInSheet)
        ' End If
                                                                   

        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        ' Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------


        ' ���������� �13 (14) ���� (3.10 ��) (���_���_����=14)
        StringInSheet = "��"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.10 ��"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("���� ��������"), _
                                             "���� ��������", _
                                               "��", _
                                                 "��.", _
                                                   0, _
                                                     "������ �� �����", _
                                                       "������ �� �������", _
                                                         0, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   

        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------

        ' ���������� �14 (15) ������������ �����
        StringInSheet = "��� �����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "2. ��� �����"
        If SheetName_String <> "" Then
          
                    
          
          ' ���� �� ����� "��� �����" ������� "��������� � ��������", �� ��� ������ ������ ������
          If ColumnByValue(ReportName_String, SheetName_String, "�����", 1000, 1000) = 0 Then
            ���_���_���� = ���_���_���� + 1 ' (���_���_����=15)
            ' (������ ������ DB 2019 ����)
            MsgBox ("��������! ������ ������ ����� ��� �����!")
            ' Call DB_UniversalSheetInDB(ReportName_String, SheetName_String, officeNameInReport, (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), 14, "������������ �����", "��", "���.���.", 0.2, "", "���.�����, ���. ���. ���� �������", 0, "��������� ��1", 0, 0, 0, 0)
            ' Call DB_UniversalSheetInDB(ReportName_String, SheetName_String, officeNameInReport, (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), 14, "������������ �����", "��", "���.���.", 0.2, "", "���� ���� �������", 0, "��������� ��1", 0, 0, 0, 0)
            Call DB_UniversalSheetInDB(ReportName_String, SheetName_String, officeNameInReport, (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), 14, "������������ �����", "��", "���.���.", 0.2, "", "�����", 0, "��������� ��1", 0, 0, 0, 0, 1, 1)
          End If ' ���� �� ����� "��� �����" ������� "��������� � ��������", �� ��� ������ ������ ������
          
          
          ' ���� �� ����� "��� �����" ������� "��������� � ��", �� ��� ����� ������ ������ (���_���_����=15)
          If ColumnByValue(ReportName_String, SheetName_String, "�����", 1000, 1000) <> 0 Then
          
            ' (����� ������ DB 2020 ����)
            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������������ �����"), _
                                             "������������ �����", _
                                               "��", _
                                                 "���.���.", _
                                                   0.15, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             39, _
                                                               39, _
                                                                 0, _
                                                                   0, 1, 1)
        
        
            ' ���������� �14.1 (16) ������������ ����� - ��������� � �� "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=16)
            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("� �.�. ��������� � ��"), _
                                             "� �.�. ��������� � ��", _
                                               "��_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
           ' ���������� �14.2 (17) ������������ ����� - ���_���� "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=17)
           ���_���_���� = ���_���_���� + 1
           Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ���_����"), _
                                             "           ���_����", _
                                               "��_���_����", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             4, _
                                                               4, _
                                                                 0, _
                                                                   0, 1, 1)
        
            
            ' ���������� �14.3 (18) ������������ ����� - ���_���� "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=18)
            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ���_����"), _
                                             "           ���_����", _
                                               "��_���_����", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             8, _
                                                               8, _
                                                                 0, _
                                                                   0, 1, 1)

        
          ' ���������� �14.4 (19) ������������ ����� - ���������� ����������� "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=19)
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ��"), _
                                             "           ��", _
                                               "��_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         9, _
                                                           "��������� ��1", _
                                                             12, _
                                                               12, _
                                                                 0, _
                                                                   0, 1, 1)
          
     
          
          ' C DB 16.08.2021 ��� ���
          ' ���������� �14.5 (20) ������������ ����� - ������ ������� "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=20)
          ' ���_���_���� = ���_���_���� + 1
          ' Call DB_UniversalSheetInDB(ReportName_String, _
          '                            SheetName_String, _
          '                              officeNameInReport, _
          '                               (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
          '                                 ����������������("           ��"), _
          '                                   "           ��", _
          '                                     "��_��", _
          '                                       "���.���.", _
          '                                         0, _
          '                                           "�����", _
          '                                             "�������", _
          '                                               3, _
          '                                                 "��������� ��1", _
          '                                                   16, _
          '                                                     16, _
          '                                                       0, _
          '                                                         0, 1, 1)
        
          ' ���������� �14.5 (20+) ������������ ����� - �� (MASS)
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           �� (MASS)"), _
                                             "           �� (MASS)", _
                                               "��_��_MASS", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         0, _
                                                           "��������� ��1", _
                                                             26, _
                                                               26, _
                                                                 0, _
                                                                   0, 1, 1)
        
           
            ' ���������� �14.6 (21) ������������ ����� - ���, ���, �� (Affluent) "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=21)
            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ���, ���, �� (Affluent)"), _
                                             "           ���, ���, �� (Affluent)", _
                                               "��_���_���_��_Affluent", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             22, _
                                                               22, _
                                                                 0, _
                                                                   0, 1, 1)
        

            ' ���������� �14.7 (22) ������������ ����� - �� (Affluent) "2. ��� �����" (����� ������ DB 2020 ����) (���_���_����=22)
            ���_���_���� = ���_���_���� + 1
            Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           �� (Affluent)"), _
                                             "           �� (Affluent)", _
                                               "��_��_Affluent", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         0, _
                                                           "��������� ��1", _
                                                             29, _
                                                               29, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                                                                              
          End If ' ���� ��� ����� ������ ��������� �� �����
          
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If ' "2. ��� �����"
                                                                   
        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------
                                                                   
                                                                   
        ' ���������� "�������+��" � ������
        StringInSheet = "�������+�����24" ' "�������+��"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' � 08-07-2021 "8.9 �������+�����24", "3.8 �������+��"
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                    SheetName_String, _
                                      officeNameInReport, _
                                        (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                          ����������������("�������+������ �������"), _
                                            "�������+������ �������", _
                                               "���", _
                                                 "��.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         3, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
            
            
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���������� "�������+��" (������)
        StringInSheet = "�������+�����24" ' "�������+��"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.8 �������+��"
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("�������+������ ������� (������)"), _
                                             "�������+������ ������� (������)", _
                                               "���_������", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             47, _
                                                               47, _
                                                                 0, _
                                                                   0, 1, 1)
            
            
          ' "� �.�. ���_������_����"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("� �.�. ��� ������ ����"), _
                                             "� �.�. ��� ������ ����", _
                                               "���_������_����", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             21, _
                                                               21, _
                                                                 0, _
                                                                   0, 1, 1)
          ' "           ��� ������ ��"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ��� ������ ��"), _
                                             "           ��� ������ ��", _
                                               "���_������_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             26, _
                                                               26, _
                                                                 0, _
                                                                   0, 1, 1)
          
          ' "           ��� ������ OPC"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ��� ������ OPC"), _
                                             "           ��� ������ OPC", _
                                               "���_������_OPC", _
                                                 "���.���.", _
                                                   0, _
                                                     "�����", _
                                                       "�������", _
                                                         4, _
                                                           "��������� ��1", _
                                                             31, _
                                                               31, _
                                                                 0, _
                                                                   0, 1, 1)
            
            
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------


        ' ���������� "���_����"
        StringInSheet = "���_����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.6 ���_����"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ ��� ����"), _
                                             "������ ��� ����", _
                                               "���_����", _
                                                 "���.���.", _
                                                   0, _
                                                     "������, ���.���._�����", _
                                                       "������, ���.���._�������", _
                                                        3, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   
        
        ' ���������� "���_����"
        StringInSheet = "���_����"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.7 ���_����"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("������ ��� ����"), _
                                             "������ ��� ����", _
                                               "���_����", _
                                                 "���.���.", _
                                                   0, _
                                                     "������, ���.���._�����", _
                                                       "������, ���.���._�������", _
                                                        3, _
                                                          "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
        
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ���-�� �������� �������
        ' ���������� "���-�� �������� �������"
        StringInSheet = "����-� ��� � ����. ������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "������", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("���-�� ����. ������� (���)"), _
                                                             "���-�� ����. ������� (���)", _
                                                               "���-�� �������� �������", _
                                                                 "��������_������_���_��", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� "����� �������� �������, ���.���."
        StringInSheet = "����-� ��� � ����. ������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "������", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�������� ������ (���)"), _
                                                             "�������� ������ (���)", _
                                                               "����� �������� �������, ���.���.", _
                                                                 "��������_������_���", _
                                                                   "���.���.", _
                                                                     0, _
                                                                      "�����")
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���-�� �������� �������, � �.�. OPC
        ' ���������� "���-�� �������� �������, � �.�. OPC"
        StringInSheet = "����-� ��� � ����. ������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "������", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("���-�� ����. ������� OPC"), _
                                                             "���-�� ����. ������� OPC", _
                                                               " ���-�� �������� �������, � �.�. OPC", _
                                                                 "��������_������_OPC_��", _
                                                                   "��.", _
                                                                     0, _
                                                                      "�����")
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If

        ' ����� �������� �������, ���.���. � �.� OPC
        ' ���������� "����� �������� �������, ���.���. � �.� OPC"
        StringInSheet = "����-� ��� � ����. ������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        If SheetName_String <> "" Then

          ���_���_���� = ���_���_���� + 1
          Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
                                                   SheetName_String, _
                                                     "������", _
                                                       officeNameInReport, _
                                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                                           ����������������("�������� ������ OPC"), _
                                                             "�������� ������ OPC", _
                                                               "����� �������� �������, ���.���. � �.� OPC", _
                                                                 "��������_������_OPC", _
                                                                   "���.���.", _
                                                                     0, _
                                                                      "�����")
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


        ' ���������� "����-� ��� � ����. ������"
        ' StringInSheet = "����-� ��� � ����. ������"
        ' SheetName_String = FindNameSheet(ReportName_String, StringInSheet) '
        ' If SheetName_String <> "" Then

        '   ���_���_���� = ���_���_���� + 1
        '   Call DB_getParamFromUniversalSheetInDB(ReportName_String, _
        '                                            SheetName_String, _
        '                                             "������", _
        '                                               officeNameInReport, _
        '                                                 (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
        '                                                   ����������������("����-� ��� � ����.������"), _
        '                                                     "����-� ��� � ����.������", _
        '                                                       " % �������������_���.���.", _
        '                                                         "�������_���_�_����_������", _
        '                                                           "%", _
        '                                                             0, _
        '                                                              "�����")
        ' Else
          ' ���� � DB ���� �� ������
        '  Call �_DB_����_��_������(StringInSheet)
        ' End If


        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------

        
        
        ' ���������� �15 (23) ��� (���_���_����=23). ������� "���" ����������� �� ������� 2021 ����, ����� ���� ������������� � "�������� ��������"
        StringInSheet = "���"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.5.1 ���"
        ' ���� ������� "���" ���, �� ��������� ������� "�������� ��������"
        StringInSheet = "�������� ��������"
        If SheetName_String = "" Then
          SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.5.1 �������� ��������"
        End If
        ' ���������
        If SheetName_String <> "" Then

          ' ���_���_���� = ���_���_���� + 1
          ' Call DB_UniversalSheetInDB(ReportName_String, _
          '                            SheetName_String, _
          '                              officeNameInReport, _
          '                                (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
          '                                  ����������������("���"), _
          '                                    "���", _
          '                                      "���", _
          '                                        "���.���.", _
          '                                          0, _
          '                                            "��������, ���.���._�����", _
          '                                              "��������, ���.���._�������", _
          '                                                0, _
          '                                                  "������", _
          '                                                    12, _
          '                                                      12, _
          '                                                        0, _
          '                                                          0, 1, 1)
                                                                   
        ���_���_���� = ���_���_���� + 1
        Call DB_UniversalSheetInDB(ReportName_String, _
                                    SheetName_String, _
                                      officeNameInReport, _
                                        (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                          ����������������("�������"), _
                                            "�������", _
                                              "�������", _
                                                "���.���.", _
                                                  0.2, _
                                                    "��������, ���.���._�����", _
                                                      "��������, ���.���._�������", _
                                                        0, _
                                                          "������", _
                                                            24, _
                                                              24, _
                                                                0, _
                                                                  0, 1, 1)
                   
                   
        ' ���������� "������� ������"
        ���_���_���� = ���_���_���� + 1
        Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("� �.�. ������� ������"), _
                                             "� �.�. ������� ������", _
                                               "���", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                   
                   
        ' ���������� "������������� ����"
        ���_���_���� = ���_���_���� + 1
        Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ������������� ����"), _
                                             "           ������������� ����", _
                                               "���_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             3, _
                                                               3, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ' ���������� "���"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ���"), _
                                             "           ���", _
                                               "���_���", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             6, _
                                                               6, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ' ���������� "������ ���"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ������ ���"), _
                                             "           ������ ���", _
                                               "���_�����", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             9, _
                                                               9, _
                                                                 0, _
                                                                   0, 1, 1)
        
          ' ���������� "�����������"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           �����������"), _
                                             "           �����������", _
                                               "���_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             12, _
                                                               12, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
          ' ���������� "������"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ������"), _
                                             "           ������", _
                                               "�������_������", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             15, _
                                                               15, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
          ' ���������� "��"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ��"), _
                                             "           ��", _
                                               "�������_��", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             18, _
                                                               18, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
          ' ���������� "���"
          ���_���_���� = ���_���_���� + 1
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("           ���"), _
                                             "           ���", _
                                               "�������_���", _
                                                 "���.���.", _
                                                   0, _
                                                     "��������, ���.���._�����", _
                                                       "��������, ���.���._�������", _
                                                         0, _
                                                           "������", _
                                                             21, _
                                                               21, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
                                                                   
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   
                                                               
        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------
                                                               
                                                               
        ' ���������� �16 (28) ������� - ���������� ����������� (���_���_����=28)
        StringInSheet = " ������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "10. ������"
        If SheetName_String <> "" Then

          ' 1) ������ MASS
          ���_���_���� = ���_���_���� + 1

          ' ������������_�������_���� = "���� ����, ���. ���."
          ������������_�������_���� = "����, ���. ���."
          
          ' ����� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�����")
          ���������������_������ = ����������������("������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������", _
                                               "���", _
                                                 "���. ���.", _
                                                   0, _
                                                     ������������_�������_����, _
                                                       "", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          
          
          
          ' ����������� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������", _
                                               "���", _
                                                 "���. ���.", _
                                                   0, _
                                                     "", _
                                                       ������������_�������_����, _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
                                                                   
          ' 1) ������ OPC
          ���_���_���� = ���_���_���� + 1

          
          ' "�������� �� "���������" _Affluent"
          ' "�������� �� "���������" _Affluent**"
          ������������_�������_���� = "�������� �� " + Chr(34) + "���������" + Chr(34) + " _Affluent**"
          
          ' ����� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�����")
          ���������������_������ = ����������������("������ OPC")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ OPC", _
                                               "���_OPC", _
                                                 "���. ���.", _
                                                   0, _
                                                     ������������_�������_����, _
                                                       "", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          
          
          
          ' ����������� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ OPC", _
                                               "���_OPC", _
                                                 "���. ���.", _
                                                   0, _
                                                     "", _
                                                       ������������_�������_����, _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                            
                                                                   
          ' 3) ������ ���������� �����
          ���_���_���� = ���_���_���� + 1
          
          ������������_�������_���� = "���������� ������������ � ���*_MASS"
          
          ' ����� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�����")
          ���������������_������ = ����������������("������ ������ ������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ ������ ������", _
                                               "���_��", _
                                                 "��.", _
                                                   0, _
                                                     ������������_�������_����, _
                                                       "", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          
          
          
          ' ����������� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ ������ ������", _
                                               "���_��", _
                                                 "��.", _
                                                   0, _
                                                     "", _
                                                       ������������_�������_����, _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
                                                                   
                                                                   
          
          ' 4) ������ ���������� ����� Affluent
          ���_���_���� = ���_���_���� + 1
          
          ������������_�������_���� = "���������� ������������ � ���*_Affluent"
          
          ' ����� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�����")
          ���������������_������ = ����������������("������ ������ ������ OPC")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ ������ ������ OPC", _
                                               "���_��_OPC", _
                                                 "��.", _
                                                   0, _
                                                     ������������_�������_����, _
                                                       "", _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
          
          
          
          ' ����������� ����/����
          Call DB_swith_to_MonthQuarter2(ReportName_String, SheetName_String, "�������")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ���������������_������, _
                                             "������ ������ ������ OPC", _
                                               "���_��_OPC", _
                                                 "��.", _
                                                   0, _
                                                     "", _
                                                       ������������_�������_����, _
                                                         0, _
                                                           "��������� ��1", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   
                                                               
        ' ���������� �17 (29) ��� (���_���_����=29)
        StringInSheet = "���"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "7.���"
        If SheetName_String <> "" Then
        
          ���_���_���� = ���_���_���� + 1
        
          ' ����� "7.���"
          Call DB_swith_to_MonthQuarter(ReportName_String, SheetName_String, 1, "����_������3")
          ����������������_��� = ����������������("��� (� �.�.OPC)")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������_���, _
                                             "��� (� �.�.OPC)", _
                                               "���", _
                                                 "���.", _
                                                   0, _
                                                     "���� ����, ���.", _
                                                       "", _
                                                         6, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)

        
          ' ������� "7.���"
          Call DB_swith_to_MonthQuarter(ReportName_String, SheetName_String, 2, "����_������3")
          Call DB_UniversalSheetInDB(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������_���, _
                                             "��� (� �.�.OPC)", _
                                               "���", _
                                                 "���.", _
                                                   0, _
                                                     "", _
                                                       "���� ����, ���.", _
                                                         6, _
                                                           "������", _
                                                             0, _
                                                               0, _
                                                                 0, _
                                                                   0, 1, 1)
                                                                   
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If
                                                                   
                                                               
        ' ----------------------------------------------------------------------------------------------------------------------------------
        ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
        Call gorizontalLineII(ThisWorkbook.Name, "����8", (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����) + 1, 2, 12)
        ' ----------------------------------------------------------------------------------------------------------------------------------
                                                                   
                                                                   
        ' ���������� "����" - ������� "������������� ������" ��������� � ����� 2021 (����� � �����)
        ' StringInSheet = "������������� ������"
        ' SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.1 ���������������  �������"
        ' If SheetName_String <> "" Then
        '    ���_���_���� = ���_���_���� + 1
        '    Call DB_UniversalSheetInDB(ReportName_String, _
        '                             SheetName_String, _
        '                               officeNameInReport, _
        '                                 (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
        '                                   ����������������("����"), _
        '                                     "����", _
        '                                       "����", _
        '                                         "��.", _
        '                                           0, _
        '                                             "����", _
        '                                               "", _
        '                                                 0, _
        '                                                   "������", _
        '                                                     0, _
        '                                                       0, _
        '                                                         0, _
        '                                                           0, 1, 1)
        '
        'Else
        '  ' ���� � DB ���� �� ������
        '  Call �_DB_����_��_������(StringInSheet)
        'End If
        
        ' ������� ������� ����� - ����� � ����7
        ���_���_���� = ���_���_���� + 1
        ' DB_����
        Call DB_����(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("����"), _
                                             "����", _
                                               "����", _
                                                 "��.", _
                                                   0)
        
        
        ' *** *** ***
        ' ������� � ����� "������������ �������_�������"
        StringInSheet = "������������ �������_�������"
        SheetName_String = FindNameSheet(ReportName_String, StringInSheet)
        If SheetName_String <> "" Then
          
          ' ���������
          ���_���_���� = ���_���_���� + 1
          Call DB_�������(ReportName_String, _
                                     SheetName_String, _
                                       officeNameInReport, _
                                         (row_��_��������� + 2 + ���_���_����) + ((i - 1) * ������_�����_�����), _
                                           ����������������("�������"), _
                                             "�������", _
                                               "�������", _
                                                 "���.���.", _
                                                   0.15)
          
                                                                   
        Else
          ' ���� � DB ���� �� ������
          Call �_DB_����_��_������(StringInSheet)
        End If


   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
            
      ' ������ �������
      Application.StatusBar = "��� ���������..."
            
      ' *** ������� ���� �� ��� � ��������� ���������

      ' ������������ ����� �� ��� �� ��������� ������ �� ������� �����
      Call ����_��_���
  
      ' *** ������� ���� �� ��� � ��������� ���������
                    
      ' ������ �������
      Application.StatusBar = "�����-�� ������� �� ������..."
      
      
      
      ' ������������ ������� �� ������
      ' ������� "1.1 �����-�� �������  �� ������" ����������� �� 14.02.2021
      If dateDB <= CDate("14.02.2021") Then
      
          StringInSheet = "�����-�� �������  �� ������"
          SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "1.1 �����-�� �������  �� ������"
      
          If SheetName_String <> "" Then
            ' ��������� ������ �� ������ �� 14.02.2021
            Call DB_rating(ReportName_String, _
                         SheetName_String, _
                           getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") + 3, _
                             "������")
          Else
            ' ���� � DB ���� �� ������
            Call �_DB_����_��_������(StringInSheet)
          End If
      End If
      
      ' ����� ���������
      
      ' ��������� ��������� �� ������
      ' ThisWorkbook.Sheets("����8").Range("O9").Value=... (���� ���������� � ������)
      Application.StatusBar = "��������� �� ������..."
      
      ' ������ ������ - ���������� ��������� �� �����
      ' Call ���������_����_��_����
      
      ' ����� ������ - ���������� ����� ������� "����_Q_��_����"
      Call ���������_����_��_����2
      
      ' ������ �������
      Application.StatusBar = "����������� ������..."

      ' ������������ ������ � ����� �� ���������� ���
      Call ����������_���_��

      ' ������������ �������� ��������
      Call ������������_��������_��������(ReportName_String)

      ' ����������� ������� �� ������
      If (����������(Date) = "�����������") Or (ThisWorkbook.Sheets("����0").Range("L2").Value = "1") Then
        Call �����������_�������_��_������
      End If

      ' �������� �������� ����� � ����� ��� ��������
      Call copyDBToSend

      ' ������������ ������ �� ���� ���� - ������� ���
      Call ����������_��_������_Update
      
      ' ���� ������� �����������, ���� ����_0_L2 = "1", �� ��������� "���� �� ������" � ���������� ������
      ' If (����������(Date) = "�����������") Or (ThisWorkbook.Sheets("����0").Range("L2").Value = "1") Then
      If (����������(CDate(ThisWorkbook.Sheets("����0").Range("E2").Value)) = "�����������") Or (ThisWorkbook.Sheets("����0").Range("L2").Value = "1") Then
        ' ���������� ���������� �� ������ � ��������� ���� �� ������
        Call ����������_��_������
        Call ����������_��_���
      Else
        ' ���������� ���������� ����� �� ����� �� ������� DB (��������� BASE\TargetWeek � ������ ����� � ����������_��_������, ����������_��_��� ����� ���������� �� ���������� ��������� ������)
        ' Call ����������_��_������_Update - ������� ���
      End If
      
      ' ������ � S9 �������� ����������� ������, ��� 15.09 ��� ����� "13.09.2021-19.09.2021"
      ThisWorkbook.Sheets("����8").Range("S9").Value = CStr(weekStartDate(dateDB)) + "-" + CStr(dateDB)
      Call �������_��������_��_������
      
      ' ��������
      ' Call ��������_������
      
      ' ������ �������
      Application.StatusBar = "����������..."

      ' ���������� ���������
      ThisWorkbook.Save
        
      ' ��������� BASE\Sales
      CloseBook ("Sales_Office")
                
      ' ��������� BASE\Sales
      CloseBook ("Sales")
      
      ' ��������� BASE\Products
      CloseBook ("Products")
                
      ' ���������� ���������� ���������
      finishProcess = True
      
      ' ������ �������
      Application.StatusBar = ""
           
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False ' ������������
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����8").Range("A1").Select
  
    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D9")
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      ' �������� ���������
      Call ��������_Lotus_Notes_����8
      ' ���������
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub

' ���������� �� ������� DB
Sub DB_UniversalSheetInDB(In_ReportName_String, In_Sheets, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Product_Code, In_Unit, In_Weight, In_ColumnNameMonth, In_ColumnNameQuarter, In_DeltaPrediction, In_���������_�������_�����, In_ColumnNameMonth_��������_����, In_ColumnNameQuarter_��������_����, In_PlanMonth, In_PlanQuarter, In_Fact_Plan_displacement_Month, In_Fact_Plan_displacement_Quarter)
Dim dateDB As Date
    
  ' ***
  ' In_ColumnNameMonth - ������������ ������� � ������ ������, �������� "������, ���.���._�����" ��� "3.6 ���_����". ���� ������ �� ����� ���, �� In_ColumnNameMonth=""
  ' In_ColumnNameQuarter - ������������ ������� � ������ ��������, �������� "������, ���.���._�������" ��� "3.6 ���_����"
  ' In_DeltaPrediction - + ����� �������� �� ������� ���� (������ ��� ��������) � ������� ��������� ������� ���������� � %, �������� ��� "3.6 ���_����" In_DeltaPrediction=3 ("����", "����" (+1), "% ���-�" (+2), "% ���-�_����" (+3) ). ���� ������� "�������" ���, �� In_DeltaPrediction = 0
  ' In_���������_�������_����� - ������������ ��������� �� �����, ��� ������� ���� �������: ��������� ��1, ������������� ��1, ������������ ��1 ...
  ' In_ColumnNameMonth_��������_���� - �������� ������������ ������� In_ColumnNameMonth ����� ������� ������� �� "���� ������", �������� ��� "3.6 ���_����" ��� �������� = 0, � ��� "3.5.1 ���" ��� In_ColumnNameMonth="��������, ���.���._�����" ����� ����� �� "���_�����-����" ����� In_ColumnNameMonth_��������_����=12
  ' In_ColumnNameQuarter_��������_���� - �������� ������������ ������� In_ColumnNameQuarter ����� ������� ������� �� "���� ��������", �������� ���, �������� ��� "3.6 ���_����" ��� �������� = 0, � ��� "3.5.1 ���" ��� In_ColumnNameMonth="��������, ���.���._�������" ����� ����� �� "���_�����-����" ����� In_ColumnNameMonth_��������_����=12
  ' In_PlanMonth - �������� ����� ����� ������, �������� 80% ������������� � ���������. ���� 0, �� ����� �� DB. ���������� - �������� In_ColumnNameMonth_��������_���� ����� = -1
  ' In_PlanQuarter - �������� ����� �������� ������, �������� 80% ������������� � ���������. ���� 0, �� ����� �� DB. ���������� - �������� In_ColumnNameQuarter_��������_���� = -1
  ' In_Fact_Plan_displacement_Month - �������� ����� ������������ ����� �� ������. �� ��������� = 1
  ' In_Fact_Plan_displacement_Quarter - �������� ����� ������������ ����� �� ��������. �� ��������� = 1
  ' ***
    
  ' ���� DB
  dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  ' ���� DB � ����8 (������ ���������)
  dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

  ' �������� ������� BASE\Products
  Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
  ' ������� In_Sheets
  ' 42
  Row_���������_�������_����� = rowByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 300, 300) ' ���� 1000 1000
  ' 2
  Column_���������_�������_����� = ColumnByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 300, 300)
  
  ' ������_���_���_����� - ������� "������, ���.���._�����" (� ������ "����������")
  If In_ColumnNameMonth <> "" Then
    
    ' ���� (BK) 63
    Column_�������_�����_���� = ColumnByValue(In_ReportName_String, In_Sheets, In_ColumnNameMonth, 500, 500) + In_ColumnNameMonth_��������_����  ' "������, ���.���._�����" ���� 1000 1000
    ' ������� ColumnByValue3 - ��� �������� �������� � ������ ������. ���������� - �� �������� �� ���! ������
    ' Column_�������_�����_���� = ColumnByValue3(In_ReportName_String, In_Sheets, In_ColumnNameMonth, 500, 500) + In_ColumnNameMonth_��������_����  ' "������, ���.���._�����" ���� 1000 1000
    
    ' ���� ������� �� ������ - ������ ���������:
    If Column_�������_�����_���� = 0 Then
      
      ' ������� StringInSheet � ���������� ������_���_�����_�_DB
      If InStr(������_���_�������_��_�����_�_DB, In_ColumnNameMonth) = 0 Then
    
        ������_���_�������_��_�����_�_DB = ������_���_�������_��_�����_�_DB + In_ColumnNameMonth + ", "
        ' ������� ���������
        MsgBox ("��������! �� " + In_Product_Name + " �� ������ " + In_ColumnNameMonth + "!")

      End If
    
    End If
    
    ' ���� (BL) 64
    ' Column_�������_�����_���� = Column_�������_�����_���� + 1
    Column_�������_�����_���� = Column_�������_�����_���� + In_Fact_Plan_displacement_Month
    
    ' ������� (BO) 67
    If In_DeltaPrediction <> 0 Then
      Column_�������_�����_������� = Column_�������_�����_���� + In_DeltaPrediction ' (+ 4) �������� In_DeltaPrediction - ��� ����� ������� ������� � ��������� � %
    End If
    
  End If
  
  ' ������_���_���_������� - ������� "������, ���.���._�������" (� ������ "����������")
  ' ���� (CP) 94
  Column_�������_�������_���� = ColumnByValue(In_ReportName_String, In_Sheets, In_ColumnNameQuarter, 500, 500) + In_ColumnNameQuarter_��������_���� ' "������, ���.���._�������" ���� 1000 1000
  ' ��� �������� �������� � ������ - ColumnByValue3. �� �������� �� ���, ������!
  ' Column_�������_�������_���� = ColumnByValue3(In_ReportName_String, In_Sheets, In_ColumnNameQuarter, 500, 500) + In_ColumnNameQuarter_��������_���� ' "������, ���.���._�������" ���� 1000 1000
  
  
  ' ���� (CQ) 95
  ' Column_�������_�������_���� = Column_�������_�������_���� + 1
  Column_�������_�������_���� = Column_�������_�������_���� + In_Fact_Plan_displacement_Quarter
   
  ' ������� (CT) 98
  If In_DeltaPrediction <> 0 Then
    Column_�������_�������_������� = Column_�������_�������_���� + In_DeltaPrediction ' (+ 4) �������� In_DeltaPrediction - ��� ����� ������� ������� � ��������� � %
  End If
  
  ' ������� ������������ �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = In_Product_Name
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
  ' ��� �������, ���� �� �� �������
  If In_Weight <> 0 Then
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).Value = In_Weight
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).HorizontalAlignment = xlCenter
  End If
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = In_Unit
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter

  ' ����������� ���������� - "��������� ��1"
  ����_������ = False
  
  ' ����������� ���������� - In_officeNameInReport ("��2") ������ � "��������� ��1"
  ��2_������ = False

  ' ������� � � ������� "��������� ��1"
  rowCount = Row_���������_�������_����� + 1
  Do While (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "����� ����") = 0) And (Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value))
    
    ' ���� ��� "��������� ��1" - ���������� ������
    If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��������� ��1") <> 0 Then
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).ShowDetail = True
      ����_������ = True
    End If
              
    ' ���� ��� ������� ����
    If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0) And (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��1") = 0) Then
      
      ' ����������� ���������� - In_officeNameInReport ("��2") ������ � "��������� ��1"
      ��2_������ = True
      
      ' ����� �� ���� ������ ������ � �������� �� ����8
      
      ' �������:
      ' If (In_ColumnNameQuarter <> "") Then
      If (In_ColumnNameQuarter <> "") And (Column_�������_�������_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
        
        ' ������� - ����
        If In_PlanQuarter = 0 Then
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
        Else
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = In_PlanQuarter
        End If
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).HorizontalAlignment = xlRight
        

        ' ������� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          
          ' ������� ����
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
          
          ' === ���� ��������� ���� �� ������ - ������� ���� ��������, ����� ����� �� ������� Q � 100%
          If �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0) < 1 Then
            
            ' ������ �������: ������� ����� ������ ���� ������� - �� ������� ���� DB + 7
            ' ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(dateDB + 7, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, 1, 5, 0)
          
            ' ������ ���� �� M9. ������: ��� "���� �� ������: (09.08-15.08.21)" ��� ����� 09.08.2021 (���). ��� ��� DB ��� ������� - 05.08.2021 (����� 4 ���)
            date1FromM9 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 18, 5) + ".20" + Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 30, 2))
          
            ' ������ �������: ������� ����� ������ ���� ������� - �� M9 "���� �� ������: (02.08-08.08.21)" ����� ������ ����
            date2FromM9 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 24, 6) + "20" + Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 30, 2))
            
            ' ���������� DB: �� ����������� (����� ������ ) - 3 ��� = �������!
            date2FromM9 = date2FromM9 - 3
            ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(date2FromM9, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, 1, 5, 0)
            
            ' ����_��������: ���� ������� �����������, �� ����� �� 6-�� ������� ����8, ���� ������� � �.�., �� ����� �� ����_Q_��_����
            ' ���� ���� ������ �� M9 - 4 (���������� ����������) = dateDB_����8, �� ���� Q, ����� �� 6-�� ������� ����8, � ���� ���, �� ����� �� ����_Q_��_����
            If (date1FromM9 - 4) = dateDB_����8 Then
              ����_��������_Var = ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value
            Else
              ����_��������_Var = ����_Q_��_����(getNumberOfficeByName(In_officeNameInReport), In_Product_Code, (date1FromM9 - 4))
            End If
            
            ' ���� ���� ��� ������ �� ������� Q ������, ��� ������� ���� Q, �� ������� �������
            If ����_��_����_���_��������_��������_Var > ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value Then
              
              ' � 13-�� ������� ����� ���� ������
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).Value = ����_��_����_���_��������_��������_Var - ����_��������_Var ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).NumberFormat = "#,##0"
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).HorizontalAlignment = xlRight
              
              ' � 14-�� ������� ����� ���������� ����� ������ (�� 13-�� �������)
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 14).Value = ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value - ����_��������_Var ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 14).NumberFormat = "#,##0"
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 14).HorizontalAlignment = xlRight
            
            End If
          
          End If
          ' ===
          
        Else
          ' ���� ��� %, �� �������� �� 100
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value * 100)
        End If
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).HorizontalAlignment = xlRight
        

        ' ������� - ���������� (� %)
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 3)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).HorizontalAlignment = xlRight
        
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("����8", In_Row_����8, 7, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, 1)
        End If
      
        ' ������� - �������
        If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value <> 0) Then
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_�������).Value
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).HorizontalAlignment = xlRight
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("����8", In_Row_����8, 8, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value, 1)
          
          
        End If
        
        ' ***
        ' ������������ ������� "�������_��������" �� ���� ��������, ���� ��������� �� � %
        If ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value <> "%" Then
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0)
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).HorizontalAlignment = xlRight
        End If
        ' ***
        
        ' ���� �� �������� ���� ����������� ����������, ��������: (In_ColumnNameMonth = "") AND (In_ColumnNameQuarter <>"")
        If (In_ColumnNameMonth = "") And (In_ColumnNameQuarter <> "") Then
        
          ' ������� � Sales_Office
          '  ������������� ID_Rec:
          ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
                        
          ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
          ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
          M_num = Nom_mes_quarter_str(dateDB)
          curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
                                      
          ' ������ ������ � BASE\Sales_Office �� ��.
          Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", strNQYY(dateDB), _
                                                      "Update_Date", dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, _
                                                            "Unit", In_Unit, _
                                                              "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
                                                                "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, _
                                                                  curr_Day_Month_Q, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

        
        End If
        
        
        
      End If
                  
      ' �����:
      If (In_ColumnNameMonth <> "") And (Column_�������_�����_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
        
        ' ����� - ����
        If In_PlanMonth = 0 Then
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value = In_PlanMonth
        End If
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).HorizontalAlignment = xlRight
        
        
        ' ����� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ' ���� ��� %, �� �������� �� 100
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value * 100)
        End If
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).HorizontalAlignment = xlRight
            
        ' ����� - ����������
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, 3)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).HorizontalAlignment = xlRight
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("����8", In_Row_����8, 11, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, 1)
        End If

        ' ����� - ������� (�����, ���.��� � �.�.) ������ ������
        If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value <> 0) Then
      
          PredictionVar = (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value) * Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
                
          ' ����� - �������, %
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).HorizontalAlignment = xlRight
          PredictionPercent = ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("����8", In_Row_����8, 12, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value, 1)
        Else
          
          ' ���� �������� ��� �� �������� � DB
          PredictionVar = 0
          PredictionPercent = 0
        
        End If
      
        ' ������� � Sales_Office
        '  ������������� ID_Rec:
        ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
            
        ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
        curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
            
        ' ������ ������ � BASE\Sales_Office �� ��.
        Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", strMMYY(dateDB), _
                                                      "Update_Date", dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, _
                                                            "Unit", In_Unit, _
                                                              "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                                "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, _
                                                                  "Prediction", PredictionVar, _
                                                                    "Percent_Prediction", PredictionPercent, _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

      End If ' If In_ColumnNameMonth <> "" Then
      
    End If
    
    ' ��������� ������
    Application.StatusBar = In_Product_Code + " " + In_officeNameInReport + ": " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
  
  ' ����������� ���������� - ���� ��� 4 ����� ����, �� ������ �� DB ����� �� ���������
  If (����_������ = False) Then
    
    ' ���� � DB ���� �� ������
    MsgBox ("��������! �� " + In_Product_Name + " �� ������� �����!")

  End If

  ' ����������� ���������� - In_officeNameInReport ("��2") ������ � "��������� ��1"
  If ��2_������ = False Then
    ' �� ������ ���� ��2
    ' t = 0
  
    ' ����������� ���������� ���������� In_ColumnNameMonth, In_ColumnNameQuarter
    If In_ColumnNameMonth <> "" Then
      ' ������� �� ������ ���� ����=0, ����=0, ���.=0%, �������=0%
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value = 0
    End If
  
    ' ����������� ���������� ���������� In_ColumnNameMonth, In_ColumnNameQuarter
    If In_ColumnNameQuarter <> "" Then
      ' ������� �� �������� ���� ����=0, ����=0, ���.=0%, �������=0%
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = 0
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = 0
      
    End If
  
  
  End If


  
End Sub



' �������� ����� ��� �������� � �����
Sub copyDBToSend_with_Msg()
  
  ' ������
  If MsgBox("������������ ���� ��� ��������?", vbYesNo) = vbYes Then
    Call copyDBToSend
    MsgBox ("������ �����������!")
  End If

End Sub


' �������� ����� ��� �������� � �����
Sub copyDBToSend()
Dim TemplatesFile As String

  Application.StatusBar = "�����������..."

  ' ��������� ������ "���������� �����.xlsx"
  If Dir(ThisWorkbook.Path + "\Templates\" + "���������� �����.xlsx") <> "" Then
    ' ��������� ������ Templates\���������� ����� �� ��������
    TemplatesFileName = "���������� �����"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����8").Activate

  ' ��������� ������ �����������
  ThisWorkbook.Sheets("����8").Cells(rowByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100) + 2).Value = _
    getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���,���,������", 2)

  ' ��� ������ �����
  FileDBName = Replace(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 1, 61), ".", "-") + ".xlsx"
  
  ' ��������� - ���� ���� ����, �� ������� ���
  Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName)
  
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  ThisWorkbook.Sheets("����8").Range("Q3").Value = ThisWorkbook.Path + "\Out\" + FileDBName
            
  ' *** ����������� ������ ***
 
  ' ������� ����� ������ � ������������� �����
  row_��_��������� = getRowFromSheet8("�� ����������", "�� ����������")
  row_��_���������� = getRowFromSheet8("�� �����������", "�� �����������")
  row_�����_��_���_��������� = getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������")
  row_������������_�������_��_������ = getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������")
  ������_�����_����� = row_��_���������� - row_��_���������
  
  row_����1_������������_�������_��_������ = rowByValue(FileDBName, "����1", "1. ������������ ������� �� ������", 100, 100)

  ' �������� ������������ ������� �� ������
  countString_����1 = 0
  
  ' ���� � ���. ������������� ��������
  Workbooks(FileDBName).Sheets("����1").Cells(5, 15).Value = "���� " + CStr(ThisWorkbook.Sheets("����8").Range("O9").Value)
  
  
  ' For i = (row_������������_�������_��_������ + 3) To (row_������������_�������_��_������ + 3) + 5
  '
  ' ������� �����
  '  countString_����1 = countString_����1 + 1
  '
  '  For j = 1 To 16 ' � ������ ���.
  '    ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells((row_����1_������������_�������_��_������ + 2) + countString_����1, j)
  '  Next j
  '
  ' Next i
  
  For i = (row_������������_�������_��_������ + 1) To (row_������������_�������_��_������ + 1) + 1 + 5
    
    ' ������� �����
    countString_����1 = countString_����1 + 1
  
    For j = 1 To 9 ' � ������ ���.
      ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells((row_����1_������������_�������_��_������) + countString_����1, j)
    Next j
  
  Next i
  
  
  ' *** �������� ������������ ������� �� ����������� � �����7
  ' ��������� ���� �������� �� ����7 � ����8. ��������, ���� ��� ���������
  dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
  dateDB_����7 = CDate(Mid(ThisWorkbook.Sheets("����7").Range("B5").Value, 40, 10))
  
  If dateDB_����8 = dateDB_����7 Then
    
    ' ��������� �� �� �����������
    Workbooks(FileDBName).Sheets("����1").Cells(14, 1).Value = "��"
    Workbooks(FileDBName).Sheets("����1").Cells(15, 1).Value = "%"
    
    ' ������������ ���������
    For i = 1 To 10
      Workbooks(FileDBName).Sheets("����1").Cells(14, 4 + 5 * (i - 1)).Value = ThisWorkbook.Sheets("����7").Cells(7, 6 + 5 * (i - 1)).Value
      ' Workbooks(FileDBName).Sheets("����1").Cells(14, 9) = ThisWorkbook.Sheets("����7").Cells(7, 11).Value
    Next i
    
    For i = 9 To 24
      
      ' ������������ �������
      For j = 60 To 60
        ThisWorkbook.Sheets("����7").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 7, j - 59)
      Next j
            
      ' ����������
      For j = 3 To 54
        ThisWorkbook.Sheets("����7").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 7, j - 1)
      Next j
      
      ' ����� ��������� � ����������
      For j = 61 To 63
        ThisWorkbook.Sheets("����7").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 7, j - 6)
      Next j
      
    Next i
  End If
  ' *** �������� ������������ ������� �� ����������� � �����7
 
  ' �������� ���������
  ThisWorkbook.Sheets("����8").Cells(5, 2).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(2, 1)
  
  ' ����� 33 ��� ����� ������ � ������� ����������� ������
  
  For k = 1 To 5
    
    ' ������������ �����
    Workbooks(FileDBName).Sheets("����1").Cells(33 + ((k - 1) * ������_�����_�����), 2).Value = Workbooks(FileDBName).Sheets("����1").Cells(33 + ((k - 1) * ������_�����_�����), 2).Value + ThisWorkbook.Sheets("����8").Cells(7 + ((k - 1) * ������_�����_�����), 2).Value
    ' ��������� �����
    ' �������
    Workbooks(FileDBName).Sheets("����1").Cells(33 + 1 + ((k - 1) * ������_�����_�����), 5).Value = ThisWorkbook.Sheets("����8").Cells(7 + 1 + ((k - 1) * ������_�����_�����), 5).Value
    ' �����
    Workbooks(FileDBName).Sheets("����1").Cells(33 + 1 + ((k - 1) * ������_�����_�����), 9).Value = ThisWorkbook.Sheets("����8").Cells(7 + 1 + ((k - 1) * ������_�����_�����), 9).Value
    ' ���� ��
    Workbooks(FileDBName).Sheets("����1").Cells(33 + 1 + 1 + ((k - 1) * ������_�����_�����), 6).Value = ThisWorkbook.Sheets("����8").Cells(7 + 1 + 1 + ((k - 1) * ������_�����_�����), 6).Value
    Workbooks(FileDBName).Sheets("����1").Cells(33 + 1 + 1 + ((k - 1) * ������_�����_�����), 10).Value = ThisWorkbook.Sheets("����8").Cells(7 + 1 + 1 + ((k - 1) * ������_�����_�����), 10).Value
        
    ' ������� ������ � ��������
    Workbooks(FileDBName).Sheets("����1").Cells(33 + 1 + ((k - 1) * ������_�����_�����), 15).Value = "���� " + CStr(ThisWorkbook.Sheets("����8").Range("O9").Value)
        
  Next k
 
   
   
  ' �������� ������
  For k = 1 To 5
    
    ' For i = 10 + ((k - 1) * ������_�����_�����) To 44 + ((k - 1) * ������_�����_�����)
    For i = (row_��_��������� + 3) + ((k - 1) * ������_�����_�����) To (row_��_���������� - 1) + ((k - 1) * ������_�����_�����)
      
      ' ���������� �������� �������
      For j = 1 To 12
        ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 26, j)
      Next j
      
      ' ���������� �������� ������� � ��������
      For j = 15 To 18
        ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 26, j)
      Next j
      
      
    Next i
      
      ' ������ �������
      Application.StatusBar = "����������� ������ " + CStr(k) + "..."
      DoEvents
    
  Next k
  
  ' ��������� ����� �� ��� ���������� (�����������!)
  
  ' ������� �� ����1 "8. ������� "
  row_8_������� = rowByValue(Workbooks(FileDBName).Name, "����1", "8. ������� ", 1000, 3)
  
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_�������, 2).Value = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_���������, 2).Value
  
  ' �������
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_������� + 1, 5).Value = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + 1, 5).Value
  ' �����
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_������� + 1, 9).Value = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + 1, 9).Value
  ' ���� ��
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_������� + 2, 6).Value = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + 2, 6).Value
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_������� + 2, 10).Value = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + 2, 10).Value
  ' ������� ������ � ��������
  Workbooks(FileDBName).Sheets("����1").Cells(row_8_������� + 1, 15).Value = "���� " + CStr(ThisWorkbook.Sheets("����8").Range("O9").Value)

  ' �������� �� ������ ����� �� ��� ����������
  For i = (row_�����_��_���_��������� + 3) To (row_�����_��_���_��������� + ������_�����_����� - 1)
      
      ' ���������� �������� �������
      For j = 1 To 12
        ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 16, j)
      Next j
      
      ' ���������� �������� ������� � ��������
      For j = 15 To 18
        ThisWorkbook.Sheets("����8").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 16, j)
      Next j
      
      ' ������ �������
      Application.StatusBar = "����������� ������ ��� " + CStr(i) + "..."
      DoEvents
      
  Next i

  ' �������� ���� Capacity (����6)
  
  
  ' ***
                    
  ' �������� �����
  Workbooks(FileDBName).Close SaveChanges:=True

  ' ����������� ���������
  Application.StatusBar = "�����������!"
  Application.StatusBar = ""

End Sub

' ������������ ������� �� ������
Sub DB_rating(In_ReportName_String, In_Sheets, In_Row_����8, In_���������_�������_�����)
Dim dateDB As Date
        
  ' ***
  ' In_���������_�������_����� - ������������ ��������� �� �����, ��� ������� ���� �������: ��������� ��1, ������������� ��1, ������������ ��1 ...
  ' ***
    
  ' �� A1 "����� �� ��������� �� 02.09.2020" ����� ����, ���� �� ��� �� ������� �����, �� ����� � ����� "����������"
  If Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(1, 1).Value <> "" Then
    dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(1, 1).Value, 23, 10))
  Else
    dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  End If
  
  ' ������� In_Sheets
  ' 42
  Row_���������_�������_����� = rowByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  ' 2
  Column_���������_�������_����� = ColumnByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  
  ' ������� � � ������� "��������� ��1"
  rowCount = Row_���������_�������_����� + 3
  Do While InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� - 2).Value, "����� ����") = 0
                
    ' ���� ��� ������� ����
    If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "���������") <> 0) Or _
          (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "����������") <> 0) Or _
            (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "���������������") <> 0) Or _
              (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "���������������") <> 0) Or _
                (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "�����-����") <> 0) Then
      
      ' ������� ���������� ������������� �������� � ������ In_Row_����8
      ' �����
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� - 3).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1)
      ' ������� �����
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlDiagonalDown).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlDiagonalUp).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlEdgeLeft).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlEdgeTop).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlEdgeBottom).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlEdgeRight).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlInsideVertical).LineStyle = xlNone
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Borders(xlInsideHorizontal).LineStyle = xlNone
      ' ����
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2)
      ' ���������� (11 ��.)
      ' ����
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 1).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 2).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 3).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 4).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 5).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 6).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 7).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 8).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 9).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11)
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 10).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12)
      
      ' ������������ ������� �����, ������� ������ ���� �� ����� 90%
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_����� + 11).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13)

      ' ���������� � ���������� ������ BASE\Sales_Office
      In_officeNameInReport = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value
      In_Product_Name = "������������ �������"
      In_Product_Code = "�������"
      ����_��_����� = Round(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13) * 100, 2)
      
      '  ������������� ID_Rec:
      ID_RecVar = CStr(CStr(getNumberOfficeByName2(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
            
      ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
      curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
            
      ' ������ ������ � BASE\Sales_Office �� ��.
      Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName2(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", getShortNameOfficeByName(In_officeNameInReport), _
                                                    "MMYY", strMMYY(dateDB), _
                                                      "Update_Date", dateDB, _
                                                        "Product_Code", In_Product_Code, _
                                                          "Plan", "90", _
                                                             "Unit", "%", _
                                                               "Fact", ����_��_�����, _
                                                                 "Percent_Completion", "", _
                                                                   "Prediction", "", _
                                                                     "Percent_Prediction", "", _
                                                                       curr_Day_Month, ����_��_�����, _
                                                                         "", "", _
                                                                           "", "", _
                                                                             "", "", _
                                                                               "", "", _
                                                                                 "", "", _
                                                                                   "", "")


      ' ����������� �������� ������ ��������� ������
      In_Row_����8 = In_Row_����8 + 1
      
    End If
    
    ' ��������� ������
    Application.StatusBar = "������������ ������� �� ������ " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
  
  
End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����8()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������ � �������� ��������..."
  
  ' ������ �������� �����������
  If ThisWorkbook.Sheets("����8").Range("N7").Value = 1 Then
    �������������� = "�����"
  Else
    �������������� = "�������"
  End If
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����8")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����8")

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����8").Cells(3, 17).Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����8").Cells(rowByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "���������� ����� �� �������� � ������� ������ � ����������� (���� �� ��������)." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������, �������� � ������������ �������, � ��������� ���������� ����� " + �������_�����_���� + " ����� 100% �� " + �����������_����_�������_�����(DashboardDate()) + " �.:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + ������_��������() + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "������� �� �����������, � ��������� ���������� ����� ������ ����� 90% �� " + CStr(Date_last_day_month(DashboardDate())) + " �.:"
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + ������_��������2() + Chr(13)
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


' ������������ ������� � DB �����/������� �� �����
Sub DB_swith_to_MonthQuarter(In_ReportName_String, In_Sheets, In_Period, In_����_������)
        
        ' ***
        ' In_Period = 1 - �����, In_Period = 2 - �������
        ' In_����_������ = ����_������5 - ��� ��������, In_����_������ = ����_������3 - ��� ���
        ' ***
                
        ' ������������ �����/������� -> �����
        If In_Period = 1 Then

          ' �����
          Select Case In_����_������
          
          Case "����_������3" ' ���
            
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�����").Selected = True
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�������").Selected = False
            
          Case "����_������5" ' ������
        
            ' ������ ���� ��, ��� True - ����� ������� ������� ������
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�����").Selected = True
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�������").Selected = False
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("(�����)").Selected = False
        
          End Select

          
        
        End If
        
        ' ������������ �����/������� -> �������
        If In_Period = 2 Then
          
          ' �������
          Select Case In_����_������
          
          Case "����_������3" ' ���
            
            ' ������ ���� ��, ��� True - ����� ������� ������� ������
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�������").Selected = True
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�����").Selected = False
            
          Case "����_������5" ' ������
        
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�������").Selected = True
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("�����").Selected = False
            Workbooks(In_ReportName_String).SlicerCaches(In_����_������).SlicerItems("(�����)").Selected = False
        
          End Select

        
        End If
        
               
    ' With ActiveWorkbook.SlicerCaches("����_������3")
    '     .SlicerItems("�����").Selected = True
    '     .SlicerItems("�������").Selected = False
    ' End With
    
    ' With ActiveWorkbook.SlicerCaches("����_������3")
    '     .SlicerItems("�������").Selected = True
    '     .SlicerItems("�����").Selected = False
    ' End With

        
End Sub

' � �����8 - ���, ��� � �������� ����� 100%
Function ������_��������() As String
Dim rowCount As Integer
 
  ' ����������� �������� �������� ��� �����
  ���_�������� = 1 ' 0.9
 
  ' ��������� DB
  ������_�������� = ""
  ������_�_������ = ""
  
  ' ���� �������� �������� N7="1"
  If ThisWorkbook.Sheets("����8").Range("N7").Value = 1 Then
    ' �����
    �������_�������� = 12
  Else
    ' �������
    �������_�������� = 8
  End If
  
  
  ' 1. ����� ������������� ������
  ������_�_������ = ������_�_������ + "1. ����� ������������� ������: "
  
  ' ���������� ����� 18+
  row_����������_�����_18 = getRowFromSheet8("����� �� ��� ����������", "���������� ����� 18+")
  ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(row_����������_�����_18, 2).Value) + " (���� " + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_����������_�����_18, 7).Value * 100, 0)) + "%, ������� " + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_����������_�����_18, 20).Value * 100, 0)) + "%), "
  
  ' �������� �� 18+, ��._�������
  row_��������_��_18_��_������� = getRowFromSheet8("����� �� ��� ����������", "�������� �� 18+, ��._������� ")
  ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(row_��������_��_18_��_�������, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_��������_��_18_��_�������, 7).Value * 100, 0)) + "%), "
  
  '            �� � ��
  row_��_�_�� = getRowFromSheet8("����� �� ��� ����������", "           �� � ��")
  ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(row_��_�_��, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_��_�_��, 20).Value * 100, 0)) + "%)" + Chr(13) + Chr(13)
    
  ' 2. ����� ���
  ������_�_������ = ������_�_������ + "2. ����� ���: "
  
  ' � �.�. �� DSA
  row_��_DSA = getRowFromSheet8("����� �� ��� ����������", "� �.�. �� DSA")
  If ThisWorkbook.Sheets("����8").Cells(row_��_DSA, �������_��������).Value < ���_�������� Then
    ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(row_��_DSA, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_��_DSA, �������_��������).Value * 100, 0)) + "%), "
  End If
  
  '            �� DSA
  row_��_DSA = getRowFromSheet8("����� �� ��� ����������", "           �� DSA")
  If ThisWorkbook.Sheets("����8").Cells(row_��_DSA, �������_��������).Value < ���_�������� Then
    ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(row_��_DSA, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(row_��_DSA, �������_��������).Value * 100, 0)) + "%)"
  End If
  
  ������_�_������ = ������_�_������ + Chr(13) + Chr(13)
  
  ' 3. �����. ��������� ������� ����������
  ������_�_������ = ������_�_������ + "3. �����: "
  
  rowCount = rowByValue(ThisWorkbook.Name, "����8", "��������� ���", 100, 100) + 2
  Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0)
    
    ' ���� ���������� ������ �����
    If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������") Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������")) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�����-����") <> 0)) Then
      
      ������_�������� = ������_�������� + ������_�_������ + Chr(13) + Chr(13)
      ������_�_������ = "- " + cityOfficeName(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + ": "
    
    End If
    
    ' ���� �������� �������� N7="1"
    If ThisWorkbook.Sheets("����8").Range("N7").Value = 1 Then
      ' �����
      �������_�������� = 12
    Else
      ' �������
      �������_�������� = 8
    End If
    
    
    ' �������� ���������� �������� � ������ �� ��������
    ' 100%
    ' If (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "") Then
    ' 90%
    ' If ((ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 0.9) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "")) Then
    If ((ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "")) Then
      
      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
    
    End If
    
    ' �������
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") And ((ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value < 0.9)) Then

      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value * 100, 0)) + "%), "
      
    End If
    
    
    ' ����� ��� ����� �� �������� � �����
    ' �������� ���������� �������� � ������ �� ��������
    ' If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������+������ �������") And ((ThisWorkbook.Sheets("����8").Cells(rowCount, 12).Value < 0.9)) Then
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������+������ ������� (������)") And ((ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������)) Then

      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
      
    End If
    
    ' ���
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������ ��� ����") And (ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������) Then
          
      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
      
    End If
    
    ' ���
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������ ��� ����") And (ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������) Then
          
      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
      
    End If
    
    
    ' �������
    ' �������� ���������� �������� � ������ �� ��������
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������") And (ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������) Then
          
      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
      
    End If
    
    ' ������ ������ ������
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������ ������ ������") And (ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value < ���_��������) Then
          
      ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, �������_��������).Value * 100, 0)) + "%), "
      
    End If
    
    ' ��������� ������
    Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
  
  Loop
  
  ' �����
  ������_�������� = ������_�������� + ������_�_������ + Chr(13)
  
  Application.StatusBar = ""
  
  
End Function

' ���������� ��� �������� � �����
Function ����(In_Str) As String
  
  ���� = In_Str
 
        Select Case In_Str
          
          Case "���������� ����� 18+"
            ���� = "�� �����"
          Case "�������� �� 18+, ��._������� "
            ���� = "�������� ��"
          Case "           �� � ��"
            ���� = "�� � ��"
          Case "� �.�. �� DSA"
            ���� = "�� DSA"
          Case "           �� DSA"
            ���� = "�� DSA"
          Case "           �� � �������"
            ���� = "�� � �������"
          Case "��������������� �������"
            ���� = "��"
          Case "��������� ����� (�����.)"
            ���� = "��"
          Case "��������� ����� (�����.)"
            ���� = "��"
          Case "��������-����"
            ���� = "��"
          Case "Orange Premium Club"
            ���� = "OPC"
          Case "������������ �����"
            ���� = "���.�����"
          Case "�������+������ �������"
            ���� = "�������"
          Case "           ��� ������ ��"
            ���� = "��� �� ��"
          Case "������������� �����"
            ���� = "��"
          Case "���������� ����� 18+"
            ���� = "�����.�����"
          Case "������ ������ ������"
            ���� = "������.�����"
          Case "           �� OPC"
            ���� = "�� OPC"
          Case "������ ������ ������ OPC"
            ���� = "������.����� OPC"
            
        End Select
  

End Function

' ���������� ��� �������� � �����
Function ����2(In_Str) As String
  
  ����2 = In_Str
 
        Select Case In_Str
          Case "��������������� �������"
            ����2 = "������.�������"
          Case "��������� ����� (�����.)"
            ����2 = "����.�����"
          Case "��������� ����� (�����.)"
            ����2 = "��"
          Case "��������-����"
            ����2 = "��"
          Case "Orange Premium Club"
            ����2 = "OPC"
          Case "������������ �����"
            ����2 = "���.�����"
          Case "�������+������ �������"
            ����2 = "�������"
          Case "������������� �����"
            ����2 = "��"
          Case "���������� ����� 18+"
            ����2 = "�����.�����"
          Case "������ ������ ������"
            ����2 = "����.�����"
          Case "�������� �� 18+, ��._������� "
            ����2 = "�����.��"
            
        End Select
  

End Function


' ������� � ������ ����� �� ��
Sub ����8_�_������()
  ThisWorkbook.Sheets("����8").Range("M8").Select
End Sub

' ������� � ������� �� �����8
Sub ����8_�_�������()
  
  ' ������ ������ �����
  row_��_���������� = getRowFromSheet8("�� �����������", "�� �����������")
  
  ' ������������
  ActiveWindow.SmallScroll Down:=row_��_���������� - 1
  
End Sub

' ������� � �������������� �� �����8
Sub ����8_�_��������������()
  row_��_��������������� = getRowFromSheet8("�� ����������������", "�� ����������������")
  ' ������������
  ActiveWindow.SmallScroll Down:=row_��_��������������� - 1
End Sub

' ������� � ����� ������� �� �����8
Sub ����8_�_�����_�������()
  row_��_��������������� = getRowFromSheet8("�� ����������������", "�� ����������������")
  ActiveWindow.SmallScroll Down:=row_��_��������������� - 1
End Sub

' ������� � �����-���� �� �����8
Sub ����8_�_�����_����()
  row_��_�����_���� = getRowFromSheet8("�� ������-����", "�� ������-����")
  ' ������������
  ActiveWindow.SmallScroll Down:=row_��_�����_���� - 1
End Sub

' ������� � ��� �� �����8
Sub ����8_�_���_���������()
  row_�����_��_���_��������� = getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������")
  ' ������������
  ActiveWindow.SmallScroll Down:=row_�����_��_���_��������� - 1
End Sub


' ���� � ����� ��������� c ����� 8
Function DashboardDate() As Date
  
  ' ��������� ���
  rowVar = rowByValue(ThisWorkbook.Name, "����8", "��������� ���", 1000, 1000)
  columnVar = ColumnByValue(ThisWorkbook.Name, "����8", "��������� ���", 1000, 1000)
  
  DashboardDate = CDate(Mid(ThisWorkbook.Sheets("����8").Cells(rowVar + 1, columnVar).Value, 52, 10))
  
End Function

' � �����7 - ���, ��� � �������� ����� 100%
Function ������_��������2() As String
Dim rowCount As Byte
 
  ' ������� "����."
  Column_���� = ColumnByValue(ThisWorkbook.Name, "����7", "����.", 100, 100)
 
  ' ��������� DB
  ������_��������2 = ""
  ������_�_������ = ""
  rowCount = rowByValue(ThisWorkbook.Name, "����7", "��������� ���", 100, 100) + 5
  Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 1).Value)
    
    ' ���� � ������� "����." �����
    If IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, Column_����).Value) Then
    
      ' ���
      ������_�_������ = ������_�_������ + " - " + ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value + ": "
    
      ' ������ ������������
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 9).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("��������������� �������") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 9).Value * 100, 0)) + "%), "
      End If
      
      ' ��
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 14).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("���� � ��") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 14).Value * 100, 0)) + "%), "
      End If
      
      ' ��
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 19).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("��������� ����� (�����.)") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 19).Value * 100, 0)) + "%), "
      End If
      
      ' ��
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 24).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("��������� ����� (�����.)") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 24).Value * 100, 0)) + "%), "
      End If
      
      ' ��������-����
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 29).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("��������-����") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 29).Value * 100, 0)) + "%), "
      End If
      
      ' ������������� �����
      ' If ThisWorkbook.Sheets("����7").Cells(rowCount, 34).Value < 0.9 Then
      '   ������_�_������ = ������_�_������ + ����("������������� �����") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 34).Value * 100, 0)) + "%), "
      ' End If
      
      ' ���_���� (������, ���.���.)
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 39).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("���") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 39).Value * 100, 0)) + "%), "
      End If
      
      ' ���_���� (������������ �����)
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 44).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("���") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 44).Value * 100, 0)) + "%), "
      End If
      
      ' ���������� �����������
      If ThisWorkbook.Sheets("����7").Cells(rowCount, 49).Value < 0.9 Then
        ������_�_������ = ������_�_������ + ����("��") + " (" + CStr(Round(ThisWorkbook.Sheets("����7").Cells(rowCount, 49).Value * 100, 0)) + "%), "
      End If
      
      ������_�_������ = ������_�_������ + Chr(13) + Chr(13)
      
    End If ' ���� � ������� "����." �����
      
    ' ��������� ������
    Application.StatusBar = "������ ��������� 2" + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
  
  Loop
  
  ' �����
  ������_��������2 = ������_��������2 + ������_�_������ + Chr(13)
  
  Application.StatusBar = ""
  
  
End Function

' ��������� ����� �� ����� "������������ ������ ������_4��.2020_����"
Sub ���������_������������_������()
Dim row_������������ As Integer

  ' ������ �� ���������� ���������
  If MsgBox("��������� ������������ ������ ������?", vbYesNo) = vbYes Then
    
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
      ThisWorkbook.Sheets("����8").Activate

      ' �������� ����� ������
      CheckFormatReportResult = CheckFormatReport(ReportName_String, "��", 10, Date)
    
      If CheckFormatReportResult = "OK" Then
      
      
        ' ������� ����������� ����������
        
      
        ' ������������ �����
        ' ���� �� 5-�� ������
        ' ��������� ������
        For i = 1 To 5
          ' ������ ������ �� 1 �� 5
          Select Case i
            Case 1 ' �� ����������
              officeNameInReport = "���������"
              row_������������ = getRowFromSheet8("���������", "���������") ' 9
            Case 2 ' �� �����������
              officeNameInReport = "����������"
              row_������������ = getRowFromSheet8("����������", "����������") ' 47
            Case 3 ' �� ����������������
              officeNameInReport = "���������������"
              row_������������ = getRowFromSheet8("���������������", "���������������") ' 85
            Case 4 ' �� ����������������
              officeNameInReport = "���������������"
              row_������������ = getRowFromSheet8("���������������", "���������������") ' 123
            Case 5 ' �� ������-����
              officeNameInReport = "�����-����"
              row_������������ = getRowFromSheet8("�����-����", "�����-����") ' 161
          End Select

          ' *** ����� ��������� ����������� �� ***
          ' 1) 1. ���������� ����� 18+
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��_�����", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 1)
          
          ' 2) 2. ��������������� �������
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 2)
          
          ' 3) 3. ��������� ����� (�����.)
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 3)
          
          ' 4) 4. ��������� ����� (�����.)
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 4)
          
          ' 5) 5. �������� -����
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 5)
          
          ' 6) 7. Orange Premium Club
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "OPC", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 7)
                                                             
          ' 7) 8. ��������� ����� Affluent
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "OPC", _
                                                   4, _
                                                     20, _
                                                       21, _
                                                         22, _
                                                           23, _
                                                             row_������������ + 8)
                                                   
          
          
          ' 9)  14.1    � �.�. ��������� � ��
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��� �����", _
                                                   4, _
                                                     36, _
                                                       37, _
                                                         38, _
                                                           39, _
                                                             row_������������ + 15)
          
          
          ' 10)  14.2               ���_����
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��� �����", _
                                                   4, _
                                                     6, _
                                                       7, _
                                                         8, _
                                                           9, _
                                                             row_������������ + 16)
          
          ' 11) 14.3               ���_����
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��� �����", _
                                                   4, _
                                                     41, _
                                                       42, _
                                                         43, _
                                                           44, _
                                                             row_������������ + 17)
          
          
          ' 12) 14.4               ��
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��� �����", _
                                                   4, _
                                                     16, _
                                                       17, _
                                                         18, _
                                                           19, _
                                                             row_������������ + 18)
          
          ' 13) 14.5               ��
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "��� �����", _
                                                   4, _
                                                     26, _
                                                       27, _
                                                         28, _
                                                           29, _
                                                             row_������������ + 19)
          
          ' 14) 14.6               ���, ���, �� (Affluent)
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "OPC", _
                                                   4, _
                                                     15, _
                                                       16, _
                                                         17, _
                                                           18, _
                                                             row_������������ + 20)
          
          
          ' 15) 14.7               �� (Affluent)
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "OPC", _
                                                   4, _
                                                     10, _
                                                       11, _
                                                         12, _
                                                           13, _
                                                             row_������������ + 21)
          
          
          
          ' 8) 14. ������������ ����� (�����)
          commissionIncomeVar = ThisWorkbook.Sheets("����8").Cells(row_������������ + 15, 5).Value _
                                  + ThisWorkbook.Sheets("����8").Cells(row_������������ + 16, 5).Value _
                                    + ThisWorkbook.Sheets("����8").Cells(row_������������ + 17, 5).Value _
                                      + ThisWorkbook.Sheets("����8").Cells(row_������������ + 18, 5).Value _
                                        + ThisWorkbook.Sheets("����8").Cells(row_������������ + 19, 5).Value _
                                          + ThisWorkbook.Sheets("����8").Cells(row_������������ + 20, 5).Value _
                                            + ThisWorkbook.Sheets("����8").Cells(row_������������ + 21, 5).Value
          
          ThisWorkbook.Sheets("����8").Cells(row_������������ + 14, 5).Value = commissionIncomeVar
           
          ' 16) 16. ������
          Call getDataFromDecompositionPlans(officeNameInReport, _
                                               ReportName_String, _
                                                 "������", _
                                                   4, _
                                                     5, _
                                                       6, _
                                                         7, _
                                                           8, _
                                                             row_������������ + 27)

          
          
          ' *** (�����) ����� ��������� ����������� �� ***
            
   
          ' ������� ������ �� �����
      
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
    
      ' ��������� � ������ M2
      ThisWorkbook.Sheets("����8").Range("A1").Select

      ' ������ �������
      Application.StatusBar = ""
    
      ' ���������� ���������
      ThisWorkbook.Save
          
      ' �������� ���������
      If finishProcess = True Then
        MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
      Else
        MsgBox ("��������� ������ ���� ��������!")
      End If

    End If ' ���� ���� ��� ������
 
  End If
  
End Sub

' ��������� ������ �� ����� ������������ ������
Sub getDataFromDecompositionPlans(In_officeNameInReport, In_ReportName_String, In_Sheets, In_ColOffice, In_Col1, In_Col2, In_Col3, In_Col4, In_rowSheet8)

  ' ���� ��� ������
  ����_������ = False

  ' ����� ������ ��/��2
  rowCount = rowByValue(In_ReportName_String, In_Sheets, "��/��2", 100, 100)
  ' rowCount = 3
  
  Do While (Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_ColOffice).Value)) And (����_������ = False)
  ' Do While Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_ColOffice).Value)
        
    ' ���� ��� ������� ����
    If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_ColOffice).Value, In_officeNameInReport) <> 0 Then
            
      ' ���� ��������
      If In_Col4 <> 0 Then
        ' ����� �� ������� �������� � ��������� � ����8 ������� 5 (���� ��������)
        ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 5).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_Col4).Value
      Else
        ' ���� �������� �������� �� ����� ����� 3-� �������: In_Col1, In_Col2, In_Col3
        ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 5).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_Col1).Value + Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_Col2).Value + Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, In_Col3).Value
      End If
      
      ' �������� ������
      ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 5).HorizontalAlignment = xlRight
      
      ' �������� � ������ ������ + "."
      ' ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 1).NumberFormat = "@"
      ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 1).Value = CStr(ThisWorkbook.Sheets("����8").Cells(In_rowSheet8, 1).Value) + "."
      
      ' ���� ��� ������
      ����_������ = True
      
    End If
        
    ' ��������� ������
    rowCount = rowCount + 1
    Application.StatusBar = In_officeNameInReport + ": " + CStr(rowCount) + "..."
    DoEventsInterval (rowCount)
  Loop


End Sub


' ������������ ��� ��� �����������
Sub ������������_��_���()
  
  If MsgBox("������������ �� ��� ����������� � ������� �� " + ThisWorkbook.Sheets("����8").Range("E8").Value + "?", vbYesNo) = vbYes Then
        
    ' ���� ������������ ���������
    ������ = Date
        
    ' ����� ��
    Count�� = 0
    
    ' *** ***
    ' ���� �� 5-�� ������
    ' ��������� ������
    For i = 1 To 9
      
      ' ������ ������ �� 1 �� 5
      Select Case i
        Case 1 ' �� ����������, ����1
          officeNameInReport = "���������"
          row_������������ = getRowFromSheet8("���������", "������������") ' 9
          functionVar = "�������1"
          row_End = "�� �����������"
        Case 2 ' �� �����������, ���2
          officeNameInReport = "����������"
          row_������������ = getRowFromSheet8("����������", "������������") ' 47
          functionVar = "���2"
          row_End = "�� ����������������"
        Case 3 ' �� �����������, ����2
          officeNameInReport = "����������"
          row_������������ = getRowFromSheet8("����������", "������������") ' 47
          functionVar = "�������2"
          row_End = "�� ����������������"
        Case 4 ' �� ����������������, ���3
          officeNameInReport = "���������������"
          row_������������ = getRowFromSheet8("���������������", "������������") ' 85
          functionVar = "���3"
          row_End = "�� ����������������"
        Case 5 ' �� ����������������, ����3
          officeNameInReport = "���������������"
          row_������������ = getRowFromSheet8("���������������", "������������") ' 85
          functionVar = "�������3"
          row_End = "�� ����������������"
        Case 6 ' �� ����������������, ���4
          officeNameInReport = "���������������"
          row_������������ = getRowFromSheet8("���������������", "������������") ' 123
          functionVar = "���4"
          row_End = "�� ������-����"
        Case 7 ' �� ����������������, ����4
          officeNameInReport = "���������������"
          row_������������ = getRowFromSheet8("���������������", "������������") ' 123
          functionVar = "�������4"
          row_End = "�� ������-����"
        Case 8 ' �� ������-����, ���5
          officeNameInReport = "�����-����"
          row_������������ = getRowFromSheet8("�����-����", "������������") ' 161
          functionVar = "���5"
          row_End = "������������ ������� �� ������"
        Case 9 ' �� ������-����, ����5
          officeNameInReport = "�����-����"
          row_������������ = getRowFromSheet8("�����-����", "������������") ' 161
          functionVar = "�������5"
          row_End = "������������ ������� �� ������"
      End Select
                 
      ' ��������� ������ ���
      Workbooks.Open (ThisWorkbook.Path + "\Templates\��.xlsx")
         
      ' ������� �� ����8
      ThisWorkbook.Sheets("����8").Activate
         
      ' �� B5 "������������ ������� �� ����������� �� 15.07.2020 �." ����� ����
      ������DB = Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 40, 10)
         
      ' ��� ����� � ���
      ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
    
      NameVar = getFromAddrBook(functionVar, 3)
      
      ' ���� NameVar<>""
      If NameVar <> "" Then
      
        Count�� = Count�� + 1
        Application.StatusBar = CStr(Count��) + ". " + NameVar + "..."
      
        FileIPZName = "��_" + NameVar + "_" + CStr(������) + ".xlsx"
        
        ' ��������� - ���� ���� ����, �� ������� ���
        Call deleteFile(ThisWorkbook.Path + "\Out\" + FileIPZName)
        
        Workbooks("��.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileIPZName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
            
        ' ��������� + ���
        Workbooks(FileIPZName).Sheets("����1").Range("F7").Value = getFromAddrBook(functionVar, 1)
        ' ���
        Workbooks(FileIPZName).Sheets("����1").Range("H40").Value = NameVar
        Workbooks(FileIPZName).Sheets("����1").Range("H40").HorizontalAlignment = xlLeft
        ' ����
        ' Workbooks(FileIPZName).Sheets("����1").Range("F9").Value = "�� �" + officeNameInReport + "�"
        ' ���� - "17" ���� 2020 �.
        Workbooks(FileIPZName).Sheets("����1").Range("G10").Value = ������������(������)
        
        ' ����� ��
        ' ���� ��� ���
        If (Mid(functionVar, 1, 3) = "���") Then
          Workbooks(FileIPZName).Sheets("����1").Range("A13").Value = "               � ����� ���������� ������ " + quarterName(������) + " ���������� ������� ��� ���������� ����� ������� � ���������� �������� ������� �� �" + officeNameInReport + "�"
        End If
        ' ���� ��� �������
        If (Mid(functionVar, 1, 7) = "�������") Then
          Workbooks(FileIPZName).Sheets("����1").Range("A13").Value = "               � ����� ���������� ������ " + quarterName(������) + " ���������� ������� ��� ���������� ����� ������� � ���������� �������� ������� ������ �� �" + officeNameInReport + "�"
        End If
        
        ' ��������� - ����            4 ��. 2020
        Workbooks(FileIPZName).Sheets("����1").Range("G16").Value = "����            " + quarterName(������)
        Workbooks(FileIPZName).Sheets("����1").Range("G16").WrapText = True
        Workbooks(FileIPZName).Sheets("����1").Range("G16").ColumnWidth = 12
        
        ' ����� ������� � ��
        �������������� = 0
        ' ��������� � ��
        ����������� = 0
        
        ' ====
        rowCount = row_������������ + 1
        ' Do While Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)
        ' Do While ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> ""
        Do While ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value <> row_End
            
          ' ������� �������
          �������������� = False
            
          ' ���� ��� ���
          If (Mid(functionVar, 1, 3) = "���") And ((ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "���������� ����� 18+") Or (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������� �� 18+, ��._������� ")) Then
            
            ' ������� �������
            �������������� = True
            
          End If
      
          ' �������
          If (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "��������������� �������") Or _
               (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "��������� ����� (�����.)") Or _
                 (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "��������� ����� (�����.)") Or _
                   (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "��������-����") Or _
                     (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "Orange Premium Club") Or _
                       (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "��������� ����� Affluent") Or _
                         (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������������ �����") Or _
                           (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "� �.�. ��������� � ��") Or _
                             (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���_����") Or _
                               (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���_����") Or _
                                 (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ��") Or _
                                   (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ��") Or _
                                     (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���, ���, �� (Affluent)") Or _
                                       (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           �� (Affluent)") Or _
                                         (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Or _
                                           (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������") Or _
                                             (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "������ ������ ������") _
          Then
            
            ' ������� �������
            �������������� = True
            
          End If
          
          ' ������� �������
          If �������������� = True Then
          
            ' ����� ������� � ��
            �������������� = �������������� + 1
          
            ' ������� ����� �� ���������
            ' �
            If Not ((ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "� �.�. ��������� � ��") Or _
                 (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���_����") Or _
                    (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���_����") Or _
                       (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ��") Or _
                          (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ��") Or _
                             (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           ���, ���, �� (Affluent)") Or _
                                (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "           �� (Affluent)")) _
            Then
              ' ��������� � ��
              ����������� = ����������� + 1
              Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 2).Value = CStr(�����������)
            End If
            
            ' ������
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 3).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 3).RowHeight = 15
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 3).HorizontalAlignment = xlLeft
            ' ������� ���������
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 6).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Value
            ' ����
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 7).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Value
            Workbooks(FileIPZName).Sheets("����1").Cells(�������������� + 16, 7).HorizontalAlignment = xlRight
          End If
                  
          ' ��������� ������
          rowCount = rowCount + 1
          DoEventsInterval (rowCount)

        Loop
    
        ' �������� �����
        Workbooks(FileIPZName).Close SaveChanges:=True
    
      End If ' ���� ��� �� ����������� <>""
    
    Next i
    ' ***
    
    ' ������
    Application.StatusBar = ""

    ' =====
    
    MsgBox ("�� � ���������� " + CStr(Count��) + " ��. ������������!")
    
    ' ��������� ���� ��������� � ������� ����? - https://www.excel-vba.ru/chto-umeet-excel/kak-sredstvami-vba-pereimenovatperemestitskopirovat-fajl/
    If MsgBox("����������� ����� �� ����������� � ������� ���� (�������������� �������)?", vbYesNo) = vbYes Then
  
      ' ������ �������
      Application.StatusBar = "����������� � ������� ����..."
    
      Count�� = 0
    
      ' ***
      ' ���� �� 5-�� ������
      ' ��������� ������
      For i = 1 To 9
      
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������, ����1
            functionVar = "�������1"
          Case 2 ' �� �����������, ���2
            functionVar = "���2"
          Case 3 ' �� �����������, ����2
            functionVar = "�������2"
          Case 4 ' �� ����������������, ���3
            functionVar = "���3"
          Case 5 ' �� ����������������, ����3
            functionVar = "�������3"
          Case 6 ' �� ����������������, ���4
            functionVar = "���4"
          Case 7 ' �� ����������������, ����4
            functionVar = "�������4"
          Case 8 ' �� ������-����, ���5
            functionVar = "���5"
          Case 9 ' �� ������-����, ����5
            functionVar = "�������5"
        End Select
                    
        NameVar = getFromAddrBook(functionVar, 3)
      
        ' ���� NameVar<>""
        If NameVar <> "" Then
                    
          Count�� = Count�� + 1
        
          ' ��� ����� � ��
          FileIPZName = ThisWorkbook.Path + "\Out\" + "��_" + NameVar + "_" + CStr(������) + ".xlsx"

          ' ������ �������
          Application.StatusBar = CStr(Count��) + " ����������� " + FileIPZName + "..."
           
          ' ������ �� ����� ���������� ������� �� ����: ��� �������� �����. ��������! ��������� �����������! ���� ��� ����� (���������) �����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ������������ �� _ ����, ��������: ��������� _ �� ��������_01.09.2018�. ���� ��� �������������� ������� /����������/�����������, �� �������� ����� ������ ���� ���������� �������: ������������� ��� _ ��� _ ����, ��������: ������ ���������� _ ������_ 01.09.2019 �, ����_������_01.08.2019�, ����_�������_01.03.2019�
          FileCopy FileIPZName, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\�������������� �������\" + "��_" + NameVar + "_" + CStr(������) + ".xlsx"
   
        End If ' ���� NameVar<>""
   
      Next i
      ' ***
   
      Application.StatusBar = "�����������!"
        
      ' ������ �������
      Application.StatusBar = ""

      ' ���������
      MsgBox ("�� � ���������� " + CStr(Count��) + " ��. ���������� � ������� ����!")

    End If ' ������� � ����
        
        
  End If
    
End Sub

' ������ ������ ����/���� �� �������� ������ � ����7 � ������� ������ ��� �������� officeNameInReport
Sub ����_����_��_����7(In_officeNameInReport, In_Row_����8, In_N, In_dateDB)
    
  ' ***
  In_Product_Code = "��_����"
  In_Product_Name = "� �.�. ������� �����"
  In_Unit = "���.���."
  curr_Day_Month = "Date_" + Mid(In_dateDB, 1, 2)
  ' ***
      
  ����_����_�� = 0
  ����_����_�� = 0
  �������_����_��_���_��� = 0
    
  ' ====
  rowCount = 9
  Do While Not IsEmpty(ThisWorkbook.Sheets("����7").Cells(rowCount, 3).Value)
      
    ' ���������
    Application.StatusBar = "������ �� (����)" + In_officeNameInReport + "..."
    
    ' ���� ������� ������ - ��� ��� ����
    If ThisWorkbook.Sheets("����7").Cells(rowCount, 4).Value = In_officeNameInReport Then
      ����_����_�� = ����_����_�� + ThisWorkbook.Sheets("����7").Cells(rowCount, 5).Value
      ����_����_�� = ����_����_�� + ThisWorkbook.Sheets("����7").Cells(rowCount, 6).Value
      �������_����_��_���_��� = �������_����_��_���_��� + ThisWorkbook.Sheets("����7").Cells(rowCount, 8).Value
    End If
      
    ' ��������� ������
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)

  Loop

  ' ������� ���������� � In_Row_����8
  ' ������������ �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = "� �.�. ������� �����"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
  ' Unit
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = "���.���."
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter
  ' ����� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value = ����_����_��
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).HorizontalAlignment = xlRight
  ' ����� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value = ����_����_��
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).HorizontalAlignment = xlRight
  ' ����� - ����������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, 3)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).NumberFormat = "0%"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).HorizontalAlignment = xlRight
  ' ������� � %
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value = �����������(����_����_��, �������_����_��_���_���, 3)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).NumberFormat = "0%"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).HorizontalAlignment = xlRight
  
  ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
  Call Full_Color_RangeII("����8", In_Row_����8, 12, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value, 1)

  ' ����� - ������� (�����, ���.��� � �.�.) ������ ������
  PredictionVar = (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value * ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value)
                
  ' ������� � Sales_Office
  '  ������������� ID_Rec:
  ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(In_dateDB) + "-" + In_Product_Code)
           
  ' ������ ������ � BASE\Sales_Office �� ��.
  Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", strMMYY(In_dateDB), _
                                                      "Update_Date", In_dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, _
                                                            "Unit", In_Unit, _
                                                              "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                                "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, _
                                                                  "Prediction", PredictionVar, _
                                                                    "Percent_Prediction", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 12).Value, _
                                                                      curr_Day_Month, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")


End Sub

' ������������ ��������� �� ������ ��� ������� � ��� �� ������ DB
Sub createTaskFroWeekOfficeFromDB()
  
  ' ��������� � �������� ������� ������ ��� ����
  ' MsgBox ("��������! ���������� �������� Cadr Emission ����� �������!")
  
  ' ������ �� ������������
  If MsgBox("������������ ��������� �� �������� �� " + CStr(weekEndDate(Date) - 2) + " ��� ������� � ���?", vbYesNo) = vbYes Then
    
    
    ' ������� ���������
    �������_��������� = 0
    
    ' ���� �� 5-�� ������
    For i = 1 To 5
      
      ' ������ ������ �� 1 �� 5
      Select Case i
        Case 1 ' �� ����������
          officeNameInReport = "���������"
          responsibleName = getFromAddrBook("�������1", 3)
          ' row_��_����8 = getRowFromSheet8("���������", ) ' 25 ' � �.�. ��������� � ��
          ' row_��������_����8 = getRowFromSheet8("���������", ) ' 43
          row_�����_�_�����_����5 = 39
          ' �� DB
          ' row_���������������_������� = getRowFromSheet8("���������", ) ' 11
          ' row_���������_�����_����� = getRowFromSheet8("���������", ) ' 14
          ' row_��������_���� = getRowFromSheet8("���������", ) ' 15
          ' row_�������������_����� = getRowFromSheet8("���������", ) ' 16
          ' row_�������_������_�������_������ = getRowFromSheet8("���������", ) ' 44
          ' row_OPC = getRowFromSheet8("���������", ) ' 17
          ' row_������������_����� = getRowFromSheet8("���������", ) ' 24
          ' row_���������_�����_����� = getRowFromSheet8("���������", ) ' 13
        Case 2 ' �� �����������
          officeNameInReport = "����������"
          responsibleName = getFromAddrBook("���2", 3)
          ' row_��_����8 = getRowFromSheet8("����������", ) ' 63 ' � �.�. ��������� � ��
          ' row_��������_����8 = getRowFromSheet8("����������", ) ' 81
          row_�����_�_�����_����5 = 40
          ' �� DB
          ' row_���������������_������� = getRowFromSheet8("����������", ) ' 49
          ' row_���������_�����_����� = getRowFromSheet8("����������", ) ' 52
          ' row_��������_���� = getRowFromSheet8("����������", ) ' 53
          ' row_�������������_����� = getRowFromSheet8("����������", ) ' 54
          ' row_�������_������_�������_������ = getRowFromSheet8("����������", ) ' 82
          ' row_OPC = getRowFromSheet8("����������", ) ' 55
          ' row_������������_����� = getRowFromSheet8("����������", ) ' 62
          ' row_���������_�����_����� = getRowFromSheet8("����������", ) ' 51
        Case 3 ' �� ����������������
          officeNameInReport = "���������������"
          responsibleName = getFromAddrBook("�������3", 3)
          ' row_��_����8 = getRowFromSheet8("���������������", ) ' 101 ' � �.�. ��������� � ��
          ' row_��������_����8 = getRowFromSheet8("���������������", ) ' 119
          row_�����_�_�����_����5 = 41
          ' �� DB
          ' row_���������������_������� = getRowFromSheet8("���������������", ) ' 87
          ' row_���������_�����_����� = getRowFromSheet8("���������������", ) ' 90
          ' row_��������_���� = getRowFromSheet8("���������������", ) ' 91
          ' row_�������������_����� = getRowFromSheet8("���������������", ) ' 92
          ' row_�������_������_�������_������ = getRowFromSheet8("���������������", ) ' 120
          ' row_OPC = getRowFromSheet8("���������������", ) ' 93
          ' row_������������_����� = getRowFromSheet8("���������������", ) ' 100
          ' row_���������_�����_����� = getRowFromSheet8("���������������", ) ' 89
        Case 4 ' �� ����������������
          officeNameInReport = "���������������"
          responsibleName = getFromAddrBook("���4", 3)
          ' row_��_����8 = getRowFromSheet8("���������������", ) ' 139 ' � �.�. ��������� � ��
          ' row_��������_����8 = getRowFromSheet8("���������������", ) ' 157
          row_�����_�_�����_����5 = 42
          ' �� DB
          ' row_���������������_������� = getRowFromSheet8("���������������", ) ' 125
          ' row_���������_�����_����� = getRowFromSheet8("���������������", ) ' 128
          ' row_��������_���� = getRowFromSheet8("���������������", ) ' 129
          ' row_�������������_����� = getRowFromSheet8("���������������", ) ' 130
          ' row_�������_������_�������_������ = getRowFromSheet8("���������������", ) ' 158
          ' row_OPC = getRowFromSheet8("���������������", ) ' 131
          ' row_������������_����� = getRowFromSheet8("���������������", ) ' 138
          ' row_���������_�����_����� = getRowFromSheet8("���������������", ) ' 127
        Case 5 ' �� ������-����
          officeNameInReport = "�����-����"
          responsibleName = getFromAddrBook("�������5", 3)
          ' row_��_����8 = getRowFromSheet8("�����-����", ) ' 177 ' � �.�. ��������� � ��
          ' row_��������_����8 =  getRowFromSheet8("�����-����", ) ' 195
          row_�����_�_�����_����5 = 43
          ' �� DB
          ' row_���������������_������� =  getRowFromSheet8("�����-����", ) ' 163
          ' row_���������_�����_����� =  getRowFromSheet8("�����-����", ) ' 166
          ' row_��������_���� =  getRowFromSheet8("�����-����", ) ' 167
          ' row_�������������_����� =  getRowFromSheet8("�����-����", ) ' 168
          ' row_�������_������_�������_������ =  getRowFromSheet8("�����-����", ) ' 196
          ' row_OPC =  getRowFromSheet8("�����-����", ) ' 169
          ' row_������������_����� =  getRowFromSheet8("�����-����", ) ' 176
          ' row_���������_�����_����� =  getRowFromSheet8("�����-����", ) ' 165
      End Select
    
    ' � ����� ������ ��������� ����
    row_��_����8 = getRowFromSheet8(officeNameInReport, "� �.�. ��������� � ��") ' 177 ' � �.�. ��������� � ��
    row_��������_����8 = getRowFromSheet8(officeNameInReport, "������ �� ��������� �����")   ' 195
    ' row_�����_�_�����_����5 = getRowFromSheet8(officeNameInReport, "")  ' 43
    ' �� DB
    row_���������������_������� = getRowFromSheet8(officeNameInReport, "��������������� �������")  ' 163
    row_���������_�����_����� = getRowFromSheet8(officeNameInReport, "��������� ����� (�����.)")  ' 166
    row_��������_���� = getRowFromSheet8(officeNameInReport, "��������-����")  ' 167
    row_�������������_����� = getRowFromSheet8(officeNameInReport, "������������� �����")  ' 168
    row_�������_������_�������_������ = getRowFromSheet8(officeNameInReport, "�������+������ ������� (������)")  ' 196
    row_OPC = getRowFromSheet8(officeNameInReport, "Orange Premium Club")  ' 169
    row_������������_����� = getRowFromSheet8(officeNameInReport, "������������ �����")  ' 176
    row_���������_�����_����� = getRowFromSheet8(officeNameInReport, "��������� ����� (�����.)")  ' 165
    
    ' �������� ����������
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_�� = 0
    �������_��� = 0
    �������_OPC = 0
    ����_������_��_������ = 0
    
    
    Application.StatusBar = "������������ ������ ��������� " + CStr(i) + "..."

    ' ���� ������ ������
    ����_������_������ = weekStartDate(Date)
    ' ���� ��������� ������
    ����_���������_������ = ����_������_������ + 4
    ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dates(In_DateStart, In_DateEnd, In_working_days_in_the_week) As Integer
    �������_�������_���� = Working_days_between_dates(����_������_������, Date_last_day_month(����_������_������), 5)
          
    ' ������� ��������� �� �������� �����
    ' 1) ��
    �������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_���������������_�������, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���������������_�������, 10).Value, 0)
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ������ ��������������� �������� �� ����� �� ����� " + CStr(����_��_������) + " ���.���.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_���������������_�������, 13).Value = ����_��_������
      ThisWorkbook.Sheets("����8").Cells(row_���������������_�������, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_���������������_�������, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 2) ��
    ' ������ �� �� �����
    �������_������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 10).Value, 0)
    ����_������_��_������ = Round(�������_������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_������_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "������� ������ �� ��������� ����� �� ����� " + CStr(����_������_��_������) + " ��.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 13).Value = ����_������_��_������
      ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_��������_����8, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
        
    
    ' 2.1) �� 2
    ' ��������� ����� (�����.)
    �������_���������_�����_����� = Round(ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 10).Value, 0)
    ����_���������_�����_����� = Round(�������_���������_�����_����� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_���������_�����_����� > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "������������ ��������� ����� �� ����� " + CStr(����_���������_�����_�����) + " ��.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).Value = ����_���������_�����_�����
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
        
        
    ' 3) ��
    �������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 10).Value, 0)
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ��������� ������ ��������� ���� �� ����� " + CStr(����_��_������) + " ��.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).Value = ����_��_������
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_���������_�����_�����, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 4) ��
    �������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_��������_����, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��������_����, 10).Value, 0)
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ����������� ��������-����� � ���-�� �� ����� " + CStr(����_��_������) + " ��.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_��������_����, 13).Value = ����_��_������
      ThisWorkbook.Sheets("����8").Cells(row_��������_����, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_��������_����, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 5) ��
    �������_�� = Round(ThisWorkbook.Sheets("����8").Cells(row_�������������_�����, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_�������������_�����, 10).Value, 0)
    ����_��_������ = Round(�������_�� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "������� ������������� ����� �� ����� " + CStr(����_��_������) + " ��.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_�������������_�����, 13).Value = ����_��_������
      ThisWorkbook.Sheets("����8").Cells(row_�������������_�����, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_�������������_�����, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
    
    ' 6) ��� (������)
    �������_��� = Round(ThisWorkbook.Sheets("����8").Cells(row_�������_������_�������_������, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_�������_������_�������_������, 10).Value, 0)
    ����_���_������ = Round(�������_��� / �������_�������_����, 0) * (����_���������_������ - ����_������_������ + 1)
    If ����_��_������ > 0 Then
      Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ������ � ������� ��� �� ����� " + CStr(����_���_������) + " ���.���.")
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_�������_������_�������_������, 13).Value = ����_���_������
      ThisWorkbook.Sheets("����8").Cells(row_�������_������_�������_������, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_�������_������_�������_������, 13).HorizontalAlignment = xlRight
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
      ' �������� ����� �� ������ � ������� "M" (13)
      ThisWorkbook.Sheets("����8").Cells(row_������������_�����, 13).Value = ����_��_������
      ThisWorkbook.Sheets("����8").Cells(row_������������_�����, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(row_������������_�����, 13).HorizontalAlignment = xlRight
      ' ������� ���������
      �������_��������� = �������_��������� + 1
    End If
              
    ' 8) OPC
    �������_OPC = ThisWorkbook.Sheets("����8").Cells(row_OPC, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_OPC, 10).Value
    If �������_OPC > 0 Then
      
      ����_OPC_������ = (�������_OPC / �������_�������_����) * (����_���������_������ - ����_������_������ + 1)
      ' ���� ������� ����, �� ������ ������� 1 �����
      If (����_OPC_������ > 0) And (����_OPC_������ < 1) Then
        ����_OPC_������ = 1
      Else
        ����_OPC_������ = Round(����_OPC_������, 0)
      End If
      
      If ����_OPC_������ > 0 Then
        Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ������ ������� OPC �� ����� " + CStr(����_OPC_������) + " ��.")
        ' �������� ����� �� ������ � ������� "M" (13)
        ThisWorkbook.Sheets("����8").Cells(row_OPC, 13).Value = ����_OPC_������
        ThisWorkbook.Sheets("����8").Cells(row_OPC, 13).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(row_OPC, 13).HorizontalAlignment = xlRight
        ' ������� ���������
        �������_��������� = �������_��������� + 1
      End If
    End If
              
    ' 9) ������ �� �� ���������� ������� 1 ������ �� 1 ��� � ����
    Call �������_������_�_���������_����������(responsibleName, ����_���������_������, "���������� ��������� ������� 1 ������ �� 1 ��� � ����.")
                           
    Application.StatusBar = ""
              
              
    Next i
              
    ' � M8 ������� ����
    ThisWorkbook.Sheets("����8").Range("M8").Value = "����: " + CStr(�������_�������_����)
              
    Application.StatusBar = ""
        
    ' ��������� � �������� ������� ������ ��� ����
    MsgBox ("��������� � ���������� " + CStr(�������_���������) + " ������������!")

    ' ������� �� ���� ����
    Call goToSheet����
  
    ' ������� � ����� ����� � �����������
    ThisWorkbook.Sheets("����").Range("AF77").Select

  End If
  
End Sub


' ��������� ���� � ������� ������ ������ �� ����� �������� Templates\���������� ����� ������ (�������).xlsx
Sub ���������_����_�������_������()
Dim FileNewVar As String

  ' ��������� ���� �� ���� �� ����� ��������
  
  ' ������ �� ������������
  If MsgBox("������������ ��������� �� ���� ��� ������?", vbYesNo) = vbYes Then
      
    ' ��������� ������ C:\Users\proschaevsf\Documents\#DB_Result\Templates\���������� ����� ������ (�������).xlsx
    Workbooks.Open (ThisWorkbook.Path + "\Templates\���������� ����� ������ (�������).xlsx")
           
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����8").Activate

    ' ���� ������������ - ���� ������� �����������, �� ��������� �� �������
    ' ���� ������� ���� ��� �����������, �� ��������� ����� �� �������
    If Weekday(CurrDate, vbMonday) = 1 Then
      dateReport = Date - 3
    Else
      dateReport = Date
    End If

    ' ��� ������ �����
    FileNewVar = "���������� ����� ������_" + str��_MM_YY(dateReport) + ".xlsx"
    
    ' ��������� - ���� ���� ����, �� ������� ���
    Call deleteFile(ThisWorkbook.Path + "\Out\" + FileNewVar)
    
    Workbooks("���������� ����� ������ (�������).xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileNewVar, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
    ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dateReports(In_dateReportStart, In_dateReportEnd, In_working_days_in_the_week) As Integer
    �������_�������_���� = Working_days_between_dates(dateReport - 1, Date_last_day_month(dateReport), 5)

    ' �������� �� �����8 � ��������� �����:
    For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
            row_����1 = 29
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
            row_����1 = 33
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
            row_����1 = 30
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
            row_����1 = 32
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
            row_����1 = 31
        End Select
        
        ' ���������
        ' 1. �� "���������"
        ' �� (29, 5)
        row_�� = getRowFromSheet8(officeNameInReport, "��������������� �������")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 5).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 5).Value = 0
        End If
        
        ' ��� + �� (������)
        row_���_�� = getRowFromSheet8(officeNameInReport, "�������+������ ������� (������)")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_���_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���_��, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 9).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_���_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���_��, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 9).Value = 0
        End If
        
        ' ��
        row_�� = getRowFromSheet8(officeNameInReport, "��������� ����� (�����.)")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 13).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 13).Value = 0
          ' ������ ������� 1
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 13).Value = 1
        End If
        
        ' ��
        row_�� = getRowFromSheet8(officeNameInReport, "��������� ����� (�����.)")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 17).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 17).Value = 0
          ' ������ ������� 1
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 17).Value = 1
        End If
        
        ' ���
        row_��� = getRowFromSheet8(officeNameInReport, "������ ��� ����")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_���, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 19).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_���, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 19).Value = 0
        End If
        
        ' ���
        row_��� = getRowFromSheet8(officeNameInReport, "������ ��� ����")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_���, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 21).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_���, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_���, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 21).Value = 0
        End If
        
        ' �� > 8 000 ���
        row_�� = getRowFromSheet8(officeNameInReport, "������������� �����")
        If Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0) > 0 Then
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 23).Value = Round(((ThisWorkbook.Sheets("����8").Cells(row_��, 9).Value - ThisWorkbook.Sheets("����8").Cells(row_��, 10).Value) / �������_�������_����), 0)
        Else
          Workbooks(FileNewVar).Sheets("����1").Cells(row_����1, 23).Value = 0
        End If
        
    Next i
    
    
    
    ' ��������� ����
    Workbooks(FileNewVar).Close SaveChanges:=True

    MsgBox ("����������� ���� " + ThisWorkbook.Path + "\Out\" + FileNewVar + "!")

    ' �������� � ����� � �����
    Call ��������_Lotus_Notes_����_����_����8(ThisWorkbook.Path + "\Out\" + FileNewVar, dateReport)
      
    ' ������ ��������: #t121121134 ">>: Re: ����������� ����� ���������� ������"
      
  End If
  
End Sub

' ������������ ����� �� ��� �� ��������� ������ �� ������� �����
Sub ����_��_���()

      ' ������ 209
      row_�����_��_���_��������� = getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + 2
      ' ������ 9
      row_��_��������� = getRowFromSheet8("�� ����������", "�� ����������") + 2
      ' ������ 47
      row_��_���������� = getRowFromSheet8("�� �����������", "�� �����������") + 2
      ' ������ 85
      row_��_��������������� = getRowFromSheet8("�� ����������������", "�� ����������������") + 2
      ' ������ 123
      row_��_��������������� = getRowFromSheet8("�� ����������������", "�� ����������������") + 2
      ' ������ 161
      row_��_�����_���� = getRowFromSheet8("�� ������-����", "�� ������-����") + 2

      ' ���� DB � ����8 (������ ���������)
      dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

      ' ���������� �����_�����������
      �����_����������� = 0
      rowCount = row_��_��������� + 1
      ' Do While (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value <> "") And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�� �����������") = 0)
      Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�� �����������") = 0)
          
        �����_����������� = �����_����������� + 1
        
        ' ��������� ������
        Application.StatusBar = "������ ����������� " + CStr(rowCount) + "..."
        rowCount = rowCount + 1
        DoEventsInterval (rowCount)
  
      Loop

      Application.StatusBar = ""


      ' ��� ��������� - 35 ����� �����������
      For i = 1 To �����_�����������
        
        ' �������: ������� 1: ����� � ������ ����� ���� ���� � ���� �� ������ ����
        �������_�������_�������� = "1"
        
        ' �����: ������� 1: ����� � ������ ����� ���� ���� � ���� �� ������ ����
        �������_�������_��������_� = "1"
        
        ' �
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 1).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 1).Value
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 1).NumberFormat = "@"
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 1).HorizontalAlignment = xlCenter
        
        ' ������������
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).HorizontalAlignment = xlLeft
        
        ' ���
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 3).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 3).Value
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 3).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 3).HorizontalAlignment = xlCenter
        
        ' ��.���.
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 4).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 4).Value
        ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 4).HorizontalAlignment = xlCenter
        
        ' ���� ��.���. �� � %, �� ��������� �� ������� �����
        If ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 4).Value <> "%" Then
        
          ' ���������:
          ' ������� - ����
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 5).Value) Then
            
            ' �� ������ ��������� ������ ��� ������������� Round
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value = CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 5).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 5).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 5).Value)
            
            ' ������ ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).NumberFormat = "#,##0"
          End If
          
          ' ������� - ����
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 6).Value) Then
            
            ' �� ������ ��������� ������ ��� ������������� Round
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value = CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 6).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 6).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 6).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 6).Value) + CheckData(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 6).Value)
            
            ' ������ ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).NumberFormat = "#,##0"
            
          End If
        
          ' ������� - ��� (���� ���� ��������)
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value) Then
            
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value, 2)
            ' ������ ������ - %
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 7).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 7).NumberFormat = "0%"
          
          End If
        
        
          ' ������� - ������� (���� ������� ��������)
          ' ���� 1
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 5).Value <> "" Then
            ����_��_��������_Q_����_1 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 5).Value)
          Else
            ����_��_��������_Q_����_1 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 8).Value <> "" Then
            �������_��_��������_Q_����_1_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 8).Value) ' * 100
          Else
            �������_��_��������_Q_����_1_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_Q_����_1 <> 0) And (�������_��_��������_Q_����_1_������� <> 0) Then
            �������_��_��������_Q_����_1 = ����_��_��������_Q_����_1 * �������_��_��������_Q_����_1_�������
          Else
            �������_��_��������_Q_����_1 = 0
          End If
          ' ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 5).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 6).Value <> 0) Then
            �������_�������_�������� = "2"
          End If
        
          ' ���� 2
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 5).Value <> "" Then
            ����_��_��������_Q_����_2 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 5).Value)
          Else
            ����_��_��������_Q_����_2 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 8).Value <> "" Then
            �������_��_��������_Q_����_2_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 8).Value) ' * 100
          Else
            �������_��_��������_Q_����_2_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_Q_����_2 <> 0) And (�������_��_��������_Q_����_2_������� <> 0) Then
            �������_��_��������_Q_����_2 = ����_��_��������_Q_����_2 * �������_��_��������_Q_����_2_�������
          Else
            �������_��_��������_Q_����_2 = 0
          End If
          ' ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 5).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 6).Value <> 0) Then
            �������_�������_�������� = "2"
          End If

          ' ���� 3
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value <> "" Then
            ����_��_��������_Q_����_3 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value)
          Else
            ����_��_��������_Q_����_3 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 8).Value <> "" Then
            �������_��_��������_Q_����_3_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 8).Value) ' * 100
          Else
            �������_��_��������_Q_����_3_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_Q_����_3 <> 0) And (�������_��_��������_Q_����_3_������� <> 0) Then
            �������_��_��������_Q_����_3 = ����_��_��������_Q_����_3 * �������_��_��������_Q_����_3_�������
          Else
            �������_��_��������_Q_����_3 = 0
          End If
          ' ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 6).Value <> 0) Then
            �������_�������_�������� = "2"
          End If
                
          ' ���� 4
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value <> "" Then
            ����_��_��������_Q_����_4 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value)
          Else
            ����_��_��������_Q_����_4 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 8).Value <> "" Then
            �������_��_��������_Q_����_4_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 8).Value) ' * 100
          Else
            �������_��_��������_Q_����_4_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_Q_����_4 <> 0) And (�������_��_��������_Q_����_4_������� <> 0) Then
            �������_��_��������_Q_����_4 = ����_��_��������_Q_����_4 * �������_��_��������_Q_����_4_�������
          Else
            �������_��_��������_Q_����_4 = 0
          End If
          ' ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 5).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 6).Value <> 0) Then
            �������_�������_�������� = "2"
          End If
        
          ' ���� 5
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 5).Value <> "" Then
            ����_��_��������_Q_����_5 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 5).Value)
          Else
            ����_��_��������_Q_����_5 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 8).Value <> "" Then
            �������_��_��������_Q_����_5_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 8).Value) ' * 100
          Else
            �������_��_��������_Q_����_5_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_Q_����_5 <> 0) And (�������_��_��������_Q_����_5_������� <> 0) Then
            �������_��_��������_Q_����_5 = ����_��_��������_Q_����_5 * �������_��_��������_Q_����_5_�������
          Else
            �������_��_��������_Q_����_5 = 0
          End If
          ' ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 5).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 6).Value <> 0) Then
            �������_�������_�������� = "2"
          End If
   
   
          ' ������� �� ��������
          �������_��_��������_Q = �������_��_��������_Q_����_1 + _
                                    �������_��_��������_Q_����_2 + _
                                      �������_��_��������_Q_����_3 + _
                                        �������_��_��������_Q_����_4 + _
                                          �������_��_��������_Q_����_5
          
          ' ���� �� ���� ������
          If ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value <> "" Then
          ����_��_����_������_Q = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value
          Else
            ����_��_����_������_Q = 0
          End If
          
          ' ������� �� ��������
          If (�������_��_��������_Q <> 0) And (����_��_����_������_Q <> 0) Then
            
            
            ' ������� 1: ����� � ������ ����� ���� ���� � ���� �� ������ ����
            If �������_�������_�������� = "1" Then
              ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 8).Value = (�������_��_��������_Q / ����_��_����_������_Q) ' * 100
            End If
            
            ' ������� 2: ����� � ����� �� ������ ����=0, �� ���� ���� �� ������ ����
            If �������_�������_�������� = "2" Then
              ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 8).Value = �������_��������_����(dateDB_����8, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value, 5, 0) ' (�������_��_��������_Q / ����_��_����_������_Q) ' * 100
            End If
            
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����8", row_�����_��_���_��������� + i, 8, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 8).Value, 1)
            
            
          End If
          ' ������ ������ - %
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 8).HorizontalAlignment = xlRight
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 8).NumberFormat = "0%"

          ' ���� �������� ���, �� ������ � �������� ���������� (7-�� �������)
          If (�������_��_��������_Q = 0) And (����_��_����_������_Q <> 0) Then
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����8", row_�����_��_���_��������� + i, 7, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 7).Value, 1)
          End If

          ' ����� - ����
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value) Then
          ' If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value <> "" Then
            
            ' ��������� ������� ������ � �������. ������, ��� � ����� ������ ����������� ����, ����. ��� ���� � ��������� ���� - ������: Dashboard_new_��_05.12.2021
            ' If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value <> "" Then var_1_9 = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value Else var_1_9 = 0
            ' If ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value <> "" Then var_2_9 = ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value Else var_2_9 = 0
            ' If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value <> "" Then var_3_9 = ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value Else var_3_9 = 0
            ' If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value <> "" Then var_4_9 = ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value Else var_4_9 = 0
            ' If ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value <> "" Then var_5_9 = ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value Else var_5_9 = 0
            ' ��������� ����������� �� null ��������
            ' ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value = var_1_9 + var_2_9 + var_3_9 + var_4_9 + var_5_9
            
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value + ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value + ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value + ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value + ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value
            
            
            ' ������ ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).NumberFormat = "#,##0"
          End If
          
          ' ����� - ����
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 10).Value) Then
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).Value = ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 10).Value + ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 10).Value + ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 10).Value + ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 10).Value + ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 10).Value
            ' ������ ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).NumberFormat = "#,##0"
          End If
        
          ' ����� - ��� (���� ���� ��������)
          If Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value) Then
        
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 11).Value = �����������(ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).Value, 2)
            ' ������ ������ - %
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 11).HorizontalAlignment = xlRight
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 11).NumberFormat = "0%"

          End If
        
          ' ����� - ������� (���� ������� ��������)
     
          ' ���� 1
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value <> "" Then
            ����_��_��������_M_����_1 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value)
          Else
            ����_��_��������_M_����_1 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 12).Value <> "" Then
            �������_��_��������_M_����_1_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 12).Value) ' * 100
          Else
            �������_��_��������_M_����_1_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_M_����_1 <> 0) And (�������_��_��������_M_����_1_������� <> 0) Then
            �������_��_��������_M_����_1 = ����_��_��������_M_����_1 * �������_��_��������_M_����_1_�������
          Else
            �������_��_��������_M_����_1 = 0
          End If
          ' �����: ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 9).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 10).Value <> 0) Then
            �������_�������_��������_� = "2"
          End If
        
        
          ' ���� 2
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value <> "" Then
            ����_��_��������_M_����_2 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value)
          Else
            ����_��_��������_M_����_2 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 12).Value <> "" Then
            �������_��_��������_M_����_2_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 12).Value) ' * 100
          Else
            �������_��_��������_M_����_2_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_M_����_2 <> 0) And (�������_��_��������_M_����_2_������� <> 0) Then
            �������_��_��������_M_����_2 = ����_��_��������_M_����_2 * �������_��_��������_M_����_2_�������
          Else
            �������_��_��������_M_����_2 = 0
          End If
          ' �����: ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 9).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_���������� + i, 10).Value <> 0) Then
            �������_�������_��������_� = "2"
          End If

          ' ���� 3
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value <> "" Then
            ����_��_��������_M_����_3 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value)
          Else
            ����_��_��������_M_����_3 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 12).Value <> "" Then
            �������_��_��������_M_����_3_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 12).Value) ' * 100
          Else
            �������_��_��������_M_����_3_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_M_����_3 <> 0) And (�������_��_��������_M_����_3_������� <> 0) Then
            �������_��_��������_M_����_3 = ����_��_��������_M_����_3 * �������_��_��������_M_����_3_�������
          Else
            �������_��_��������_M_����_3 = 0
          End If
          ' �����: ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 10).Value <> 0) Then
            �������_�������_��������_� = "2"
          End If
        
        
          ' ���� 4
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value <> "" Then
            ����_��_��������_M_����_4 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value)
          Else
            ����_��_��������_M_����_4 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 12).Value <> "" Then
            �������_��_��������_M_����_4_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 12).Value) ' * 100
          Else
            �������_��_��������_M_����_4_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_M_����_4 <> 0) And (�������_��_��������_M_����_4_������� <> 0) Then
            �������_��_��������_M_����_4 = ����_��_��������_M_����_4 * �������_��_��������_M_����_4_�������
          Else
            �������_��_��������_M_����_4 = 0
          End If
          ' �����: ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 9).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_��������������� + i, 10).Value <> 0) Then
            �������_�������_��������_� = "2"
          End If

        
          ' ���� 5
          ' ���� 1
          If ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value <> "" Then
            ����_��_��������_M_����_5 = CLng(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value)
          Else
            ����_��_��������_M_����_5 = 0
          End If
          ' ������� 1 � %
          If ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 12).Value <> "" Then
            �������_��_��������_M_����_5_������� = CDbl(ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 12).Value) ' * 100
          Else
            �������_��_��������_M_����_5_������� = 0
          End If
          ' ������� 1 (� ��, ���.���.)
          If (����_��_��������_M_����_5 <> 0) And (�������_��_��������_M_����_5_������� <> 0) Then
            �������_��_��������_M_����_5 = ����_��_��������_M_����_5 * �������_��_��������_M_����_5_�������
          Else
            �������_��_��������_M_����_5 = 0
          End If
          ' �����: ������� ������� �������� "������� 1": ����� � ������ ����� ���� ���� � ���� �� ������ ���� � "������� 2", ���� ����=0,� ����<>0
          If (ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 9).Value = 0) And (ThisWorkbook.Sheets("����8").Cells(row_��_�����_���� + i, 10).Value <> 0) Then
            �������_�������_��������_� = "2"
          End If
   
   
          ' ������� �� ��������
          �������_��_��������_M = �������_��_��������_M_����_1 + _
                                    �������_��_��������_M_����_2 + _
                                      �������_��_��������_M_����_3 + _
                                        �������_��_��������_M_����_4 + _
                                          �������_��_��������_M_����_5
          
          ' ���� �� ���� ������
          If ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value <> "" Then
            ����_��_����_������_� = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value
          Else
            ����_��_����_������_� = 0
          End If
          
          If (�������_��_��������_M <> 0) And (����_��_����_������_� <> 0) Then
            
            ' ������� 1: ����� � ������ ����� ���� ���� � ���� �� ������ ����
            If �������_�������_��������_� = "1" Then
              ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 12).Value = (�������_��_��������_M / ����_��_����_������_�) ' * 100
            End If
            
            ' ������� 2: ����� � ����� �� ������ ����=0, �� ���� ���� �� ������ ����
            If �������_�������_��������_� = "2" Then
              ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 12).Value = �������_������_����(dateDB_����8, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value, 10, 0)
            End If
            
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����8", row_�����_��_���_��������� + i, 12, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 12).Value, 1)
          
          End If
        
        
          ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          If (�������_��_��������_M = 0) And (����_��_����_������_� <> 0) Then
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("����8", row_�����_��_���_��������� + i, 11, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 11).Value, 1)
          End If

        
          ' ������ ������ - %
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 12).HorizontalAlignment = xlRight
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 12).NumberFormat = "0%"
    
          ' ***
          ' ������������ ������� "�������_��������" �� ���� ��������, ���� ��������� �� � %
          ' If ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value <> "%" Then
          
            t = row_�����_��_���_��������� + i
            t2 = dateDB
            t3 = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value
            t4 = ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value
            t5 = 0
          
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value, 5, 0)
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 20).NumberFormat = "0%"
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 20).HorizontalAlignment = xlRight
            
            ' ������ ������� ����������� �� ������, ���� ������ ���������� �� � ���������
            If ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 4).Value <> "%" Then
              
              ' === ���� ��������� ���� �� ������ - ������� ���� ��������, ����� ����� �� ������� Q � 100%
              If �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value, 5, 0) < 1 Then
            
                ' ������� ����� ������ ���� �������
                ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(dateDB + 7, ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value, 1, 5, 0)
          
                ' ���� ���� ��� ������ �� ������� Q ������, ��� ������� ���� Q, �� ������� �������
                If ����_��_����_���_��������_��������_Var > ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value Then
                  
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 13).Value = ����_��_����_���_��������_��������_Var - ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 13).NumberFormat = "#,##0"
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 13).HorizontalAlignment = xlRight
                  
                  '
                  ' � 14-�� ������� ����� ���������� ����� ������ (�� 13-�� �������)
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 14).Value = CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value), 14).Value) + _
                                                                                 CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� �����������", ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value), 14).Value) + _
                                                                                   CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value), 14).Value) + _
                                                                                     CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value), 14).Value) + _
                                                                                       CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ������-����", ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 2).Value), 14).Value)
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 14).NumberFormat = "#,##0"
                  ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 14).HorizontalAlignment = xlRight

                  
                End If
            
              End If
              ' ===
              
            End If
          
          ' ***
        
        
        Else
          
          ' ���� ������� ���������� ���������� � %, �� ����� ����� �� ��������� ��� � DB
          ' ��� ������������ ���������� ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value
          ' ��� ����� ����� ��� 5 ������ �� ��������, ����� �� 5 � ��������� � %
          
          ' % ������� (����)
          If ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 5).Value <> "" Then
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 5).Value
            ' ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 5).HorizontalAlignment = xlRight
          End If
          
          ' % ����� (����)
          If ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 9).Value <> "" Then
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 9).Value
            ' ������
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 9).HorizontalAlignment = xlRight
          End If
          
          ' % ������� (����)
          ����_1_Q = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 6).Value
          If ����_1_Q = "" Then
            ����_1_Q = 0
          End If
          
          ����_2_Q = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� �����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 6).Value
          If ����_2_Q = "" Then
            ����_2_Q = 0
          End If
          
          ����_3_Q = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 6).Value
          If ����_3_Q = "" Then
            ����_3_Q = 0
          End If
          
          ����_4_Q = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 6).Value
          If ����_4_Q = "" Then
            ����_4_Q = 0
          End If
          
          ����_5_Q = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ������-����", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 6).Value
          If ����_5_Q = "" Then
            ����_5_Q = 0
          End If
          
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).Value = (����_1_Q + ����_2_Q + ����_3_Q + ����_4_Q + ����_5_Q) / 5
          ' ������
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 6).HorizontalAlignment = xlRight
          
          ' % ����� (����)
          ����_1_M = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 10).Value
          If ����_1_M = "" Then
            ����_1_M = 0
          End If
          
          ����_2_M = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� �����������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 10).Value
          If ����_2_M = "" Then
            ����_2_M = 0
          End If
          
          ����_3_M = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 10).Value
          If ����_3_M = "" Then
            ����_3_M = 0
          End If
          
          ����_4_M = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 10).Value
          If ����_4_M = "" Then
            ����_4_M = 0
          End If
          
          ����_5_M = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ������-����", ThisWorkbook.Sheets("����8").Cells(row_��_��������� + i, 2).Value), 10).Value
          If ����_5_M = "" Then
            ����_5_M = 0
          End If
          
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).Value = (����_1_M + ����_2_M + ����_3_M + ����_4_M + ����_5_M) / 5
          ' ������
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("����8").Cells(row_�����_��_���_��������� + i, 10).HorizontalAlignment = xlRight
          
        End If ' ���� ��.���. �� � %, �� ��������� �� ������� �����
        
      Next i



  ' ������ �������������� �����
  

  ' ----------------------------------------------------------------------------------------------------------------------------------
  ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "�������� �� 18+") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "���������� ������ ��") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "�� ���-�� ��������") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "�� ���-�� ��������") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "������������� �����") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "Orange Premium Club") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "���� ��������") + 1, 2, 12)
  
  ' If getRowFromSheet8("����� �� ��� ����������", "           �� (Affluent)") <> 0 Then
  '   Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "           �� (Affluent)") + 1, 2, 12)
  ' End If
  
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "           �� (Affluent)") + 1, 2, 12)
  
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "           ��� ������ OPC") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "�������� ������ OPC") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "           ���") + 1, 2, 12)
  Call gorizontalLineII(ThisWorkbook.Name, "����8", getRowFromSheet8("����� �� ��� ����������", "��� (� �.�.OPC)") + 1, 2, 12)
  
  ' ----------------------------------------------------------------------------------------------------------------------------------

  ' ������� ���� �� ������
  

End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����_����_����8(In_attachmentFile, In_DateFile)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  
  ' ������
  If MsgBox("��������� ���� ������ ������ � ������� �� ����?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "����� ������ �� " + CStr(In_DateFile)

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#���������������"

    ' ����-�������� (!!!)
    attachmentFile = In_attachmentFile
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "���� ������ �� " + CStr(In_DateFile) + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub

' ��������� ���� �� ���� � ���������
Sub ���������_����_��_����_������()
      
  ' ������
  If MsgBox("��������� ���� �� " + CStr(ThisWorkbook.Sheets("����8").Range("O9").Value) + "?", vbYesNo) = vbYes Then
      
    ' ��������� �������� �������� �� ������ � ���
    Call ���������_��������_��������_��_������_�_���
      
    ' ��������� BASE\Sales
    OpenBookInBase ("Sales_Office")
  
    ' ����� �����
    ' Call ���������_����_��_����
        
    ' ����� Q
    Call ���������_����_��_����2
        
        
    ' ��������� BASE\Sales
    CloseBook ("Sales_Office")
    
    ' ���������
    MsgBox ("������ ���������!")
    
  End If

End Sub

' ��������� ���� �� ����
Sub ���������_����_��_����()
Dim dateForLoad As Date
  
  ' ���� ��� �������� ������
  dateForLoad = ThisWorkbook.Sheets("����8").Range("O9").Value
  ' ���� ������ ����
  strMMYYVar = strMMYY(dateForLoad)
  ' ���� Q
  strNQYYVar = strNQYY(dateDB)
  
    ' ��� ��� ������� ��� �� � ���
    ' ����� ������������ ���� WorkDayLeft ��� ������� �������� � ������� ������ (� ������ ������� ����)
    WorkDayLeft = Working_days_between_datesII(monthStartDate(dateForLoad), dateForLoad, 5)
    ' ����� ���������� ���� WorkDayRight ��� ������� �������� � ������� ������ ((� ������ ������� ����))
    WorkDayRight = Working_days_between_datesII(dateForLoad + 1, Date_last_day_month(dateForLoad), 5)
          
    ' ��� ��� ������� ��� ��
    ' ����� ������������ ���� WorkDayLeft ��� ������� �������� � ������� ������ (� ������ ������� ����)
    WorkDayLeftCalendar = Working_days_between_dates(monthStartDate(dateForLoad), dateForLoad, 5)
    ' ����� ���������� ���� WorkDayRight ��� ������� �������� � ������� ������ ((� ������ ������� ����))
    WorkDayRightCalendar = Working_days_between_dates(dateForLoad + 1, Date_last_day_month(dateForLoad), 5)
              
          
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����8").Activate
          
    ' ��������� �������� �������� �� ������ � ���
    ' Call ���������_��������_��������_��_������_�_���
         
    ' ������� �ffice_Number
    Column_�ffice_Number = ColumnByName("Sales_Office", "����1", 1, "�ffice_Number")
    ' ������� �������
    column_MMYY = ColumnByName("Sales_Office", "����1", 1, "MMYY")
    ' ������� ����� ������� Date_�� ��� ������
    Column_Date_�� = ColumnByName("Sales_Office", "����1", 1, "Date_" + CStr(Mid(dateForLoad, 1, 2)))
    
    ' ������� ����� ������� DateN_�� ��� ��������
    M_num = Nom_mes_quarter_str(dateForLoad)
    curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateForLoad, 1, 2)
    Column_DateN_�� = ColumnByName("Sales_Office", "����1", 1, curr_Day_Month_Q)
    
    ' ������� ����� ������� Product_Name
    column_Product_Name = ColumnByName("Sales_Office", "����1", 1, "Product_Name")
         
    rowCount = 2
    Do While Not IsEmpty(Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, 1).Value)
      
      ' ���������
      Application.StatusBar = CStr(rowCount) + "..."
    
      ' ���� ������� ������ - ��� ��� �����
      If Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_MMYY).Value = strMMYYVar Then
        
        ' ���� ��� �� ������������ ������� (������� 3)
        If Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, 3).Value <> "������������ �������" Then
        
          ' ����� ��������� ������� - ��������������� ������� ������� ����������� ��� � ��������, �.�. ������ ����� ��
          If Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_Product_Name).Value = "��������������� �������" Then
            ' ��� ��������������� ������� ������� ����������� ����� ������� � �����.
            WorkDayLeft_Var = WorkDayLeftCalendar
            WorkDayRight_Var = WorkDayRightCalendar
          Else
            ' ��� ��������� ��������� ��������� ��� �� BASE\NonWorkingDays
            WorkDayLeft_Var = WorkDayLeft
            WorkDayRight_Var = WorkDayRight
          End If
        
          ' �������� ��������� ������ ������ �� ����8 (In_�ffice, In_Product_Name, In_Fact)
          Call ��������_������_��_����8(Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, Column_�ffice_Number).Value, _
                                          Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_Product_Name).Value, _
                                            Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, Column_Date_��).Value, _
                                              WorkDayLeft_Var, _
                                                WorkDayRight_Var)
        
        End If ' ���� ��� �� ������������ ������� (������� 3)
        
        ' ���� ��� ������������ ������� (������� 3)
        If Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, 3).Value = "������������ �������" Then
        
          ' �������� ��������� ������ ������ �� ����8 (In_�ffice, In_Product_Name, In_Fact)
          Call ��������_������_��_��_����8(Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, 4).Value, _
                                             Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_Product_Name).Value, _
                                               Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, Column_Date_��).Value, _
                                                 WorkDayLeft, _
                                                   WorkDayRight)
        
        End If ' ���� ��� ������������ ������� (������� 3)
        
      End If
      
      ' ���� ������� ������ - ��� ��� Q, �� ���������� ��� �� ����8
      If Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_MMYY).Value = strNQYYVar Then
          
          ' ��� ��������
          WorkDayLeft_Var = Working_days_between_dates(Date_begin_day_quarter(dateForLoad), dateForLoad, 5)
          WorkDayRight_Var = Working_days_between_dates(dateForLoad + 1, Date_last_day_quarter(dateForLoad), 5)
          
          ' �������� ��������� ������ ������ �� ����8 (In_�ffice, In_Product_Name, In_Fact)
          Call ��������_������_��_����8_Q(Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, Column_�ffice_Number).Value, _
                                          Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, column_Product_Name).Value, _
                                            Workbooks("Sales_Office").Sheets("����1").Cells(rowCount, Column_DateN_��).Value, _
                                              WorkDayLeft_Var, _
                                                WorkDayRight_Var)
      
      End If
    ' ��������� ������
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)

  Loop
         
    Application.StatusBar = ""
  
End Sub

' �������� ��������� ������ ������ �� ����8 ��� ��������
Sub ��������_������_��_����8_Q(In_�ffice, In_Product_Name, In_Fact, In_WorkDayLeft, In_WorkDayRight)
  
  ' ��� ����� ��������� �������
  Select Case In_�ffice
    Case 1 ' �� ����������
      rowCount_����8_Q = getRowFromSheet8("�� ����������", In_Product_Name)
    Case 2 ' �� �����������
      rowCount_����8_Q = getRowFromSheet8("�� �����������", In_Product_Name)
    Case 3 ' �� ����������������
      rowCount_����8_Q = getRowFromSheet8("�� ����������������", In_Product_Name)
    Case 4 ' �� ����������������
      rowCount_����8_Q = getRowFromSheet8("�� ����������������", In_Product_Name)
    Case 5 ' �� ������-����
      rowCount_����8_Q = getRowFromSheet8("�� ������-����", In_Product_Name)
  End Select
  
  
  ' ������� ��������
  ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 15).Value = In_Fact
  ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 15).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 15).HorizontalAlignment = xlRight

  ' ������� ��������� ����� �� ��������
  If (ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 6).Value <> "") Then
    ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 16).Value = Round(ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 6).Value - In_Fact, 0)
    ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 16).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("����8").Cells(rowCount_����8_Q, 16).HorizontalAlignment = xlRight
  End If

End Sub

' �������� ��������� ������ ������ �� ����8 ��� ������
Sub ��������_������_��_����8(In_�ffice, In_Product_Name, In_Fact, In_WorkDayLeft, In_WorkDayRight)
  
  ' ��� ����� ��������� �������
  Select Case In_�ffice
    Case 1 ' �� ����������
      rowCount = getRowFromSheet8("�� ����������", "�� ����������") + 3
    Case 2 ' �� �����������
      rowCount = getRowFromSheet8("�� �����������", "�� �����������") + 3
    Case 3 ' �� ����������������
      rowCount = getRowFromSheet8("�� ����������������", "�� ����������������") + 3
    Case 4 ' �� ����������������
      rowCount = getRowFromSheet8("�� ����������������", "�� ����������������") + 3
    Case 5 ' �� ������-����
      rowCount = getRowFromSheet8("�� ������-����", "�� ������-����") + 3
  End Select
  
  ' ����� ������������ ���� In_WorkDayLeft
  
  ' ����� ���������� ���� In_WorkDayRight
    
  ' ����������
  ������_������� = False
  
  ' ���������� ������ �����
  ������_����� = getRowFromSheet8("�� �����������", "�� �����������") - getRowFromSheet8("�� ����������", "�� ����������") - 3
  ' ������� ����� ������ � �����
  ������_�����_�_����� = 0
  
  ' ���� ������� �� ����8
  Do While (������_�����_�_����� <= ������_�����) And (������_������� = False)
  
    ' ��������� ������������ ��������
    If ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = In_Product_Name Then
      
      ' ������� ��������
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = In_Fact
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).HorizontalAlignment = xlRight
      
      ' ������� ��������� ����� �� ������
      If (ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "") Then
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value - In_Fact, 0)
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).HorizontalAlignment = xlRight
      End If
      
      ' ������ �������� �� ����������� ���� �� ����� (���� � 12-�� ������� ���� ������� ������)
      If (ThisWorkbook.Sheets("����8").Cells(rowCount, 12).Value <> "") And (In_Fact <> Empty) Then
        
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value = (In_Fact + ((In_Fact / In_WorkDayLeft) * In_WorkDayRight)) / ThisWorkbook.Sheets("����8").Cells(rowCount, 9).Value
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).HorizontalAlignment = xlRight
        
        ' �������� �������� (������� R (18))
        ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 12).Value - ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value
        ThisWorkbook.Sheets("����8").Cells(rowCount, 18).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 18).HorizontalAlignment = xlRight
        
        ' ������� ������ ��������: � �������, ���� ������������� �������� � �������� ����� 1
        If (ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value < 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 11).Value < 1) Then
          Call Full_Color_RangeII("����8", rowCount, 18, 0, 100)
        End If

        ' ������� ������ ��������: � �������, ���� ������������� ��������
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value > 0 Then
          Call Full_Color_RangeII("����8", rowCount, 18, 100, 100)
        End If
        
      End If
      
      ' ����������
      ������_������� = True
    
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
    ������_�����_�_����� = ������_�����_�_����� + 1
  
  Loop
  
  ' ��������� ��� ���
  rowCount = getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������")
  
  ' ����������
  ������_������� = False
  
  ' ������� ����� ������ � �����
  ������_�����_�_����� = 0

  
  ' ���� ������� �� ����8
  Do While (������_�����_�_����� <= ������_�����) And (������_������� = False)
  
    ' ��������� ������������ ��������
    If ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = In_Product_Name Then
      
      ' ���� ������� ��������� �� � %
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Value <> "%" Then
      
        ' ������� ��������
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "" Then
          ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value + CDec(In_Fact)
        Else
          ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = CDec(In_Fact)
        End If
        ThisWorkbook.Sheets("����8").Cells(rowCount, 15).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 15).HorizontalAlignment = xlRight
      
        ' ������� ��������� �� ������
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value <> "" Then
          �����_���� = ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value
        Else
          �����_���� = 0
        End If
        
        ' ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value - ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value, 0)
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = Round(�����_���� - ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value, 0)
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).HorizontalAlignment = xlRight
      
        ' ������ �������� �� ����������� ���� �� ���
        If (ThisWorkbook.Sheets("����8").Cells(rowCount, 12).Value <> "") And (In_Fact <> Empty) Then
      
          ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value = (ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value + ((ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value / In_WorkDayLeft) * In_WorkDayRight)) / ThisWorkbook.Sheets("����8").Cells(rowCount, 9).Value
          ThisWorkbook.Sheets("����8").Cells(rowCount, 17).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(rowCount, 17).HorizontalAlignment = xlRight
        
          ' �������� �������� (������� R (18))
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 12).Value - ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).HorizontalAlignment = xlRight

          ' ������� ������ ��������: � �������, ���� ������������� ��������
          If (ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value < 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 11).Value < 1) Then
            Call Full_Color_RangeII("����8", rowCount, 18, 0, 100)
          End If

          ' ������� ������ ��������: � �������, ���� ������������� ��������
          If ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value > 0 Then
            Call Full_Color_RangeII("����8", rowCount, 18, 100, 100)
          End If

        End If
      Else
        ' ���� ������� ��������� � %
        
      End If ' ���� ������� ��������� �� � %
      
      ' ����������
      ������_������� = True
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
    ������_�����_�_����� = ������_�����_�_����� + 1
  Loop
  
  
End Sub


' ��������� �������� �������� �� ������ � ���
Sub ���������_��������_��������_��_������_�_���()
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("�� ����������", "�� ����������") + 3), "R" + CStr(getRowFromSheet8("�� �����������", "�� �����������") - 1))
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("�� �����������", "�� �����������") + 3), "R" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "R" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "R" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") - 1))
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") + 3), "R" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") - 2))
    
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + 3), "R" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + (getRowFromSheet8("�� �����������", "�� �����������") - getRowFromSheet8("�� ����������", "�� ����������"))))

    ' ������������ ������� �� ������
    Call clear�ontents2(ThisWorkbook.Name, "����8", "O" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") + 3), "R" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") - 1))

End Sub

' ��������� ������ ������ �� ����9 �� ����� (���������, ����������, ���������������, ���������������, �����-����) � ������������ ��������
Function getRowFromSheet8(In_Office, In_ProductName)
  
  ' �������� ��������
  getRowFromSheet8 = 0
  
  ' ����� � ����� �� ����������
  rowCount = rowByValue(ThisWorkbook.Name, "����8", "�� ����������", 100, 100)
  
  '  ���������� ������ �����
  ���_������_���� = False
  ��������_���������� = False
  
  ' ������������ ���� - ���� ������� ����, ���� ������� ����, �� ���� ������� � ������������� ��������
  ' Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0) And (��������_���������� = False)
  Do While (rowCount <= 1000) And (��������_���������� = False)
  
    ' ��������� ����
    If InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, In_Office) <> 0 Then
      ���_������_���� = True
    End If
    
    '  ��������� ������������ ��������
    If (���_������_���� = True) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, In_ProductName) <> 0) Then
      
      getRowFromSheet8 = rowCount
      
      ' ������������� ���������� �����
      ��������_���������� = True
    End If
    
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop
    
End Function

' ��������� ���������� ����� � ����8
Function getValueFromSheet8(In_Office, In_ProductName, In_Column)
  
  ' �������� ��������
  getValueFromSheet8 = ThisWorkbook.Sheets("����8").Cells( _
                                                          getRowFromSheet8(In_Office, In_ProductName), _
                                                            In_Column).Value
  
End Function

' ��� ������: ������ �����������! � ��������� ����� ���� ������������ ������, ������� ���������� ������� � ������� ���������� ����������.
' https://www.planetaexcel.ru/forum/index.php?PAGE_NAME=message&FID=1&TID=58709&TITLE_SEO=58709-opoveshchenie-pered-sokhraneniem&MID=993712#message993712
' � ���������� ������������������ ����� ����� "������� ������ ��������..."


' ������������ �������� �����/�������
Sub DB_swith_to_MonthQuarter2(In_ReportName_String, In_Sheets, In_Period)

'   ActiveSheet.PivotTables("������� �������5").PivotFields("������").ClearAllFilters
'   ActiveSheet.PivotTables("������� �������5").PivotFields("������").CurrentPage = "�������"
    
    On Error Resume Next
    ' ������� �������5
    ' Workbooks(In_ReportName_String).Sheets(In_Sheets).PivotTables("������� �������5").PivotFields("������").ClearAllFilters
    ' Workbooks(In_ReportName_String).Sheets(In_Sheets).PivotTables("������� �������5").PivotFields("������").CurrentPage = In_Period
    
    ' ������� �������3
    Workbooks(In_ReportName_String).Sheets(In_Sheets).PivotTables("������� �������3").PivotFields("������").ClearAllFilters
    Workbooks(In_ReportName_String).Sheets(In_Sheets).PivotTables("������� �������3").PivotFields("������").CurrentPage = In_Period

'    ActiveSheet.PivotTables("������� �������3").PivotFields("������").ClearAllFilters
'    ActiveSheet.PivotTables("������� �������3").PivotFields("������").CurrentPage = "�����"
      
      
   ' �� 21.04
   If In_Period = "�����" Then
     
     ' With ActiveWorkbook.SlicerCaches("����_������5")
     '      .SlicerItems("�����").Selected = True
     '      .SlicerItems("�������").Selected = False
     '      .SlicerItems("(�����)").Selected = False
     '  End With
     
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("�����").Selected = True
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("�������").Selected = False
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("(�����)").Selected = False

   End If
   
   If In_Period = "�������" Then
   
     '  With ActiveWorkbook.SlicerCaches("����_������5")
     '      .SlicerItems("�������").Selected = True
     '      .SlicerItems("�����").Selected = False
     '      .SlicerItems("(�����)").Selected = False
     '  End With
     
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("�������").Selected = True
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("�����").Selected = False
     Workbooks(In_ReportName_String).SlicerCaches("����_������5").SlicerItems("(�����)").Selected = False

   End If
      
      
End Sub

' ���������� ������ �������� ������
Function PreviousWeek(In_Date) As Date
  
  ' ����� 7 ���� �����
  PreviousWeek = In_Date - 7
  
  ' ��������� - ���� �� ���� � ������� �����, �� ��������� 01 ����� �������� ������
  If Month(PreviousWeek) < Month(In_Date) Then
    PreviousWeek = Date_begin_day_month(In_Date)
  End If
  
End Function

' ���������� ������ �������� Q
Function PreviousWeek2(In_Date) As Date
  
  ' ����� 7 ���� �����
  PreviousWeek2 = In_Date - 7
  
  ' ��������� - ���� �� ���� � ������� Q, �� ��������� 01 ����� 1-�� ������ � ������� Q
  If quarterName3(PreviousWeek2) <> quarterName3(In_Date) Then
    PreviousWeek2 = Date_begin_day_quarter(In_Date)
  End If
  
End Function


' �������� ��������� ������ ������ �� ����8
Sub ��������_������_��_��_����8(In_�ffice, In_Product_Name, In_Fact, In_WorkDayLeft, In_WorkDayRight)
  
  ' ��� ����� ��������� �������
  rowCount = getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") + 3
  
  ' ����������
  ������_������� = False
  
  ' ���� ������� �� ����8
  Do While (������_������� = False) And (Not IsEmpty(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����� �� ��� ����������") = 0)
    
    ' ���� ��� ������� ����
    If InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, In_�ffice) <> 0 Then
    
      ' ������� ��������
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = (In_Fact / 100)
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).NumberFormat = "0%"
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).HorizontalAlignment = xlRight
      
      ' ������� ��������� ����� �� ������
      ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value - (In_Fact / 100)
      ThisWorkbook.Sheets("����8").Cells(rowCount, 16).NumberFormat = "0%"
      ThisWorkbook.Sheets("����8").Cells(rowCount, 16).HorizontalAlignment = xlRight
        
      ' �������� � ����������� �� + (�������)/- (�������)
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value > 0 Then
        ' �������
        Call Full_Color_RangeII("����8", rowCount, 16, 100, 100)
      End If
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value < 0 Then
        ' �������
        Call Full_Color_RangeII("����8", rowCount, 16, 0, 100)
      End If
      
      ' ����������
      ������_������� = True
    
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop
  
End Sub

' (3) ������ ������ ����/���� �� �������� �� BASE\Sales � ������� ������ ��� �������� officeNameInReport
Sub ����_����_Q_��_Sales(In_officeNameInReport, In_Row_����8, In_N, In_dateDB)
    
  ' ***
  In_Product_Code = "��_����"
  In_Product_Name = "� �.�. ������� �����"
  In_Unit = "���.���."
  curr_Day_Month = "Date_" + Mid(In_dateDB, 1, 2)
  ' ***
      
  ����_����_�� = 0
  ����_����_�� = 0
  �������_����_��_���_��� = 0
    
  ' ����� �������� 1
  ������������������ = quarterStartDate(In_dateDB)
  ���Q1 = strMMYY(������������������)
  ' ����� �������� 2
  ���Q2 = strMMYY(quarterSecondMonthStartDate(In_dateDB))
  ' ����� �������� 3
  ����������������� = Date_last_day_quarter(In_dateDB)
  ���Q3 = strMMYY(�����������������)
  ' ====
  rowCount = 2
  Do While Not IsEmpty(Workbooks("Sales").Sheets("����1").Cells(rowCount, 1).Value)
      
    ' ���������
    Application.StatusBar = "������ �� (����) Q " + In_officeNameInReport + ": " + CStr(rowCount) + " ..."
    
    ' ���� ������� ������ - ��� ��� ����
    If (Workbooks("Sales").Sheets("����1").Cells(rowCount, 4).Value = In_officeNameInReport) _
         And ((Workbooks("Sales").Sheets("����1").Cells(rowCount, 5).Value = ���Q1) Or (Workbooks("Sales").Sheets("����1").Cells(rowCount, 5).Value = ���Q2) Or (Workbooks("Sales").Sheets("����1").Cells(rowCount, 5).Value = ���Q3)) _
           And (Workbooks("Sales").Sheets("����1").Cells(rowCount, 7).Value = "��") Then
      
      ����_����_�� = ����_����_�� + Workbooks("Sales").Sheets("����1").Cells(rowCount, 8).Value
      ����_����_�� = ����_����_�� + Workbooks("Sales").Sheets("����1").Cells(rowCount, 10).Value
    
    End If
      
    ' ��������� ������
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)

  Loop

  ' ������� ���������� � In_Row_����8
  ' ������� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = ����_����_��
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).HorizontalAlignment = xlRight
  ' ������� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = ����_����_��
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).HorizontalAlignment = xlRight
  ' ����� - ����������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 3)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0%"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).HorizontalAlignment = xlRight
  
  ' ������ ������ �������� ����� ������������������ � �����������������
  �����_���������_���_���� = Working_days_between_datesII(������������������, In_dateDB, 5)
  �����_���_����_������� = Working_days_between_datesII(������������������, �����������������, 5)
  
  �������_����_��_���_��� = (����_����_�� / �����_���������_���_����) * �����_���_����_�������
  
  ' ������� � %
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = �����������(����_����_��, �������_����_��_���_���, 3)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).NumberFormat = "0%"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).HorizontalAlignment = xlRight
  
  ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
  Call Full_Color_RangeII("����8", In_Row_����8, 8, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value, 1)

  ' ���������
  Application.StatusBar = ""

End Sub

' ��������� ���������� �� ������� DB (��� ����/�����)
Sub DB_getParamFromUniversalSheetInDB(In_ReportName_String, In_Sheets, In_���������_�������_�����, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Param_Name_In_DB, In_Product_Code, In_Unit, In_Weight, In_Period)
  
  dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  
  ' �������� ������� BASE\Products
  Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
  ' ������� In_Sheets
  Row_���������_�������_����� = rowByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  Column_���������_�������_����� = ColumnByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  
  ' ������� ������� � ������� ���� In_Param_Name_In_DB
  column_Product_Name = ColumnByValue(In_ReportName_String, In_Sheets, In_Param_Name_In_DB, 1000, 1000)
  
  ' ������� � � ������� "��������� ��1"
  rowCount = Row_���������_�������_����� + 1

  Do While (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "����� ����") = 0) And (Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value))
    
    ' ���� ��� "��������� ��1" - ���������� ������
    If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��������� ��1") <> 0 Then
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).ShowDetail = True
      ����_������ = True
    End If
              
    ' ���� ��� ������� ����
    If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0) And (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��1") = 0) Then
      
      ' ����� �� ���� ������ ������ � �������� �� ����8
      ���������_�������� = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, column_Product_Name).Value

      ' ���� ��������� � %
      If In_Unit = "%" Then
        ' ���� ��� %, �� �������� �� 100
        ���������_�������� = (���������_�������� * 100)
      End If

    End If
    
    ' ��������� ������
    Application.StatusBar = In_Product_Code + " " + In_officeNameInReport + ": " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
 
  ' ������� ���������� �� ����8 � ������� ���� In_Period = "�����"/"�������"
  If In_Period = "�����" Then
    
    Column_In_����8 = 10
    
    ' ������������� ID_Rec:
    ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
    
    ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
    curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
    
    ' ������ � BASE\Sale_Office
    MMYY_Var = strMMYY(dateDB)
  
  End If
  
  ' ��� ��������
  If In_Period = "�������" Then
    
    Column_In_����8 = 6
    
    ' ������������� ID_Rec:
    ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
    
    ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
    M_num = Nom_mes_quarter_str(dateDB)
    curr_Day_Month = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
    
    ' ������ � BASE\Sale_Office
    MMYY_Var = strNQYY(dateDB)
    
  End If
  
  ' ������� ������������ �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
  ' ������������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = In_Product_Name
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
  
  ' ��� �������, ���� �� �� �������
  If In_Weight <> 0 Then
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).Value = In_Weight
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).HorizontalAlignment = xlCenter
  End If
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = In_Unit
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter
  
  ' ������� ��������� �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).Value = ���������_��������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).HorizontalAlignment = xlRight
  
  ' ������� ��������� ���������� � BASE\Sale_Office
  Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", MMYY_Var, _
                                                      "Update_Date", dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", "", _
                                                            "Unit", In_Unit, _
                                                              "Fact", ���������_��������, _
                                                                "Percent_Completion", "", _
                                                                  "Prediction", "", _
                                                                    "Percent_Prediction", "", _
                                                                      curr_Day_Month, ���������_��������, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
  
End Sub

' ��������� ���������� �� ������� DB (��� ����/�����) �� ��������� ������� �� ��������
Sub DB_getParamFromUniversalSheetInDB2(In_ReportName_String, In_Sheets, In_���������_�������_�����, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Param_Name_In_DB, In_Product_Code, In_Unit, In_Weight, In_Period, In_DeltaPrediction)
  
  ' In_DeltaPrediction - + ����� �������� �� ������� In_Param_Name_In_DB � ������� ��������� �������� ����������
  
  dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  
  ' �������� ������� BASE\Products
  Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
  ' ������� In_Sheets
  Row_���������_�������_����� = rowByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  Column_���������_�������_����� = ColumnByValue(In_ReportName_String, In_Sheets, In_���������_�������_�����, 1000, 1000)
  
  ' ������� ������� � ������� ���� In_Param_Name_In_DB
  column_Product_Name = ColumnByValue(In_ReportName_String, In_Sheets, In_Param_Name_In_DB, 1000, 1000) + In_DeltaPrediction
  
  ' ������� � � ������� "��������� ��1"
  rowCount = Row_���������_�������_����� + 1

  Do While (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "����� ����") = 0) And (Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value))
    
    ' ���� ��� "��������� ��1" - ���������� ������
    If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��������� ��1") <> 0 Then
      Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).ShowDetail = True
      ����_������ = True
    End If
              
    ' ���� ��� ������� ����
    If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0) And (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��1") = 0) Then
      
      ' ����� �� ���� ������ ������ � �������� �� ����8
      ���������_�������� = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, column_Product_Name).Value

      ' ���� ��������� � %
      If In_Unit = "%" Then
        ' ���� ��� %, �� �������� �� 100
        ���������_�������� = (���������_�������� * 100)
      End If

    End If
    
    ' ��������� ������
    Application.StatusBar = In_Product_Code + " " + In_officeNameInReport + ": " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
 
  ' ������� ���������� �� ����8 � ������� ���� In_Period = "�����"/"�������"
  If In_Period = "�����" Then
    
    Column_In_����8 = 10
    
    ' ������������� ID_Rec:
    ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
    
    ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
    curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
    
    ' ������ � BASE\Sale_Office
    MMYY_Var = strMMYY(dateDB)
  
  End If
  
  ' ��� ��������
  If In_Period = "�������" Then
    
    Column_In_����8 = 6
    
    ' ������������� ID_Rec:
    ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
  
    ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
    M_num = Nom_mes_quarter_str(dateDB)
    curr_Day_Month = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
    
    ' ������ � BASE\Sale_Office
    MMYY_Var = strNQYY(dateDB)
  
  End If
  
  ' ������� ������������ �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
  ' ������������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = In_Product_Name
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
  
  ' ��� �������, ���� �� �� �������
  If In_Weight <> 0 Then
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).Value = In_Weight
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).HorizontalAlignment = xlCenter
  End If
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = In_Unit
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter
  
  ' ������� ��������� �������� �� ����8
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).Value = ���������_��������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, Column_In_����8).HorizontalAlignment = xlRight
    
  ' ������� ��������� ���������� � BASE\Sale_Office
  Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", MMYY_Var, _
                                                      "Update_Date", dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", "", _
                                                            "Unit", In_Unit, _
                                                              "Fact", ���������_��������, _
                                                                "Percent_Completion", "", _
                                                                  "Prediction", "", _
                                                                    "Percent_Prediction", "", _
                                                                      curr_Day_Month, ���������_��������, _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
  
End Sub


' ��������� ������� �� ������ � �����8
Sub ���������_�������_��_������_����8()
  
  ' ������
  ��_�����_�������_��_20_�������_��_����_���������_str = "�������� �� 18+, ��._������� , �������, � �.�. ������� ������,            ������������� ����,            ���,            ������ ���,            �����������,            ������,            ��,           ���"
  
  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_��_��������� = RangeByValue(ThisWorkbook.Name, "����8", "�� ����������", 100, 100)
  �����������_��_��������� = ThisWorkbook.Sheets("����8").Range(������_��_���������).Row
  ������������_��_��������� = ThisWorkbook.Sheets("����8").Range(������_��_���������).Column
  
  ������_��_���������� = RangeByValue(ThisWorkbook.Name, "����8", "�� �����������", 100, 100)
  �����������_��_���������� = ThisWorkbook.Sheets("����8").Range(������_��_����������).Row
  ������������_��_���������� = ThisWorkbook.Sheets("����8").Range(������_��_����������).Column
  
  ' �������� ��� ��������� �������� ������
  If (ActiveCell.Row >= �����������_��_��������� + 3) And (ActiveCell.Row <= �����������_��_���������� - 1) And (ActiveCell.Column >= ������������_��_��������� - 1) And ((ActiveCell.Column <= ������������_��_��������� + 10)) Then
  
    ' ������������ ����������
    ����������_������������ = ThisWorkbook.Sheets("����8").Cells(ActiveCell.Row, ������������_��_���������).Value
  
    ' ������
    If MsgBox("��������� �" + ����������_������������ + "� �� ������?", vbYesNo) = vbYes Then
    
      ' ��������� ��������:
      ' ��������� ������
      If Dir(ThisWorkbook.Path + "\Templates\" + "������� �� ��������.xlsx") <> "" Then
        ' ��������� ������ Templates\������� �� ��������
        TemplatesFileName = "������� �� ��������"
      End If
              
      ' ��������� ������ �� C:\Users\...\Documents\#VBA\DB_Result\Templates
      Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����8").Activate

      ' ���� DB
      dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

      ' ��� ������ �����
      FileDBName = "������� " + ����������_������������ + " " + Replace(CStr(dateDB_����8), ".", "-") + ".xlsx"
       
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName)

      Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
      ' �������� � ���� ������:
      ' � "B3" � "B4" ��������� ������������ ��������
      Workbooks(FileDBName).Sheets("����1").Range("B3").Value = "������� �� �������� �" + ����������_������������ + "� �� " + CStr(dateDB_����8) + " �."
      Workbooks(FileDBName).Sheets("����1").Range("B4").Value = "����������_������������"
    
      ' ��������� �������
      Workbooks(FileDBName).Sheets("����1").Cells(4, 5).Value = quarterName(dateDB_����8)
      Workbooks(FileDBName).Sheets("����1").Cells(4, 9).Value = "����� (" + ���������(dateDB_����8) + ")" '����� (��������)
      Workbooks(FileDBName).Sheets("����1").Cells(5, 6).Value = "���� �� " + strDDMM(dateDB_����8)
      Workbooks(FileDBName).Sheets("����1").Cells(5, 10).Value = Workbooks(FileDBName).Sheets("����1").Cells(5, 6).Value
      Workbooks(FileDBName).Sheets("����1").Cells(4, 15).Value = "���� " + CStr(ThisWorkbook.Sheets("����8").Range("O9").Value)
    
      ' �����
      �����_�������_���� = 0
      �����_�������_���� = 0
      �����_�����_���� = 0
      �����_�����_���� = 0
      �����_������ = 0
    
      ' ������� ������� �������� �� �����
      For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
        End Select
        
        ' Function getRowFromSheet8(In_Office, In_ProductName)
        RowFromSheet8 = getRowFromSheet8(officeNameInReport, ����������_������������)
      
        �����_������ = �����_������ + 1
      
        ' �
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 1).Value = CStr(i)
        ' ����
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 2).Value = officeNameInReport
        ' ���
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 3).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 3)
        ' ��.���.
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 4).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 4)
        ��_���_Var = Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 4).Value
        
        ' �������: ����
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 5).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5)
        If Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).Value <> "" Then
          �����_�������_���� = �����_�������_���� + Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).Value
        End If
        
        ' �������: ���� �� ____
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 6).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6)
        If Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).Value <> "" Then
          �����_�������_���� = �����_�������_���� + Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).Value
        End If
        
        ' �������: ���.
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 7).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7)
        
        ' �������: ������� - ���� �� ���� � ������� 8, ����� �� 20-��
        If ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 8).Value <> "" Then
          ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 8).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8)
        Else
          ' �� 20-�� �������
          If InStr(��_�����_�������_��_20_�������_��_����_���������_str, ����������_������������) = 0 Then
            
            ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 20).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8)
            ' ���� �������� � ������� 8 �� ������
            If Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).Value <> "" Then
              ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
              Call Full_Color_RangeV(FileDBName, "����1", 5 + i, 8, Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).Value, 1)
              ' ������� ���� � ������� 7
              Call ������_�������_������(FileDBName, "����1", 5 + i, 7)
            End If
          
          End If
          
        End If
        
        ' �����: ����
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 9).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9)
        If Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).Value <> "" Then
          �����_�����_���� = �����_�����_���� + Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).Value
        End If
        
        ' �����: ���� �� ____
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 10).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10)
        If Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).Value <> "" Then
          �����_�����_���� = �����_�����_���� + Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).Value
        End If
        
        ' �����: ���.
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 11).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 11)
        
        ' �����: �������
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 12).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12)

        ' ������� ����� � ������� ������
        For columnNum = 3 To 12
          ' �����������
          Call ������_�����(FileDBName, "����1", 5 + i, columnNum)
        Next columnNum
        
        
        ' ���������: ����
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 15).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 15)
        
        ' ���������: ���.
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 16).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 16)
        
        ' ���������: �����.
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 17).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 17)
        
        ' ���������: �������� %
        ThisWorkbook.Sheets("����8").Cells(RowFromSheet8, 18).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 18)
        
    
        
      Next i

      ' ������ ����� ����� ������
      Call gorizontalLine(FileDBName, "����1", 5 + i)

      ' ���� ���������� � %, �� � ������ ������� ��������
      If ��_���_Var = "%" Then
        �����_�������_���� = �����_�������_���� / �����_������
        �����_�������_���� = �����_�������_���� / �����_������
        '
        �����_�����_���� = �����_�����_���� / �����_������
        �����_�����_���� = �����_�����_���� / �����_������
      End If

      ' ����� ����� �� ���:
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 2).Value = "����� �� ���:"
      ' �������: ����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).Value = �����_�������_����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).NumberFormat = "#,##0"
      ' �������: ���� �� ____
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).Value = �����_�������_����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).NumberFormat = "#,##0"
      ' �������: ���.
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7).Value = �����������(�����_�������_����, �����_�������_����, 3)
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7).NumberFormat = "0%"
      ' �������: �������
      If ��_���_Var <> "%" Then
        
        ' ���� �� 20-�� ������� �� ����� ��������� �������
        If InStr(��_�����_�������_��_20_�������_��_����_���������_str, ����������_������������) = 0 Then
          Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).Value = �������_��������_����(dateDB_����8, �����_�������_����, �����_�������_����, 5, 0)
          Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).NumberFormat = "0%"
        End If
        
      End If
      
      '
      ' �����: ����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).Value = �����_�����_����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).NumberFormat = "#,##0"

      ' �����: ���� �� ____
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).Value = �����_�����_����
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).NumberFormat = "#,##0"
      
      ' �����: ���.
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 11).Value = �����������(�����_�����_����, �����_�����_����, 3)
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 11).NumberFormat = "0%"
            
      ' �����: �������
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12).Value = ""
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12).NumberFormat = "0%"
      
    
      ' �������� �����
      Workbooks(FileDBName).Close SaveChanges:=True
    
      ' ��������� � ���, ��� �������� ���������
      MsgBox ("������ �� �" + ����������_������������ + "� ��������� � ����!")
  
      ' ������ - ������� ����?
      If MsgBox("������� �������������� ���� " + Dir(FileDBName) + "?", vbYesNo) = vbYes Then
        Workbooks.Open (ThisWorkbook.Path + "\Out\" + FileDBName)
      End If
  
      ' ������ - ��������� ���� � �����?
      If MsgBox("��������� �������������� ���� " + Dir(FileDBName) + " � �����?", vbYesNo) = vbYes Then
        Call ��������_Lotus_Notes_����������_����8(dateDB_����8, ����������_������������, ThisWorkbook.Path + "\Out\" + FileDBName)
      End If
  
    End If
  
  Else
  
    MsgBox ("��������� � ���� �����!")
  
  End If ' �������� ���������� � ����� �����
  
End Sub

' ������ �������������� �����
Sub gorizontalLine(In_FileDBName, In_Sheets, In_Row)

  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlDiagonalDown).LineStyle = xlNone
    
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlEdgeLeft).LineStyle = xlNone
  With Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
  End With
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range("B" + CStr(In_Row) + ":L" + CStr(In_Row)).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub



' ������ �������������� ����� 2
Sub gorizontalLineII(In_FileDBName, In_Sheets, In_Row, In_ColumnBegin, In_ColumnEnd)

  letterColumnBegin = ConvertToLetter(In_ColumnBegin)
  letterColumnEnd = ConvertToLetter(In_ColumnEnd)

  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlDiagonalDown).LineStyle = xlNone
    
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlEdgeLeft).LineStyle = xlNone
  With Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
  End With
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_FileDBName).Sheets(In_Sheets).Range(letterColumnBegin + CStr(In_Row) + ":" + letterColumnEnd + CStr(In_Row)).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub


' �������� ������ � �����������
Sub ��������_Lotus_Notes_����������_����8(In_dateDB_����8, In_����������_������������, In_fileName)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
    
    ' ���� ������ - ����:
    ���������� = In_����������_������������ + " �� " + CStr(In_dateDB_����8)

    ' hashTag - ������:
    hashTag = hashTagFromSheet("����8")

    ' ����-�������� (!!!)
    attachmentFile = In_fileName
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + In_����������_������������ + " �� " + CStr(In_dateDB_����8) + " �." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
    
    ' ���������
    MsgBox ("������ ����������!")
  
End Sub


' ���������� ��� �� �� ������
Sub ����������_���_��()
      
      ' ������ �������
      Application.StatusBar = "���������� ��� ��: ������������ ������..."
      
      ' ��������� ��������:
      ' ��������� ������
      If Dir(ThisWorkbook.Path + "\Templates\" + "���������� ��� ��.xlsx") <> "" Then
        ' ��������� ������ Templates\������� �� ��������
        TemplatesFileName = "���������� ��� ��"
      End If
              
      ' ��������� ������ �� C:\Users\...\Documents\#VBA\DB_Result\Templates
      Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����8").Activate

      ' ���� DB
      dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

      ' ��� ������ �����
      FileDBName = "���������� ��� " + Replace(CStr(dateDB_����8), ".", "-") + ".xlsx"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName)
      
      Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
      ' � "B2" ���������
      Workbooks(FileDBName).Sheets("����1").Range("A2").Value = "���������� ��� ������� �� " + ���������(dateDB_����8) + " �� " + CStr(dateDB_����8) + " �."
    
      ' ������� �� ������ ��� ��������
      If ThisWorkbook.Sheets("����8").Range("I3").Value = 1 Then
        ' 1 = �����
        cloumn_����8_���� = 9
        cloumn_����8_���� = 10
        cloumn_����8_���% = 11
        cloumn_����8_������� = 12
      Else
        ' 2 = �������
        cloumn_����8_���� = 5
        cloumn_����8_���� = 6
        cloumn_����8_���% = 7
        cloumn_����8_������� = 8
      End If
      
    
      ' ������� ������� �������� �� �����
      For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
            officeNameInReportIR = "�� " + Chr(34) + "���������" + Chr(34)
            officeName����7 = "���������"
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
            officeNameInReportIR = "��2" + Chr(34) + "����������" + Chr(34)
            officeName����7 = "����������"
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
            officeNameInReportIR = "��2 " + Chr(34) + "���������������" + Chr(34)
            officeName����7 = "���������������"
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
            officeNameInReportIR = "��2" + Chr(34) + "���������������" + Chr(34)
            officeName����7 = "���������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
            officeNameInReportIR = "��2 " + Chr(34) + "�����-����" + Chr(34)
            officeName����7 = "�����-����"
        End Select
        
        ' Function getRowFromSheet8(In_Office, In_ProductName)
        RowFromSheet8 = getRowFromSheet8(officeNameInReport, ����������_������������)
      
        ' �
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 1).Value = CStr(i)
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 1).HorizontalAlignment = xlCenter
        ' ����
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 2).Value = officeNameInReport
        
        ' ������. ������������: �������, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 3).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "��������������� �������"), cloumn_����8_�������).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 3).NumberFormat = "0%"
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeV(FileDBName, "����1", 5 + i, 3, Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 3).Value, 1)

        ' ������. ������������: ��������� PA, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 4).Value = ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", officeNameInReport, 100, 100), 17).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 4).NumberFormat = "0%"

        ' ������������� � ��, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).Value = ThisWorkbook.Sheets("�������").Cells(rowByValue(ThisWorkbook.Name, "�������", officeNameInReport, 100, 100), 7).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).NumberFormat = "0.0%"

        ' ������������ �����: �������, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������������ �����"), cloumn_����8_�������).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).NumberFormat = "0%"
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeV(FileDBName, "����1", 5 + i, 6, Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 6).Value, 1)

        ' ������������ �����: ���+��� �������, % !!! �������� ��� !!!
        ' ��� ������ ������� ��� Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ ��� ����"), 12).Value
        ' ����� ���� ��� + ���� ���
        ����_���_��� = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ ��� ����"), cloumn_����8_����).Value + ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ ��� ����"), cloumn_����8_����).Value
        ����_���_��� = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ ��� ����"), cloumn_����8_����).Value + ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ ��� ����"), cloumn_����8_����).Value
        
        ' ������ ������ ��������
        �����_���������_���_����_����� = Working_days_between_dates(Date_begin_day_month(dateDB_����8), dateDB_����8, 5)
        �����_���_����_����� = Working_days_between_dates(Date_begin_day_month(dateDB_����8), Date_last_day_month(dateDB_����8), 5)
        �������_���_���_���_��� = (����_���_��� / �����_���������_���_����_�����) * �����_���_����_�����
        �������_���_���_���� = �����������(����_���_���, �������_���_���_���_���, 3)
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7).Value = �������_���_���_����
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 7).NumberFormat = "0%"

        ' �� � �� � ���, % (N=60%)
        ��_����_�� = getDataFromSheet7(officeName����7, "������ ������������ (������� ����������� ����� ���������)")
        ���_����_�� = getDataFromSheet7(officeName����7, "���������� �����������")
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).Value = �����������(��_����_��, ���_����_��, 3)
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).NumberFormat = "0%"

        ' ��������� �����: �������, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "��������� ����� (�����.)"), cloumn_����8_�������).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).NumberFormat = "0%"
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeV(FileDBName, "����1", 5 + i, 9, Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 9).Value, 1)

        ' ��������� �����: ������ �� ������, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).Value = ThisWorkbook.Sheets("����6").Cells(rowByValue(ThisWorkbook.Name, "����6", officeNameInReport, 100, 100), 5).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).NumberFormat = "0%"

        ' ������ � ��, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 11).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������ � ��"), cloumn_����8_���%).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 11).NumberFormat = "0%"

        ' �������: �������, %
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "������"), cloumn_����8_���%).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12).NumberFormat = "0%"
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        ' Call Full_Color_RangeV(FileDBName, "����1", 5 + i, 12, Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 12).Value, 1)

        ' �������� �� ����� 18+
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 13).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(officeNameInReport, "���������� ����� 18+"), 7).Value
        Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 13).NumberFormat = "0%"
  
        ' ������ �������
        ' Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 14).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("������������ ������� �� ������", officeNameInReportIR), 13).Value
        ' Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 14).NumberFormat = "0%"
        
      Next i

      ' ������ ����� ����� ������
      Call gorizontalLineII(FileDBName, "����1", 5 + i, 2, 14)

      ' ����� ����� �� ���:
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 2).Value = "����� �� ���:"
      ' �������: ����
      ' Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).Value = �����_�������_����
      ' Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).NumberFormat = "#,##0"
    
      ' ������� �������� ��������� PA, %
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 4).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      
      ' ������� �������� ������������� � ��, %
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 5).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      
      ' ������� �������� �� � �� � ���, % (N=60%)
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 8).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      
      ' ������� �������� ������ �� ������, %
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 10).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      
      ' ������� �������� ������������� ��������
      Workbooks(FileDBName).Sheets("����1").Cells(5 + i, 14).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
    
      ' �������� �����
      Workbooks(FileDBName).Close SaveChanges:=True
    
      ' ������ �������
      Application.StatusBar = "���������� ��� ��: �������� ������..."
  
      ' �������� ����� � �����
      Call ��������_Lotus_Notes_����������_���_��_����8(ThisWorkbook.Path + "\Out\" + FileDBName, dateDB_����8)
  
      ' ������ �������
      Application.StatusBar = "���������� ��� ��: ����� ���������"
      Application.StatusBar = ""
  
  
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����������_���_��_����8(In_fileName, In_dateDB)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "���������� ��� 1 ��. 2021 �� " + CStr(In_dateDB) + " �."

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#����������_���_��"

    ' ����-�������� (!!!)
    attachmentFile = In_fileName
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����,����", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "� ������ ���������� ��������� �.3 ��������� �������� �6-01022021 ��������� ���� ���������� ��� �� " + strDDMM(In_dateDB) + "*" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "* - ����������: �� � �� � ��� ����� ����������� �������������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ����������
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
  ' End If
  
End Sub

' ��������� ���� � ������� ������ ������ �� ����� ����������� ����� (�� ������ ����� ��������)
' Templates\���������� ����� ������ (�������) 2.xlsx
Sub ���������_����_�������_������2()
Dim FileNewVar As String

  ' ��������� ���� �� ���� �� ����� ��������
  
  ' ������ �� ������������
  If MsgBox("������������ ��������� �� ���� ��� ������?", vbYesNo) = vbYes Then
      

    ' ���� ������������ - ���� ������� �����������, �� ��������� �� �������
    ' ���� ������� ���� ��� �����������, �� ��������� ����� �� �������
    If Weekday(CurrDate, vbMonday) = 1 Then
      dateReport = Date - 3
    Else
      dateReport = Date
    End If

    ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dateReports(In_dateReportStart, In_dateReportEnd, In_working_days_in_the_week) As Integer
    �������_�������_���� = Working_days_between_dates(dateReport - 1, Date_last_day_month(dateReport), 5)

    ' ������������ ����� � ����� (TemplateSheets)
    TS = "���������� �����"

    ' ������ � ������� ������ ��� �������������
    strFileNewVar_Office = ""

    ' �������� �� �����8 � ��������� �����:
    For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
        End Select
        
        ' ���������
        Application.StatusBar = "������������ �� " + officeNameInReport + "..."
                
        ' ��������� ������ C:\Users\proschaevsf\Documents\#DB_Result\Templates\���������� ����� ������ (�������) 2.xlsx
        fileTemplatesName = "���������� ����� ������ (�������) 2.xlsx"
        Workbooks.Open (ThisWorkbook.Path + "\Templates\" + fileTemplatesName)
        
        ' ��� ������ �����
        FileNewVar = "����������_�����_������_" + cityOfficeNameByNumber(i) + "_" + str��_MM_YYYY(dateReport) + ".xlsx"
         
        ' ��������� - ���� ���� ����, �� ������� ���
        Call deleteFile(ThisWorkbook.Path + "\Out\" + FileNewVar)
       
        Workbooks(fileTemplatesName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileNewVar, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
        
        ' ������ � ������� ������ ��� �������������
        strFileNewVar_Office = strFileNewVar_Office + ThisWorkbook.Path + "\Out\" + FileNewVar + " "
        ' ��������� �� ���� DB
        ThisWorkbook.Sheets("����8").Activate
    
        ' ��������� � ��������� �����
        Workbooks(FileNewVar).Sheets(TS).Range("A1").Value = "������� ��: " + CStr(dateReport) + " (���.���� " + CStr(�������_�������_����) + ")"
                
        ' ������� ������ ����� � ������
        row_TS = rowByValue(FileNewVar, TS, officeNameInReport, 100, 100)
        
        ' ������������ ������� � fileTemplatesName � �������������� �����������
        ColumnCount = 1
        Do While (ColumnCount <= 100)
          
          ' ���� ������� # � ������
          If InStr(Workbooks(FileNewVar).Sheets(TS).Cells(1, ColumnCount).Value, "#") <> 0 Then
            
            ' ������� ������� � ����� ������
            currProductName = Mid(Workbooks(FileNewVar).Sheets(TS).Cells(1, ColumnCount).Value, 2)
            
            ' ������� ������� ������� �� ����8 ��� �������� �����
            Row_����8 = getRowFromSheet8(officeNameInReport, currProductName)
            
            ' ������ ����� ���
            If Round(((ThisWorkbook.Sheets("����8").Cells(Row_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(Row_����8, 10).Value) / �������_�������_����), 0) > 0 Then
              Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).Value = Round(((ThisWorkbook.Sheets("����8").Cells(Row_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(Row_����8, 10).Value) / �������_�������_����), 0)
            Else
              Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).Value = 0
            End If

            ' ������ ������ �����
            Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).NumberFormat = "#,##0"
            
          End If ' ���� ������� # � ������
          
          ' ��������� �������
          ' Application.StatusBar = In_Product_Code + " " + In_officeNameInReport + ": " + CStr(rowCount) + "..."
          ColumnCount = ColumnCount + 1
          DoEventsInterval (ColumnCount)
        Loop
                
        ' ������ �������
        Application.StatusBar = "���������� " + officeNameInReport + "..."
                
        ' ��������� ����
        Workbooks(FileNewVar).Close SaveChanges:=True

        Application.StatusBar = "����������� ���� " + ThisWorkbook.Path + "\Out\" + FileNewVar
                
        ' ��������� �� ���� DB
        ThisWorkbook.Sheets("����8").Activate

        ' ������ �������
        Application.StatusBar = ""
        
    Next i


    Application.StatusBar = "�������� ������..."

    ' ��������� ��������� ����� �����, ������� https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd
    ' ��� ����� ������
    File7zipName = "����������_�����_������_" + str��_MM_YYYY(dateReport) + ".zip"
    Shell ("C:\Program Files\7-Zip\7z a -tzip -ssw -mx9 C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\" + File7zipName + " " + strFileNewVar_Office)

    Application.StatusBar = "����� ������!"

    MsgBox ("����������� ���� " + ThisWorkbook.Path + "\Out\" + FileNewVar + "!")

    Application.StatusBar = "���������� ��������� � ��������..."

    ' �������� � ����� � �����
    ' Call ��������_Lotus_Notes_����_����_����8(ThisWorkbook.Path + "\Out\" + FileNewVar, DateReport)
    Call ��������_Lotus_Notes_����_����_����8(ThisWorkbook.Path + "\Out\" + File7zipName, dateReport)
      
    ' ������ �������
    Application.StatusBar = "��������� ����������!"
    ' ������ �������
    Application.StatusBar = ""
      
  End If
  
End Sub



' ��������� �������������� ����� ��������� ������� ����������������
Function ����������������(In_ProductName)
  
  ' ���� In_ProductName ���������� � "� �.�. ��������� � ��" ��� ("           ���_����")
  If (Mid(In_ProductName, 1, 6) = "� �.�.") Or (Mid(In_ProductName, 1, 1) = " ") Then
    ' ������� X.Y - ��� ������
    ' �� �� ����������� ����������_�����_��������_��_����8
    ' ������� ����� ������������� �� �������
    ����������_�����_��������_�����_��_����8 = ����������_�����_��������_�����_��_����8 + 1
    ' ������� ��� �����
    ���������������� = CStr(����������_�����_��������_��_����8) + "." + CStr(����������_�����_��������_�����_��_����8)
  Else
    ' ������� ����� ����������
    ����������_�����_��������_�����_��_����8 = 0
    ' ����� ����� ����������� �� �������
    ����������_�����_��������_��_����8 = ����������_�����_��������_��_����8 + 1
    ' ������� ��� X - ��� �����
    ���������������� = CInt(����������_�����_��������_��_����8)
  End If
  
End Function

' ������� �� ����8 ����� �������� ����� ������
Sub fillBlockBlue(In_RowStart, In_RowEnd)
    
    Range("B16:B19").Select
    Application.CutCopyMode = False
    Selection.Interior.Pattern = xlSolid
    Selection.Interior.PatternColorIndex = xlAutomatic
    Selection.Interior.ThemeColor = xlThemeColorAccent1
    Selection.Interior.TintAndShade = 0.799981688894314
    Selection.Interior.PatternTintAndShade = 0
    
End Sub

' ������ ������
Sub ������_����8()
    
  ' ������
  If MsgBox("���������� ������ �� ������?", vbYesNo) = vbYes Then
    
      ' 1. �� ����������
      Range("A" + CStr(getRowFromSheet8("�� ����������", "�� ����������")) + ":T" + CStr(getRowFromSheet8("�� �����������", "�� �����������") - 1)).Select
      Selection.PrintOut Copies:=1, Collate:=True
      
      ' 2. �� �����������
      Range("A" + CStr(getRowFromSheet8("�� �����������", "�� �����������")) + ":T" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1)).Select
      Selection.PrintOut Copies:=1, Collate:=True
      
      ' 3. �� ����������������
      Range("A" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������")) + ":T" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1)).Select
      Selection.PrintOut Copies:=1, Collate:=True
      
      ' 4. �� ����������������
      Range("A" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������")) + ":T" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") - 1)).Select
      Selection.PrintOut Copies:=1, Collate:=True
      
      ' 5. �� ������-����
      Range("A" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����")) + ":T" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") - 1)).Select
      Selection.PrintOut Copies:=1, Collate:=True
      
      ' 6. ��� ���������
      Range("A" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������")) + ":T" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + (getRowFromSheet8("�� �����������", "�� �����������") - getRowFromSheet8("�� ����������", "�� ����������")))).Select
      Selection.PrintOut Copies:=1, Collate:=True

      ' ��������� � ������ �����
      Call ����8_�_������
    
  End If
    
End Sub

' DB_�������
Sub DB_�������(In_ReportName_String, In_Sheets, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Product_Code, In_Unit, In_Weight)
Dim dateDB As Date
  
  dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
    
  ' �������� ������� BASE\Products
  Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
       
  ' � DB �� ����1 ���������� �������
  ' DP4_����� (�����): �� "���������", ��2 "���������������", ��2 "�����-����", ��2"���������������", ��2"����������"
  column_DB_����1_DP4_����� = ColumnByValue(In_ReportName_String, "����1", "DP4_�����", 100, 100)
  ' ����_���_Q_�������
  column_DB_����1_����_���_Q_������� = ColumnByValue(In_ReportName_String, "����1", "����_���_Q_�������", 100, 100)
  ' ����_���_Q_�������
  column_DB_����1_����_���_Q_������� = ColumnByValue(In_ReportName_String, "����1", "����_���_Q_�������", 100, 100)
  ' ����_���_Q_�������
  column_DB_����1_����_���_Q_������� = ColumnByValue(In_ReportName_String, "����1", "����_���_Q_�������", 100, 100)
  
  rowCount_DB_����1 = 2
  Do While Not IsEmpty(Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_DP4_�����).Value)
  
    ' ���� ��� ������� ����
    If InStr(Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_DP4_�����).Value, getShortNameOfficeByName(In_officeNameInReport)) <> 0 Then
      
      ' 1. ������� �� ���� 8 ������ �� ������� � �������
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = In_Product_Name
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
      ' ��� �������, ���� �� �� �������
      If In_Weight <> 0 Then
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).Value = In_Weight
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).HorizontalAlignment = xlCenter
      End If
      '
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = In_Unit
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter
      
      ' ������� - ����
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).HorizontalAlignment = xlRight

      ' ������� - ����
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).HorizontalAlignment = xlRight

      ' ������� - ���������� (� %)
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 3)
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0%"
      ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).HorizontalAlignment = xlRight
        
      ' ������� - �������
      If ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value <> 0 Then
        
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value / Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).HorizontalAlignment = xlRight
      
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeII("����8", In_Row_����8, 8, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value, 1)
        
      End If
      
      ' 2. ������� � ��
      
      ' ������� � Sales_Office
      '  ������������� ID_Rec:
      ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
                        
      ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
      ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
      M_num = Nom_mes_quarter_str(dateDB)
      curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
                                      
      ' ������ ������ � BASE\Sales_Office �� ��.
      Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", In_officeNameInReport, _
                                                    "MMYY", strNQYY(dateDB), _
                                                      "Update_Date", dateDB, _
                                                       "Product_Code", In_Product_Code, _
                                                         "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, _
                                                            "Unit", In_Unit, _
                                                              "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
                                                                "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, _
                                                                  curr_Day_Month_Q, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
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
    rowCount_DB_����1 = rowCount_DB_����1 + 1
    DoEventsInterval (rowCount)
    
  Loop
  
End Sub


' ��������� ���������� "���� � DB ���� �� ������"
Sub �_DB_����_��_������(In_StringInSheet)
          
  ' ������� StringInSheet � ���������� ������_���_�����_�_DB
  If InStr(������_���_�����_�_DB, In_StringInSheet) = 0 Then
    
    ������_���_�����_�_DB = ������_���_�����_�_DB + In_StringInSheet + ", "
    ' Call �_DB_����_��_������(StringInSheet)
    
    ' ���� � DB ���� �� ������ - ������� ���������
    MsgBox ("�� ������ ���� " + Chr(34) + In_StringInSheet + Chr(34)) ' + " � " + ReportName_String)

  End If
  
End Sub


' ������ ������ "��������" / "������"
Function �������_�����_����() As String
    
    ' ���� �������� �������� N7="1"
    If ThisWorkbook.Sheets("����8").Range("N7").Value = 1 Then
      ' �����
      �������_�����_���� = "������"
    Else
      ' �������
      �������_�����_���� = "��������"
    End If

End Function

' ������ ������ � ����� ��������� �������� ��� ������
Function �����������_����_�������_�����(In_Date) As String
    
    ' ���� �������� �������� N7="1"
    If ThisWorkbook.Sheets("����8").Range("N7").Value = 1 Then
      ' �����
      �����������_����_�������_����� = CStr(Date_last_day_month(In_Date))
    Else
      ' �������
      �����������_����_�������_����� = CStr(Date_last_day_quarter(In_Date))
    End If

End Function

' ������������_��������_��������
Sub ������������_��������_��������(In_ReportName_String)
      
      ' ������ �������
      Application.StatusBar = "������� ��������: ������������..."
      
      ' ��������� ������
      If Dir(ThisWorkbook.Path + "\Templates\" + "������������ ������� �������.xlsx") <> "" Then
        ' ��������� ������
        TemplatesFileName = "������������ ������� �������"
      End If
              
      ' ��������� ������ �� C:\Users\...\Documents\#VBA\DB_Result\Templates
      Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����8").Activate

      ' ���� DB
      dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

      ' ��� ������ �����
      FileDBName = "������� �������� " + Replace(CStr(dateDB_����8), ".", "-") + ".xlsx"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName)
      
      Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
      ' � "A1" ���������
      Workbooks(FileDBName).Sheets("����1").Range("A1").Value = "������������ �������� �� " + CStr(dateDB_����8) + " �."
      
      ' ���� �� ���� "������������ �������_�������"?
      StringInSheet = "������������ �������_�������"
      SheetName_String = FindNameSheet(In_ReportName_String, StringInSheet)
      If SheetName_String <> "" Then
    
        ' I. �������� �� DB ������ �� �������� 1-18 � ����� "3. ������������ �������_�������" - ��
        ' ������� ������� �������� � ����� ������ ��������� DB, ����� ������� Workbooks(In_ReportName_String).Sheets(SheetName_String).PivotTables("������� �������1").PivotFields("DP3_�����_new").PivotItems("��������� ��1").ShowDetail = True
        
        row_���������_��1 = rowByValue(In_ReportName_String, SheetName_String, "��������� ��1", 100, 100)
        column_���������_��1 = ColumnByValue(In_ReportName_String, SheetName_String, "��������� ��1", 300, 300)
        row_����1 = 5

        ' I.1 �������� ���� 5 ����� � 8 ��������
        For i = row_���������_��1 + 1 To row_���������_��1 + 5
      
          row_����1 = row_����1 + 1
      
          For j = column_���������_��1 To column_���������_��1 + 7
            
            ' Workbooks(In_ReportName_String).Sheets(SheetName_String).Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i - 20, j - 1)
            Workbooks(In_ReportName_String).Sheets(SheetName_String).Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(row_����1, j - 1)
            
            ' ���� ������� ������� = (column_���������_��1 + 7), �� ��������� � BASE\Sales_Office
            If j = (column_���������_��1 + 7) Then
              
              ' ��������� � BASE\Sales_Office. ������������ ������ ��2 "�����-����", ��2 "���������������", ��2"���������������", �� "���������", ��2"����������"
              In_officeNameInReport = Workbooks(FileDBName).Sheets("����1").Cells(row_����1, 2).Value
              In_Product_Name = "������������ �������"
              In_Product_Code = "�������"
              ����_��_����� = Round(Workbooks(FileDBName).Sheets("����1").Cells(row_����1, 9).Value * 100, 2)
      
              '  ������������� ID_Rec:
              ID_RecVar = CStr(CStr(getNumberOfficeByName2(In_officeNameInReport)) + "-" + strMMYY(dateDB_����8) + "-" + In_Product_Code)
            
              ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
              curr_Day_Month = "Date_" + Mid(dateDB_����8, 1, 2)
      
              ' ������ ������ � BASE\Sales_Office �� ��.
              Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                            "ID_Rec", ID_RecVar, _
                                              "�ffice_Number", getNumberOfficeByName2(In_officeNameInReport), _
                                                "Product_Name", In_Product_Name, _
                                                  "�ffice", getShortNameOfficeByName(In_officeNameInReport), _
                                                    "MMYY", strMMYY(dateDB_����8), _
                                                      "Update_Date", dateDB_����8, _
                                                        "Product_Code", In_Product_Code, _
                                                          "Plan", "100", _
                                                             "Unit", "%", _
                                                               "Fact", ����_��_�����, _
                                                                 "Percent_Completion", "", _
                                                                   "Prediction", "", _
                                                                     "Percent_Prediction", "", _
                                                                       curr_Day_Month, ����_��_�����, _
                                                                         "", "", _
                                                                           "", "", _
                                                                             "", "", _
                                                                               "", "", _
                                                                                 "", "", _
                                                                                   "", "")

              
            End If ' ���� ������� ������� = (column_���������_��1 + 7), �� ��������� � BASE\Sales_Office
            
            DoEvents
            
          Next j
      
        Next i

        
        ' I.2 ����������� ������� ������: �������� ������ ������� ��������, �������� ������������ ������, ������� ������� ����� � %
        For i = 1 To 5
          
          ' � - �������� ������ ������� ��������
          Workbooks(FileDBName).Sheets("����1").Cells(i + 5, 1).Value = CStr(i)
          Workbooks(FileDBName).Sheets("����1").Cells(i + 5, 1).HorizontalAlignment = xlCenter
          ' �������� ������������ ������
          Workbooks(FileDBName).Sheets("����1").Cells(i + 5, 2).Value = updateNameOfficeByName(Workbooks(FileDBName).Sheets("����1").Cells(i + 5, 2))
          ' ����������� (������� ������� ���� � %)
          For j = 3 To 9
            Workbooks(FileDBName).Sheets("����1").Cells(i + 5, j).NumberFormat = "0%"
          Next j
          
        Next i
        
        ' I.3 �������� ������� ������ � ������� �� �����8
        row_����8_������������_�������_��_������ = getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������")
        ' ���������
        For j = 3 To 9
          ThisWorkbook.Sheets("����8").Cells(row_����8_������������_�������_��_������ + 1, j).Value = Workbooks(FileDBName).Sheets("����1").Cells(4, j).Value
          ThisWorkbook.Sheets("����8").Cells(row_����8_������������_�������_��_������ + 1, j).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(row_����8_������������_�������_��_������ + 2, j).Value = Workbooks(FileDBName).Sheets("����1").Cells(5, j).Value
        Next j
        
        ' ���������� �������� �� �� ����8 �������� (5 ����� � 9 ��������)
        For i = 1 To 5
          For j = 1 To 9
            
            Workbooks(FileDBName).Sheets("����1").Cells(i + 5, j).Copy Destination:=ThisWorkbook.Sheets("����8").Cells(row_����8_������������_�������_��_������ + 2 + i, j)
            DoEvents
            
          Next j
        Next i
         

        ' II. �������� �� DB ������ �� �������� 1-18 � ����� "3. ������������ �������_�������" - �������
        
        ' ��������� ���� �����
        ' ��������� ������� "����1" �� �����������
        ' row_���������_��1 = rowByValue(In_ReportName_String, SheetName_String, "��������� ��1", 100, 100)
        ' column_���������_��1 = ColumnByValue(In_ReportName_String, SheetName_String, "��������� ��1", 300, 300)
        
        Workbooks(In_ReportName_String).Sheets(SheetName_String).Cells(row_���������_��1, column_���������_��1).ShowDetail = False

        
        
        ' ���� ����� ���� ���� - ������� ������ "� �/�"
        row_�_�� = rowByValue(In_ReportName_String, SheetName_String, "� �/�", 100, 100)
        column_�_�� = ColumnByValue(In_ReportName_String, SheetName_String, "� �/�", 300, 300)
        row_����1 = 16
         
        ' �������� ���� 18 ����� � 8 ��������
        For i = row_�_�� + 1 To row_�_�� + 18
          
          row_����1 = row_����1 + 1
          
          For j = column_�_�� To column_�_�� + 8
            
            ' Workbooks(In_ReportName_String).Sheets(SheetName_String).Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i + 9, j - 1)
            Workbooks(In_ReportName_String).Sheets(SheetName_String).Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(row_����1, j - 1)
            DoEvents
          Next j
        Next i
        
        ' ����������� ������� �������� ��: ������� ��������� ������������ ������� (���� ��� �� ��������� ��1), ������� ������� ����� � %
        For i = 17 To 34
          
          ' ������� ��������� ������������ ������� (���� ��� �� ��������� ��1)
          If InStr(Workbooks(FileDBName).Sheets("����1").Cells(i, 2).Value, "��������� ��1") = 0 Then
            
            For j = 1 To 9
              ' ������ ������ � �������� ��������
              Call ������_������_��������_��������(FileDBName, "����1", i, j)
            Next j
            
          End If
                     
          ' ����������� (������� ������� ���� � %) - ��� ����!
          For j = 3 To 9
            Workbooks(FileDBName).Sheets("����1").Cells(i, j).NumberFormat = "0%"
          Next j
          
        Next i
        
      
      Else
        ' ���� � DB ���� �� ������
        ' ���������, ��� ����� ���!
      End If
   
    
      ' �������� �����
      Workbooks(FileDBName).Close SaveChanges:=True
    
      ' ������ �������
      Application.StatusBar = "������� ��������: �������� ������..."
  
      ' �������� ����� � �����
      Call ��������_Lotus_Notes_�������_��������(ThisWorkbook.Path + "\Out\" + FileDBName, dateDB_����8)
  
      ' ������ �������
      Application.StatusBar = "������� ��������: ����� ���������!"
      Application.StatusBar = ""
  
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_�������_��������(In_fileName, In_dateDB)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "������� �������� � ������ �� " + CStr(In_dateDB) + " �."

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#�������_��������"

    ' ����-�������� (!!!)
    attachmentFile = In_fileName
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����,����,���", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������� �������� �� ��������� �� " + strDDMM(In_dateDB) + " � �������� ���������� ������ ��������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "* - ����������: �� � �� � ��� ����� ����������� �������������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ����������
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
  ' End If
  
End Sub

' �������������� ������ �������� ��������
Sub ������_������_��������_��������(In_Workbooks, In_Sheets, In_Row, In_Col)
  
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Font.Bold = False
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalDown).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeLeft).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeTop).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub

' ���������� �� ������ ���������
Sub ����������_��_������_with_Msg()
  
  ' ������
  If MsgBox("������������ ���������� �� ������?", vbYesNo) = vbYes Then
    Call ����������_��_������
    MsgBox ("������ � ������������ ������������!")
  End If

End Sub


' ���������� �� ������ ���������
Sub ����������_��_������()
Dim ����������, �����������, hashTag, attachmentFile As String
' Dim ���� As Byte

  ' ������ �������
  Application.StatusBar = "���������� �� ������..."

  ' ��������� BASE\Sales
  OpenBookInBase ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  OpenBookInBase ("TargetWeek")
  ThisWorkbook.Sheets("����8").Activate

  OpenBookInBase ("Products")
  ThisWorkbook.Sheets("����8").Activate


  ' �������� �� 5-�� ������
  ' ���������
  For i = 1 To 5 ' 5 - �� ������ �������
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' �� ����������
        officeNameInReport = "�� ����������"
        �������_������ = getFromAddrBook("�������1,����,���", 2)
      Case 2 ' �� �����������
        officeNameInReport = "�� �����������"
        �������_������ = getFromAddrBook("���" + CStr(i), 2)
      Case 3 ' �� ����������������
        officeNameInReport = "�� ����������������"
        �������_������ = getFromAddrBook("���" + CStr(i), 2)
      Case 4 ' �� ����������������
        officeNameInReport = "�� ����������������"
        �������_������ = getFromAddrBook("���" + CStr(i), 2)
      Case 5 ' �� ������-����
        officeNameInReport = "�� ������-����"
        �������_������ = getFromAddrBook("���" + CStr(i), 2)
    End Select
  
    ' ��������� ���� � �������� "���� �� ������.xlsx"
    If Dir(ThisWorkbook.Path + "\Templates\" + "���� �� ������.xlsx") <> "" Then
      ' ��������� ������ Templates\���������� ����� �� ��������
      TemplatesFileName = "���� �� ������"
    End If
              
    ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
    Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����8").Activate

    ' ��� ������ �����
    FileTargetWeekName = getShortNameOfficeByName(officeNameInReport) + "_" + CStr(dateDB_����_8) + ".xlsx"
    
    ' ��������� - ���� ���� ����, �� ������� ���
    Call deleteFile(ThisWorkbook.Path + "\Out\" + FileTargetWeekName)
    
    ' ��������������� ������ � ����� ����
    Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileTargetWeekName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    ' ThisWorkbook.Sheets("����8").Range("Q3").Value = ThisWorkbook.Path + "\Out\" + FileTargetWeekName
    
    ' ��������� � ����� ����� (������, ����)
    ' ���� �� ������ � A2
    Workbooks(FileTargetWeekName).Sheets("����1").Range("A2").Value = "���� �� ������ c " + strDDMM(weekStartDate(Date)) + " �� " + CStr(weekEndDate(Date) - 2)
    ' ����
    Workbooks(FileTargetWeekName).Sheets("����1").Range("B3").Value = officeNameInReport
    ' �������
    Workbooks(FileTargetWeekName).Sheets("����1").Range("E4").Value = ThisWorkbook.Sheets("����8").Range("E8").Value
    ' ����
    Workbooks(FileTargetWeekName).Sheets("����1").Range("F5").Value = ThisWorkbook.Sheets("����8").Range("F9").Value
    ' ���� �� ������
    Workbooks(FileTargetWeekName).Sheets("����1").Range("I4").Value = "���� �� ������ " + strDDMM(weekStartDate(Date)) + "-" + strDDMM(weekEndDate(Date) - 2)
    ' ����� ��������� ������
    Workbooks(FileTargetWeekName).Sheets("����1").Range("L4").Value = "����� ��������� ������ " + strDDMM(weekStartDate(Date - 7)) + "-" + strDDMM(weekEndDate(Date - 7) - 2)
    
    ' ������� ���������� �� �������� ��
  
    ' *** ��������� ������ ***
    
    ' ���� ������
    ���������� = "���������� �� " + officeNameInReport + " �� �� �� " + CStr(dateDB_����_8)

    ' hashTag - ������:
    hashTag = "#��_�� #��_" + getShortNameOfficeByName(officeNameInReport)

    ' ����-��������
    attachmentFile = ThisWorkbook.Path + "\Out\" + FileTargetWeekName
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ' ����������� = ����������� + "" + getFromAddrBook("���" + CStr(i), 2) + Chr(13)
    ����������� = ����������� + "" + �������_������ + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    
    
    ' *** ��������� ***
    ' ���� ������� ���� ������, �� ��� ��������
    ' ����������� = ����������� + getFromAddrBook("���" + CStr(i), 6) + ������_����_����_�����(Time()) + Chr(13)
    ' ���� ��������, �� �� �����
    ����������� = ����������� + getFromAddrBook("���" + CStr(i), 6) + ", " + ������_����_����_�����(Time(), "�") + ", " + Chr(13)
    ' *** ��������� ***
    
    ' *** ������ ������ ***
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + �������������_����_����������� + " " + officeNameInReport + " �� " + strDDMM(dateDB_����_8) + ":" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    
    ' ����� ������
    �����_������ = 0
    
    ' 1. ���������� � "������� ����"
    ����������_�������_����_Q_Var = ����������_�������_������_�������_����_Q(officeNameInReport, 1, 1000, FileTargetWeekName) ' ����������_�������_����_Q(officeNameInReport)
    If ����������_�������_����_Q_Var <> "" Then
      �����_������ = �����_������ + 1
      ����������� = ����������� + CStr(�����_������) + ". ���������� � ������� ����: " + ����������_�������_����_Q_Var + Chr(13)
    Else
      ' ���� ��� �� ������ ���������� � ������� ����
      �����_������ = �����_������ + 1
      ����������� = ����������� + CStr(�����_������) + ". ��� �� ������ ���������� � ������� ����!" + Chr(13)
    End If
    ����������� = ����������� + "" + Chr(13)
    
    ' 2. ���������� � "������ ����"
    �����_������ = �����_������ + 1
    ����������_������_����_Q_Var = ����������_�������_������_�������_����_Q(officeNameInReport, 0.9, 1, FileTargetWeekName)
    ����������� = ����������� + CStr(�����_������) + ". ���������� � ������ ����: " + ����������_������_����_Q_Var + Chr(13)
    ' ����������� = ����������� + "- " + ����������_������_����_Q(officeNameInReport) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    
    ' 3. ���������� � "������� ����"
    �����_������ = �����_������ + 1
    ����������_�������_����_Q_Var = ����������_�������_������_�������_����_Q(officeNameInReport, 0, 0.8999, FileTargetWeekName)
    ����������� = ����������� + CStr(�����_������) + ". ���������� � ������� ����: " + ����������_�������_����_Q_Var + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    
    ' 4. ���������������� �����������
    ' �����_������ = �����_������ + 1
    ' ����������� = ����������� + CStr(�����_������) + ". ���������������� �����������:" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    
    ' 5. ��������� ��
    ' �����_������ = �����_������ + 1
    ' ����������� = ����������� + CStr(�����_������) + ". ��������� ��:" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    
    ' 6. ���� �� ������
    �����_������ = �����_������ + 1
    ����������� = ����������� + CStr(�����_������) + ". ���� �� ������ � ���� ���������� ��������� ������� ������:" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    
    
    
    ' *** ������ ������ ***
    
    
    
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "* - ����������: �� � �� � ��� ����� ����������� �������������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    
    ' �������� �����
    Workbooks(FileTargetWeekName).Close SaveChanges:=True
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
    
    ' *** ��������� ������ ***
  
  Next i
  
  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("TargetWeek")
  
  ' ��������� BASE\Sales
  OpenBookInBase ("Products")
  
  ThisWorkbook.Sheets("����8").Activate

  ' ������ �������
  Application.StatusBar = ""
  
End Sub

' ���������� �� ������ ���������
Sub ����������_��_���()
Dim ����������, �����������, hashTag, attachmentFile As String
' Dim ���� As Byte

  ' ������ �������
  Application.StatusBar = "���������� �� ���..."

  ' ��������� BASE\Sales
  OpenBookInBase ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  OpenBookInBase ("TargetWeek")
  ThisWorkbook.Sheets("����8").Activate

  ' ������������ �����
  officeNameInReport = "��� (+���)"
  
  ' ��������� ���� � �������� "���� �� ������.xlsx"
  If Dir(ThisWorkbook.Path + "\Templates\" + "���� �� ������.xlsx") <> "" Then
    ' ��������� ������ Templates\���������� ����� �� ��������
    TemplatesFileName = "���� �� ������"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����8").Activate

  ' ��� ������ �����
  FileTargetWeekName = officeNameInReport + "_" + CStr(dateDB_����_8) + ".xlsx"
    
  ' ��������� - ���� ���� ����, �� ������� ���
  Call deleteFile(ThisWorkbook.Path + "\Out\" + FileTargetWeekName)
    
  ' ��������������� ������ � ����� ����
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileTargetWeekName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  
    
  ' ��������� � ����� ����� (������, ����)
  ' ���� �� ������ � A2
  Workbooks(FileTargetWeekName).Sheets("����1").Range("A2").Value = "���� �� ������ c " + strDDMM(weekStartDate(Date)) + " �� " + CStr(weekEndDate(Date) - 2)
  ' ����
  Workbooks(FileTargetWeekName).Sheets("����1").Range("B3").Value = officeNameInReport
  ' �������
  Workbooks(FileTargetWeekName).Sheets("����1").Range("E4").Value = ThisWorkbook.Sheets("����8").Range("E8").Value
  ' ����
  Workbooks(FileTargetWeekName).Sheets("����1").Range("F5").Value = ThisWorkbook.Sheets("����8").Range("F9").Value
  ' ���� �� ������
  Workbooks(FileTargetWeekName).Sheets("����1").Range("I4").Value = "���� �� ������ " + strDDMM(weekStartDate(Date)) + "-" + strDDMM(weekEndDate(Date) - 2)
  ' ����� ��������� ������
  Workbooks(FileTargetWeekName).Sheets("����1").Range("L4").Value = "����� ��������� ������ " + strDDMM(weekStartDate(Date - 7)) + "-" + strDDMM(weekEndDate(Date - 7) - 2)

  ' ������� ���������� �� �������� ��
  
  ' *** ��������� ������ ***
    
  ' ���� ������
  ���������� = "���������� �� " + officeNameInReport + " �� " + CStr(dateDB_����_8)

  ' hashTag - ������:
  hashTag = "#��_�� #��_" + officeNameInReport

  ' ����-��������
  attachmentFile = ThisWorkbook.Path + "\Out\" + FileTargetWeekName
    
  ' ����� ������
  ����������� = "" + Chr(13)
  ����������� = ����������� + "" + getFromAddrBook("����" + CStr(i), 2) + ", Marat Albertovich Timergaliev/Tyumen/PSBank/Ru, Yuriy Vladimirovich Martyuchenko/Tyumen/PSBank/Ru" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
  ����������� = ����������� + "" + Chr(13)
    
    
  ' *** ��������� ***
  ' ���� ������� ���� ������, �� ��� ��������
  ' ����������� = ����������� + getFromAddrBook("���" + CStr(i), 6) + ������_����_����_�����(Time()) + Chr(13)
  ' ���� ��������, �� �� �����
  ' ����������� = ����������� + getFromAddrBook("���" + CStr(i), 6) + ", " + ������_����_����_�����(Time(), "�") + ", " + Chr(13)
  
  ����������� = ����������� + "��������� ������������, " + Chr(13)
  
  
  ' *** ��������� ***
    
  ' *** ������ ������ ***
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + �������������_����_����������� + " " + officeNameInReport + " (� �.�. ����� ���) �� " + strDDMM(dateDB_����_8) + " � ���� �� ������:" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
    
  ' ����� ������
  �����_������ = 0
    
  ' �������� ��� ��� ����� �� "����� �� ��� ����������":
  ' 1) "���������� ����� 18+"
  ' 2) "�������� �� 18+, ��._������� "
  ' 3) "� �.�. �� DSA"
  ' 4) "           �� DSA"
  ' 5) "           �� � ��"
  
  ' ������� ������ ��������� "����������" � �������� �����
  row_����1_���������� = rowByValue(FileTargetWeekName, "����1", "����������", 50, 50)
  
  For i = 1 To 5
  
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' "���������� ����� 18+"
        productName = "���������� ����� 18+"
        �����������_���������� = "���������� ����� 18+"
        row_���_�������� = getRowFromSheet8("����� �� ��� ����������", "���������� ����� 18+")
      Case 2 ' "�������� �� 18+, ��._������� "
        productName = "�������� �� 18+, ��._������� "
        �����������_���������� = "�������� �� 18+, ��._������� "
        row_���_�������� = getRowFromSheet8("����� �� ��� ����������", "�������� �� 18+, ��._������� ")
      Case 3 ' "� �.�. �� DSA"
        productName = "� �.�. �� DSA"
        �����������_���������� = "������ ������� DSA"
        row_���_�������� = getRowFromSheet8("����� �� ��� ����������", "��������������� �������")
      Case 4 ' "           �� DSA"
        productName = "           �� DSA"
        �����������_���������� = "��������� ����� DSA"
        row_���_�������� = getRowFromSheet8("����� �� ��� ����������", "��������� ����� (�����.)")
      Case 5 ' "           �� � ��"
        productName = "           �� � ��"
        �����������_���������� = "��������� ����� � ��"
        row_���_�������� = getRowFromSheet8("����� �� ��� ����������", "��������� ����� (�����.)")
    End Select

    ' ������� ����� ������ ��� ���������� ������� �� ����8 ��� ��� ���������
    row_����8_productName = getRowFromSheet8("����� �� ��� ����������", productName)
  
    ' ��������� #1
    ' �����
    Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 1).Value = i
        
    ' ������������ ����������
    ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 2)
    Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 2).Value = �����������_����������
        
    ' ���
    ThisWorkbook.Sheets("����8").Cells(row_���_��������, 3).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 3)
    Call ������_������_����_��_������(FileTargetWeekName, "����1", row_����1_���������� + 1 + i, 3)
        
    ' ��.���.
    ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 4).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 4)
        
    ' ����
    ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 5).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 5)
        
    ' ����
    ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 6).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 6)
        
    ' ���������� Q
    ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 7).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 7)
        
    ' ���� ��� �������� ��� �������, �� �������=����
    If (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "��������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "�������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "������") <> 0) Then
      ' ����
      column_������� = 7
    Else
      ' ��������� �������
      column_������� = 20
    End If
        
    ' ������� (���� ������� �� ����� ��  ������� 7 �� ����8)
    If column_������� <> 7 Then
          
      ThisWorkbook.Sheets("����8").Cells(row_����8_productName, column_�������).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 8)
                    
    End If
        
    ' ����������� ���������� �������� � ������� (����)
    ' ���� "�������" ����, �� �������� ��� ��������, � � "���. Q" ������� ����
    If Not IsEmpty(Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 8).Value) Then
      
      ' ������� ������� � "���. Q"
      Call ������_�������_������(FileTargetWeekName, "����1", row_����1_���������� + 1 + i, 7)
      ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
      Call Full_Color_RangeV(FileTargetWeekName, "����1", row_����1_���������� + 1 + i, 8, Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 8).Value, 1)
    End If
        
    ' ���� ������
    ' ��������� ������ ���� �� ������:
    ����_������_������_��_DB = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
    ����_���������_������_��_DB = ����_������_������_��_DB + 7
    ' ����_���������_������_��_DB = ����_������_������_��_DB + 6
          
    ' ���� ������ ��������� �� ����� �������, �� ����� ��������� ���� ��������
    If ����_���������_������_��_DB > Date_last_day_quarter(����_������_������_��_DB) Then
      ����_���������_������_��_DB = Date_last_day_quarter(����_������_������_��_DB)
    End If
          
    ' ���� ���������� ���������������, �� ������ ��������� ��������, ����� ��������� �� 100%
    If Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 8).Value > 1 Then
            
      ' ���������, ����� ���� �� �����! ����� ������
      ' ����_��������_�������� = Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_����������, 8).Value / 100
        
    Else
      ����_��������_�������� = 1
    End If
          
    ' ����������� �������, ������� ��������! ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0)
    ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(����_���������_������_��_DB, _
                                                                                      Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 5).Value, _
                                                                                        ����_��������_��������, _
                                                                                          5, _
                                                                                            0)
                                                                                            
    �����������_�������_��_������ = ����_��_����_���_��������_��������_Var - Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 6).Value
          
    ' ���� ����������� ������������� �� ������ ��� ���� �����������<100% � ��������
    If �����������_�������_��_������ > 0 Then
          
      ' ���� ��� �������� ��� �������, �� �������=����
      If (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "��������") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "�������") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 2).Value, "������") = 0) Then
          
        ' �������� ��������� ������ (�� ����)
        Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 5).Copy Destination:=Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 9)
        Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 9) = �����������_�������_��_������
          
        ' ��������� ������� �� ����� ������
        Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 10).Value = �������_��������_����(����_���������_������_��_DB, _
                                                                                                                     Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 5).Value, _
                                                                                                                       Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 6).Value + Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 9).Value, _
                                                                                                                        5, _
                                                                                                                         0)
        Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 10).NumberFormat = "0%"
        Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 10).HorizontalAlignment = xlRight
                              
      End If
                              
    End If
    
    ' ��������� ���� ������� �� ��������� ������ �� �������� ����������!
    ' "����� ��������� ������ " + strDDMM(weekStartDate(Date - 7)) + "-" + strDDMM(weekEndDate(Date - 7) - 2)
    ' ���������� Q
    Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 12).Value = ThisWorkbook.Sheets("����8").Cells(row_����8_productName, 16).Value
    Workbooks(FileTargetWeekName).Sheets("����1").Cells(row_����1_���������� + 1 + i, 12).NumberFormat = "#,##0"
 
  Next i
  ' *** ������ ������ ***
    
    
    
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ' ����������� = ����������� + "* - ����������: �� � �� � ��� ����� ����������� �������������" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ����������� = ����������� + "" + Chr(13)
  ' ������� (������� � ��., )
  ����������� = ����������� + ��������������()
  ' ������
  ����������� = ����������� + createBlankStr(27) + hashTag
    
  ' �������� �����
  Workbooks(FileTargetWeekName).Close SaveChanges:=True
    
  ' �����
  Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
    
  ' *** ��������� ������ ***
  
  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("TargetWeek")
  ThisWorkbook.Sheets("����8").Activate
  
  ' ������ �������
  Application.StatusBar = ""
    
End Sub


' ���� ��������
Sub AscW_ChrW()
  ThisWorkbook.Sheets("����8").Range("X7").Value = AscW(ThisWorkbook.Sheets("����8").Range("V7").Value)
End Sub


' ���������� MBO
Function ����������_MBO(In_Product_Name) As Boolean
      
  ����������_MBO = False
  
  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  ' OpenBookInBase ("MBO")
  ' ThisWorkbook.Sheets("����8").Activate
  
  ����������_������ = False
  column_Product_Name = 2
  rowCount = 2
  
  ' ������������ ���� - ���� ������� ����, ���� ������� ����, �� ���� ������� � ������������� ��������
  Do While (Not IsEmpty(Workbooks("MBO").Sheets("����1").Cells(rowCount, column_Product_Name).Value)) And (����������_������ = False)
  
    ' ��������� �������� � �����
    If Workbooks("MBO").Sheets("����1").Cells(rowCount, column_Product_Name).Value = In_Product_Name Then
      ����������_MBO = True
      ����������_������ = True
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop

  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  ' CloseBook ("MBO")
  ' ThisWorkbook.Sheets("����8").Activate
  
End Function


' ���������� � �������_������_������� ����
Function ����������_�������_������_�������_����_Q(In_officeNameInReport, In_LowRange, In_UpperRange, In_FileTargetWeekName) As String
      
  ����������_�������_������_�������_����_Q = ""
  
  ' ����� � ����� �� ����������
  rowCount = rowByValue(ThisWorkbook.Name, "����8", In_officeNameInReport, 1000, 100) + 3
  
  ' ����� � ����1
  row_����������_����1 = rowByValue(In_FileTargetWeekName, "����1", "����������", 100, 100) + 2
  �����_�����_����1 = 1
  
  ' ������������ ���� - ���� ������� ����, ���� ������� ����, �� ���� ������� � ������������� ��������
  Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�� �") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0)
  
    ' ��������� �������� � �����
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "") Or (����������_MBO(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) = True) Then
      
      ' ������� ���� � �������� 8 ��� ����� �� 20-��
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value <> "" Then
        column_������� = 8
      Else
       
       
      ' ���� ��� �������� ��� �������, �� �������=����
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "��������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������") <> 0) Then
        ' ����
        column_������� = 7
      Else
        ' ��������� �������
        column_������� = 20
      End If
       
      End If
      
      ' ��������� ������� ��������
      If (ThisWorkbook.Sheets("����8").Cells(rowCount, column_�������).Value >= In_LowRange) And ((ThisWorkbook.Sheets("����8").Cells(rowCount, column_�������).Value <= In_UpperRange)) Then
      
        If ����������_�������_������_�������_����_Q <> "" Then
          ����������_�������_������_�������_����_Q = ����������_�������_������_�������_����_Q + ", "
        End If
        
        ����������_�������_������_�������_����_Q = ����������_�������_������_�������_����_Q + ����2(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, column_�������).Value * 100, 0)) + "%)"
        
        ' ��������� ������ � ��������� ������� FileTargetWeekName
        Do While Not IsEmpty(Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 1).Value)
          �����_�����_����1 = �����_�����_����1 + 1
          row_����������_����1 = row_����������_����1 + 1
        Loop
        
        ' ��������� #1
        ' �����
        Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 1).Value = �����_�����_����1
        
        ' ������������ ����������
        ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2)
        
        ' ���
        ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 3)
        
        ' ��.���.
        ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 4)
        
        ' ����
        ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5)
        
        ' ����
        ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6)
        
        ' ����������
        ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 7)
        
        ' ������� (���� ������� �� ����� ��  ������� 7 �� ����8)
        If column_������� <> 7 Then
          
          ThisWorkbook.Sheets("����8").Cells(rowCount, column_�������).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8)
                    
        End If
        
        ' ���� ������
        ' ��������� ������ ���� �� ������:
        ����_������_������_��_DB = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
        ����_���������_������_��_DB = ����_������_������_��_DB + 7
        ' ����_���������_������_��_DB = ����_������_������_��_DB + 6
          
        ' ���� ������ ��������� �� ����� �������, �� ����� ��������� ���� ��������
        If ����_���������_������_��_DB > Date_last_day_quarter(����_������_������_��_DB) Then
          ����_���������_������_��_DB = Date_last_day_quarter(����_������_������_��_DB)
        End If
          
        ' ���� ���������� ���������������, �� ������ ��������� ��������, ����� ��������� �� 100%
        If Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8).Value > 1 Then
          ' ���������, ����� ���� �� �����! ����� ������
          ' ����_��������_�������� = Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8).Value / 100
        Else
          ����_��������_�������� = 1
        End If
          
        ' ���� � ��������� ���� ������� � DB
        If Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8).Value <> "" Then
          
          ' ������ ������, ����� ������� ��� 100%                                                                     ����������� �������, ������� ��������! ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0)
          ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(����_���������_������_��_DB, _
                                                                                        Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5).Value, _
                                                                                          ����_��������_��������, _
                                                                                            5, _
                                                                                              0)
          �����������_�������_��_������ = ����_��_����_���_��������_��������_Var - Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value
        
        Else
          
          ' ���� � ���������� ��� ��������, �� ������ ������ �� ������ ���������� �� ������� ����
          ����_Var = Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5).Value
          ����_Var = Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value
          ' ������� � ������� Date �� ���������
          �����_�������_����_��_�����_Q = Working_days_between_dates(Date, Date_last_day_quarter(Date), 5)
          �����_�������_����_��_����_������ = 5
          �����������_�������_��_������ = ((����_Var - ����_Var) / �����_�������_����_��_�����_Q) * �����_�������_����_��_����_������
          
        End If
          
                    
        ' ���� ���� ����������� ��������� ������� �� ������
        If �����������_�������_��_������ > 0 Then
          
          ' �������� ������ ���������� ������ (�� ����)
          Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5).Copy Destination:=Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 9)
          
          ' ���� �� ������ - �������
          Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 9) = �����������_�������_��_������
          
          ' ���� ��� �� �������� � �� �������, �� ������ ��������� �������
          ' If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "��������") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�������") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������") = 0) Then
          
          ' ���� � ��������� ���� ������� � DB
          If Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8).Value <> "" Then
          
            ' ��������� ������� �� ����� ������
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 10).Value = �������_��������_����(����_���������_������_��_DB, _
                                                                                                                     Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5).Value, _
                                                                                                                       Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value + Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 9).Value, _
                                                                                                                        5, _
                                                                                                                         0)
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 10).NumberFormat = "0%"
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 10).HorizontalAlignment = xlRight
                              
          End If ' ���� ��� �� �������� � �� �������
        
        End If ' If �����������_�������_��_������ > 0 Then

        
        ' ����� ��������� ������ ��.��-��.�� - ����� ��������� getDataFrom_BASE_Workbook �� <> "�� ������", �����  - ������!
        ' If False Then
          
          ' ������� (��������� ��� �������� ����_Q_Update_Date - ����_Q)
          getDataFrom_BASE_Workbook_Var1 = CheckData(getDataFrom_BASE_Workbook("TargetWeek", "����1", "ID_Rec", ID_Rec_TargetWeek(weekStartDate(Date - 7), Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value, In_officeNameInReport), "����_Q_Update_Date", 0))
          getDataFrom_BASE_Workbook_Var2 = CheckData(getDataFrom_BASE_Workbook("TargetWeek", "����1", "ID_Rec", ID_Rec_TargetWeek(weekStartDate(Date - 7), Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value, In_officeNameInReport), "����_Q", 0))
          Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 12).Value = getDataFrom_BASE_Workbook_Var1 - getDataFrom_BASE_Workbook_Var2
          Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 12).NumberFormat = "#,##0"
          Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 12).HorizontalAlignment = xlRight
              
        
          ' ���������� ���� - ���� ���� ����������� ���� �� ������� �������� �� ������� ������, �� ������� ���������� ����
          If getDataFrom_BASE_Workbook("TargetWeek", "����1", "ID_Rec", ID_Rec_TargetWeek(weekStartDate(Date - 7), Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value, In_officeNameInReport), "TargetWeek", 0) > 0 Then
          
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 13).Value = CheckData(getDataFrom_BASE_Workbook("TargetWeek", "����1", "ID_Rec", ID_Rec_TargetWeek(weekStartDate(Date - 7), Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value, In_officeNameInReport), "���_TargetWeek", 0))
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 13).NumberFormat = "0%"
            Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 13).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeV(In_FileTargetWeekName, "����1", row_����������_����1, 13, Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 13).Value, 1)

          End If
        ' End If
        
        ' ����������� ������ �� ����1 - ������� ��� ����� � �������
        For �������_��_����1 = 1 To 10
          Call ������_������_����_��_������(In_FileTargetWeekName, "����1", row_����������_����1, �������_��_����1)
        Next �������_��_����1

        ' ��������� #2
        ' ID_Rec = 1-2321-�� ����-���������-�������
        WWYY_Var = CStr(WeekNumber(����_���������_������_��_DB)) + strYY(����_���������_������_��_DB)
        Product_Code_Var = Product_Name_to_Product_Code(Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value)
        ID_Rec_TargetWeek_Var = CStr(getNumberOfficeByName2(In_officeNameInReport)) + "-" + WWYY_Var + "-" + Product_Code_Var
        
        ' ������ ������ � BASE\TargetWeek
        Call InsertRecordInBook("TargetWeek", "����1", "ID_Rec", ID_Rec_TargetWeek_Var, _
                                            "ID_Rec", ID_Rec_TargetWeek_Var, _
                                              "�ffice_Number", getNumberOfficeByName2(In_officeNameInReport), _
                                                "�ffice", getShortNameOfficeByName(In_officeNameInReport), _
                                                  "Product_Name", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 2).Value, _
                                                    "Product_Code", Product_Code_Var, _
                                                      "Unit", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 4).Value, _
                                                        "WWYY", WWYY_Var, _
                                                          "Update_Date", ����_������_������_��_DB, _
                                                            "DB_Start", ����_������_������_��_DB, _
                                                              "DB_End", ����_���������_������_��_DB, _
                                                                "����_Q", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 5).Value, _
                                                                  "����_Q", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value, _
                                                                    "���_Q", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 7).Value, _
                                                                      "����_Q", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 8).Value, _
                                                                        "TargetWeek", �����������_�������_��_������, _
                                                                          "TargetWeek_����_Q", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 10).Value, _
                                                                            "����_Q_Update_Date", Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value, _
                                                                              "���_TargetWeek", �����������(�����������_�������_��_������, Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value - Workbooks(In_FileTargetWeekName).Sheets("����1").Cells(row_����������_����1, 6).Value, 3), _
                                                                                "Fact_WeekStart", weekStartDate(����_���������_������_��_DB), _
                                                                                  "Fact_WeekEnd", weekEndDate(����_���������_������_��_DB))
      
      End If ' ��������� ������� ��������
      
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop

      
End Function

' ��������� ������
Function �������������_����_�����������() As String

  If C������_������_�����(Now) = True Then
    �������������_����_����������� = "������������� ���� �����������"
  Else
    �������������_����_����������� = "������������� �����"
  End If
  
  
  ' �������������_����_����������� = "������������� �����"
  ' �������������_����_����������� = "����������"
  
  
  
End Function

' ������ ��� �������� ���� � ����� ��������
Function C������_������_�����(In_Date) As Boolean
  
  ' ���� ������� ������ �����
  If CInt(Mid(CStr(In_Date), 1, 2)) Mod 2 = 0 Then
    C������_������_����� = True
  Else
    C������_������_����� = False
  End If
  
  
End Function

' ������� ������� ���� ������ � ������� ����� (��� ������� ��������)
Function �������_����������_���������() As String
  
  dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
  
  ����_������_�������� = quarterStartDate(dateDB_����8)
  
  ����_�����_�������� = Date_last_day_quarter(dateDB_����8)
  
  ����_������ = Working_days_between_dates(����_������_��������, dateDB_����8, 5)
  
  ����_����� = Working_days_between_dates(����_������_��������, ����_�����_��������, 5)
  
  �������_���������_���������� = "����_������: " + CStr(����_������) + ", ����_�����: " + CStr(����_�����)
  
  ThisWorkbook.Sheets("����8").Range("T8").Value = �������_���������_����������
  
End Function

' ���������� ���������� ����� �� ����� �� ������� DB
Sub ����������_��_������_Update()
Dim ����_���_�������_������ As Date
  
  ' ������ �������
  Application.StatusBar = "����������_��_������_Update..."

  ' ��������� BASE\Sales
  OpenBookInBase ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  OpenBookInBase ("TargetWeek")
  ThisWorkbook.Sheets("����8").Activate

  OpenBookInBase ("Products")
  ThisWorkbook.Sheets("����8").Activate

  ' ���������� ������� � "TargetWeek"
  column_Update_Date = 8
  column_����_Q_Update_Date = 17
  column_����_���_TargetWeek = 18

  ' ���� DB
  dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

  ' ���������� ���� ��� ������ ������ � TargetWeek
  Select Case Weekday(dateDB_����8, vbMonday)
    Case 1 ' �����������
      ����_���_�������_������ = dateDB_����8
    Case 2 ' �������
      ����_���_�������_������ = dateDB_����8
    Case 3 ' �����
      ����_���_�������_������ = dateDB_����8
    Case 4 ' �������
      ' ����_���_�������_������ = dateDB_����8 + 4
      ' c 12.07 ������� �������� ��������� �������� �� ������� ������. �� �� ��� � 08.07
      ����_���_�������_������ = dateDB_����8
    Case 5 ' �������
      ����_���_�������_������ = dateDB_����8 + 3
    Case 6 ' �������
      ����_���_�������_������ = dateDB_����8 + 2
    Case 7 ' �����������
      ����_���_�������_������ = dateDB_����8 + 1
  End Select
  
  ' ���������� ������ � TargetWeek
  WWYY_Var = CStr(WeekNumber(����_���_�������_������)) + strYY(����_���_�������_������)

  ' �������� �� 5-�� ������
  ' ���������
  For i = 1 To 5 ' 5 - �� ������ �������
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' �� ����������
        officeNameInReport = "�� ����������"
      Case 2 ' �� �����������
        officeNameInReport = "�� �����������"
      Case 3 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 4 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 5 ' �� ������-����
        officeNameInReport = "�� ������-����"
    End Select
  
    ' ����� � ����� �� ����������
    rowCount = rowByValue(ThisWorkbook.Name, "����8", officeNameInReport, 1000, 100) + 3
  
    ' ����� � ����1
    ' row_����������_����1 = rowByValue(In_FileTargetWeekName, "����1", "����������", 100, 100) + 2
    ' �����_�����_����1 = 1
  
    ' ������������ ���� - ���� ������� ����, ���� ������� ����, �� ���� ������� � ������������� ��������
    Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�� �") = 0) And (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0)
  
      ' ��������� �������� � ����� ��� ����� MBO
      If (ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "") Or (����������_MBO(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) = True) Then
        
        
        Product_Code_Var = Product_Name_to_Product_Code(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)
        
        ID_Rec_TargetWeek_Var = CStr(getNumberOfficeByName2(officeNameInReport)) + "-" + WWYY_Var + "-" + Product_Code_Var
        
        ' ��������� � "TargetWeek"
        ' ��������� ����� - �������_����_�������� ���� � BASE\NonWorkingDays?
        Set searchResults = Workbooks("TargetWeek").Sheets("����1").Columns("A:A").Find(ID_Rec_TargetWeek_Var, LookAt:=xlWhole)
  
        ' ��������� - ���� �� ����� ������ � "TargetWeek"
        If searchResults Is Nothing Then
          ' ���� �� �������
        Else
          
          ' ���� �������
          ' �������� ��������� ������: ���� �������� Update_Date, ���� �� �������� ����_Q_Update_Date � ������� ���_TargetWeek
          ' Update_Date
          Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, column_Update_Date).Value = dateDB_����8
          Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, column_����_Q_Update_Date).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Value
          Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, column_����_���_TargetWeek).Value = �����������(Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, 15).Value, _
                                                                                                                             Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, 17).Value - Workbooks("TargetWeek").Sheets("����1").Cells(searchResults.Row, 12).Value, 3)
        End If
        
      End If ' ��������� �������� � ����� ��� ����� MBO
    
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
  
  Next i


  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("MBO")
  ThisWorkbook.Sheets("����8").Activate

  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("TargetWeek")
  ThisWorkbook.Sheets("����8").Activate
    
  ' ��������� ������� MBO
  ' ��������� BASE\Sales
  CloseBook ("Products")
  ThisWorkbook.Sheets("����8").Activate

  
  ' ������ �������
  Application.StatusBar = ""


End Sub

' �������������� ������
Sub ������_������_����_��_������(In_Workbooks, In_Sheets, In_Row, In_Col)
  
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Font.Bold = False
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalDown).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlDiagonalUp).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeLeft).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeTop).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeBottom).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlEdgeRight).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideVertical).LineStyle = xlNone
  Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, In_Col).Borders(xlInsideHorizontal).LineStyle = xlNone

End Sub

' ���� ���� � ����� ������
Sub ����_�_������()
  
  ThisWorkbook.Sheets("����8").Range("X6").Value = �����_������(CDate(ThisWorkbook.Sheets("����8").Range("V6").Value))

End Sub

' ��������� ID_Rec ��� BASE\TargetWeek �� ���� ������ � ������������ �������� In_Product_Name � �����
Function ID_Rec_TargetWeek(In_Date, In_Product_Name, In_officeNameInReport) As String
  
  ' ID_Rec = 1-2321-�� ����-���������-�������
  WWYY_Var = CStr(WeekNumber(In_Date)) + strYY(In_Date)
  
  Product_Code_Var = Product_Name_to_Product_Code(In_Product_Name)
  
  ID_Rec_TargetWeek = CStr(getNumberOfficeByName2(In_officeNameInReport)) + "-" + WWYY_Var + "-" + Product_Code_Var

End Function

' �������� ������� BASE\Products
Sub Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
  ' ���� Product_Code
  
  ' ��������� ����� - �������_����_�������� ���� � BASE\NonWorkingDays?
  Set searchResults = Workbooks("Products").Sheets("����1").Columns("B:B").Find(In_Product_Code, LookAt:=xlWhole)
  
  ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
  If searchResults Is Nothing Then
    
    ' ���� �� ������� - ���������
    ' ������ ������ � BASE\Products
    Call InsertRecordInBook("Products", "����1", "Product_Code", In_Product_Code, _
                                            "Product_Code", In_Product_Code, _
                                              "Product_Name", In_Product_Name, _
                                                "Unit", In_Unit, _
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
  
  Else
    ' ���� �������
  
  End If

  
End Sub


' ����� ������ - ���������� ����� ������� "����_Q_��_����"
Sub ���������_����_��_����2()
  
  ' �������� ����� ��������� ����� � �� �������� ��������
  
  ' ����_Q_��_���� - ��������� �� �������� ���� �� ����� ����
  
  ' �������_��������_���� - ������ ������ �������� �� ���� �� ����� � �����
  
  ' Product_Name_to_Product_Code - ����������� "��������������� �������" � "��"
  
  ' ����, �� ������� ��������� ������
  dateForLoad = CDate(ThisWorkbook.Sheets("����8").Range("O9").Value)
  
  ' ��������� �������, ������� �����:
  ' ��������� BASE\Products
  OpenBookInBase ("Products")

  
  ' 1) ��������� ������
  For i = 1 To 5
    
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' �� ����������
        officeNameInReport = "�� ����������"
      Case 2 ' �� �����������
        officeNameInReport = "�� �����������"
      Case 3 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 4 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 5 ' �� ������-����
        officeNameInReport = "�� ������-����"
            
    End Select
        
    ' ������� ����� ������ � ������������� �����
    row_���� = getRowFromSheet8(officeNameInReport, officeNameInReport)
        
    ' ������������ ���� �����
    rowCount = row_���� + 3
    Do While (ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> ".")

      ' ��� ��������
      Product_Name_to_Product_Code_Var = Product_Name_to_Product_Code(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)
      
      ' ���� �� �������� ������ �������� ��� ��������
      If Product_Name_to_Product_Code_Var <> "" Then
      
        ' 1) ��������� ������� "O" - ���� �� ����
        ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = ����_Q_��_����(i, _
                                                                                  Product_Name_to_Product_Code_Var, _
                                                                                    dateForLoad)
        ThisWorkbook.Sheets("����8").Cells(rowCount, 15).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 15).HorizontalAlignment = xlRight
        
        ' 2) ��������� ������� "P" - ��������� ������ ��������
        ����_������� = 0
        ����_������� = 0
        ' ���� � ������� 6 ���� ��������, �� ����� ���
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Value <> "" Then
          ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Value
        Else
          ' ���� � �������� ���� "", �� ��������� �����
          If ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value <> "" Then
            ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value
          End If
        End If
        ' ���� � ������� 16 ���� ��������, �� ����� ���
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "" Then
          ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value
        End If
        ' ���������� ��������
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = ����_������� - ����_�������
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 16).HorizontalAlignment = xlRight
        
        ' 3) ��������� ������� "Q" - ������� �������� �� ����
        If (ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Value <> "%") Then
                    
          ' ���� �� �������� ��� �������� � ������� 8
          If ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value <> "" Then
            
            ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value = �������_��������_����(dateForLoad, _
                                                                                             ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Value, _
                                                                                               ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value, _
                                                                                                 5, 0)
                                                                                                 
            ThisWorkbook.Sheets("����8").Cells(rowCount, 17).NumberFormat = "0%"
            ThisWorkbook.Sheets("����8").Cells(rowCount, 17).HorizontalAlignment = xlRight
          
          End If
                                                                                               
        End If
        
        ' 4) ��������� ������� "R" - �������� ��������
        If (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value <> "") Then
          
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value - ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).NumberFormat = "0%"
          ThisWorkbook.Sheets("����8").Cells(rowCount, 18).HorizontalAlignment = xlRight
        
          ' ������� ������ ��������: � �������, ���� ������������� �������� � �������� ����� 1
          If (ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value < 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 11).Value < 1) Then
            Call Full_Color_RangeII("����8", rowCount, 18, 0, 100)
          End If

          ' ������� ������ ��������: � �������, ���� ������������� ��������
          If ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value > 0 Then
            Call Full_Color_RangeII("����8", rowCount, 18, 100, 100)
          End If
        End If

      End If
      
      ' ��������� ������
      Application.StatusBar = officeNameInReport + ": " + CStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
    
    Loop
        
  Next i
  
  ' 2) ���� �� ���
  Application.StatusBar = "���..."
  
  ' ������� ����� ������ � ������������� �����
  row_���� = getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������")
        
  ' ������������ ���� �����
  rowCount = row_���� + 3
  Do While (ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> "")
  
    ' 1) ��������� ������� "O" - ���� �� ����
    ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value), 15).Value + _
                                                                 ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� �����������", ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value), 15).Value + _
                                                                   ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value), 15).Value + _
                                                                     ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value), 15).Value + _
                                                                       ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ������-����", ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value), 15).Value
    ' ���� ��� %, �� ����� �� 5 ������ - ������� ��.��������������
    If ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Value = "%" Then
      ' ���� ��� %
      ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value / 5
    End If
    
    ThisWorkbook.Sheets("����8").Cells(rowCount, 15).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("����8").Cells(rowCount, 15).HorizontalAlignment = xlRight
        
    ' 2) ��������� ������� "P" - ��������� ������ ��������
    ����_������� = 0
    ����_������� = 0
    ' ���� � ������� 6 ���� ��������, �� ����� ���
    If ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Value <> "" Then
      ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 6).Value
    Else
      ' ���� � �������� ���� "", �� ��������� �����
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value <> "" Then
        ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 10).Value
      End If
    End If
    ' ���� � ������� 16 ���� ��������, �� ����� ���
    If ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "" Then
      ����_������� = ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value
    End If
    ' ���������� ��������
    ThisWorkbook.Sheets("����8").Cells(rowCount, 16).Value = ����_������� - ����_�������
    ThisWorkbook.Sheets("����8").Cells(rowCount, 16).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("����8").Cells(rowCount, 16).HorizontalAlignment = xlRight

    ' 3) ��������� ������� "Q" - ������� �������� �� ����
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 4).Value <> "%") Then
      
      ' ���� �� �������� ��� �������� � ������� 8
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value <> "" Then
      
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value = �������_��������_����(dateForLoad, _
                                                                                             ThisWorkbook.Sheets("����8").Cells(rowCount, 5).Value, _
                                                                                               ThisWorkbook.Sheets("����8").Cells(rowCount, 15).Value, _
                                                                                                 5, 0)
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).NumberFormat = "0%"
        ThisWorkbook.Sheets("����8").Cells(rowCount, 17).HorizontalAlignment = xlRight
      End If
                                                                                               
    End If
        
    ' 4) ��������� ������� "R" - �������� ��������
    If (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value <> "") Then
          
      ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value = ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value - ThisWorkbook.Sheets("����8").Cells(rowCount, 17).Value
      ThisWorkbook.Sheets("����8").Cells(rowCount, 18).NumberFormat = "0%"
      ThisWorkbook.Sheets("����8").Cells(rowCount, 18).HorizontalAlignment = xlRight
        
      ' ������� ������ ��������: � �������, ���� ������������� �������� � �������� ����� 1
      If (ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value < 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 11).Value < 1) Then
        Call Full_Color_RangeII("����8", rowCount, 18, 0, 100)
      End If

      ' ������� ������ ��������: � �������, ���� ������������� ��������
      If ThisWorkbook.Sheets("����8").Cells(rowCount, 18).Value > 0 Then
        Call Full_Color_RangeII("����8", rowCount, 18, 100, 100)
      End If
    End If

  
    ' ��������� ������
    Application.StatusBar = "���: " + CStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
  
    
  ' ����������
  Application.StatusBar = "����������..."
  
  ' ��������� �������, ���������������� � ��������
  ' ��������� BASE\Products
  CloseBook ("Products")
  
  Application.StatusBar = ""
  
  
End Sub

' ���������� - ���� "�� ������:" � "M9"
Sub ����_��_������_����8()
      
      ' �������� - ������ ���� ������
      ������_����_������ = False
      
      ' ���� ������� �����������
      If Weekday(Date, vbMonday) = 1 Then
        ������_����_������ = True
      End If
      
      ' ���� �� ����0 ��������� ������ ���� ������
      If CStr(ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100) + 2).Value) = "1" Then
        ' ���������� ��� ������ ���� ������?
        If MsgBox("������������ ������ ������� ��� ������?", vbYesNo) = vbYes Then
          ������_����_������ = True
        Else
          ������_����_������ = False
        End If
      End If
      
      ' ���������
      If ������_����_������ = True Then
        ' ThisWorkbook.Sheets("����8").Range("M9").Value = "�� ������:       (�� " + CStr(dateDB + 7) + ")"
        '
        ThisWorkbook.Sheets("����8").Range("M9").Value = "���� �� ������: (" + strDDMM(Date) + "-" + str��_MM_YY2(Date + 6) + ")"
      End If

End Sub

' ���-���� ������� �������
Sub ���_����_�������_�������()
  
  
  
End Sub

' ����������� ������� �� ������
Sub �����������_�������_��_������()
  
  ' ������ �������
  Application.StatusBar = "����������� ������� �� ������..."
  
  ' ���� DB
  dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
 
  ' ��������� �������, ������� �����:
  ' ��������� BASE\Products
  OpenBookInBase ("Products")
  
  ' ������ "����������� ������� �� ������"
  ' ��������� ������
  If Dir(ThisWorkbook.Path + "\Templates\" + "����������� ������� �� ������.xlsx") <> "" Then
    ' ��������� ������ Templates\����������� ������� �� ������
    TemplatesFileName = "����������� ������� �� ������"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����8").Activate

  ' ��� ������ �����
  FileDBName_OSp = "����������� ������� �� ������" + Replace(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 48, 14), ".", "-") + ".xlsx"
  
  ' ��������� - ���� ���� ����, �� ������� ���
  Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName_OSp)
  
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName_OSp, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  ' ���������� � S3 �� ����8
  ThisWorkbook.Sheets("����8").Range("S3").Value = ThisWorkbook.Path + "\Out\" + FileDBName_OSp
  
  ' ������ �������
  Application.StatusBar = "����������� ������� �� ������: ����������� ��������..."
    
  ' ������� ������� #����
  column_���� = ColumnByValue(FileDBName_OSp, "����1", "#����", 100, 100)
  
  ' ������� ������� #Product_Code
  column_Product_Code = ColumnByValue(FileDBName_OSp, "����1", "#Product_Code", 100, 100)
  
  ' ������� ������� #�������
  column_����������_������� = ColumnByValue(FileDBName_OSp, "����1", "#�������", 100, 100)

  ' ����������� ��������
  ' �������
  Column_������� = ColumnByValue(FileDBName_OSp, "����1", "�������", 100, 100)
  
  ' ��.���.
  column_��_��� = ColumnByValue(FileDBName_OSp, "����1", "��.���.", 100, 100)
  
  ' ����
  column_���� = ColumnByValue(FileDBName_OSp, "����1", "����", 100, 100)
  
  ' ����
  column_���� = ColumnByValue(FileDBName_OSp, "����1", "���� �� ____", 100, 100)
  
  ' ���.
  column_��� = ColumnByValue(FileDBName_OSp, "����1", "���.", 100, 100)
  
  ' �������
  column_������� = ColumnByValue(FileDBName_OSp, "����1", "�������", 100, 100)
  
  ' ������� �� ������� ������
  ' ����
  column_����_�������_������ = ColumnByValue(FileDBName_OSp, "����1", "���� _", 100, 100)

  ' ���.
  column_��� = ColumnByValue(FileDBName_OSp, "����1", "���.", 100, 100)
  
  ' �����.Q
  column_�����_Q = ColumnByValue(FileDBName_OSp, "����1", "�����.Q", 100, 100)
  
  ' �������� %
  column_�������� = ColumnByValue(FileDBName_OSp, "����1", "%", 100, 100)
  
  ' ���������
  ' ���� ����������  ____
  column_��������� = ColumnByValue(FileDBName_OSp, "����1", "���� ����������  ____", 100, 100)
  
  ' ������� ������ "�������������"
  row_������������� = rowByValue(FileDBName_OSp, "����1", "�������������", 100, 100)
  
  ' ������ �������
  Application.StatusBar = "����������� ������� �� ������: ���������..."
  
  ' ����������� ��������� � ����� �������:
  ' F4 - "__ ��. 2020 �." �� dateDB
  Workbooks(FileDBName_OSp).Sheets("����1").Range("F4").Value = quarterName(dateDB_����8)
  ' G5 - "���� �� ____"
  Workbooks(FileDBName_OSp).Sheets("����1").Range("G5").Value = "���� �� " + strDDMM(dateDB_����8)
  ' K4 - "������� �� ������� ������"
  Workbooks(FileDBName_OSp).Sheets("����1").Range("K4").Value = "������� �� ������� ������ " + strDDMM(dateDB_����8 - 7) + "-" + strDDMM(dateDB_����8)
  ' K5 - "����"
  Workbooks(FileDBName_OSp).Sheets("����1").Range("K5").Value = "���� " + strDDMM(dateDB_����8 - 7)
  ' P5 - "���� ����������  ____"
  Workbooks(FileDBName_OSp).Sheets("����1").Range("P5").Value = "���� ���������� " + strDDMM(dateDB_����8 + 7)
  
  ' ���� �� ������� ������ ���� � ���������� � #���� � #Product_Code
  rowCount = row_������������� + 1
  Do While Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, Column_�������).Value <> ""
    
      
    ' �������
    ' column_������� = ColumnByValue(FileDBName_OSp, "����1", "�������", 100, 100)
  
    ' ��.���.
    ' column_��_��� = ColumnByValue(FileDBName_OSp, "����1", "��.���.", 100, 100)
    
    Row_����8 = getRowFromSheet8(getNameOfficeByNumber(Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value), Product_Code_to_Product_Name(Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_Product_Code).Value))
    
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��_���).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 4).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��_���).NumberFormat = "@" ' "#,##0"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��_���).HorizontalAlignment = xlCenter ' xlRight

    ' ����
    ' column_���� = ColumnByValue(FileDBName_OSp, "����1", "����", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 5).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).NumberFormat = "#,##0"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).HorizontalAlignment = xlRight
  
    ' *UPDATE ���� �������� �� ��� �� 3 ��. 2021. ���������� ������������ � ������ : 1) ���� �� ��� �� 30.09.2021 �� "���������" - 20 ��., �� "����������" - 12 ��., �� "���������������" - 12 ��., �� "���������������" - 18 ��., �� "�����-����" - 18 ��. 2) �������� ���� ������ (������ �� ��������� ���������� � ������) 3) ���������� �������� - 1 ������ �� ��� � ���� �� �����
    If (quarterName2(dateDB_����8) = "3Q 2021 �.") And (Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_Product_Code).Value = "���") Then
      
      ' �� "���������" - 20 ��., �� "����������" - 12 ��., �� "���������������" - 12 ��., �� "���������������" - 18 ��., �� "�����-����" - 18 ��.
      Call UPDATE_����_��������_���_3Q2021(FileDBName_OSp, "����1", rowCount, column_����, column_����)
      
    End If
  
    ' ����
    ' column_���� = ColumnByValue(FileDBName_OSp, "����1", "���� �� ____", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 6).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).NumberFormat = "#,##0"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).HorizontalAlignment = xlRight
  
    ' ���.
    ' column_��� = ColumnByValue(FileDBName_OSp, "����1", "���.", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 7).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).NumberFormat = "0%"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).HorizontalAlignment = xlRight
  
    ' �������
    ' column_������� = ColumnByValue(FileDBName_OSp, "����1", "�������", 100, 100)
    ' ���� � column_����������_������� ����� "����8_column17", �� ����� ���������� ������� �� 17 ������� ����8
    If Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����������_�������).Value = "����8_column20" Then
      �������_��������_����8 = 20
    Else
      �������_��������_����8 = 8
    End If
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, �������_��������_����8).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).NumberFormat = "0%"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).HorizontalAlignment = xlRight
    ' ���� � column_������� ���� �������� - ������ � ��������
    If Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).Value <> "" Then
      ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
      Call Full_Color_RangeV(FileDBName_OSp, "����1", rowCount, column_�������, Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).Value, 1)
    End If
     
    ' ������� �� ������� ������
    ' ����
    ' column_����_�������_������ = ColumnByValue(FileDBName_OSp, "����1", "���� _", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����_�������_������).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 15).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����_�������_������).NumberFormat = "#,##0"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����_�������_������).HorizontalAlignment = xlRight

    ' ���.
    ' column_��� = ColumnByValue(FileDBName_OSp, "����1", "���.", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 16).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).NumberFormat = "#,##0"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���).HorizontalAlignment = xlRight
  
    ' �����.Q
    ' column_�����_Q = ColumnByValue(FileDBName_OSp, "����1", "�����.Q", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�����_Q).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 17).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�����_Q).NumberFormat = "0%"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�����_Q).HorizontalAlignment = xlRight
  
    ' �������� %
    ' column_�������� = ColumnByValue(FileDBName_OSp, "����1", "%", 100, 100)
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).Value = ThisWorkbook.Sheets("����8").Cells(Row_����8, 18).Value
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).NumberFormat = "0%"
    Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).HorizontalAlignment = xlRight
    ' ������� ��������:
    ' ������� ������ ��������: � �������, ���� ������������� �������� � �������� ����� 1
    If (Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).Value < 0) And (Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).Value < 1) Then
      Call Full_Color_RangeV(FileDBName_OSp, "����1", rowCount, column_��������, 0, 100)
    End If

    ' ������� ������ ��������: � �������, ���� ������������� ��������
    If Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_��������).Value > 0 Then
      Call Full_Color_RangeV(FileDBName_OSp, "����1", rowCount, column_��������, 100, 100)
    End If
  
    ' ��������� - "��������� �� ������ ��� ������ �� �����.Q 100%"
    ' ���� ����������  ____
    ' column_��������� = ColumnByValue(FileDBName_OSp, "����1", "���� ����������  ____", 100, 100)
    
    ' === ���� ��������� ���� �� ������ - ������� ���� ��������, ����� ����� �� ������� Q � 100%
    If Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).Value < 1 Then
            
            ' ������ �������: ������� ����� ������ ���� ������� - �� ������� ���� DB + 7
            ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(dateDB_����8 + 7, Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value, 1, 5, 0)
            
            ' ���� ���� ��� ������ �� ������� Q ������, ��� ������� ���� Q, �� ������� �������
            If ����_��_����_���_��������_��������_Var > Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value Then
              
              ' ���� ���� �� ������ > 0
              If (����_��_����_���_��������_��������_Var - Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value) > 0 Then
              
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).Value = ����_��_����_���_��������_��������_Var - Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).NumberFormat = "#,##0"
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).HorizontalAlignment = xlRight
                 '
                 ' �� ������� �������� ��������� �� ��� � ������� "T" (20)
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).Value = (����_��_����_���_��������_��������_Var - Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value) / 5
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).NumberFormat = "#,##0"
                 Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).HorizontalAlignment = xlRight
              
              End If
            End If
          
    End If
    ' ===
    
    ' === ���� ������� �� ��������� (�������� ��������)
    If Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_�������).Value = "" Then
            
      ' ���� ���� �� ������ > 0
      If (Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value - Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value) > 0 Then
      
        ' ��������� � ���� ������ ������� ����� ������ � ������
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).Value = Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value - Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_����).Value
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).NumberFormat = "#,##0"
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).HorizontalAlignment = xlRight
                 
        ' �� ������� �������� ��������� �� ��� � ������� "T" (20)
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).Value = Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, column_���������).Value / 5
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).NumberFormat = "#,##0"
        Workbooks(FileDBName_OSp).Sheets("����1").Cells(rowCount, 20).HorizontalAlignment = xlRight
      
      End If
      
    End If
    ' ===


    
    ' ��������� ������
    Application.StatusBar = "����������� ������� �� ������: " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
  
  ' ������ �������
  Application.StatusBar = "����������� ������� �� ������: ����������..."
  
  ' �������� �����
  Workbooks(FileDBName_OSp).Close SaveChanges:=True
  
  ' ��������� �������, ���������������� � ��������
  ' ��������� BASE\Products
  CloseBook ("Products")
  
  ' ������ �������
  Application.StatusBar = "����������� ������� �� ������: ��������..."
  
  Call ��������_Lotus_Notes_����������_����8
  
  ' ������ �������
  Application.StatusBar = ""
   
End Sub


' *UPDATE ���� �������� �� ��� �� 3 ��. 2021. ���������� ������������ � ������ : 1) ���� �� ��� �� 30.09.2021 �� "���������" - 20 ��., �� "����������" - 12 ��., �� "���������������" - 12 ��., �� "���������������" - 18 ��., �� "�����-����" - 18 ��. 2) �������� ���� ������ (������ �� ��������� ���������� � ������) 3) ���������� �������� - 1 ������ �� ��� � ���� �� �����
Sub UPDATE_����_��������_���_3Q2021(In_FileDBName_OSp, In_Sheets, In_rowCount, In_column_����, In_column_����)
      
      ' �� "���������" - 20 ��.,
      If Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 1 Then
        Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 20
      End If
      
      ' �� "����������" - 12 ��.,
      If Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 2 Then
        Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 12
      End If
      
      ' �� "���������������" - 12 ��.,
      If Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 3 Then
        Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 12
      End If
      
      ' �� "���������������" - 18 ��.,
      If Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 4 Then
        Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 18
      End If
      
      ' �� "�����-����" - 18 ��.
      If Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 5 Then
        Workbooks(In_FileDBName_OSp).Sheets(In_Sheets).Cells(In_rowCount, In_column_����).Value = 18
      End If
    
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����������_����8()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������..."
  
    
    dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
   
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "����������� ������� �� ������ ������ �� " + CStr(dateDB_����8) + " �."

    ' hashTag - ������:
    hashTag = "#�����������_������� #���������"

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����8").Range("S3").Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("����,����,���,�������1,���2,�������2,���3,�������3,���4,�������4,���5,�������5", 2) + Chr(13) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������� ������� �� ������ ������� ������ �� " + CStr(dateDB_����8) + " �. (���� �� ��������)" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "� ������� " + �������() + "P" + �������() + " - ��������� ������������� ������������� �� ������� �������� ����������� �� ������ (" + strDDMM(Date) + "-" + str��_MM_YY2(Date + 6) + "), " + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����������� ��� ������ �� ������� ���. �� " + quarterName3(dateDB_����8) + " ���������� ��� �� ����� 100%" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "(����������� � �����)" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
    ' ������ �������
    Application.StatusBar = ""
     
  
End Sub


' �� ��������!!! �� ���������!!!
' ����������� ����� �� ������ �� ������� M �� ����8 �� ����� �� M9
Sub UPDATE_����8_column_M9()
  
  ' ������ �� ���������� ���������
  If MsgBox("�������� Update ������� M? �� ��������!!! �� ���������!!!", vbYesNo) = vbYes Then
  
  
  ' ��������� �������, ������� �����:
  ' ��������� BASE\Products
  OpenBookInBase ("Products")

  
  ' 1) ��������� ������
  For i = 1 To 5
    
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' �� ����������
        officeNameInReport = "�� ����������"
      Case 2 ' �� �����������
        officeNameInReport = "�� �����������"
      Case 3 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 4 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 5 ' �� ������-����
        officeNameInReport = "�� ������-����"
            
    End Select
        
    ' ������� ����� ������ � ������������� �����
    row_���� = getRowFromSheet8(officeNameInReport, officeNameInReport)
        
    ' ������������ ���� �����
    rowCount = row_���� + 3
    Do While (ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value <> ".")
' ===================
  
  
    ' ������� - ����
    ' ���� ��������� � %
    If In_Unit <> "%" Then
          
          ' ������� ����
          ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
          
          ' === ���� ��������� ���� �� ������ - ������� ���� ��������, ����� ����� �� ������� Q � 100%
          If �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0) < 1 Then
            
            ' ������ �������: ������� ����� ������ ���� ������� - �� ������� ���� DB + 7
            ' ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(dateDB + 7, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, 1, 5, 0)
          
            ' ������ �������: ������� ����� ������ ���� ������� - �� M9 "���� �� ������: (02.08-08.08.21)" ����� ������ ����
            date2FromM9 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 24, 6) + "20" + Mid(ThisWorkbook.Sheets("����8").Range("M9").Value, 30, 2))
            
            ' ���������� DB: �� ����������� (����� ������ ) - 3 ��� = �������!
            date2FromM9 = date2FromM9 - 3
            ����_��_����_���_��������_��������_Var = ����_��_����_���_��������_��������(date2FromM9, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, 1, 5, 0)
            
            ' ���� ���� ��� ������ �� ������� Q ������, ��� ������� ���� Q, �� ������� �������
            If ����_��_����_���_��������_��������_Var > ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value Then
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).Value = ����_��_����_���_��������_��������_Var - ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).NumberFormat = "#,##0"
              ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 13).HorizontalAlignment = xlRight
            End If
          
          End If
          ' ===
    End If

  
' =============================================================================
      ' ��������� ������
      Application.StatusBar = officeNameInReport + ": " + CStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 1).Value) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
    
    Loop
        
  Next i
  
  End If ' ������
  
  
End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����8_���()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������ � ���..."
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "��� �� 3Q 2021 (���, �������) ������� �������, �����������"

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#��� #���_��� #���_�������"

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
    ����������� = ����������� + "��������� �������������� �������� ������� �� 3Q 2021 �." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ������� � ����������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
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



' ������ ��� �������_��������_��_������()
Sub �������_��������_��_������_with_Msg()
  
  ' ������ "12.08.2021-19.08.2021"
  If MsgBox("���������� ������� � " + CStr(����1(ThisWorkbook.Sheets("����8").Range("S9").Value)) + " �� " + CStr(����2(ThisWorkbook.Sheets("����8").Range("S9").Value)) + " ?", vbYesNo) = vbYes Then
    Call �������_��������_��_������
    MsgBox ("������ ���������!")
  End If
  
  
End Sub

' �������_��������_��_������()
Sub �������_��������_��_������()
  
  ' ��������� BASE\Sales
  OpenBookInBase ("Sales_Office")
  
  ' ��������� BASE\Products
  OpenBookInBase ("Products")

  ' ���� ������
  ����1_Var = ����1(ThisWorkbook.Sheets("����8").Range("S9").Value)
  ' ���� ���������
  ����2_Var = ����2(ThisWorkbook.Sheets("����8").Range("S9").Value)
  
  ' ������� �������
  ' 1. �� ����������
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("�� ����������", "�� ����������") + 3), "S" + CStr(getRowFromSheet8("�� �����������", "�� �����������") - 1))
  ' 2. �� �����������
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("�� �����������", "�� �����������") + 3), "S" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
  ' 3. �� ����������������
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "S" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") - 1))
  ' 4. �� ����������������
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("�� ����������������", "�� ����������������") + 3), "S" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") - 1))
  ' 5. �� ������-����
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("�� ������-����", "�� ������-����") + 3), "S" + CStr(getRowFromSheet8("������������ ������� �� ������", "������������ ������� �� ������") - 2))
  ' 6. ��� ���������
  Call clear�ontents2(ThisWorkbook.Name, "����8", "S" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + 3), "S" + CStr(getRowFromSheet8("����� �� ��� ����������", "����� �� ��� ����������") + (getRowFromSheet8("�� �����������", "�� �����������") - getRowFromSheet8("�� ����������", "�� ����������"))))
  
  ' ��������� �� 5 ������
  For i = 1 To 5
    
    ' ������ ������ �� 1 �� 5
    Select Case i
      Case 1 ' �� ����������
        officeNameInReport = "�� ����������"
      Case 2 ' �� �����������
        officeNameInReport = "�� �����������"
      Case 3 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 4 ' �� ����������������
        officeNameInReport = "�� ����������������"
      Case 5 ' �� ������-����
        officeNameInReport = "�� ������-����"
    End Select
  
    ' ��������� �����
    row_����_N = getRowFromSheet8(officeNameInReport, officeNameInReport) + 3
    Do While (ThisWorkbook.Sheets("����8").Cells(row_����_N, 1).Value <> "") And (ThisWorkbook.Sheets("����8").Cells(row_����_N, 1).Value <> ".")
      
      ' ������� ��������
      If ThisWorkbook.Sheets("����8").Cells(row_����_N, 4).Value <> "%" Then
        
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).Value = �������_Q_��_������(i, Product_Name_to_Product_Code(ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), ����1_Var, ����2_Var)
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).HorizontalAlignment = xlRight
        
      End If
      
      ' ��������� ������
      Application.StatusBar = officeNameInReport + ": " + CStr(row_����_N) + "..."
      row_����_N = row_����_N + 1
      DoEventsInterval (row_����_N)
      
    Loop
    
  Next i
  
  ' ���� �� ���
  officeNameInReport = "����� �� ��� ����������"
  
  ' ��������� �����
  row_����_N = getRowFromSheet8(officeNameInReport, officeNameInReport) + 3
  Do While (ThisWorkbook.Sheets("����8").Cells(row_����_N, 1).Value <> "")
      
      ' ������� ��������
      If ThisWorkbook.Sheets("����8").Cells(row_����_N, 4).Value <> "%" Then
        
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).Value = CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������", ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), 19).Value) + _
                                                                     CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� �����������", ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), 19).Value) + _
                                                                       CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), 19).Value) + _
                                                                         CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ����������������", ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), 19).Value) + _
                                                                           CheckData(ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8("�� ������-����", ThisWorkbook.Sheets("����8").Cells(row_����_N, 2).Value), 19).Value)
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����8").Cells(row_����_N, 19).HorizontalAlignment = xlRight
        
      End If
      
    ' ��������� ������
    Application.StatusBar = officeNameInReport + ": " + CStr(row_����_N) + "..."
    row_����_N = row_����_N + 1
    DoEventsInterval (row_����_N)
      
  Loop
  
  
  ' ��������� BASE\Sales
  CloseBook ("Sales_Office")
  
  ' ��������� BASE\Products
  CloseBook ("Products")
  
  ' ������ �������
  Application.StatusBar = ""
  
  
End Sub

' DB_����
Sub DB_����(In_ReportName_String, In_Sheets, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Product_Code, In_Unit, In_Weight)
Dim dateDB As Date
  
  dateDB = CDate(Mid(Workbooks(In_ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
    
  ' �������� ������� BASE\Products
  Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
       
  ' ���������� ����� ����������� �� ������� �����_�����������_�_�����_����7
       
      
  ' 1. ������� �� ���� 8 ������ �� ������� � �������
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).Value = In_N
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 1).HorizontalAlignment = xlCenter
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).Value = In_Product_Name
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 2).HorizontalAlignment = xlLeft
  ' ��� �������, ���� �� �� �������
  If In_Weight <> 0 Then
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).Value = In_Weight
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 3).HorizontalAlignment = xlCenter
  End If
  '
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value = In_Unit
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).HorizontalAlignment = xlCenter
      
  ' ����� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value = ����_����_���_����(getNumberOfficeByName2(In_officeNameInReport)) ' Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).HorizontalAlignment = xlRight

  ' ����� - ����
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value = �����_�����������_�_�����_����7(getNumberOfficeByName2(In_officeNameInReport)) ' Workbooks(In_ReportName_String).Sheets("����1").Cells(rowCount_DB_����1, column_DB_����1_����_���_Q_�������).Value
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).HorizontalAlignment = xlRight

  ' ����� - ���������� (� %)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, 3)
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).NumberFormat = "0%"
  ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).HorizontalAlignment = xlRight
        
  ' 2. ������� � ��
      
  ' ������� � Sales_Office
  '  ������������� ID_Rec:
  ' ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
                        
  ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
  ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
  ' M_num = Nom_mes_quarter_str(dateDB)
  ' curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
         
  '  ������������� ID_Rec:
  ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
            
  ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
  curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
         
  ' ������ ������ � BASE\Sales_Office �� ��.
  Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
                                        "ID_Rec", ID_RecVar, _
                                          "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
                                            "Product_Name", In_Product_Name, _
                                              "�ffice", In_officeNameInReport, _
                                                "MMYY", strMMYY(dateDB), _
                                                  "Update_Date", dateDB, _
                                                    "Product_Code", In_Product_Code, _
                                                      "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, _
                                                        "Unit", In_Unit, _
                                                          "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                            "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, _
                                                              curr_Day_Month, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
                                                                "", "", _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "")

      
  
End Sub


