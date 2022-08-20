Attribute VB_Name = "Module_PL"
' ���������� �� �������������
Sub PL_�_�������_��_��_��������()

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
    ThisWorkbook.Sheets("PL").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "���������� ", 16, Date)
    If CheckFormatReportResult = "OK" Then
      
      
      ' ������� �������
      Call ��������_PL1_PL2_����Pl
      
      ' ������������ �����
      ' ���� �� 5-�� ������
      ' ��������� ������
      For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� " + Chr(34) + "���������" + Chr(34)
          Case 2 ' �� �����������
            officeNameInReport = "�� " + Chr(34) + "����������" + Chr(34)
          Case 3 ' �� ����������������
            officeNameInReport = "�� " + Chr(34) + "���������������" + Chr(34)
          Case 4 ' �� ����������������
            officeNameInReport = "�� " + Chr(34) + "���������������" + Chr(34)
          Case 5 ' �� ������-����
            officeNameInReport = "�� " + Chr(34) + "�����-����" + Chr(34)
        End Select


        ' ����������� ������������ ����� (������ ������)
        SheetsNameVar = "PL � ������� �� �� ��������"

        ' *** ������ ���� ��������� ***
        
         
        ' �������
        Column_��������_����� = ColumnByValue(ReportName_String, SheetsNameVar, "�������� �����", 100, 11)
        Column_��������_�������� = ColumnByValue(ReportName_String, SheetsNameVar, "�������� ��������", 100, 11)
        Column_����_���� = Column_��������_�������� + 4
        
        ' �������:
        For j = 1 To 6
        Select Case j
          Case 1 ' MB RM (253)
            currBusiness = "MB RM (253)"
          Case 2 ' MASS (254)
            currBusiness = "MASS (254)"
          Case 3 ' ������� ������ (27)
            currBusiness = "������� ������ (27)"
          Case 4 ' ������������� ������� (1)
            currBusiness = "������������� ������� (1)"
          Case 5 ' VIP-������� (22)
            currBusiness = "VIP-������� (22)"
          Case 6 ' �� (202)
            currBusiness = "�� (202)"
        End Select
        
        ' ���������� ���������
        ������_�������_���� = False
        ������_currBusiness = False
        
        ' ������ "�������� �����"
        rowCount = rowByValue(ReportName_String, SheetsNameVar, "�������� �����", 1000, 10)
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value)
        
          ' --- ������ ���� ---
          ' ���� ������� � ������ ���� '�� "' ��� '���.���� �����-����', �� ������ ��������� ���� �����
          If (������_�������_���� = True) And ((InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, ("�� " + Chr(34))) <> 0) Or (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, ("���.���� �����-����")) <> 0)) Then
            ������_�������_���� = False
          End If
          
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, officeNameInReport) <> 0 Then
            ������_�������_���� = True
          End If
          ' --- ������ ���� ---
        
          ' --- ������ �������� �������  ---
          If (������_�������_���� = True) And InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, currBusiness) <> 0 Then
            
            ������_currBusiness = True
            
            ' �������� ����������
            ' ������������_���������_����_���� = 0
            
            ' ������� ���� �� �� ���� ��������
            ' ������� = 0
            ' ���������_�������_��_������� = False
            '
            ' ������������_�������_����_���� = 0
            ' ������������_�������_��_�����_1 = 0
          
          End If
          ' --- ������ �������� ������� ---
          
          ' --- ��������� �����  � ������� ����� � ������ �� ---
          ' ���� ��� ������ "������������ ��������� (1)" ��� ����� � ��
          If (������_�������_���� = True) And (������_currBusiness = True) And (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, "������������ ��������� (1)") <> 0) Then
            
            ' ����� �� ������� 6 "202X ����"
            ������������_���������_����_���� = Round(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_����_����).Value / 1000, 0)
            
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(officeNameInReport, "����.���", currBusiness, ������������_���������_����_����)
            
          End If
          
          ' ���� ��� ������ ������� (4398)
          If (������_�������_���� = True) And (������_currBusiness = True) And (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, "������� (4398)") <> 0) Then
            
            ' ����� �� ������� 6 "202X ����"
            ������� = Round(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_����_����).Value / 1000, 0)
           
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(officeNameInReport, "�������", currBusiness, �������)
            
          End If
          
          ' ���� ��� ������ ������������ ������� (2105)
          If (������_�������_���� = True) And (������_currBusiness = True) And (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, "������������ ������� (2105)") <> 0) Then
            
            ' ����� �� ������� 6 "202X ����"
            ������������_�������_����_���� = Round(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_����_����).Value / 1000, 0)
            
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(officeNameInReport, "���_��", currBusiness, ������������_�������_����_����)
            
            ' ����� ������ "��.-1_��". ��� ����� �� Column_����_���� ����� ����� ������ �� ������ �������
            ������������_�������_��_�����_1_���������� = False
            column_count = Column_����_���� - 1
            Do While (column_count >= 2) And (������������_�������_��_�����_1_���������� = False)
            
              ' ��������� - ���� � ������ ���� ��������, �� ����� ���
              If Not IsEmpty(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, column_count).Value) Then
                ������������_�������_��_�����_1 = Round(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, column_count).Value / 1000, 0)
                ������������_�������_��_�����_1_���������� = True
              End If
              
              ' ��������� ������� �� 1 (��������� �����)
              column_count = column_count - 1
            Loop
            
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(officeNameInReport, "��.-1_��", currBusiness, ������������_�������_��_�����_1)
          
          End If
          
          ' ���� ��� ������ ������ ������� (1409), �� ��� ���������� ������ �� �������, ����� ���������������� �������
          If (������_�������_���� = True) And (������_currBusiness = True) And (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, "������ ������� (1409)") <> 0) Then
            ' ���� ������ ������� �� ���������, �� ����� ��
            
            ' �������� ��������� ������� ���������������� ��������
            Call ������_����������������_��������(ReportName_String, SheetsNameVar, officeNameInReport, currBusiness)
            
            ' ��������� ������ �������
            ������_currBusiness = False
            
          End If ' ���� ��� ������ ������ ������� (1409)
          
          ' --- ��������� ����� ---
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + " " + currBusiness + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
            
        ' *************************************************************************
        ' *** ������  ��� ���������������� ������� ��������� �� = (����.���.+�������+(����.�������- ������� �� ��������������))*(80%);       ��� 4��2020 ����� ������� ��������� 2/3   �� ����� ����.�������� 3��2020 �� ������� �������� �� �������������� 3��2020. ***
        ' *************************************************************************
         
        ' >> �����, ������ ����!
        ' ��� ������ - ������ ������� ����� ����������� � � ��������� ���������, �.�. ����� ������ ������ ��������� ������, � ��������� 2/3 � 80% �������� ��� ���������? -
        ' ��� ���� �������� �������� ������� �� = (����.���.+�������+����.������� �� ����������� ���������������� ��������)*80%
        ' �� ���� ������� �� ����.�������� (��� �� ���, ��� �� ���)  - � ������ ������� �������� ����������� �� ������ �����������/�������� ���,
        ' �.�. �� ����������� �������  � ������ ���������� ��� ������ ����� ��������;
        ' �� ������ ����� �������������� �������� = 1/3 �� ����������� ��������;
        ' �� ������ ����� �������������� �������� = 2/3 �� ����������� ��������.
        ' ��� ������� � ���, ��� ��������� �  PL   ������  ��  ������ ���  ������������ �� ����������, �  �������������.
        ' >> �������  ��� ���������������� ������� ��������� �� = (����.���.+�������+(����.�������- ������� �� ��������������))*(80%);       ��� 4��2020 ����� ������� ��������� 2/3   �� ����� ����.�������� 3��2020 �� ������� �������� �� �������������� 3��2020.
         
        ' �� I2 ����� ����� ������ � ������� ������ ������ � ���������� ����. �� ���������: �� ������ ����� �������������� �������� = 1/3 �� ����������� ��������; �� ������ ����� �������������� �������� = 2/3 �� ����������� ��������
        �����������_���������_��� = �����������_�����������_���������_���(ThisWorkbook.Sheets("PL").Range("I2").Value) ' ��� ������ 0.67 �� ���������� �� 11 ���.
        
        ������� = getDataInSheetPL(officeNameInReport, currBusiness, "����.���")
        ������� = getDataInSheetPL(officeNameInReport, currBusiness, "�������")
          
        �����������_��� = getDataInSheetPL(officeNameInReport, currBusiness, "���_��")
        �����������_��������� = getDataInSheetPL(officeNameInReport, currBusiness, "��.-1_��")
          
        ������������������_��� = getDataInSheetPL(officeNameInReport, currBusiness, "���_��")
        ������������������_��������� = getDataInSheetPL(officeNameInReport, currBusiness, "��.-1_��")
          
        ���������_�� = ������� + ������� + (�����������_��� + �����������_���������_��� * �����������_���������) - ((������������������_��� + �����������_���������_��� * ������������������_���������))
          
        ���������_�� = ���������_�� * 0.8
          
        ' ���������_�� = (getDataInSheetPL(officeNameInReport, "����.���") + getDataInSheetPL(officeNameInReport, "�������") + (getDataInSheetPL(officeNameInReport, "���_��") - getDataInSheetPL(officeNameInReport, "��.-1_��") / 3 * 2 - (getDataInSheetPL(officeNameInReport, "���_��") - getDataInSheetPL(officeNameInReport, "��.-1_��") / 3 * 2))) * 0.8

        ' ������� � ������� �� ����� PL
        Call setDataInSheetPL(officeNameInReport, "����.��", currBusiness, ���������_��)
       
        Next j ' ��������� ������
      
      Next i ' ��������� ����
      
      ' ������� ����� ���������
      
      ' ������ �������
      Application.StatusBar = "����������� ������..."
      
      ' �������� �������� ����� � ����� ��� ��������
      Call copyPLToSend
      
      Application.StatusBar = "����������..."
      
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
    ThisWorkbook.Sheets("PL").Range("A7").Select

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

  

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����PL()
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
    ����������� = ����������� + "������� �� ������ �������� � ��������� ������" + Chr(13)
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

