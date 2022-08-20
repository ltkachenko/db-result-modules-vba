Attribute VB_Name = "Module_UpdFr_DB"
' *** ���� UpdFr_DB ***

' *** ���������� ���������� ***
Public In_Row_UpdFr_DB As Integer

' ***                       ***

' �������� ������ �� DB
Sub UpdateFrom_DB()
Attribute UpdateFrom_DB.VB_ProcData.VB_Invoke_Func = " \n14"

  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm", , "�������� ����� � �������")
    
  ' ������� ��� ���� ������ �� ����� �����
  ReportName_String = Dir(FileName)
  
  ' ��������� ��������� ����� (UpdateLinks:=0)
  Workbooks.Open FileName, 0
      
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("UpdFr_DB").Activate

  ' ������
  ThisWorkbook.Sheets("UpdFr_DB").Range("C6").Value = ""

  ' �������� ������� �� ����� "UpdFr_DB"
  Call clear�ontents2(ThisWorkbook.Name, "UpdFr_DB", "A9", "L14")

  ' ���� DB
  dateDB_UpdFr_DB = CDate(Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  ThisWorkbook.Sheets("UpdFr_DB").Range("C7").Value = CStr(dateDB_UpdFr_DB)
  ' ThisWorkbook.Sheets("UpdFr_DB").Range("D8").Value = "���� �� " + strDDMMYY(dateDB_UpdFr_DB)

  ' ���������� ������� #��������_����������
  column_��������_���������� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#��������_����������", 100, 100)

  ' ������������� ����������
  In_ReportName_String_Var = ReportName_String ' ThisWorkbook.Sheets("UpdFr_DB").Cells(8, 9).Value
  
  SheetName_String_Var = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "SheetName_String:", 100, 100), column_��������_����������).Value
  
  In_Product_Name_Var = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_Product_Name:", 100, 100), column_��������_����������).Value ' "������ ��"
  
  In_Product_Code_Var = Product_Name_to_Product_Code(In_Product_Name_Var) ' "������_��_��"
  
  In_Unit_Var = Product_Name_to_Unit(In_Product_Name_Var)

  In_ColumnNameMonth = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_ColumnNameMonth:", 100, 100), column_��������_����������).Value
  
  In_ColumnNameQuarter = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_ColumnNameQuarter:", 100, 100), column_��������_����������).Value

  In_DeltaPrediction = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_DeltaPrediction:", 100, 100), column_��������_����������).Value

  In_���������_�������_����� = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_���������_�������_�����:", 100, 100), column_��������_����������).Value

  ' �������� ������� ����� � DB
  StringInSheet = SheetName_String_Var
  SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.11 ���������� �����"
  If SheetName_String <> "" Then

    ' ��������� � DB �� ������ ����
    Workbooks(ReportName_String).Sheets(SheetName_String_Var).Activate

    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("UpdFr_DB").Activate

    ' ���������
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
            
      ' ����� ������ ��� ������ �� ����� UpdFr_DB
      In_Row_UpdFr_DB = i + 8
        
      ' ������� ����� ������ � ������������� �����
      officeNameInReport_Var = officeNameInReport ' ThisWorkbook.Sheets("UpdFr_DB").Cells(8, 9).Value
        
      ' ����: ID_Rec, �ffice_Number, Product_Name, �ffice, MMYY, Update_Date, Product_Code, Plan, Unit, Fact, Percent_Completion

      ' �� ������, ��.
      Call DB_UniversalSheetInDB_UpdFr_DB(In_ReportName_String_Var, _
                                           SheetName_String_Var, _
                                             officeNameInReport_Var, _
                                               0, _
                                                 0, _
                                                   In_Product_Name_Var, _
                                                     In_Product_Code_Var, _
                                                       In_Unit_Var, _
                                                         0, _
                                                           In_ColumnNameMonth, _
                                                             In_ColumnNameQuarter, _
                                                               In_DeltaPrediction, _
                                                                 In_���������_�������_�����, _
                                                                   0, _
                                                                     0, _
                                                                       0, _
                                                                         0, 1, 1)

    Next i

    ' ������
    ThisWorkbook.Sheets("UpdFr_DB").Range("C6").Value = "������: ������ �� " + CStr(ThisWorkbook.Sheets("UpdFr_DB").Range("C7").Value) + " ���������, ��������� �����!"

  Else
    
    ' ���������
    MsgBox ("� DB �� ������ ���� " + SheetName_String_Var + "!")
    
  End If

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    If MsgBox("������� DB?", vbYesNo) = vbYes Then

      Workbooks(Dir(FileName)).Close SaveChanges:=False ' ������������
      ' ��������� � ������ M2
      ThisWorkbook.Sheets("UpdFr_DB").Range("A1").Select
    
    Else
    
      
    
    End If
    

    ' ���������
    MsgBox ("��������� ���������!")
 
    Application.StatusBar = ""

