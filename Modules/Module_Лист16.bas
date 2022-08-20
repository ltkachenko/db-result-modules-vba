Attribute VB_Name = "Module_����16"
' ��������� � CRM - ��������� ������ "�������� �� ��������"
Sub ���������_��������_��_��������()
  
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
  
    ' � "S3" ������ ������������ ������:
    ThisWorkbook.Sheets("����16").Range("S3").Value = FileName
  
    ' ���������� ������ ���������
    finishProcess = False

    ' ������� ��� ���� ������ �� ����� �����
    ReportName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����16").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
            
      ' ���� � �������
      ThisWorkbook.Sheets("����16").Range("Q3").Value = FileName
      
      ' ��������� ������ �����������
      ThisWorkbook.Sheets("����16").Cells(rowByValue(ThisWorkbook.Name, "����16", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������ �����������:", 100, 100) + 2).Value = _
         getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)

      ' ����
      ThisWorkbook.Sheets("����16").Range("P2").Value = "CRM Dynamics 365 - �������� �� �������� " + CStr(Date)
                  
      ' ������� �������
      Call clear�ontents2(ThisWorkbook.Name, "����16", "C7", "H11")
            
      ' �������� ��� ����� � ����� "�������� �� ��������"
      Sheet_Name_In_Report = Workbooks(ReportName_String).Sheets(1).Name

      ' ������� � ������
      Column_������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "���. ����", 100, 100)
      Column_�������_�������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "������� ��������", 100, 100)
      Column_�������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "��������", 100, 100)
      Column_�������_���������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "������� ����������", 100, 100)
      Column_������_�����_������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "������ ����� �������", 100, 100)
      Column_������_�����_������ = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "������ ����� ������", 100, 100)
      Column_��������_��������_���_����������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "�������� ��������, ��� �����������", 100, 100)
      
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

        rowCount = 2
        ThisOffice = False
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������_�������� + 2).Value)
        
          ' ���� ��� ������� ���� - ������� ������
          If InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, officeNameInReport) <> 0 Then
            
            ThisOffice = True
                
          End If
        
          ' ���� ��� ������� ���� ThisOffice = True � ������ � � � ������ - ����� �������� ��� ����� ����� �� ������
          If (ThisOffice = True) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value)) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_��������).Value)) Then
            
            ' ������� ������:
            ' � ������� - ������� ����������. ������ � ������� ����, ���� �� ����!
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_�������_����������, _
                                    6 + i, _
                                      3, _
                                        1)
                                      
            
            ' � ������ - ������ ����� �������
            ' ThisWorkbook.Sheets("����16").Cells(6 + i, 4).Value = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, 8).Value
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_������_�����_�������, _
                                    6 + i, _
                                      4, _
                                        0)
            
            
            ' � ������ - ������ ����� ������
            ' ThisWorkbook.Sheets("����16").Cells(6 + i, 5).Value = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, 9).Value
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_������_�����_������, _
                                    6 + i, _
                                      5, _
                                        0)

            
            ' � ������ - �������� ��������, ��� �����������. ������ � ������� ����, ���� �� ����!
            ' ThisWorkbook.Sheets("����16").Cells(6 + i, 6).Value = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, 11).Value
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_��������_��������_���_�����������, _
                                    6 + i, _
                                      6, _
                                        1)

            ' ����� (������� �������� + 2)
            ' ThisWorkbook.Sheets("����16").Cells(6 + i, 7).Value = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(Column_�������1).Value
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_�������_�������� + 2, _
                                    6 + i, _
                                      7, _
                                       0)
            
            
            ' ������� ��������
            ' ThisWorkbook.Sheets("����16").Cells(6 + i, 8).Value = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, 19).Value
            Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
                                rowCount, _
                                  Column_�������_��������, _
                                    6 + i, _
                                      8, _
                                        0)

            
            ' ���������� ������
            ThisOffice = False
                
          End If
          
          
        
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
      Call gorizontalLineII(ThisWorkbook.Name, "����16", 12, 2, 9)
      ' ----------------------------------------------------------------------------------------------------------------------------------
      
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
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����16").Range("A1").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� CRM", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����16()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����16").Cells(RowByValue(ThisWorkbook.Name, "����16", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����16")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����16").Cells(RowByValue(ThisWorkbook.Name, "����16", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����16")

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����16").Cells(3, 17).Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����16").Cells(rowByValue(ThisWorkbook.Name, "����16", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ���������� � ������ �������� � ������������� ��������� � ����������� ����������!" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ��������� ������������� ��������: ���� �������� - 40%, ���� �������- 70%, ���� ����� - 30% , ���� ������������ - 20%." + Chr(13)
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


            
' ������� ������
Sub Write_����16(In_ReportName_String, In_Sheet_Name_In_Report, In_rowCount, In_columnCount, In_rowCount_����16, In_columnCount_����16, In_Color) ' 6 + i, 3)
           
            If IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheet_Name_In_Report).Cells(In_rowCount, In_columnCount).Value) = False Then
              
              ' � ������� - ������� ����������
              ThisWorkbook.Sheets("����16").Cells(In_rowCount_����16, In_columnCount_����16).Value = Workbooks(In_ReportName_String).Sheets(In_Sheet_Name_In_Report).Cells(In_rowCount, In_columnCount).Value
              
              ' ���� ���������� In_Color = 1, �� ������ � ������ ���� ������ �� �������!
              If In_Color = 1 Then
                ThisWorkbook.Sheets("����16").Cells(In_rowCount_����16, In_columnCount_����16).Interior.Color = vbYellow
              End If
              
            Else
              
              ' ���� ������ ���� ������, �� ���������� 0 � ���
              ThisWorkbook.Sheets("����16").Cells(In_rowCount_����16, In_columnCount_����16).Value = 0
              
            End If
            
            ' ��������
            ThisWorkbook.Sheets("����16").Cells(In_rowCount_����16, In_columnCount_����16).HorizontalAlignment = xlCenter

