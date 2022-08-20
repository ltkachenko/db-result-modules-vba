Attribute VB_Name = "Module_����9"
' ���������� ����� "�������"
Sub ����������_�������()
Attribute ����������_�������.VB_ProcData.VB_Invoke_Func = " \n14"
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����9").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "��", 15, Date)
    
    If CheckFormatReportResult = "OK" Then
      
      ' ��������� BASE\Credits
      OpenBookInBase ("Credits")
      
      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("����9").Activate
      
      ' ���� � ��������� � Q3
      ThisWorkbook.Sheets("����9").Range("Q3").Value = FileName
             
      ' ��������� ������ �����������
      ThisWorkbook.Sheets("����9").Cells(rowByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������ �����������:", 100, 100) + 2).Value = _
          getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����,����", 2)

      ' ������� ������� �� �����9
      
      Application.StatusBar = "����������� ��������..."

      ' ������������ �����
      Column_���������_�������_����� = ColumnByValue(ReportName_String, "��", "������������ ��������������� ���", 1000, 1000)
      ' ������
      Column_CLAIM_ID = ColumnByValue(ReportName_String, "��", "CLAIM_ID", 1000, 1000) ' ���� ������_ID
      Column_����_����_������ = ColumnByValue(ReportName_String, "��", "���� ���� ������", 1000, 1000) ' ���� ������_����
      Column_��������_����� = ColumnByValue(ReportName_String, "��", "�������� �����", 1000, 1000) ' ���� ������_�����
      Column_���������_������ = ColumnByValue(ReportName_String, "��", "��������� ������", 1000, 1000) ' ������_������
      Column_��������_������ = ColumnByValue(ReportName_String, "��", "�������� ������", 1000, 1000) ' ������_��������
      ' �������
      Column_����_������� = ColumnByValue(ReportName_String, "��", "���� �������", 1000, 1000) ' ���� �������_����
      Column_������ = ColumnByValue(ReportName_String, "��", "������", 1000, 1000) ' ���� ������_������
      Column_������2 = ColumnByValue(ReportName_String, "��", "STATUS_CLAIM_DEMOGR", 1000, 1000) ' ������_������2
      Column_������3 = ColumnByValue(ReportName_String, "��", "��������� �������", 1000, 1000) ' ������_������3
      Column_������4 = ColumnByValue(ReportName_String, "��", "STATUS_DRR_VAR", 1000, 1000) ' STATUS_DRR_VAR -> ������_������4
      Column_������5 = ColumnByValue(ReportName_String, "��", "DECL_REASON_DRR_VAR", 1000, 1000) ' DECL_REASON_DRR_VAR -> ������_������5
      Column_���_�����_��������� = ColumnByValue(ReportName_String, "��", "���_����� ���������", 1000, 1000) ' �������_�����_min
      Column_�������_�����_��������� = ColumnByValue(ReportName_String, "��", "�������_����� ���������", 1000, 1000) ' �������_�����_mid
      Column_���_�����_��������� = ColumnByValue(ReportName_String, "��", "���_����� ���������", 1000, 1000) ' �������_�����_max
      Column_���������_������� = ColumnByValue(ReportName_String, "��", "��������� �������", 1000, 1000) ' �������_���������
      Column_����_��� = ColumnByValue(ReportName_String, "��", "����  ���", 1000, 1000) ' �������_�������
      Column_���������_������������_���� = ColumnByValue(ReportName_String, "��", "��������� ������������ ����", 1000, 1000)
      ' ������
      Column_�� = ColumnByValue(ReportName_String, "��", "������� �������", 1000, 1000) ' ������_��
      Column_�����_�������_�_������� = ColumnByValue(ReportName_String, "��", "����� ������� � �������", 1000, 1000) ' ����� ������� � ������� -> �������_�����
      Column_BIRTH_DATE = ColumnByValue(ReportName_String, "��", "BIRTH_DATE", 1000, 1000) ' ������_��
      Column_FIO = ColumnByValue(ReportName_String, "��", "FIO", 1000, 1000) ' ������_FIO
      ' ����� ������
      Column_��������_���� = ColumnByValue(ReportName_String, "��", "�������� ����", 1000, 1000) ' ��������_����
      Column_���_�������� = ColumnByValue(ReportName_String, "��", "��� ��������", 1000, 1000) ' ��������_���
      Column_�������_������� = ColumnByValue(ReportName_String, "��", "������� �������", 1000, 1000) ' �������
      Column_����������� = ColumnByValue(ReportName_String, "��", "����������� - ��", 1000, 1000)
      Column_���������������_�������� = ColumnByValue(ReportName_String, "��", "������� ��������", 1000, 1000)
      Column_�������_�������� = ColumnByValue(ReportName_String, "��", Chr(34) + "�������" + Chr(34) + " ��������", 1000, 1000)
      ' ����� � ��
      Column_���������_Split = ColumnByValue(ReportName_String, "��", "��������� split", 1000, 1000) ' Split
      Column_����_Split = ColumnByValue(ReportName_String, "��", "���� split-sell", 1000, 1000)
      ' ������
      column_����_������ = ColumnByValue(ReportName_String, "��", "���� ������", 1000, 1000) ' ������_����
      Column_�����_������_��� = ColumnByValue(ReportName_String, "��", "����� ������ ���", 1000, 1000) ' �����_��
      Column_������_��� = ColumnByValue(ReportName_String, "��", "������ ���", 1000, 1000) ' ������_�����
      Column_������_������ = ColumnByValue(ReportName_String, "��", "������ ������", 1000, 1000) ' ������_������
      Column_����_������� = ColumnByValue(ReportName_String, "��", "���� ������� (���) (2)", 1000, 1000) ' ������_����
      Column_FIO_MPP_OTHER = ColumnByValue(ReportName_String, "��", "FIO_MPP_OTHER", 1000, 1000) ' ������_���������
      Column_Flag_Chanel_IB = ColumnByValue(ReportName_String, "��", "Flag_Chanel_IB", 1000, 1000) ' ����� ��
      Column_��������_������ = ColumnByValue(ReportName_String, "��", "�������� ������", 1000, 1000) ' �������� ������
       
      Application.StatusBar = "����������� ������� � �������..."
       
      ' ���������� ����� 1 ������ ������������ � ����������� ���� ������ � ����� �� ���� ������ � ��������
      ' 1. ����������� ������������ ���� ������ � �������
      ' ���� ������
      dateBegin = CDate("01.01.2022")
      ' ���� ���������
      dateEnd = CDate("01.01.2000")
      '
      rowCount = 2
      Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 1).Value)
        
        ' ���� ��� ���� �� ������
        If (InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, "���������") <> 0) Or (InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, "����������") <> 0) Or (InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, "���������������") <> 0) Or (InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, "���������������") <> 0) Or (InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, "�����-����") <> 0) Then
        
          ' ���� ���� ������ dateEnd
          If Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value > dateEnd Then
            dateEnd = CDate(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value)
          End If
        
          ' ���� ���� ������ dateBegin
          If Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value < dateBegin Then
            dateBegin = CDate(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value)
          End If
        
        End If
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����������� ������� ���� �������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop

      ' ���������� �������� ��� � ����
      ThisWorkbook.Sheets("����9").Range("P2").Value = "������� �� �� � �� " + CStr(dateBegin) + "-" + CStr(dateEnd)
       
      ' ������������ �����
      ' ���� �� 5-�� ������
      ' ��������� ������
      For i = 1 To 5
        
        ' ��������� �� ���� DB
        ThisWorkbook.Sheets("����9").Activate
        
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


        rowCount = 2
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, 1).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������_�����).Value, officeNameInReport) <> 0 Then
            
            ' ���������� (��� ���������� ������ �������� ���������� � ���������)
            ������_ID_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_CLAIM_ID).Value
            ������_����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value
            ������_�����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��������_�����).Value
            �������_����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_�������).Value
            ������_������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������).Value
            ������_������2_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������2).Value
            ������_������3_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������3).Value
            �������_�����_min_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_�����_���������).Value
            �������_�����_mid_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_�������_�����_���������).Value
            �������_�����_max_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_�����_���������).Value
            �������_���������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������).Value
            �������_�������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_���).Value
            ������_��_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��).Value
            ��������_���_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_��������).Value
            ��������_����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��������_����).Value
            �������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_�������_�������).Value
            ������_����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, column_����_������).Value
            ������_�����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������_���).Value
            �����_��_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_Flag_Chanel_IB).Value
            �������_����_Var = Dir(ReportName_String)
          
            ' ��������� 4 ����
            ������_������4_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������4).Value
            ������_������5_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������5).Value
            ���������_������������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_������������_����).Value
            �������_�����_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_�����_�������_�_�������).Value
            ��������_������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��������_������).Value
            ���������_������_Var = Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_������).Value

            ' ������� � BASE\Credits
            Call InsertRecordInBook2("Credits", "����1", "������_ID", ������_ID_Var, _
                                            "������_ID", ������_ID_Var, _
                                              "����", officeNameInReport, _
                                                "������_����", ������_����_Var, _
                                                  "������_�����", ������_�����_Var, _
                                                    "�������_����", �������_����_Var, _
                                                      "������_������", ������_������_Var, _
                                                       "������_������2", ������_������2_Var, _
                                                         "������_������3", ������_������3_Var, _
                                                            "�������_�����_min", �������_�����_min_Var, _
                                                              "�������_�����_mid", �������_�����_mid_Var, _
                                                                "�������_�����_max", �������_�����_max_Var, _
                                                                  "�������_���������", �������_���������_Var, _
                                                                    "�������_�������", �������_�������_Var, _
                                                                      "������_��", ������_��_Var, _
                                                                        "��������_���", ��������_���_Var, _
                                                                          "��������_����", ��������_����_Var, _
                                                                            "�������", �������_Var, _
                                                                              "������_����", ������_����_Var, _
                                                                                "������_�����", ������_�����_Var, _
                                                                                  "�����_��", �����_��_Var, _
                                                                                    "������_������4", ������_������4_Var, _
                                                                                      "������_������5", ������_������5_Var, _
                                                                                        "���������_������������", ���������_������������_Var, "�������_�����", �������_�����_Var, "�������_����", �������_����_Var, "������_��������", ��������_������_Var, "������_������", ���������_������_Var, "", "")
                                                                                    
 
            
            ' ��������� BASE\FUNNEL ���� � ��� � ������� ������ �� ������ (���� ���, �� ������� ����)
            Call InsertRecordInBASEFUNNELBook("Credits", "����1", "������_ID", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_CLAIM_ID).Value, _
                                                "������_ID", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_CLAIM_ID).Value, _
                                                  "����", officeNameInReport, _
                                                    "������_����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_����_������).Value, _
                                                      "������_�����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��������_�����).Value, _
                                                        "�������_����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_�������).Value, _
                                                          "������_������", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������).Value, _
                                                            "������_������2", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������2).Value, _
                                                              "������_������3", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������3).Value, _
                                                                "�������_�����_min", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_�����_���������).Value, _
                                                                  "�������_�����_mid", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_�������_�����_���������).Value, _
                                                                    "�������_�����_max", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_�����_���������).Value, _
                                                                      "�������_���������", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���������_�������).Value, _
                                                                        "�������_�������", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_����_���).Value, _
                                                                          "������_��", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��).Value, _
                                                                            "��������_���", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_���_��������).Value, _
                                                                              "��������_����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_��������_����).Value, _
                                                                                "�������", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_�������_�������).Value, _
                                                                                  "������_����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, column_����_������).Value, _
                                                                                    "������_�����", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_������_���).Value, _
                                                                                      "�����_��", Workbooks(ReportName_String).Sheets("��").Cells(rowCount, Column_Flag_Chanel_IB).Value, _
                                                                                        "������_������4", ������_������4_Var, _
                                                                                          "������_������5", ������_������5_Var, _
                                                                                            "���������_������������", ���������_������������_Var, _
                                                                                             "�������_�����", �������_�����_Var, "������_��������", ��������_������_Var, "������_������", ���������_������_Var, "", "", "", "")
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      Application.StatusBar = "��������� �����������..."
      
      ' ������� ����� ��������� �� ����8 �� BASE\Credits
      Call �����_������_��_�������_����9
      
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ��������� BASE\Credits
      CloseBook ("Credits")

      ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
      Workbooks(Dir(FileName)).Close SaveChanges:=False

      Application.StatusBar = ""

      ' �������� ������ � �������� � �����
      Call ��������_Lotus_Notes_����9
    
      ' ���������� ���������� ���������
      finishProcess = True
    
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� BASE\Credits
    ' CloseBook ("Credits")

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    ' Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����9").Range("A1").Select

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

                                
' ��������� BASE\FUNNEL ���� � ��� � ������� ������ �� ������ (���� ���, �� ������� ����)
Sub InsertRecordInBASEFUNNELBook(In_BookName, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_FieldValue1, In_FieldName2, In_FieldValue2, In_FieldName3, In_FieldValue3, In_FieldName4, In_FieldValue4, In_FieldName5, In_FieldValue5, In_FieldName6, In_FieldValue6, In_FieldName7, In_FieldValue7, In_FieldName8, In_FieldValue8, In_FieldName9, In_FieldValue9, In_FieldName10, In_FieldValue10, In_FieldName11, In_FieldValue11, In_FieldName12, In_FieldValue12, In_FieldName13, In_FieldValue13, In_FieldName14, In_FieldValue14, In_FieldName15, In_FieldValue15, In_FieldName16, In_FieldValue16, In_FieldName17, In_FieldValue17, In_FieldName18, In_FieldValue18, In_FieldName19, In_FieldValue19, In_FieldName20, In_FieldValue20, In_FieldName21, In_FieldValue21, In_FieldName22, In_FieldValue22, In_FieldName23, In_FieldValue23, In_FieldName24, In_FieldValue24, In_FieldName25, In_FieldValue25, In_FieldName26, In_FieldValue26, In_FieldName27, In_FieldValue27, In_FieldName28, In_FieldValue28)
    
  ' ��� ��� In_FieldValue15
  If In_FieldValue15 = "" Then
    In_FieldValue15 = "emptyInn"
  End If
  
  If Dir(ThisWorkbook.Path + "\BASE\FUNNEL\" + In_FieldValue15 + ".xlsx") = "" Then
    ' ���� ����� ���, �� ��������� ������ � ��������� � \BASE\FUNNEL
    Workbooks.Open (ThisWorkbook.Path + "\Templates\�������.xlsx")
    Workbooks("�������").SaveAs FileName:=ThisWorkbook.Path + "\BASE\FUNNEL\" + In_FieldValue15 + ".xlsx", createBackUp:=False
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����9").Activate
  Else
    ' ���� ���� ����������
    Workbooks.Open (ThisWorkbook.Path + "\BASE\FUNNEL\" + In_FieldValue15 + ".xlsx")
    ThisWorkbook.Sheets("����9").Activate
  End If
  
  ' ������� ������ � �������� ����
  Call InsertRecordInBook2(In_FieldValue15, In_Sheet, In_FieldKeyName, In_FieldKeyValue, In_FieldName1, In_FieldValue1, In_FieldName2, In_FieldValue2, In_FieldName3, In_FieldValue3, In_FieldName4, In_FieldValue4, In_FieldName5, In_FieldValue5, In_FieldName6, In_FieldValue6, In_FieldName7, In_FieldValue7, In_FieldName8, In_FieldValue8, In_FieldName9, In_FieldValue9, In_FieldName10, In_FieldValue10, In_FieldName11, In_FieldValue11, In_FieldName12, In_FieldValue12, In_FieldName13, In_FieldValue13, In_FieldName14, In_FieldValue14, In_FieldName15, In_FieldValue15, In_FieldName16, In_FieldValue16, In_FieldName17, In_FieldValue17, In_FieldName18, In_FieldValue18, In_FieldName19, In_FieldValue19, In_FieldName20, In_FieldValue20, In_FieldName21, In_FieldValue21, In_FieldName22, In_FieldValue22, In_FieldName23, In_FieldValue23, In_FieldName24, In_FieldValue24, In_FieldName25, In_FieldValue25, In_FieldName26, In_FieldValue26, In_FieldName27, In_FieldValue27, In_FieldName28, In_FieldValue28)
  
  ' ��������� ����
  Workbooks(In_FieldValue15).Close SaveChanges:=True
  
End Sub
 
' ������� ��������� � ������ �� ����8
Sub �����_������_��_�������_����9()
  
  ' ������� �������� � ������� �� ����9
  For i = 31 To 35
    For j = 3 To 16
      ThisWorkbook.Sheets("����9").Cells(i, j).Value = 0
    Next j
  Next i
  
  ' 1. ����������� ������������ ���� ������
  dateEnd = CDate("01.01.2000")
  
  ' ������ �������� � BASE\Credits
  Column_������_���� = ColumnByValue("Credits", "����1", "������_����", 1000, 1000)
  column_���� = ColumnByValue("Credits", "����1", "����", 1000, 1000)
  Column_������� = ColumnByValue("Credits", "����1", "�������", 1000, 1000)
  Column_������_������ = ColumnByValue("Credits", "����1", "������_������", 1000, 1000)
  Column_�������_�����_min = ColumnByValue("Credits", "����1", "�������_�����_min", 1000, 1000)
  
  rowCount = 2
  Do While Not IsEmpty(Workbooks("Credits").Sheets("����1").Cells(rowCount, 1).Value)
        
    ' ���� ���� ������
    If Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_������_����).Value > dateEnd Then
      dateEnd = Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_������_����).Value
    End If
        
    ' ��������� ������
    rowCount = rowCount + 1
    Application.StatusBar = "����������� �������: " + CStr(rowCount) + "..."
    DoEventsInterval (rowCount)
  Loop

  ' ���������� ���� ������
  ' ���� ������
  dateBegin = Date_begin_day_month(dateEnd)
  
  ' ����� ��������� ������� �� ����9
  ThisWorkbook.Sheets("����9").Range("B28").Value = "�������� � ��������� � " + CStr(dateBegin) + " �� " + CStr(dateEnd)
  
  ' 2. ������� ������ �� ��������� �� ������
  rowCount = 2
  Do While Not IsEmpty(Workbooks("Credits").Sheets("����1").Cells(rowCount, 1).Value)
        
    ' ���� ���� � ���������
    If (Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_������_����).Value >= dateBegin) And (Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_������_����).Value <= dateEnd) Then
        
      ' ���������� ������ � ������� �� �����9
      row����9 = officeIn����9(Workbooks("Credits").Sheets("����1").Cells(rowCount, column_����).Value)
      column����9 = segmentIn����9(Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_�������).Value)
      
      ' ��������� ���� �������� - � ���� ����� (9) �� �����
      If Not IsEmpty(Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_�������_�����_min).Value) Then
        ThisWorkbook.Sheets("����9").Cells(row����9, column����9).Value = ThisWorkbook.Sheets("����9").Cells(row����9, column����9).Value + 1
      End If
      
      ' ��������� ���� �����
      If InStr(Workbooks("Credits").Sheets("����1").Cells(rowCount, Column_������_������).Value, "�����") <> 0 Then
        ThisWorkbook.Sheets("����9").Cells(row����9, column����9 + 1).Value = ThisWorkbook.Sheets("����9").Cells(row����9, column����9 + 1).Value + 1
      End If
      
    End If
        
    ' ��������� ������
    rowCount = rowCount + 1
    Application.StatusBar = "������� �� ���������: " + CStr(rowCount) + "..."
    DoEventsInterval (rowCount)
  Loop
  
  Application.StatusBar = ""