End Sub



' ���������� �� ������� DB
Sub DB_UniversalSheetInDB_UpdFr_DB(In_ReportName_String, In_Sheets, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Product_Code, In_Unit, In_Weight, In_ColumnNameMonth, In_ColumnNameQuarter, In_DeltaPrediction, In_���������_�������_�����, In_ColumnNameMonth_��������_����, In_ColumnNameQuarter_��������_����, In_PlanMonth, In_PlanQuarter, In_Fact_Plan_displacement_Month, In_Fact_Plan_displacement_Quarter)
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
  ' dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

  ' �������� ������� BASE\Products
  ' Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
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
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).Value = In_Row_UpdFr_DB - 8 'In_N
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).HorizontalAlignment = xlCenter
  ' ����
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 2).Value = In_officeNameInReport ' In_Product_Name
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 2).HorizontalAlignment = xlLeft
  

  ' ����������� ����������
  ����_������ = False

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
      
      ' �������:
      ' If (In_ColumnNameQuarter <> "") Then
      If (In_ColumnNameQuarter <> "") And (Column_�������_�������_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
        
        ' ������� - ����
        If In_PlanQuarter = 0 Then
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
        Else
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = In_PlanQuarter
        End If
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).NumberFormat = "#,##0"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).HorizontalAlignment = xlRight
        

        ' ������� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          
          ' ������� ����
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
          
        Else
          ' ���� ��� %, �� �������� �� 100
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value * 100)
        End If
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).NumberFormat = "#,##0"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).HorizontalAlignment = xlRight
        

        ' ������� - ���������� (� %)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 3)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0%"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).HorizontalAlignment = xlRight
        
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        ' If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        '   Call Full_Color_RangeII("����8", In_Row_����8, 7, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, 1)
        ' End If
      
        ' ������� - �������
        ' If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value <> 0) Then
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_�������).Value
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).NumberFormat = "0%"
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).HorizontalAlignment = xlRight
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        '   Call Full_Color_RangeII("����8", In_Row_����8, 8, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value, 1)
        ' End If
        
        ' ***
        ' ������������ ������� "�������_��������" �� ���� ��������, ���� ��������� �� � %
        ' If ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value <> "%" Then
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0)
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).NumberFormat = "0%"
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).HorizontalAlignment = xlRight
        ' End If
        ' ***
        
        ' ���� �� �������� ���� ����������� ����������, ��������: (In_ColumnNameMonth = "") AND (In_ColumnNameQuarter <>"")
        ' If (In_ColumnNameMonth = "") And (In_ColumnNameQuarter <> "") Then
        
          ' ������� � Sales_Office
          '  ������������� ID_Rec:
          ' ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
                        
          ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
          ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
          ' M_num = Nom_mes_quarter_str(dateDB)
          ' curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
                                      
          ' ������ ������ � BASE\Sales_Office �� ��.
          ' Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
          '                                   "ID_Rec", ID_RecVar, _
          '                                     "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
          '                                       "Product_Name", In_Product_Name, _
          '                                         "�ffice", In_officeNameInReport, _
          '                                           "MMYY", strNQYY(dateDB), _
          '                                             "Update_Date", dateDB, _
          '                                              "Product_Code", In_Product_Code, _
          '                                                "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, _
          '                                                   "Unit", In_Unit, _
          '                                                     "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
          '                                                       "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, _
          '                                                         curr_Day_Month_Q, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
          '                                                          "", "", _
          '                                                            "", "", _
          '                                                              "", "", _
          '                                                                "", "", _
          '                                                                  "", "", _
          '                                                                    "", "", _
          '                                                                      "", "", _
          '                                                                        "", "")

        
        ' End If
        
        
        
      End If
                  
      ' �����:
      If (In_ColumnNameMonth <> "") And (Column_�������_�����_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
  
        ' ����� - ����
        If In_PlanMonth = 0 Then
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value = In_PlanMonth
        End If
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).HorizontalAlignment = xlRight
        
        
        ' ����� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ' ���� ��� %, �� �������� �� 100
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value * 100)
        End If
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).HorizontalAlignment = xlRight
            
        ' ����� - ����������
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).Value = �����������(ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value, 3)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).NumberFormat = "0%"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).HorizontalAlignment = xlRight
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("UpdFr_DB", In_Row_UpdFr_DB, 5, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).Value, 1)
        End If

        ' ����� - ������� (�����, ���.��� � �.�.) ������ ������
        If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value <> 0) Then
      
          PredictionVar = (ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value) * Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
                
          ' ����� - �������, %
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).NumberFormat = "0%"
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).HorizontalAlignment = xlRight
          PredictionPercent = ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("UpdFr_DB", In_Row_UpdFr_DB, 6, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value, 1)
        Else
          
          ' ���� �������� ��� �� �������� � DB
          PredictionVar = 0
          PredictionPercent = 0
        
        End If
      
        '  ������������� ID_Rec:
        ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
      
        ' ID_Rec
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).Value = ID_RecVar
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).HorizontalAlignment = xlLeft
        
        ' Product_Name
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).Value = In_Product_Name
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).HorizontalAlignment = xlLeft
        
        ' �ffice
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).Value = In_officeNameInReport
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).HorizontalAlignment = xlLeft
        
        ' MMYY
        ' t = strMMYY(dateDB)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).Value = strMMYY(dateDB)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).HorizontalAlignment = xlCenter
        
        ' Update_Date
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).Value = dateDB
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).NumberFormat = "m/d/yyyy"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).HorizontalAlignment = xlLeft
        
        ' Product_Code
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).Value = In_Product_Code
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).HorizontalAlignment = xlLeft
      
        ' ������� � Sales_Office
            
        ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
        curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
            
        ' ������ ������ � BASE\Sales_Office �� ��.
        ' Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
        '                                     "ID_Rec", ID_RecVar, _
        '                                       "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
        '                                         "Product_Name", In_Product_Name, _
        '                                          "�ffice", In_officeNameInReport, _
        '                                             "MMYY", strMMYY(dateDB), _
        '                                               "Update_Date", dateDB, _
        '                                                "Product_Code", In_Product_Code, _
        '                                                  "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, _
        '                                                     "Unit", In_Unit, _
        '                                                       "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
        '                                                         "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, _
        '                                                           "Prediction", PredictionVar, _
        '                                                             "Percent_Prediction", PredictionPercent, _
        '                                                               curr_Day_Month, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
        '                                                                 "", "", _
        '                                                                   "", "", _
        '                                                                     "", "", _
        '                                                                       "", "", _
        '                                                                         "", "", _
        '                                                                           "", "")

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

  
End Sub