' ������� � ������� �� ����� PL
Sub setDataInSheetPL(In_officeNameInReport, In_Param, In_currBusiness, In_Value)
  
  If InStr(In_officeNameInReport, "���������") Then
    In_officeNameInReport_����PL = "�� ����������"
  End If
  
  If InStr(In_officeNameInReport, "����������") Then
    In_officeNameInReport_����PL = "�� �����������"
  End If
  
  If InStr(In_officeNameInReport, "���������������") Then
    In_officeNameInReport_����PL = "�� ����������������"
  End If
  
  If InStr(In_officeNameInReport, "���������������") Then
    In_officeNameInReport_����PL = "�� ����������������"
  End If
  
  If InStr(In_officeNameInReport, "�����-����") Then
    In_officeNameInReport_����PL = "�� ������-����"
  End If
  
  ' ������� �� ����� PL
  Column_Param = ColumnByValue(ThisWorkbook.Name, "PL", In_Param, 5, 10)
  
  ' ����� PL1 (������ ��)
  If In_currBusiness = "�� (202)" Then
    Row_officeName = rowByValue(ThisWorkbook.Name, "PL", In_officeNameInReport_����PL, 10, 2)
    ThisWorkbook.Sheets("PL").Cells(Row_officeName, Column_Param).Value = In_Value
  End If
  
  ' ����� PL2 ��� �������
  ���_�����_������� = CStr(getNumberOfficeByName2(In_officeNameInReport_����PL)) + "_" + In_currBusiness
  Row_officeName_currBusiness = rowByValue(ThisWorkbook.Name, "PL", ���_�����_�������, 51, 2)
  ThisWorkbook.Sheets("PL").Cells(Row_officeName_currBusiness, Column_Param).Value = In_Value
    
  
