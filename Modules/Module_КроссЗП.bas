Attribute VB_Name = "Module_�������"
' *** ���� ������� ***

' *** ���������� ���������� ***
' Public numStr_����8 As Integer
' ***                       ***

' ��������� ������ http://isrb.psbnk.msk.ru/inf/6601/6622/otchet_zp_org/
Sub ������_��_�����������_��_��_���������()

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
    ThisWorkbook.Sheets("�������").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "������� �� ��", 17, Date)
    If CheckFormatReportResult = "OK" Then
      
      ' ������� ������
      Call clear�ontents2(ThisWorkbook.Name, "�������", "C6", "N11")
      
      ' ���� ������ c "������ ��������" "B2"
      dateReport = CDate(Workbooks(ReportName_String).Sheets("������ ��������").Range("B2").Value)
      
      ' ���� ������ - ����:
      ThisWorkbook.Sheets("�������").Cells(rowByValue(ThisWorkbook.Name, "�������", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "�������", "����:", 100, 100) + 1).Value = "������������� ��������� � ��-����������� �� " + str��_MM_YYYY(dateReport)
      
      ' ������ ��������� �������
      startRow = rowByValue(ReportName_String, "������� �� ��", "����� �� �����������", 100, 100) + 1
      
      ' Workbooks(ReportName_String).Sheets("������� �� ��").Activate
      ' Workbooks(ReportName_String).Sheets("������� �� ��").PivotTables("������� �������8").PivotFields("������").PivotItems("��������� ��1").ShowDetail = True
      �������_������_������ = False
      ����������_�������_��_����1 = False
      
      ' ������� �������� ������� ��� ��������
      OutBookName = ThisWorkbook.Path + "\Out\�������_" + str��_MM_YYYY(dateReport) + ".xlsx"
      
      ' ��������� - ���� ���� ����, �� ������� ���
      Call deleteFile(OutBookName)

      ' ��������2
      ThisWorkbook.Sheets("�������").Range("U3").Value = OutBookName
      ' ������� ����
      Call createBook_out_�������(OutBookName)

      ' ��������� �� ���� DB
      ThisWorkbook.Sheets("�������").Activate

      
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

        ' ����� ������ ����� �� "�������"
        RowOfficeInSheet = rowByValue(ThisWorkbook.Name, "�������", "�� �" + officeNameInReport + "�", 100, 100)
        rowCount = startRow
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 1).Value)
        
          ' �������� ������ ������
          If (InStr(Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 1).Value, "��������� ��1") <> 0) And (�������_������_������ = False) Then
            
            ' ������ ������
            ' ��������� ������ ������
            ' Workbooks(ReportName_String).Sheets("������� �� ��").PivotTables("������� �������8").PivotFields("������").PivotItems("��������� ��1").ShowDetail = True
            ' ��������� ������ ����������� c ����1
            Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 2).ShowDetail = True
            
            ' ����� ������
            ' Range("B65").Select
            ' Selection.ShowDetail = True
            
            ' ������� �� ��������
            ThisWorkbook.Sheets("�������").Activate
            
            ' ����������
            �������_������_������ = True
          
          End If
          
          ' ���� ��� ������� ����
          If (InStr(Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 1).Value, officeNameInReport) <> 0) And (InStr(Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 1).Value, "��1") = 0) Then
            
            ' ���-�� ���
            ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).Value = Workbooks(ReportName_String).Sheets("������� �� ��").Cells(rowCount, 2).Value
            ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).HorizontalAlignment = xlRight
                
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ��������� ������ �� ����� �� �� ������������ �� ����2
        If ����������_�������_��_����2 = False Then
          Application.StatusBar = "����������� ��������..."
          column_������ = ColumnByValue(ReportName_String, "����2", "������", 1000, 1000)
          column_���� = ColumnByValue(ReportName_String, "����2", "����", 1000, 1000)
          column_��� = ColumnByValue(ReportName_String, "����2", "���", 1000, 1000)
          column_����������� = ColumnByValue(ReportName_String, "����2", "�����������", 1000, 1000)
          column_SALORGCD = ColumnByValue(ReportName_String, "����2", "SALORGCD", 1000, 1000)
          column_���_��_��������_�_��������_����������_�_���_6_���������_��� = ColumnByValue(ReportName_String, "����2", "���-�� �������� � ��������  ���������� � ��� 6 ��������� ���.", 1000, 1000)
          column_����_�� = ColumnByValue(ReportName_String, "����2", "���� ��", 1000, 1000)
          column_����_��������_�� = ColumnByValue(ReportName_String, "����2", "���� �������� ��", 1000, 1000)
          column_����_�� = ColumnByValue(ReportName_String, "����2", "���� ��", 1000, 1000)
          column_����_�� = ColumnByValue(ReportName_String, "����2", "���� ��", 1000, 1000)
          column_���_��_�� = ColumnByValue(ReportName_String, "����2", "��� ��-��", 1000, 1000)
          column_���_CRM_��_�������_���_����������� = ColumnByValue(ReportName_String, "����2", "��� CRM-�� (������� ��� �����������)", 1000, 1000)
          column_���_��_�� = ColumnByValue(ReportName_String, "����2", "��� ��-��", 1000, 1000)
          column_�������_AR_��_�������� = ColumnByValue(ReportName_String, "����2", "������� AR �� ��������", 1000, 1000)
          column_��������� = ColumnByValue(ReportName_String, "����2", "���������", 1000, 1000)
          column_�������_������ = ColumnByValue(ReportName_String, "����2", "������� ������", 1000, 1000)
          Application.StatusBar = "������� ����������!"
          ����������_�������_��_����2 = True
        End If
        
        ' ��������� ����������
        �����_��_������� = 0
        �����_����_�� = 0
        �����_�����_��������_�_������������_�_����_�� = 0
        �����_�������_�� = 0
        �����_��������_PA_�� = 0
        �����_��������_CRM_�� = 0
        �����_�������_�� = 0
        �����_��������_PA_�� = 0
        �����_�� = 0
        
        rowCount = 2
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, 1).Value)
                  
          ' ���� ��� �� �������� �����
          If (InStr(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����).Value, officeNameInReport) <> 0) Then
            
            ' ��_�������
            �����_��_������� = �����_��_������� + 1
            ' ���� ��
            �����_����_�� = �����_����_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value
            ' ����� �������� � ������������ � ���� ��
            �����_�����_��������_�_������������_�_����_�� = �����_�����_��������_�_������������_�_����_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��������_�_��������_����������_�_���_6_���������_���).Value
            ' ����� �������� � �������� ��
            �����_�������_�� = �����_�������_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��������_��).Value
            ' �������� PA ��
            �����_��������_PA_�� = �����_��������_PA_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��).Value
            ' �������� CRM-��
            �����_��������_CRM_�� = �����_��������_CRM_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_CRM_��_�������_���_�����������).Value
            ' ������� ��
            �����_�������_�� = �����_�������_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value
            ' �������� PA ��
            �����_��������_PA_�� = �����_��������_PA_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��).Value
            ' ��
            �����_�� = �����_�� + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value
            ' �����_... = �����_... + Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, ...).Value
            
            ' ��������� � �������
            Call InsertRecordInBook(Dir(OutBookName), "����1", "SalOrgCD", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_SALORGCD).Value, _
                                              "����", officeNameInReport, _
                                                "�����������_���", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���).Value, _
                                                  "�����������_������������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_�����������).Value, _
                                                    "SalOrgCD", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_SALORGCD).Value, _
                                                      "���������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���������).Value, _
                                                        "����_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value, _
                                                          "�������_�_������������_�_���_���������_6_���_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��������_�_��������_����������_�_���_6_���������_���).Value, _
                                                            "��������_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��������_��).Value, _
                                                              "C������_������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_�������_������).Value, _
                                                                "��������_��_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��).Value, _
                                                                  "��������_CRM_��_�������_�����������_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_CRM_��_�������_���_�����������).Value, _
                                                                    "�������_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value, _
                                                                      "��������_��_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_���_��_��).Value, _
                                                                        "C������_AR_��_��������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_�������_AR_��_��������).Value, _
                                                                          "�������_��_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����_��).Value, _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "", _
                                                                                    "", "")

            
          End If ' ���� ��� �� �������� �����
          
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + " �� �������: " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
      
        ' ������� ����� ���������:
        ' �� �������
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).Value = �����_��_�������
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).HorizontalAlignment = xlRight
        ' ���� ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).Value = �����_����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).HorizontalAlignment = xlRight
        ' ����� �������� � ������������ � ���� ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).Value = �����_�����_��������_�_������������_�_����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).HorizontalAlignment = xlRight
        ' ����� �������� � �������� ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).Value = �����_�������_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).HorizontalAlignment = xlRight
        ' ������������� �� � ����
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).Value = �����_�������_�� / �����_����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).HorizontalAlignment = xlRight
        ' �������� PA ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).Value = �����_��������_PA_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).HorizontalAlignment = xlRight
        ' �������� CRM-��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).Value = �����_��������_CRM_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).HorizontalAlignment = xlRight
        ' ������� ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).Value = �����_�������_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).HorizontalAlignment = xlRight
        ' ������������� �� � ����
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).Value = �����_�������_�� / �����_����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).HorizontalAlignment = xlRight
        ' �������� PA ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).Value = �����_��������_PA_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).HorizontalAlignment = xlRight
        ' ��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).Value = �����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).HorizontalAlignment = xlRight
        ' ������������� �� � ����
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).Value = �����_�� / �����_����_��
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).NumberFormat = "0.0%"
        ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).HorizontalAlignment = xlRight
        
      
      Next i ' ��������� ����
      
      ' ����� �� ������
      RowOfficeInSheet = RowOfficeInSheet + 1
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).Value = "����� �� ���:"
      ' �� �������, ��.
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 3).HorizontalAlignment = xlRight
      ' ���� ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 4).HorizontalAlignment = xlRight
      ' ����� �������� � ������������ � ���� ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 5).HorizontalAlignment = xlRight
      ' ����� �������� � �������� ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 6).HorizontalAlignment = xlRight
      ' ������������� �� � ����
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 7).HorizontalAlignment = xlRight
      ' �������� PA ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 8).HorizontalAlignment = xlRight
      ' �������� CRM-��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 9).HorizontalAlignment = xlRight
      ' ������� ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 10).HorizontalAlignment = xlRight
      ' ������������� �� � ����
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 11).HorizontalAlignment = xlRight
      ' �������� PA ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 12).HorizontalAlignment = xlRight
      ' ��
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).FormulaR1C1 = "=R[-5]C+R[-4]C+R[-3]C+R[-2]C+R[-1]C"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).NumberFormat = "#,##0"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 13).HorizontalAlignment = xlRight
      ' ������������� �� � ����
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).FormulaR1C1 = "=AVERAGE(R[-5]C:R[-1]C)"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).NumberFormat = "0.0%"
      ThisWorkbook.Sheets("�������").Cells(RowOfficeInSheet, 14).HorizontalAlignment = xlRight
     
     
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ��������� �������� ����� � ��������� �������
      Workbooks(Dir(OutBookName)).Close SaveChanges:=True
    
      ' ������ �������
      Application.StatusBar = "�������� ���������..."
    
      ' �������� ���������
      Call ��������_Lotus_Notes_�������
    
      ' ������ �������
      Application.StatusBar = ""
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("�������").Range("A1").Select

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