' ���������� �� ������� DB (��� �������)
Sub DB_UniversalSheetInDB_UpdFr_DB2(In_ReportName_String, In_Sheets, In_officeNameInReport, In_Row_����8, In_N, In_Product_Name, In_Product_Code, In_Unit, In_Weight, In_ColumnNameMonth, In_ColumnNameQuarter, In_DeltaPrediction, In_���������_�������_�����, In_ColumnNameMonth_��������_����, In_ColumnNameQuarter_��������_����, In_PlanMonth, In_PlanQuarter, In_Fact_Plan_displacement_Month, In_Fact_Plan_displacement_Quarter)
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
  ' dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))

  ' �������� ������� BASE\Products
  ' Call Update_BASE_Products(In_Product_Name, In_Product_Code, In_Unit)
  
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
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).NumberFormat = "@"
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).Value = In_Row_UpdFr_DB - 8 'In_N
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 1).HorizontalAlignment = xlCenter
  ' ����
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 2).Value = In_officeNameInReport ' In_Product_Name
  ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 2).HorizontalAlignment = xlLeft
  

  ' ����������� ����������
  ����_������ = False

  ' ������� � � ������� "��������� ��1"
  rowCount = Row_���������_�������_����� + 1
  Do While (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "����� ����") = 0) And (Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value))
    
    ' ���� ��� "��������� ��1" - ���������� ������
    ' If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��������� ��1") <> 0 Then
    If InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0 Then
    '   Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).ShowDetail = True
      ����_������ = True
    End If
              
    ' ���� ��� ������� ����
    ' If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0) And (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, "��1") = 0) Then
    If (InStr(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_���������_�������_�����).Value, In_officeNameInReport) <> 0) Then
      ' ����� �� ���� ������ ������ � �������� �� ����8
      
      ' �������:
      ' If (In_ColumnNameQuarter <> "") Then
      If (In_ColumnNameQuarter <> "") And (Column_�������_�������_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
        
        ' ������� - ����
        If In_PlanQuarter = 0 Then
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
        Else
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value = In_PlanQuarter
        End If
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).NumberFormat = "#,##0"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).HorizontalAlignment = xlRight
        

        ' ������� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          
          ' ������� ����
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value
          
        Else
          ' ���� ��� %, �� �������� �� 100
          ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value * 100)
        End If
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).NumberFormat = "#,##0"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).HorizontalAlignment = xlRight
        

        ' ������� - ���������� (� %)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value = �����������(ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 3)
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).NumberFormat = "0%"
        ' ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).HorizontalAlignment = xlRight
        
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        ' If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        '   Call Full_Color_RangeII("����8", In_Row_����8, 7, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, 1)
        ' End If
      
        ' ������� - �������
        ' If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_����).Value <> 0) Then
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�������_�������).Value
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).NumberFormat = "0%"
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).HorizontalAlignment = xlRight
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        '   Call Full_Color_RangeII("����8", In_Row_����8, 8, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 8).Value, 1)
        ' End If
        
        ' ***
        ' ������������ ������� "�������_��������" �� ���� ��������, ���� ��������� �� � %
        ' If ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 4).Value <> "%" Then
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).Value = �������_��������_����(dateDB, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, 5, 0)
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).NumberFormat = "0%"
        '   ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 20).HorizontalAlignment = xlRight
        ' End If
        ' ***
        
        ' ���� �� �������� ���� ����������� ����������, ��������: (In_ColumnNameMonth = "") AND (In_ColumnNameQuarter <>"")
        ' If (In_ColumnNameMonth = "") And (In_ColumnNameQuarter <> "") Then
        
          ' ������� � Sales_Office
          '  ������������� ID_Rec:
          ' ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strNQYY(dateDB) + "-" + In_Product_Code)
                        
          ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
          ' ����� ������ � ��������: 1-"", 2-"2", 3-"3"
          ' M_num = Nom_mes_quarter_str(dateDB)
          ' curr_Day_Month_Q = "Date" + M_num + "_" + Mid(dateDB, 1, 2)
                                      
          ' ������ ������ � BASE\Sales_Office �� ��.
          ' Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
          '                                   "ID_Rec", ID_RecVar, _
          '                                     "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
          '                                       "Product_Name", In_Product_Name, _
          '                                         "�ffice", In_officeNameInReport, _
          '                                           "MMYY", strNQYY(dateDB), _
          '                                             "Update_Date", dateDB, _
          '                                              "Product_Code", In_Product_Code, _
          '                                                "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 5).Value, _
          '                                                   "Unit", In_Unit, _
          '                                                     "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
          '                                                       "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 7).Value, _
          '                                                         curr_Day_Month_Q, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 6).Value, _
          '                                                          "", "", _
          '                                                            "", "", _
          '                                                              "", "", _
          '                                                                "", "", _
          '                                                                  "", "", _
          '                                                                    "", "", _
          '                                                                      "", "", _
          '                                                                        "", "")

        
        ' End If
        
        
        
      End If
                  
      ' �����:
      If (In_ColumnNameMonth <> "") And (Column_�������_�����_���� <> 0) Then ' 21.09 ��� ��������� ������� DB
  
        ' ����� - ����
        If In_PlanMonth = 0 Then
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value = In_PlanMonth
        End If
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).HorizontalAlignment = xlRight
        
        
        ' ����� - ����
        ' ���� ��������� � %
        If In_Unit <> "%" Then
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value
        Else
          ' ���� ��� %, �� �������� �� 100
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value = (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value * 100)
        End If
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).HorizontalAlignment = xlRight
            
        ' ����� - ����������
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).Value = �����������(ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value, 3)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).NumberFormat = "0%"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).HorizontalAlignment = xlRight
        ' ���� ������� "�������" ��� (In_DeltaPrediction = 0), �� ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        If (In_DeltaPrediction = 0) And (ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 4).Value <> 0) Then
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("UpdFr_DB", In_Row_UpdFr_DB, 5, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 5).Value, 1)
        End If

        ' ����� - ������� (�����, ���.��� � �.�.) ������ ������
        If (In_DeltaPrediction <> 0) And (Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_����).Value <> 0) Then
      
          PredictionVar = (ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 3).Value) * Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
                
          ' ����� - �������, %
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, Column_�������_�����_�������).Value
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).NumberFormat = "0%"
          ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).HorizontalAlignment = xlRight
          PredictionPercent = ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("UpdFr_DB", In_Row_UpdFr_DB, 6, ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 6).Value, 1)
        Else
          
          ' ���� �������� ��� �� �������� � DB
          PredictionVar = 0
          PredictionPercent = 0
        
        End If
      
        '  ������������� ID_Rec:
        ID_RecVar = CStr(CStr(getNumberOfficeByName(In_officeNameInReport)) + "-" + strMMYY(dateDB) + "-" + In_Product_Code)
      
        ' ID_Rec
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).Value = ID_RecVar
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 7).HorizontalAlignment = xlLeft
        
        ' Product_Name
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).Value = In_Product_Name
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 8).HorizontalAlignment = xlLeft
        
        ' �ffice
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).Value = In_officeNameInReport
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 9).HorizontalAlignment = xlLeft
        
        ' MMYY
        ' t = strMMYY(dateDB)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).Value = strMMYY(dateDB)
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 10).HorizontalAlignment = xlCenter
        
        ' Update_Date
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).Value = dateDB
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).NumberFormat = "m/d/yyyy"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 11).HorizontalAlignment = xlLeft
        
        ' Product_Code
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).Value = In_Product_Code
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).NumberFormat = "@"
        ThisWorkbook.Sheets("UpdFr_DB").Cells(In_Row_UpdFr_DB, 12).HorizontalAlignment = xlLeft
      
        ' ������� � Sales_Office
            
        ' ������� �������� � ������: Date_01 (N), Date_02 (O), Date_03 (P), Date_04 (Q), Date_05 Date_06 Date_07 Date_08 Date_09 Date_10 Date_11 Date_12 Date_13 Date_14 Date_15 Date_16 Date_17 Date_18 Date_19 Date_20 Date_21 Date_22 Date_23 Date_24 Date_25 Date_26 Date_27 Date_28 Date_29 Date_30 Date_31
        curr_Day_Month = "Date_" + Mid(dateDB, 1, 2)
            
        ' ������ ������ � BASE\Sales_Office �� ��.
        ' Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ID_RecVar, _
        '                                     "ID_Rec", ID_RecVar, _
        '                                       "�ffice_Number", getNumberOfficeByName(In_officeNameInReport), _
        '                                         "Product_Name", In_Product_Name, _
        '                                          "�ffice", In_officeNameInReport, _
        '                                             "MMYY", strMMYY(dateDB), _
        '                                               "Update_Date", dateDB, _
        '                                                "Product_Code", In_Product_Code, _
        '                                                  "Plan", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 9).Value, _
        '                                                     "Unit", In_Unit, _
        '                                                       "Fact", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
        '                                                         "Percent_Completion", ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 11).Value, _
        '                                                           "Prediction", PredictionVar, _
        '                                                             "Percent_Prediction", PredictionPercent, _
        '                                                               curr_Day_Month, ThisWorkbook.Sheets("����8").Cells(In_Row_����8, 10).Value, _
        '                                                                 "", "", _
        '                                                                   "", "", _
        '                                                                     "", "", _
        '                                                                       "", "", _
        '                                                                         "", "", _
        '                                                                           "", "")

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

  
End Sub