End Sub

' �������� �� ������� ������ �� ����� PL
Function getDataInSheetPL(In_officeNameInReport, In_currBusiness, In_Param)
  
  If InStr(In_officeNameInReport, "���������") Then
    In_officeNameInReport_����PL = "�� ����������"
  End If
  
  If InStr(In_officeNameInReport, "����������") Then
    In_officeNameInReport_����PL = "�� �����������"
  End If
  
  If InStr(In_officeNameInReport, "���������������") Then
    In_officeNameInReport_����PL = "�� ����������������"
  End If
  
  If InStr(In_officeNameInReport, "���������������") Then
    In_officeNameInReport_����PL = "�� ����������������"
  End If
  
  If InStr(In_officeNameInReport, "�����-����") Then
    In_officeNameInReport_����PL = "�� ������-����"
  End If
  
  Column_Param = ColumnByValue(ThisWorkbook.Name, "PL", In_Param, 5, 10)
  ' Row_officeName = rowByValue(ThisWorkbook.Name, "PL", In_officeNameInReport_����PL, 10, 2)
  
  ' ����� PL2 ��� �������
  ���_�����_������� = CStr(getNumberOfficeByName2(In_officeNameInReport_����PL)) + "_" + In_currBusiness
  Row_officeName_currBusiness = rowByValue(ThisWorkbook.Name, "PL", ���_�����_�������, 51, 2)

  getDataInSheetPL = ThisWorkbook.Sheets("PL").Cells(Row_officeName_currBusiness, Column_Param).Value
  