' �������� ����� � ����� ��
Sub createBook_out_�������(In_OutBookName)

    Application.StatusBar = "�������� " + In_OutBookName + "..."

    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    ' ����
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).Value = "����"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("A:A").HorizontalAlignment = xlCenter
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).HorizontalAlignment = xlCenter
    
    ' �����������_���
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 2).Value = "�����������_���"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").EntireColumn.ColumnWidth = 19
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").NumberFormat = "0"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("B:B").HorizontalAlignment = xlLeft
    
    ' �����������_������������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).Value = "�����������_������������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("C:C").EntireColumn.ColumnWidth = 40
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 3).HorizontalAlignment = xlCenter
    
    ' SalOrgCD
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).Value = "SalOrgCD"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("D:D").EntireColumn.ColumnWidth = 11
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 4).HorizontalAlignment = xlLeft
 
    ' ���������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).Value = "���������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("E:E").EntireColumn.ColumnWidth = 12
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 5).HorizontalAlignment = xlLeft
    
    ' ����_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).Value = "����_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("F:F").EntireColumn.ColumnWidth = 14
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 6).HorizontalAlignment = xlLeft
    
    ' �������_�_������������_�_���_���������_6_���_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).Value = "�������_�_������������_�_���_���������_6_���_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("G:G").EntireColumn.ColumnWidth = 20
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 7).HorizontalAlignment = xlLeft
    
    ' ��������_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).Value = "��������_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("H:H").EntireColumn.ColumnWidth = 19
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 8).HorizontalAlignment = xlLeft
    
    ' C������_������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).Value = "C������_������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("I:I").NumberFormat = "0.0%"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 9).HorizontalAlignment = xlLeft
    
    ' ��������_��_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).Value = "��������_��_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("J:J").EntireColumn.ColumnWidth = 21
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 10).HorizontalAlignment = xlLeft

    ' ��������_CRM_��_�������_�����������_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).Value = "��������_CRM_��_�������_�����������_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("K:K").EntireColumn.ColumnWidth = 21
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 11).HorizontalAlignment = xlLeft

    ' �������_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).Value = "�������_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("L:L").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 12).HorizontalAlignment = xlLeft
    
    ' ��������_��_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).Value = "��������_��_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("M:M").EntireColumn.ColumnWidth = 22
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 13).HorizontalAlignment = xlLeft

    ' C������_AR_��_��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 14).Value = "C������_AR_��_��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("N:N").EntireColumn.ColumnWidth = 27
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("N:N").NumberFormat = "0.0%"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 14).HorizontalAlignment = xlCenter

    ' �������_��_��
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 15).Value = "�������_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns("O:O").EntireColumn.ColumnWidth = 17
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 15).HorizontalAlignment = xlLeft

    ' �������� ����������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, 1).AutoFilter

    Application.StatusBar = In_OutBookName + " ������!"

End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_�������()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = ThisWorkbook.Sheets("�������").Cells(rowByValue(ThisWorkbook.Name, "�������", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "�������", "����:", 100, 100) + 1).Value

    ' hashTag - ������:
    hashTag = ThisWorkbook.Sheets("�������").Cells(rowByValue(ThisWorkbook.Name, "�������", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "�������", "������:", 100, 100) + 1).Value

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("�������").Cells(rowByValue(ThisWorkbook.Name, "�������", "��������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "�������", "��������:", 100, 100) + 1).Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����,����,���", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + Replace(����������, "-", ".") + " �." + Chr(13)
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
  
    ' ����������
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
  ' End If
  
End Sub