' �������� ������ �� DB
Sub ��������_������_�_UpdFr_DB_�_Sales_Office()

  ' ������
  If MsgBox("�������� ������ � ����� UpdFr_DB � BASE\Sales_Office?", vbYesNo) = vbYes Then
    
    ' ������
    ThisWorkbook.Sheets("UpdFr_DB").Range("C6").Value = ""
    
    ' ��������� BASE\Sales
    OpenBookInBase ("Sales_Office")
    
    ' ��������� BASE\Products
    OpenBookInBase ("Products")

    
    ' ���������� �������: #ID_Rec #Product_Name   #�ffice #MMYY   #Update_Date    #Product_Code
    column_ID_Rec = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#ID_Rec", 100, 100)
    column_Product_Name = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Product_Name", 100, 100)
    column_�ffice = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#�ffice", 100, 100)
    column_MMYY = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#MMYY", 100, 100)
    column_Update_Date = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Update_Date", 100, 100)
    column_Product_Code = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Product_Code", 100, 100)
    
    ' #����   #����   #���.   #������� '     column_ = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "", 100, 100)
    column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����", 100, 100)
    column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����", 100, 100)
    column_��� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#���.", 100, 100)
    column_������� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#�������", 100, 100)

    
    ' ������� ������ ����� UpdFr_DB_1
    rowCount = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_1", 100, 100) + 3
    Do While (ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value <> "")
    
       
    
      ' ��������� ������
      ' ������ ������ � BASE\Sales_Office �� ��.
      Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_ID_Rec).Value, _
                                           "ID_Rec", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_ID_Rec).Value, _
                                             "�ffice_Number", getNumberOfficeByName(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_�ffice).Value), _
                                               "Product_Name", Product_Code_to_Product_Name(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value), _
                                                "�ffice", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_�ffice).Value, _
                                                   "MMYY", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_MMYY).Value, _
                                                     "Update_Date", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Update_Date).Value, _
                                                      "Product_Code", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value, _
                                                        "Plan", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_����).Value, _
                                                           "Unit", Product_Name_to_Unit(Product_Code_to_Product_Name(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value)), _
                                                             "Fact", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_����).Value, _
                                                               "Percent_Completion", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_���).Value, _
                                                                 "Prediction", "", _
                                                                   "Percent_Prediction", "", _
                                                                     "", "", _
                                                                       "", "", _
                                                                         "", "", _
                                                                           "", "", _
                                                                             "", "", _
                                                                               "", "", _
                                                                                 "", "")
    
      ' ��������� ������
      Application.StatusBar = "����������: " + ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
    
    Loop
      
    ' ������
    ThisWorkbook.Sheets("UpdFr_DB").Range("C6").Value = "������: ������ �� " + CStr(ThisWorkbook.Sheets("UpdFr_DB").Range("C7").Value) + " ��������� � Sales_Office"
      
    ' ��������� BASE\Products
    CloseBook ("Products")
   
    ' ��������� BASE\Sales
    CloseBook ("Sales_Office")
    
    Application.StatusBar = ""
    
    MsgBox ("������ ���������!")
  
  End If



