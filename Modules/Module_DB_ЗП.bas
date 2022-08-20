Attribute VB_Name = "Module_DB_��"
' *** ���� DB_�� ***

' *** ���������� ���������� ***
' Public dateDB_DB_�� As Date
' ***                       ***

' ���������� �� DB_��
Sub ����������_��_DB_��()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
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
    ThisWorkbook.Sheets("DB_��").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "����. ����.", 20, Date)
    
    If CheckFormatReportResult = "OK" Then
      
      ' ���� ������ � "B5" �� ����� ����� "����� �� ��_3��_2021_29.07.2021.xlsb"
      ' dateDB_DB_��_str = Mid(ReportName_String, InStr(ReportName_String, ".xlsb") - 10, 10)
      ' 22 � 10
      dateDB_DB_��_str = Mid(ReportName_String, 22, 10)
      dateDB_DB_�� = CDate(dateDB_DB_��_str)
      ThisWorkbook.Sheets("DB_��").Range("B5").Value = "����������� ����� 18+ ����� � ��� �� " + dateDB_DB_��_str
      
      ' ���� ������
      ThisWorkbook.Sheets("DB_��").Range("Q2").Value = "����������� �� 18+ ����� � ��� �� " + dateDB_DB_��_str
      
      ' ������� ������� "����� DB_��"
      row_�����_DB_�� = rowByValue(ThisWorkbook.Name, "DB_��", "����� DB_��", 100, 100)
      Call clear�ontents2(ThisWorkbook.Name, "DB_��", "A" + CStr(row_�����_DB_�� + 3), "S" + CStr(row_�����_DB_�� + 3 + 5))
      
      ' ������� ������� "����� ����_����"
      row_�����_����_���� = rowByValue(ThisWorkbook.Name, "DB_��", "����� ����_����", 100, 100)
      Call clear�ontents2(ThisWorkbook.Name, "DB_��", "A" + CStr(row_�����_����_���� + 3), "M" + CStr(row_�����_����_���� + 3 + 5))
      
      ' ��������� ������� ������� "�� (����� �����������)"
      Workbooks(ReportName_String).Sheets("�� (����� �����������)").PivotTables("SASApp:TEMP.ZP_V3_TPL").PivotFields("������").PivotItems("��������� ��1").ShowDetail = True
      
      ' ���������� ������� �� ����� "�� (����� �����������)"
      Application.StatusBar = "����������� �������� � �� (����� �����������)..."
      row_������_���� = rowByValue(ReportName_String, "�� (����� �����������)", "������ - ����", 50, 50)
      column_�����_18_���� = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, "����� 18+ ����")
      column_�����_18�_���� = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, "����� 18�+ ����")
      column_����������_�����_�����_18� = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, "���������� ����� (����� 18�+)")
      column_����_��_�������������_�� = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, " ���� ��  �������������")
      column_�������������_��_�_��������_18 = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, " ������������� �� � �������� 18+")
      column_����������_����_��_�������������_�� = ColumnByName(ReportName_String, "�� (����� �����������)", row_������_����, " ���������� ���� �� ������������� ��")
      Application.StatusBar = ""

      ' ��������� � ��������� ����� "����������� ����������"
      ' SALORGCD
      column_������_SALORGCD = ColumnByName(ReportName_String, "����������� ����������", 1, "SALORGCD")
      ' NAMEORG
      column_������_NAMEORG = ColumnByName(ReportName_String, "����������� ����������", 1, "NAMEORG")
      ' INNSORG
      column_������_INNSORG = ColumnByName(ReportName_String, "����������� ����������", 1, "INNSORG")
      ' ZCONTRN
      column_������_ZCONTRN = ColumnByName(ReportName_String, "����������� ����������", 1, "ZCONTRN")
      ' CNTR_YM_FROM
      column_������_CNTR_YM_FROM = ColumnByName(ReportName_String, "����������� ����������", 1, "CNTR_YM_FROM")
      ' ��������� (��)
      column_������_���������_�� = ColumnByName(ReportName_String, "����������� ����������", 1, "��������� (��)")
      ' ��������� (��)
      column_������_���������_�� = ColumnByName(ReportName_String, "����������� ����������", 1, "��������� (��)")
      ' ���� ������
      column_������_����_������ = ColumnByName(ReportName_String, "����������� ����������", 1, "���� ������")
      ' ������
      column_������_������ = ColumnByName(ReportName_String, "����������� ����������", 1, "������")
      ' ��
      column_������_�� = ColumnByName(ReportName_String, "����������� ����������", 1, "��")
      ' TB_CONTR
      column_������_TB_CONTR = ColumnByName(ReportName_String, "����������� ����������", 1, "TB_CONTR")

      ' ��������� ������� �� "����������� ����������" ��������! �� �������� ���������� �����
      Workbooks(ReportName_String).Sheets("����������� ����������").ListObjects("�������2").Range.AutoFilter Field:=column_������_������, Criteria1:="��������� ��1"

      ' �������� ��������� ������� ��� ���� � �����������
      OutBookName = ThisWorkbook.Path + "\Out\Cards_pot_" + Mid(ThisWorkbook.Sheets("DB_��").Range("B5").Value, 38, 10) + ".xlsx"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(OutBookName)

      Call createBook_out_DB_��(OutBookName)

      ThisWorkbook.Sheets("DB_��").Range("T3").Value = OutBookName

      ' ��������� ����������
      �����_�����_18_���� = 0
      �����_�����_18_���� = 0
      �����_��������_��18_���� = 0
      �����_��������_��18_���� = 0
      �����_��_��_���� = 0
      �����_��_��_���� = 0

      �����_���_���������_���_�� = 0
      �����_���_���������_���_�� = 0
      �����_���_���������_������ = 0
      
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

        ' ������
        ' Application.StatusBar = officeNameInReport + "..."

        ThisWorkbook.Sheets("DB_��").Activate

        ' 1) "�� (����� �����������)"
        count_���������_OO1 = 0

        rowCount = row_������_���� + 1
        Do While InStr(Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, 1).Value, "����� ����") = 0
       
          ' ������ ���� ������ ��������� OO1
          If InStr(Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, 1).Value, "��������� ��1") <> 0 And (officeNameInReport = "���������") Then
            count_���������_OO1 = count_���������_OO1 + 1
          End If

          ' ���� ��� ������� ����
          If ((InStr(Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, 1).Value, officeNameInReport) <> 0) And (officeNameInReport <> "���������")) Or ((InStr(Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, 1).Value, "���������") <> 0) And (count_���������_OO1 = 2)) Then
            
            
            ' ������� ������ � ������� "����� DB_��"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 1).Value = CStr(i) + "."
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 1).NumberFormat = "@"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 1).HorizontalAlignment = xlCenter
            
            ' ����
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 2).Value = getNameOfficeByNumber(i)
            ' ����� 18+ ����
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value = Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, column_�����_18_����).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).HorizontalAlignment = xlRight
            
            ' ��������� ���� �� ����� ������ � ���� �� �� ������ �� ����8
            ����_����_����������_�����_18_����8 = ThisWorkbook.Sheets("����8").Cells(getRowFromSheet8(getNameOfficeByNumber(i), "���������� ����� 18+"), 5).Value
            '
            If ����_����_����������_�����_18_����8 <> ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value Then
              ' ������
              If MsgBox("���� ��18 ����8 " + CStr(����_����_����������_�����_18_����8) + " ��. ���� DB_�� " + CStr(ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value) + " ��. ������ ���� � ����8?", vbYesNo) = vbYes Then
                ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value = ����_����_����������_�����_18_����8
              End If

            End If
            
            
            ' ����� �����
            �����_�����_18_���� = �����_�����_18_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value
            
            ' ����� 18+ ����
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).Value = Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, column_�����_18�_����).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).HorizontalAlignment = xlRight
            �����_�����_18_���� = �����_�����_18_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).Value
            
            ' ����� 18+ ���.
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).Value, 3) ' Workbooks(ReportName_String).Sheets("�� (����� �����������)").Cells(rowCount, column_����������_�����_�����_18�).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).NumberFormat = "0%"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).HorizontalAlignment = xlRight
            
            ' ����� 18+ �������
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).Value = �������_��������_����(dateDB_DB_��, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).Value, 5, 0)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).NumberFormat = "0%"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("DB_��", row_�����_DB_�� + 2 + i, 6, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).Value, 1)
            
            ' �������� �� ���� ����� �� ����8 (����. ������������� �� ����)
            row_����8_officeNameInReport_��������_�� = getRowFromSheet8(getNameOfficeByNumber(i), "�������� �� 18+, ��._������� ")
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).Value = ThisWorkbook.Sheets("����8").Cells(row_����8_officeNameInReport_��������_��, 5).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).HorizontalAlignment = xlRight
            �����_��������_��18_���� = �����_��������_��18_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).Value
            
            ' �������� �� ���� (����. ������������� �� ����)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).Value = ThisWorkbook.Sheets("����8").Cells(row_����8_officeNameInReport_��������_��, 6).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).HorizontalAlignment = xlRight
            �����_��������_��18_���� = �����_��������_��18_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).Value
            
            ' �������� �� ���������� (����. ������������� �� ���)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).Value, 3)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).NumberFormat = "0%"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("DB_��", row_�����_DB_�� + 2 + i, 9, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).Value, 1)
            
            ' ������ �� � �� ����� �� ����8
            row_����8_officeNameInReport_��_�� = getRowFromSheet8(getNameOfficeByNumber(i), "           �� � ��")
                       
            ' ������ �� � �� ����
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).Value = ThisWorkbook.Sheets("����8").Cells(row_����8_officeNameInReport_��_��, 5).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).HorizontalAlignment = xlRight
            �����_��_��_���� = �����_��_��_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).Value
            
            ' ������ �� � �� ����
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value = ThisWorkbook.Sheets("����8").Cells(row_����8_officeNameInReport_��_��, 6).Value
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).HorizontalAlignment = xlRight
            �����_��_��_���� = �����_��_��_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value
            
            ' ������ �� � �� ���.
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value, 3)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).NumberFormat = "0%"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).HorizontalAlignment = xlRight

            ' ������ �� � �� �������.
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).Value = �������_��������_����(dateDB_DB_��, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value, 5, 0)
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).NumberFormat = "0%"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).HorizontalAlignment = xlRight
            ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
            Call Full_Color_RangeII("DB_��", row_�����_DB_�� + 2 + i, 13, ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).Value, 1)

            ' =======================================================================================================================================
            ' ��������� � ��������� ����� "����������� ����������"
            
            ' ��������� ����������
            �����_���������_�� = 0
            �����_���������_�� = 0
            ' ���� ������
            �����_��������_���_���������� = 0

            
            rowCount_������ = 2
            Do While Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, 1).Value <> ""
       
              ' ���� ��� ������� ����
              If (InStr(Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_��).Value, officeNameInReport) <> 0) Then
                
                
                ' ���� ������ "00000000" (�����)
                If Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_����_������).Value = "00000000" Then
                  
                  ' ��������� �� �������
                  If Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_���������_��).Value = "1" Then
                    �����_���������_�� = �����_���������_�� + 1
                    �����_���_���������_���_�� = �����_���_���������_���_�� + 1
                    Status_Var = "�� ������ (��)"
                  End If
                  
                  ' ��������� �� �������
                  If Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_���������_��).Value = "1" Then
                    �����_���������_�� = �����_���������_�� + 1
                    �����_���_���������_���_�� = �����_���_���������_���_�� + 1
                    Status_Var = "�� ������ (��)"
                  End If
                  
                Else
                  ' ���� ���� ������ �� "00000000" (�����)
                  �����_��������_���_���������� = �����_��������_���_���������� + 1
                  �����_���_���������_������ = �����_���_���������_������ + 1
                  Status_Var = "������ ��� ����������"
                End If
                
                ' ��������� ����� � OutBookName
                ' ������ ������ � BASE\Sales_Office �� ��.
                Call InsertRecordInBook(Dir(OutBookName), "����1", "TB_CONTR", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_TB_CONTR).Value, _
                                            "TB_CONTR", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_TB_CONTR).Value, _
                                              "SALORGCD", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_SALORGCD).Value, _
                                                "NAMEORG", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_NAMEORG).Value, _
                                                  "INNSORG", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_INNSORG).Value, _
                                                    "ZCONTRN", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_ZCONTRN).Value, _
                                                      "CNTR_YM_FROM", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_CNTR_YM_FROM).Value, _
                                                        "Status", Status_Var, _
                                                          "���� ������", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_����_������).Value, _
                                                            "����", Workbooks(ReportName_String).Sheets("����������� ����������").Cells(rowCount_������, column_������_��).Value, _
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
              rowCount_������ = rowCount_������ + 1
              Application.StatusBar = officeNameInReport + ": ����������� ���������� " + CStr(rowCount_������) + "..."
              DoEventsInterval (rowCount_������)
            Loop
            
            ' ������� ����� �� ����� "����������� ����������"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).Value = �����_���������_��
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).HorizontalAlignment = xlRight
            ' �����_��_��_���� = �����_��_��_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value

            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).Value = �����_���������_��
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).HorizontalAlignment = xlRight
            ' �����_��_��_���� = �����_��_��_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value

            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).Value = �����_��������_���_����������
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).HorizontalAlignment = xlRight
            ' �����_��_��_���� = �����_��_��_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value

            
            ' =======================================================================================================================================
            
            
          End If ' ���� ��� ������� ����
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' ������� ����� ���������
      ' ----------------------------------------------------------------------------------------------------------------------------------
      ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
      Call gorizontalLineII(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 2, 19)
      
      ' ����� ����� 18+ ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).Value = �����_�����_18_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 3).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 3)
      
      ' ����� ����� 18+ ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).Value = �����_�����_18_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 4).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 4)
      
      ' ����� ����� 18+ ���.
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).Value = �����������(�����_�����_18_����, �����_�����_18_����, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 5).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 5)
      
      ' ����� ����� 18+ �������.
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).Value = �������_��������_����(dateDB_DB_��, �����_�����_18_����, �����_�����_18_����, 5, 0)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 6).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 6)
      
      ' �������� �� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).Value = �����_��������_��18_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 7).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 7)
      
      ' �������� �� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).Value = �����_��������_��18_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 8).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 8)
      
      ' �������� �� ����������
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).Value = �����������(�����_��������_��18_����, �����_��������_��18_����, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 9).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 5)
      
      ' �� � �� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).Value = �����_��_��_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 10).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 10)
                  
      ' �� � �� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).Value = �����_��_��_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 11).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 11)
      
      ' �� � �� ���.
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).Value = �����������(�����_��_��_����, �����_��_��_����, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 12).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 12)

      ' �� � �� �������.
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).Value = �������_��������_����(dateDB_DB_��, �����_��_��_����, �����_��_��_����, 5, 0)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 13).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 13)

      ' 17
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).Value = �����_���_���������_���_��
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 17).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 17)
      
      ' 18
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).Value = �����_���_���������_���_��
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 18).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 18)
            
      ' 19
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).Value = �����_���_���������_������
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_DB_�� + 2 + i, 19).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_DB_�� + 2 + i, 19)
      

      ' 2. ��������� ����� "����. ����."
      ' ���������� ������� �� ����� "����. ����."
      Application.StatusBar = "����������� �������� � " + �������() + "����. ����." + �������() + "..."
      row_��������_��������� = rowByValue(ReportName_String, "����. ����.", "���������", 50, 50)
      column_��������_��������� = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, "���������")
      column_��������_������ = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, "������")
      column_��������_���� = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, "����")
      column_��������_���� = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, " ����")
      column_��������_����_18 = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, " ���� 18+")
      column_��������_����������_�����_18 = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, "���������� ����� 18+")
      ' column_��������_ = ColumnByName(ReportName_String, "����. ����.", row_��������_���������, "")
      Application.StatusBar = ""

      ' ��������� ������� ������� - � ����1 ������ ���������
      row_��������_�����_���� = rowByValue(ReportName_String, "����. ����.", "����� ����", 1000, 50)
      Workbooks(ReportName_String).Sheets("����. ����.").Cells(row_��������_�����_����, column_��������_����_18).ShowDetail = True

      ThisWorkbook.Sheets("DB_��").Activate

      ' ���������� ������� �� ����� "����. ����. ����1"
      Application.StatusBar = "����������� �������� � " + �������() + "����. ����. ����1" + �������() + "..."
      column_��������_����1_������ = ColumnByName(ReportName_String, "����1", 1, "������")
      column_��������_����1_��������� = ColumnByName(ReportName_String, "����1", 1, "���������")
      column_��������_����1_���� = ColumnByName(ReportName_String, "����1", 1, "����")
      column_��������_����1_15_�� = ColumnByName(ReportName_String, "����1", 1, "15+ ��")
      column_��������_����1_15_�� = ColumnByName(ReportName_String, "����1", 1, "15+ ��")
      column_��������_����1_15_��� = ColumnByName(ReportName_String, "����1", 1, "15+ ���!")
      
      column_��������_����1_����_�����_�� = ColumnByName(ReportName_String, "����1", 1, "���� ����� ��")
      column_��������_����1_IB_ACT = ColumnByName(ReportName_String, "����1", 1, "IB_ACT")
      
      ' column_��������_����1_ = ColumnByName(ReportName_String, "����1", 1, "")
      
      ' column_��������_����1 = ColumnByName(ReportName_String, "����1", 1, "")
      Application.StatusBar = ""
      
      ' �� ����
      �����_������ = 0
      �����_�����_18_����_���� = 0
      �����_�����_18_����_���� = 0
      �����_IB_����_���� = 0
      �����_IB_����_���� = 0
      
      rowCount = 2
      Do While Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, 1).Value <> ""
        
        ' ���� ��� ��������� ��1, �� ������� � ������� �� ����� "DB_��" ������ �� ����������
        If InStr(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_������).Value, "��������� ��1") <> 0 Then
          
          ' �
          �����_������ = �����_������ + 1
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 1).Value = CStr(�����_������) + "."
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 1).NumberFormat = "@"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 1).HorizontalAlignment = xlCenter

          ' ���������
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 2).Value = �������_�_���(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_���������).Value, 3)
          
          ' ����� 18+ ���� ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).Value = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_����).Value
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).HorizontalAlignment = xlRight
          �����_�����_18_����_���� = �����_�����_18_����_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).Value

          ' ����� 18+ ���� ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).Value = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_15_��).Value + _
                                                                                                  Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_15_��).Value + _
                                                                                                    Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_15_���).Value
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).HorizontalAlignment = xlRight
          �����_�����_18_����_���� = �����_�����_18_����_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).Value
          
          ' ����� 18+ ���. ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 5).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).Value, 3)
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 5).NumberFormat = "0%"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 5).HorizontalAlignment = xlRight

          ' ����� 18+ �������. ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 6).Value = �������_��������_����(dateDB_DB_��, ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 3).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).Value, 5, 0)
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 6).NumberFormat = "0%"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 6).HorizontalAlignment = xlRight
          ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
          Call Full_Color_RangeII("DB_��", row_�����_����_���� + 2 + �����_������, 6, ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 6).Value, 1)


          ' ���� IB ����
          ' 90% �� �������� ���� ������ ���� � ��
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 7).Value = (ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 4).Value / 100) * 90 ' Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_����_�����_��).Value
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 7).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 7).HorizontalAlignment = xlRight
          �����_IB_����_���� = �����_IB_����_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 7).Value

          ' ���� IB ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 8).Value = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, column_��������_����1_IB_ACT).Value
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 8).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 8).HorizontalAlignment = xlRight
          �����_IB_����_���� = �����_IB_����_���� + ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 8).Value

          ' ��� IB ����
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 9).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 7).Value, ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 8).Value, 3)
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 9).NumberFormat = "0%"
          ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������, 9).HorizontalAlignment = xlRight
          
        End If
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "����. ����.: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop

      ' ������� ����� ���������
      ' ----------------------------------------------------------------------------------------------------------------------------------
      ' ������ �������������� ����� 2 (��������� ���������� �������� ������ + 1)
      Call gorizontalLineII(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 2, 13)

      ' ����� ����� 18+ ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 3).Value = �����_�����_18_����_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 3).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 3).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 3)

      ' ����� ����� 18+ ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 4).Value = �����_�����_18_����_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 4).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 4).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 4)

      ' ����� ����� 18+ ���
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 5).Value = �����������(�����_�����_18_����_����, �����_�����_18_����_����, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 5).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 5).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 5)

      ' ����� ����� 18+ �������
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 6).Value = �������_��������_����(dateDB_DB_��, �����_�����_18_����_����, �����_�����_18_����_����, 5, 0)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 6).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 6).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 6)

      ' ����� �� ���� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 7).Value = �����_IB_����_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 7).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 7).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 7)

      ' ����� �� ���� ����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 8).Value = �����_IB_����_����
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 8).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 8).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 8)

      ' ����� �� ���� ���
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 9).Value = �����������(�����_IB_����_����, �����_IB_����_����, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 9).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_�����_����_���� + 2 + �����_������ + 1, 9).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_�����_����_���� + 2 + �����_������ + 1, 9)
 
      ' ================================================================================
      ' 3. �������� ���������� �� ������ � ����������� �� ����� "����������� ����������"
      ' ���������� ������� "������"
      ' ���������� ������� "��"
      ' ���������� ������� "INNSORG"
      ' ���������� ������� "NAMEORG"
      ' ���������� ������� "ZCONTRN" - ��� �������
      ' - ��������� (��)
      ' - ��������� (��)
      ' - ���� ������
      
      
      
             
      ' ================================================================================
 
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ����������� � ������� ��� ��������
      ' Call copy_DB_��_ToSend
    
      ' �������� ������� ������
      ' Call ��������_Lotus_Notes_DB_��
    
      ' ��������� �������� ����� � ���������
      Workbooks(Dir(OutBookName)).Close SaveChanges:=True
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������
    

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("DB_��").Range("A1").Select

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