End Function

' �� I2 ����� ����� ������ � ������� ������ ������ � ���������� ����. �� ���������: �� ������ ����� �������������� �������� = 1/3 �� ����������� ��������; �� ������ ����� �������������� �������� = 2/3 �� ����������� ��������
Function �����������_�����������_���������_���(In_�����_������_����������) ' ��� ������ 0.67 �� ���������� �� 11 ���.
                    
          Select Case In_�����_������_����������
          Case 1, 4, 7, 10
            �����������_�����������_���������_��� = 0.3333333
          Case 2, 5, 8, 11
            �����������_�����������_���������_��� = 0.6666666
        End Select

End Function

' �������� ��������� ������� ���������������� ��������
Sub ������_����������������_��������(In_ReportName_String, In_SheetsNameVar, In_officeNameInReport, In_currBusiness)
    
        ' *************************************************************************
        ' *** ������ ���� ��������� ����� �� ����� �� ���������������� �������� ***
        ' *************************************************************************
        ' ���������� ���������
        ������_�������_���� = False
        ������_��_202 = False
         
        ' �������
        Column_��������_����� = ColumnByValue2(In_ReportName_String, In_SheetsNameVar, "�������� �����", 100, 100, 2)
        Column_��������_�������� = ColumnByValue2(In_ReportName_String, In_SheetsNameVar, "�������� ��������", 100, 100, 2)
        Column_����_���� = Column_��������_�������� + 4
        
        ' ������ "�������� �����"
        rowCount = rowByValue2(In_ReportName_String, In_SheetsNameVar, "�������� �����", 1000, 100, 2)
        Do While Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value)
        
          ' --- ������ ���� ---
          ' ���� ������� � ������ ���� '�� "' ��� '���.���� �����-����', �� ������ ��������� ���� �����
          If (������_�������_���� = True) And ((InStr(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, ("�� " + Chr(34))) <> 0) Or (InStr(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, ("���.���� �����-����")) <> 0)) Then
            ������_�������_���� = False
          End If
          
          ' ���� ��� ������� ����
          If InStr(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, In_officeNameInReport) <> 0 Then
            ������_�������_���� = True
          End If
          ' --- ������ ���� ---
        
          ' --- ��������� ����� ---
          ' ���� ��� ������ "������������ ��������� (1)" ��� ����� � ��
          ' If (������_�������_���� = True) And (InStr(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, "�� (202)") <> 0) Then
          If (������_�������_���� = True) And (InStr(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_��������_�����).Value, In_currBusiness) <> 0) Then
            
            ' ����� �� ������� "202X ����"
            �������_��_��������������_����_���� = Round(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, Column_����_����).Value / 1000, 0)
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(In_officeNameInReport, "���_��", In_currBusiness, �������_��_��������������_����_����)
            
            ' ����� ������ "��.-1_��". ��� ����� �� Column_����_���� ����� ����� ������ �� ������ �������
            �������_��_��������������_��_�����_1_���������� = False
            column_count = Column_����_���� - 1
            Do While (column_count >= 2) And (�������_��_��������������_��_�����_1_���������� = False)
            
              ' ��������� - ���� � ������ ���� ��������, �� ����� ���
              If Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, column_count).Value) Then
                �������_��_��������������_��_�����_1 = Round(Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(rowCount, column_count).Value / 1000, 0)
                �������_��_��������������_��_�����_1_���������� = True
              End If
              
              ' ��������� ������� �� 1 (��������� �����)
              column_count = column_count - 1
            Loop
            ' ������� � ������� �� ����� PL
            Call setDataInSheetPL(In_officeNameInReport, "��.-1_��", In_currBusiness, �������_��_��������������_��_�����_1)
                    
          End If
          
          ' --- ��������� ����� ---
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = "������� �� �������������� " + In_officeNameInReport + " " + In_currBusiness + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
    
    
End Sub