End Sub

' ������ ���� ���. �� ����� � ����
Sub Update_UpdFr_DB_���()

  ' #����   #����   #���.   #������� '     column_ = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "", 100, 100)
  column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����", 100, 100)
  column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����", 100, 100)
  column_��� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#���.", 100, 100)

  ' ������� ������ ����� UpdFr_DB_1
  rowCount = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_1", 100, 100) + 3
  Do While (ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value <> "")
  
    ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 5).Value = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 4).Value / ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 3).Value
    
    ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
    Call Full_Color_RangeII("UpdFr_DB", rowCount, 5, ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 5).Value, 1)
  
    ' ��������� ������
    Application.StatusBar = "����������: " + ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop

  Application.StatusBar = ""

End Sub

' ������ ���� ���. �� ����� � ����
Sub Update_UpdFr_DB_�������_���()

  ' #����   #����   #���.   #������� '     column_ = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "", 100, 100)
  column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)
  column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)
  column_��� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#���2", 100, 100)
  column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)

  ' ������� ������ ����� UpdFr_DB_1
  rowCount = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_2", 100, 100) + 3
  Do While (ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value <> "")
  
    ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 5).Value = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 4).Value / ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 3).Value
    ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 6).Value = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 4).Value / ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 3).Value
    
    ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
    Call Full_Color_RangeII("UpdFr_DB", rowCount, 6, ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 6).Value, 1)
  
    ' ��������� ������
    Application.StatusBar = "����������: " + ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop

  Application.StatusBar = ""