End Sub


' ������� � �������� �� ������ �� ��������, � ����� ������� "/" ��� �������� � ���������
Sub goToURL_����16()
  
  ' SheetsVar = ThisWorkbook.ActiveSheet.Name
  ' rowVar = rowByValue(ThisWorkbook.Name, SheetsVar, "������:", 100, 100)
  ' columnVar = ColumnByValue(ThisWorkbook.Name, SheetsVar, "������:", 100, 100) + 1
  
  ' ThisWorkbook.FollowHyperlink ("http://isrb.psbnk.msk.ru/inf/6601/6622/ejednevnii_otchet_po_prodajam/")
  ThisWorkbook.FollowHyperlink (ThisWorkbook.Sheets("����16").Range("T32").Value)
  
End Sub


' ���������� �� ���������� (������)
Sub ���������_����������_��_����������()
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
Dim ����_������ As Date
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� ������..."
  
    ' � "S3" ������ ������������ ������:
    ThisWorkbook.Sheets("����16").Range("S17").Value = FileName
  
    ' ���������� ������ ���������
    finishProcess = False

    ' ������� ��� ���� ������ �� ����� �����
    ReportName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����16").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
            
      ' ���� � �������
      ThisWorkbook.Sheets("����16").Range("Q17").Value = FileName
      
      ' ��������� ������ �����������
      ThisWorkbook.Sheets("����16").Cells(rowByValue(ThisWorkbook.Name, "����16", "������ �����������2:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������ �����������2:", 100, 100) + 2).Value = _
         getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)

      ' ����
      ThisWorkbook.Sheets("����16").Range("P16").Value = "CRM Dynamics 365 - ���������� �� ����������� " + CStr(Date)
                  
      ' ������� �������
      Call clear�ontents2(ThisWorkbook.Name, "����16", "D20", "D24")
            
      ' �������� ��� ����� � ����� "�������� �� ��������"
      Sheet_Name_In_Report = Workbooks(ReportName_String).Sheets(1).Name

      ' ������� � ������
      Column_������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "���. ����", 100, 100)
      Column_�������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "��������", 100, 100)
      Column_���������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "����������", 100, 100)
      Column_���������_�������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "��������� ��������", 100, 100)
      Column_������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "�������", 100, 100)
      Column_����������_���������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "���������� ����������", 100, 100)
      Column_������� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "�������", 100, 100)
      Column_���� = ColumnByValue(ReportName_String, Sheet_Name_In_Report, "����", 100, 100)
      
      ' ������ �� "����16"
      row_�����_16_2 = rowByValue(ThisWorkbook.Name, "����16", "����� 16.2", 100, 100)
      
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

        ' ������ 0
        ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).Value = 0
        ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).HorizontalAlignment = xlCenter

        rowCount = 2
        ThisOffice = False
        ' Do While rowCount < 300 ' "�����:" � 6-�� �������
        Do While InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, "�����:") = 0
        
          ' �� Column_���� ����� ����
          If Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_����).Value <> "" Then
            ����_������ = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_����).Value
          End If
        
          ' ���� ��� ������� ���� - ������� ������
          If (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, officeNameInReport) <> 0) And (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, "��") = 0) Then
            
            ' t0 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value
            
            �����_�������_��_����� = 0
            
            ThisOffice = True
                
          End If
        
          ' ���� ����� ������ � ������ B, �, D, E, F, �� ����������. ����� ��� �� ������ - ���������� �������-����, �������2-����2 � �.�.
          ' If (ThisOffice = True) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value) = False) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 1).Value) = False) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Value) = False) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Value) = False) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Value) = False) And (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, officeNameInReport) = 0) And (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, "��") = 0) Then
          If (ThisOffice = True) And _
               (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 1).Interior.Color = 15128749) And _
                 (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Interior.Color = 15128749) And _
                   (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Interior.Color = 15128749) And _
                     (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Interior.Color = 16777215) Then
            
            t0 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value
            
            ThisOffice = False
                
            ' ������� ����� �����������
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 3).Value = �����_�����������_�_�����_����7(i)
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 3).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 3).HorizontalAlignment = xlCenter
                
            ' ������� �����
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).Value = �����_�������_��_�����
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).HorizontalAlignment = xlCenter
                
            ' ���������� ��������� ���
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).Value = (ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).Value) / (ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 3).Value * 20)
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).NumberFormat = "0%"
            ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).HorizontalAlignment = xlCenter
                
          End If
          
        
          ' ���� ��� ������� ���� ThisOffice = True � ������ D, E, F ������ - ����� �������� ��� ����� ����� �� ������
          If (ThisOffice = True) And _
               (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 1).Interior.Color = 15128749) And _
                 (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Interior.Color = 15658671) And _
                   (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Interior.Color = 15658671) And _
                     (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Interior.Color = 16777215) Then
          
          ' If (ThisOffice = True) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Value)) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Value)) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Value)) And (Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Interior.Color = 16777215) Then
          ' If (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, officeNameInReport) <> 0) And (InStr(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_�������).Value, "��") = 0) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Value)) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Value)) And (IsEmpty(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Value)) Then
            
            ' �����_�������_��_�����
            �����_�������_��_����� = �����_�������_��_����� + CheckData(Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_����������_����������).Value)
            
            t1 = rowCount
            
            t2 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 2).Value
            t3 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 3).Value
            t3 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Value
            t4 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Interior.Color
            t5 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(rowCount, Column_������� + 4).Interior.Pattern
        
            ' .Pattern = xlSolid ' .PatternColorIndex = xlAutomatic ' .Color = 65535 ' .TintAndShade = 0 ' .PatternTintAndShade = 0
            
            ' ����� �� ���������� (����� ����� � ������)
            t_3 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(35, 3).Interior.Color
            t_4 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(35, 4).Interior.Color
            t_5 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(35, 5).Interior.Color
            t_6 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(35, 6).Interior.Color
            
            ' ����� �� ����� (����� ����� � ������)
            t__3 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(36, 3).Interior.Color
            t__4 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(36, 4).Interior.Color
            t__5 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(36, 5).Interior.Color
            t__6 = Workbooks(ReportName_String).Sheets(Sheet_Name_In_Report).Cells(36, 6).Interior.Color
            
            t4 = 0
            
        
            ' ������� ������:
            ' � ������� - ������� ����������. ������ � ������� ����, ���� �� ����!
            ' Call Write_����16(ReportName_String, Sheet_Name_In_Report, _
            '                    rowCount, _
            '                      Column_�������_����������, _
            '                        6 + i, _
            '                          3, _
            '                            1)
                                      
            
            ' ���������� ������
            ' ThisOffice = False
                
          End If
          
          
        
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
      Call gorizontalLineII(ThisWorkbook.Name, "����16", 25, 2, 5)
      ' ----------------------------------------------------------------------------------------------------------------------------------
      
      ' ���������� ��������� ���
      ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).Value = (ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 4).Value) / (ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 3).Value * 20)
      ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).NumberFormat = "0%"
      ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 + 2 + i, 5).HorizontalAlignment = xlCenter
      
      ' ����_������
      ����_������ = CDate(Mid(CStr(����_������), 1, 10))
      ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 - 1, 2).Value = "CRM Dynamics 365 ���������� �� ���������� �� " + CStr(����_������) + " �."
      ThisWorkbook.Sheets("����16").Range("P16").Value = "CRM Dynamics 365 - ���������� �� ����������� (������) " + CStr(����_������)
            
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
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����16").Range("A1").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� CRM", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����16_����������_��_�������()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����16").Cells(RowByValue(ThisWorkbook.Name, "����16", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheetII("����16", 2)

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����16").Cells(RowByValue(ThisWorkbook.Name, "����16", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheetII("����16", 2)

    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("����16").Range("Q17").Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����16").Cells(rowByValue(ThisWorkbook.Name, "����16", "������ �����������2:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����16", "������ �����������2:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "���������� ��������� �� ��������� ������� �� " + CStr(����_������_�����_16_2()) + " �." + Chr(13)
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
     
  End If
  
End Sub

' ����
Function ����_������_�����_16_2() As Date

  ' ������ �� "����16"
  row_�����_16_2 = rowByValue(ThisWorkbook.Name, "����16", "����� 16.2", 100, 100)

  ' ����_������ "CRM Dynamics 365 ���������� �� ���������� �� " + CStr(����_������) + " �."
  ' t = Mid(ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 - 1, 2).Value, 46, 10)
  ����_������_�����_16_2 = CDate(Mid(ThisWorkbook.Sheets("����16").Cells(row_�����_16_2 - 1, 2).Value, 46, 10))
  
End Function