' ������� �������
Sub ��������_PL1_PL2_����Pl()
      ' PL 1
      For i = 6 To 10
        For j = 3 To 9
          ThisWorkbook.Sheets("PL").Cells(i, j).Value = 0
        Next j
      Next i
      
      ' PL 2
      For o = 1 To 5
        For i = 18 To 23
          For j = 3 To 9
            ThisWorkbook.Sheets("PL").Cells(i + ((o - 1) * 7), j).Value = 0
          Next j
        Next i
      Next o
      
End Sub

' ������ ����� ����� (����� �� ����������)
Sub SaveToXlsFrom_����Pl()

  ' �������� ����2
  ThisWorkbook.Sheets("PL").Copy

  ' Workbooks("�����1").Sheets("����1").Paste

End Sub

' �������� �������� ����� � ����� ��� ��������
Sub copyPLToSend()
  Dim TemplatesFile As String

  Application.StatusBar = "�����������..."

  ' ���� 2 ��������: "���������� ����� �� ��������.xlsx" � "���������� �����.xlsx"
  If Dir(ThisWorkbook.Path + "\Templates\" + "PL-����.xlsx") <> "" Then
    ' ��������� ������ Templates\���������� ����� �� ��������
    TemplatesFileName = "PL-����"
  End If
              
  ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
  Workbooks.Open (ThisWorkbook.Path + "\Templates\" + TemplatesFileName + ".xlsx")
           
  ' ��������� �� PL
  ThisWorkbook.Sheets("PL").Activate

  ' ��������� ������ �����������
  ThisWorkbook.Sheets("PL").Cells(rowByValue(ThisWorkbook.Name, "PL", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "PL", "������ �����������:", 100, 100) + 2).Value = _
    getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)

  ' ��� ������ �����
  FilePLName = "PL ����� " + CStr(ThisWorkbook.Sheets("PL").Range("I2").Value) + ".xlsx"
  Workbooks(TemplatesFileName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FilePLName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
  ThisWorkbook.Sheets("PL").Range("Q3").Value = ThisWorkbook.Path + "\Out\" + FilePLName
            
  ' *** ����������� ������ ***
 
  ' ���������
  i = 2
    For j = 1 To 9
      ThisWorkbook.Sheets("PL").Cells(i, j).Copy Destination:=Workbooks(FilePLName).Sheets("����1").Cells(i, j)
    Next j
  
  ' ����� PL1
  For i = 6 To 11
    For j = 1 To 9
      ThisWorkbook.Sheets("PL").Cells(i, j).Copy Destination:=Workbooks(FilePLName).Sheets("����1").Cells(i, j)
    Next j
  Next i

  ' ����� PL2
  For i = 17 To 52
    For j = 1 To 9
      ThisWorkbook.Sheets("PL").Cells(i, j).Copy Destination:=Workbooks(FilePLName).Sheets("����1").Cells(i, j)
    Next j
  Next i
  
  ' ***
                    
  ' �������� �����
  Workbooks(FilePLName).Close SaveChanges:=True

  ' ����������� ���������
  Application.StatusBar = "�����������!"
  Application.StatusBar = ""


End Sub


' ���������� �� ������������� (�� �������) "PL ������� � ������� �� ������ X �� 20��" - ���� ������������� � �������������: "����������� ����.���. �� �������  � �������� � ������� ��, �������� � ���������, � ����� ����.��� �� ��"
Sub PL_�������_�_�������_��()
  
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
    ThisWorkbook.Sheets("PL").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "���������� ", 16, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
      
      ' ������� �������
      Call ��������_PL3_����Pl
      
      ' ��������� ����� �������� ����� PL
      ' ������ "�������� �����"
      SheetsNameVar = "PL ������� ������"
      ����������_��_������ = "���.���� �����-����"
      ' ����������_��_������ = "��������� ��������1" ' �� "���������������" ��������� ��������1
      
      rowCount = rowByValue(ReportName_String, SheetsNameVar, "�� (202)", 1000, 10) + 3
      Do While InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ����������_��_������) = 0 ' "���.���� �����-����"
      
          ' --- ��������� ����� ---
          If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, "������� (4398)") = 0) And _
               (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, "��������1") = 0) And _
                 (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, "(") <> 0) Then
            
            ' ������������ ������, � ������� ���� "("
            ������ = False
            
            ' If False Then
            
            ' ��������� ������������ (������������� �����) (2514)
            ������_������� = "��������� ������������ (������������� �����) (2514)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ������� ������� (������������� �����) (4444)
            ������_������� = "������� ������� (������������� �����) (4444)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ������� �� (������������� �����) (2505)
            ������_������� = "������� �� (������������� �����) (2505)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ���������������� (������������� �����) (2991)
            ������_������� = "���������������� (������������� �����) (2991)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ������ (������������� �����)
            ������_������� = "������������� �����"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "������ (������������� �����)", rowCount)
              ������ = True
            End If
            
            ' ������� ������� (��������� �����) (3855)
            ������_������� = "������� ������� (��������� �����) (3855)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ����������� ������� (��� ��������� 2020) (4445)
            ������_������� = "����������� ������� (��� ��������� 2020) (4445)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' �������� ������� (3856)
            ������_������� = "�������� ������� (3856)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ���������������� ������� ������� (3753)
            ������_������� = "���������������� ������� ������� (3753)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ������� (������������) (61)
            ������_������� = "������� (������������) (61)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ����������� (1418)
            ������_������� = "����������� (1418)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ��������� ����� (1308)
            ������_������� = "��������� ����� (1308)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ���������� ����� (��� ��������� ����� ���������)
            ������_������� = "���������� �����"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "���������� ����� (��� ��������� ����� ���������)", rowCount)
              ������ = True
            End If
            
            ' ��������� ����� (��� ��������� ����� ���������)
            ������_������� = "��������� �����"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "��������� ����� (��� ��������� ����� ���������)", rowCount)
              ������ = True
            End If
            
            ' ��������� �����  (��� ��������� ����� ���������)
            ������_������� = "��������� �����"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "��������� �����  (��� ��������� ����� ���������)", rowCount)
              ������ = True
            End If
            
            ' ��������� ����� (��� ��������� ����� ���������)
            ������_������� = "��������� �����"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "��������� ����� (��� ��������� ����� ���������)", rowCount)
              ������ = True
            End If
            
            ' ����������� (3080)
            ������_������� = "����������� (3080)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' Pre_approved (2222)
            ������_������� = "Pre_approved (2222)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' ������� �������� (2476)
            ������_������� = "������� �������� (2476)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' �������� ����� (3486)
            ������_������� = "�������� ����� (3486)"
            If (InStr(Workbooks(ReportName_String).Sheets(SheetsNameVar).Cells(rowCount, 1).Value, ������_�������) <> 0) And (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, ������_�������, rowCount)
              ������ = True
            End If
            
            ' End If
            
            ' ������ (��� ���������)
            ������_������� = ""
            If (������ = False) Then
              ' ������� �� ���� "PL" � ����� PL3
              Call SetDataIn_PL3_����Pl(ReportName_String, SheetsNameVar, "������ (��� ���������)", rowCount)
              ������ = True
            End If
            
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
      Loop
      
      ' ������� ����������
      ThisWorkbook.Sheets("PL").Range("B83").Value = "���������� �� ������ �" + CStr(rowCount)
      
      Application.StatusBar = "����������..."
      
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
    ThisWorkbook.Sheets("PL").Range("A55").Select

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