End Sub



' �������� ������ �� DB �� �������
Sub UpdateFrom_DB_�������()

  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm", , "�������� ����� � �������")
    
  ' ������� ��� ���� ������ �� ����� �����
  ReportName_String = Dir(FileName)
  
  ' ��������� ��������� ����� (UpdateLinks:=0)
  Workbooks.Open FileName, 0
      
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("UpdFr_DB").Activate

  row_�����_UpdFr_DB_2 = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_2", 100, 100)

  ' ������
  ThisWorkbook.Sheets("UpdFr_DB").Range("C" + CStr(row_�����_UpdFr_DB_2)).Value = ""

  ' �������� ������� �� ����� "UpdFr_DB"
  Call clear�ontents2(ThisWorkbook.Name, "UpdFr_DB", "A" + CStr(row_�����_UpdFr_DB_2 + 3), "L14" + CStr(row_�����_UpdFr_DB_2 + 3))

  ' ���� DB
  dateDB_UpdFr_DB = CDate(Mid(Workbooks(ReportName_String).Sheets("����������").Cells(1, 1).Value, 23, 10))
  ThisWorkbook.Sheets("UpdFr_DB").Range("C" + CStr(row_�����_UpdFr_DB_2 + 1)).Value = CStr(dateDB_UpdFr_DB)

  ' ���������� ������� #��������_����������
  column_��������_���������� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#��������_����������2", 100, 100)

  ' ������������� ����������
  In_ReportName_String_Var = ReportName_String ' ThisWorkbook.Sheets("UpdFr_DB").Cells(8, 9).Value
  
  SheetName_String_Var = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "SheetName_String2:", 100, 100), column_��������_����������).Value
  
  In_officeNameInReport = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_officeNameInReport2:", 100, 100), column_��������_����������).Value
  
  In_Product_Name_Var = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_Product_Name2:", 100, 100), column_��������_����������).Value ' "������ ��"
  
  In_Product_Code_Var = Product_Name_to_Product_Code(In_Product_Name_Var) ' "������_��_��"
  
  In_Unit_Var = Product_Name_to_Unit(In_Product_Name_Var)

  In_ColumnNameMonth = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_ColumnNameMonth2:", 100, 100), column_��������_����������).Value
  
  In_ColumnNameQuarter = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_ColumnNameQuarter2:", 100, 100), column_��������_����������).Value

  In_DeltaPrediction = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_DeltaPrediction2:", 100, 100), column_��������_����������).Value

  In_���������_�������_����� = ThisWorkbook.Sheets("UpdFr_DB").Cells(rowByValue(ThisWorkbook.Name, "UpdFr_DB", "In_���������_�������_�����2:", 100, 100), column_��������_����������).Value

  ' �������� ������� ����� � DB
  StringInSheet = SheetName_String_Var
  SheetName_String = FindNameSheet(ReportName_String, StringInSheet) ' "3.11 ���������� �����"
  If SheetName_String <> "" Then

    ' ��������� � DB �� ������ ����
    Workbooks(ReportName_String).Sheets(SheetName_String_Var).Activate

    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("UpdFr_DB").Activate

            
      ' ����� ������ ��� ������ �� ����� UpdFr_DB
      In_Row_UpdFr_DB = row_�����_UpdFr_DB_2 + 3
        
      ' ������� ����� ������ � ������������� �����
      officeNameInReport_Var = In_officeNameInReport ' "���������" ' officeNameInReport ' ThisWorkbook.Sheets("UpdFr_DB").Cells(8, 9).Value
        
      ' ����: ID_Rec, �ffice_Number, Product_Name, �ffice, MMYY, Update_Date, Product_Code, Plan, Unit, Fact, Percent_Completion

      ' �� ������, ��.
      Call DB_UniversalSheetInDB_UpdFr_DB2(In_ReportName_String_Var, _
                                             SheetName_String_Var, _
                                               officeNameInReport_Var, _
                                                 0, _
                                                   0, _
                                                     In_Product_Name_Var, _
                                                       In_Product_Code_Var, _
                                                         In_Unit_Var, _
                                                           0, _
                                                             In_ColumnNameMonth, _
                                                               In_ColumnNameQuarter, _
                                                                 In_DeltaPrediction, _
                                                                   In_���������_�������_�����, _
                                                                     0, _
                                                                       0, _
                                                                         0, _
                                                                           0, 1, 1)


    ' ������
    ThisWorkbook.Sheets("UpdFr_DB").Range("C6").Value = "������: ������ �� " + CStr(ThisWorkbook.Sheets("UpdFr_DB").Range("C7").Value) + " ���������, ��������� �����!"

  Else
    
    ' ���������
    MsgBox ("� DB �� ������ ���� " + SheetName_String_Var + "!")
    
  End If

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    If MsgBox("������� DB?", vbYesNo) = vbYes Then

      Workbooks(Dir(FileName)).Close SaveChanges:=False ' ������������
      ' ��������� � ������ M2
      ThisWorkbook.Sheets("UpdFr_DB").Range("A1").Select
    
    Else
    
      
    
    End If
    

    ' ���������
    MsgBox ("��������� ���������!")
 
    Application.StatusBar = ""
  