' �������� ����� ��� �������� � �����
Sub copy_DB_��_ToSend()
Dim TemplatesFile As String

  Application.StatusBar = "�����������..."

  ' ��������� ������ "����� �� ��_N��_YYYY_DD-MM-YYYY.xlsx"
  If Dir(ThisWorkbook.Path + "\Templates\" + "����� �� ��_N��_YYYY_DD-MM-YYYY.xlsx") <> "" Then
    ' ��������� ������ Templates\���������� ����� �� ��������
    TemplatesFileName = "����� �� ��_N��_YYYY_DD-MM-YYYY"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("DB_��").Activate

  ' ��������� ������ �����������
  ThisWorkbook.Sheets("DB_��").Cells(rowByValue(ThisWorkbook.Name, "DB_��", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "DB_��", "������ �����������:", 100, 100) + 2).Value = _
    getFromAddrBook("���2,���3,���4,���5,����,����,���", 2)

  ' ���� ������ � "B5" �� ����� ����� "����� �� ��_3��_2021_29.07.2021.xlsb"
  dateDB_DB_�� = CDate(Mid(ThisWorkbook.Sheets("DB_��").Range("B5").Value, 38, 10))

  ' ��� ������ �����
  FileDBName = "����� �� ��_" + quarterName3(dateDB_DB_��) + " �� " + str��_MM_YYYY(dateDB_DB_��) + ".xlsx"
  
  ' ��������� - ���� ���� ����, �� ������� ���
  Call deleteFile(ThisWorkbook.Path + "\Out\" + FileDBName)
  
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileDBName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  ThisWorkbook.Sheets("DB_��").Range("R3").Value = ThisWorkbook.Path + "\Out\" + FileDBName
            
  ' *** ����������� ������ ***
 
  ' ���������
  ThisWorkbook.Sheets("DB_��").Cells(5, 2).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(5, 2)
 
  ' ����� ������ (1)
  ' 1
  Workbooks(FileDBName).Sheets("����1").Cells(7, 1).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 1).Value
  ' 2
  Workbooks(FileDBName).Sheets("����1").Cells(7, 2).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 2).Value
  ' 3
  Workbooks(FileDBName).Sheets("����1").Cells(7, 3).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 3).Value
  ' 7
  Workbooks(FileDBName).Sheets("����1").Cells(7, 7).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 7).Value
  ' 10
  Workbooks(FileDBName).Sheets("����1").Cells(7, 10).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 10).Value
  ' 14
  Workbooks(FileDBName).Sheets("����1").Cells(7, 14).Value = ThisWorkbook.Sheets("DB_��").Cells(7, 14).Value
  
  ' ����� ������ (2)
  ' 1
  Workbooks(FileDBName).Sheets("����1").Cells(19, 1).Value = ThisWorkbook.Sheets("DB_��").Cells(19, 1).Value
  ' 2
  Workbooks(FileDBName).Sheets("����1").Cells(19, 2).Value = ThisWorkbook.Sheets("DB_��").Cells(19, 2).Value
  ' 3
  Workbooks(FileDBName).Sheets("����1").Cells(19, 3).Value = ThisWorkbook.Sheets("DB_��").Cells(19, 3).Value
  ' 7
  Workbooks(FileDBName).Sheets("����1").Cells(19, 7).Value = ThisWorkbook.Sheets("DB_��").Cells(19, 7).Value
  ' 10
  Workbooks(FileDBName).Sheets("����1").Cells(19, 10).Value = ThisWorkbook.Sheets("DB_��").Cells(19, 10).Value
  

  ' �����
  For i = 9 To 14
    
    For j = 1 To 16
      ThisWorkbook.Sheets("DB_��").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i, j)
      Application.StatusBar = "����������� 1: " + CStr(i) + "-" + CStr(j) + "..."
    Next j
  
  Next i
  
  ' ����
  For i = 21 To 24
    
    For j = 1 To 13
      ThisWorkbook.Sheets("DB_��").Cells(i, j).Copy Destination:=Workbooks(FileDBName).Sheets("����1").Cells(i, j)
      Application.StatusBar = "����������� 2: " + CStr(i) + "-" + CStr(j) + "..."
    Next j
  
  Next i
  
  
  ' ***
                    
  ' �������� �����
  Workbooks(FileDBName).Close SaveChanges:=True

  ' ����������� ���������
  Application.StatusBar = "�����������!"
  Application.StatusBar = ""