' ������� �������
Sub ��������_PL3_����Pl()
      
      ' PL 3
        For i = 58 To 80
        
          If ThisWorkbook.Sheets("PL").Cells(i, 2).Value <> "" Then
            
            ' ��������
            ThisWorkbook.Sheets("PL").Cells(i, 6).Value = 0
            ' ������ ������
            ThisWorkbook.Sheets("PL").Cells(i, 6).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("PL").Cells(i, 6).Font.Bold = True
                
            ' ��������������
            ThisWorkbook.Sheets("PL").Cells(i, 8).Value = 0
            ' ������ ������
            ThisWorkbook.Sheets("PL").Cells(i, 8).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("PL").Cells(i, 8).Font.Bold = True

          End If
          
        Next i
      
End Sub

' ������� �� ���� "PL" � ����� PL3
Sub SetDataIn_PL3_����Pl(In_ReportName_String, In_SheetsNameVar, In_Name_PL3, In_rowCount_report_PL)
  
  ' In_rowCount_report_PL - ��� ����� ������ �� ����� ������ �� �������������
  ' In_Name_PL3 - ������������ ������ ������� �� ����� PL � DB_Result
  
  ' ������ �����
  row_begin_����PL = 58
  ' ����� �����
  row_end_����PL = 82
  
  ������_������� = False
  rowCount = row_begin_����PL
  Do While (rowCount <= row_end_����PL) And (������_������� = False) '
      
          
      
          ' --- ��������� ����� ---
          If (InStr(ThisWorkbook.Sheets("PL").Cells(rowCount, 2).Value, In_Name_PL3) <> 0) Then
            
            ' t = Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(In_rowCount_report_PL, 6).Value
            
            ' ���� ������ �� ������ "-" � ������� 6 "2020 ����" - �������� �������
            If Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(In_rowCount_report_PL, 6).Value < 0 Then
              ThisWorkbook.Sheets("PL").Cells(rowCount, 6).Value = ThisWorkbook.Sheets("PL").Cells(rowCount, 6).Value + (Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(In_rowCount_report_PL, 6).Value / 1000)
            End If
            
            ' ���� ������ �� ������ "+" - ��������������
            If Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(In_rowCount_report_PL, 6).Value > 0 Then
              ThisWorkbook.Sheets("PL").Cells(rowCount, 8).Value = ThisWorkbook.Sheets("PL").Cells(rowCount, 8).Value + (Workbooks(In_ReportName_String).Sheets(In_SheetsNameVar).Cells(In_rowCount_report_PL, 6).Value / 1000)
            End If
            
            ������_������� = True
          End If
        
    ' ��������� ������
    rowCount = rowCount + 1
    ' Application.StatusBar = CStr(rowCount) + "..."
    ' DoEventsInterval (rowCount)
  Loop

End Sub