End Sub

' �������� ������ �� DB
Sub ��������_������_�_UpdFr_DB_�������_�_Sales_Office()

  ' ������
  If MsgBox("�������� ������ � ����� UpdFr_DB (�������) � BASE\Sales_Office?", vbYesNo) = vbYes Then
    
    ' ������
    row_�����_UpdFr_DB_2 = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_2", 100, 100)
    ThisWorkbook.Sheets("UpdFr_DB").Range("C" + CStr(row_�����_UpdFr_DB_2)).Value = ""
    
    ' ��������� BASE\Sales
    OpenBookInBase ("Sales_Office")
    
    ' ��������� BASE\Products
    OpenBookInBase ("Products")

    
    ' ���������� �������: #ID_Rec #Product_Name   #�ffice #MMYY   #Update_Date    #Product_Code
    column_ID_Rec = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#ID_Rec2", 100, 100)
    column_Product_Name = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Product_Name2", 100, 100)
    column_�ffice = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#�ffice2", 100, 100)
    column_MMYY = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#MMYY2", 100, 100)
    column_Update_Date = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Update_Date2", 100, 100)
    column_Product_Code = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#Product_Code2", 100, 100)
    
    ' #����   #����   #���.   #������� '     column_ = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "", 100, 100)
    column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)
    column_���� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)
    column_��� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#���2", 100, 100)
    column_������� = ColumnByValue(ThisWorkbook.Name, "UpdFr_DB", "#����2", 100, 100)

    
    ' ������� ������ ����� UpdFr_DB_1
    rowCount = rowByValue(ThisWorkbook.Name, "UpdFr_DB", "����� UpdFr_DB_2", 100, 100) + 3
    Do While (ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value <> "")
    
       
    
      ' ��������� ������
      ' ������ ������ � BASE\Sales_Office �� ��.
      Call InsertRecordInBook("Sales_Office", "����1", "ID_Rec", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_ID_Rec).Value, _
                                           "ID_Rec", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_ID_Rec).Value, _
                                             "�ffice_Number", getNumberOfficeByName(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_�ffice).Value), _
                                               "Product_Name", Product_Code_to_Product_Name(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value), _
                                                "�ffice", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_�ffice).Value, _
                                                   "MMYY", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_MMYY).Value, _
                                                     "Update_Date", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Update_Date).Value, _
                                                      "Product_Code", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value, _
                                                        "Plan", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_����).Value, _
                                                           "Unit", Product_Name_to_Unit(Product_Code_to_Product_Name(ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_Product_Code).Value)), _
                                                             "Fact", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_����).Value, _
                                                               "Percent_Completion", ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, column_���).Value, _
                                                                 "Prediction", "", _
                                                                   "Percent_Prediction", "", _
                                                                     "", "", _
                                                                       "", "", _
                                                                         "", "", _
                                                                           "", "", _
                                                                             "", "", _
                                                                               "", "", _
                                                                                 "", "")
    
      ' ��������� ������
      Application.StatusBar = "����������: " + ThisWorkbook.Sheets("UpdFr_DB").Cells(rowCount, 2).Value + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
    
    Loop
      
    ' ������
    ThisWorkbook.Sheets("UpdFr_DB").Range("C" + CStr(row_�����_UpdFr_DB_2)).Value = "������: ������ �� " + CStr(ThisWorkbook.Sheets("UpdFr_DB").Range("C" + CStr(row_�����_UpdFr_DB_2 + 1)).Value) + " ��������� � Sales_Office"
      
    ' ��������� BASE\Products
    CloseBook ("Products")
   
    ' ��������� BASE\Sales
    CloseBook ("Sales_Office")
    
    Application.StatusBar = ""
    
    MsgBox ("������ ���������!")
  
  End If
  

End Sub