End Sub

' row����9 = officeIn����9(Workbooks("Credits").Sheets("����1").Cells(rowCount, 2).Value)
Function officeIn����9(In_Office) As Integer
        
        ' ������ ������ �� 1 �� 5
        Select Case In_Office
          Case "���������" ' �� ����������
            officeIn����9 = 31
          Case "����������" ' �� �����������
            officeIn����9 = 32
          Case "���������������" ' �� ����������������
            officeIn����9 = 33
          Case "���������������" ' �� ����������������
            officeIn����9 = 34
          Case "�����-����" ' �� ������-����
            officeIn����9 = 35
        End Select
  
End Function

' column����9 = segmentIn����9(Workbooks("Credits").Sheets("����1").Cells(rowCount, 14).Value)
Function segmentIn����9(In_Segment) As Integer
  
  �������_��������� = False
  
  ' ���
  If (�������_��������� = False) And (InStr(In_Segment, "���") <> 0) Then
    segmentIn����9 = 3
    �������_��������� = True
  End If
    
  ' ������������
  If (�������_��������� = False) And (InStr(In_Segment, "����.") <> 0) Then
    segmentIn����9 = 5
    �������_��������� = True
  End If
    
  ' �����������
  If (�������_��������� = False) And (InStr(In_Segment, "�����������") <> 0) Then
    segmentIn����9 = 7
    �������_��������� = True
  End If
    
  ' �������
  If (�������_��������� = False) And (InStr(In_Segment, "��˨���") <> 0) Then
    segmentIn����9 = 9
    �������_��������� = True
  End If
    
  ' ����������
  If (�������_��������� = False) And (InStr(In_Segment, "����������") <> 0) Then
    segmentIn����9 = 11
    �������_��������� = True
  End If
    
  ' ��������  �����
  If (�������_��������� = False) And (InStr(In_Segment, "�������� �����") <> 0) Then
    segmentIn����9 = 13
    �������_��������� = True
  End If
    
  ' ������
  If �������_��������� = False Then
    segmentIn����9 = 15
  End If
  
  
End Function


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����9()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������
  If MsgBox("��������� ���� ������ ������ � ������� ��������� �������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����9").Cells(RowByValue(ThisWorkbook.Name, "����9", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����9", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����9")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����9").Cells(RowByValue(ThisWorkbook.Name, "����9", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����9", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����9")

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����9").Range("Q3").Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����9").Cells(rowByValue(ThisWorkbook.Name, "����9", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����9", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "1. ������� �� ������ �������� � ��������� ������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "2. ������� ����������:" + Chr(13)
    ����������� = ����������� + "- ������� ������ �� <�����>: ___ ��."
    ����������� = ����������� + "- ��������: ___ ��. (__%)"
    ����������� = ����������� + "- � �.�. ������� �� ��������:" + Chr(13)
    ����������� = ����������� + "___% - __ ��. (__%)" + Chr(13)
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