End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_DB_��()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������ ..."
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("DB_��").Cells(RowByValue(ThisWorkbook.Name, "DB_��", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "DB_��", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("DB_��")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("DB_��").Cells(RowByValue(ThisWorkbook.Name, "DB_��", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "DB_��", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("DB_��")

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("DB_��").Range("R3").Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("DB_��").Cells(rowByValue(ThisWorkbook.Name, "DB_��", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "DB_��", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� �� ����������� �� 18+ ������� � ��� (���� �� ��������)." + Chr(13)
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
     
    ' ������ �������
    Application.StatusBar = ""
     
  ' End If
  
End Sub

' ��������� Pipe ��
Sub ���������_Pipe_��()

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
    ThisWorkbook.Sheets("DB_��").Activate

    Sheets_Name = "{D24520B3-6725-EA11-B826-02BFAC"

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, Sheets_Name, 21, Date)
    If CheckFormatReportResult = "OK" Then
      
      column_������ = ColumnByValue(ReportName_String, Sheets_Name, "������", 100, 300)
      column_����_������������ = ColumnByValue(ReportName_String, Sheets_Name, "���� ������������", 100, 300)
      column_�����������_������_�_����_�������� = ColumnByValue(ReportName_String, Sheets_Name, "����������� ������ � ���� ��������", 100, 300)
      column_�����_���������_������ = ColumnByValue(ReportName_String, Sheets_Name, "����� ��������� ������", 100, 300)
      '
      column_��������� = ColumnByValue(ThisWorkbook.Name, "DB_��", "���������", 100, 300)
      column_������_Q = ColumnByValue(ThisWorkbook.Name, "DB_��", "������ Q", 100, 300)
      column_�����_18_�� = ColumnByValue(ThisWorkbook.Name, "DB_��", "����� 18+, ��.", 100, 300)
      column_�������_����� = ColumnByValue(ThisWorkbook.Name, "DB_��", "% �����", 100, 300)
      
      ' ��������� ���������� �� ���
      �����_���_�����������_������_�_����_�������� = 0
      �����_���_�����_���������_������ = 0
      
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

        ' ��������� ����������
        �����_�����������_������_�_����_�������� = 0
        �����_�����_���������_������ = 0

        rowCount = 2
        Do While Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_������).Value = "��������� ��1"
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_����_������������).Value, officeNameInReport) <> 0 Then
            
            �����_�����������_������_�_����_�������� = �����_�����������_������_�_����_�������� + Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_�����������_������_�_����_��������).Value
            If column_�����_���������_������ <> 0 Then
              �����_�����_���������_������ = �����_�����_���������_������ + Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_�����_���������_������).Value
            End If
            '
            �����_���_�����������_������_�_����_�������� = �����_���_�����������_������_�_����_�������� + Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_�����������_������_�_����_��������).Value
            
            If column_�����_���������_������ <> 0 Then
              �����_���_�����_���������_������ = �����_���_�����_���������_������ + Workbooks(ReportName_String).Sheets(Sheets_Name).Cells(rowCount, column_�����_���������_������).Value
            End If
            
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
        row_officeNameInReport = rowByValue(ThisWorkbook.Name, "DB_��", getNameOfficeByNumber(i), 100, 100)
        ' ���������
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_���������).Value = �����_�����_���������_������
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_���������).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_���������).HorizontalAlignment = xlRight
        ' ������ � ��������
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_������_Q).Value = �����_�����������_������_�_����_��������
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_������_Q).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_������_Q).HorizontalAlignment = xlRight
        ' ������� �� �����
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_�������_�����).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_�����_18_��).Value, �����_�����������_������_�_����_��������, 3)
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_�������_�����).NumberFormat = "0%"
        ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_�������_�����).HorizontalAlignment = xlRight
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeII("DB_��", row_officeNameInReport, column_�������_�����, ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport, column_�������_�����).Value, 1)

      Next i ' ��������� ����
      
      ' ������� ����� ���������
      ' ����� ���������
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_���������).Value = �����_���_�����_���������_������
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_���������).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_���������).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_officeNameInReport + 1, column_���������)
      
      ' ����� ������ Q
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_������_Q).Value = �����_���_�����������_������_�_����_��������
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_������_Q).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_������_Q).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_officeNameInReport + 1, column_������_Q)
      
      ' ����� % �����
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_�������_�����).Value = �����������(ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_�����_18_��).Value, �����_���_�����������_������_�_����_��������, 3)
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_�������_�����).NumberFormat = "0%"
      ThisWorkbook.Sheets("DB_��").Cells(row_officeNameInReport + 1, column_�������_�����).HorizontalAlignment = xlRight
      Call ����������_�����(ThisWorkbook.Name, "DB_��", row_officeNameInReport + 1, column_�������_�����)
      
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ����������� � ������� ��� ��������
      Call copy_DB_��_ToSend
    
      ' �������� ������� ������
      Call ��������_Lotus_Notes_DB_��
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("DB_��").Range("A1").Select

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


' �������� ����� ����������� ���� ��, ��, ����������
Sub createBook_out_DB_��(In_OutBookName)

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' TB_CONTR
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "TB_CONTR"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).NumberFormat = "@"
    
    ' SALORGCD
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "SALORGCD"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 16
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).NumberFormat = "@"
    
    ' NAMEORG
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "NAMEORG"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 42
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).NumberFormat = "@"
    
    ' INNSORG
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "INNSORG"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).NumberFormat = "@"
    
    ' ZCONTRN
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "ZCONTRN"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 30
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).NumberFormat = "@"
    
    ' CNTR_YM_FROM
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "CNTR_YM_FROM"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).NumberFormat = "@"
    
    ' ��������� (��) / ��������� (��) / ������ ��� ����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "Status"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 22
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).NumberFormat = "@"
    
    ' ���� ������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "���� ������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).NumberFormat = "@"
    
    ' ��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 25
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).NumberFormat = "@"
    
    ' ActiveCell.Offset(0, -4).Columns("A:A").EntireColumn.Select
    ' Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("C:C").Select
    ' ��������
    ' Selection.NumberFormat = "0"
    ' ���������
    ' Selection.NumberFormat = "@"

    ' ��������� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1:I1").Select
    Selection.AutoFilter
    
End Sub

