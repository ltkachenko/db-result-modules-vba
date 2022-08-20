Attribute VB_Name = "Module_����"
' *** ���� 17 (����) ***

' *** ���������� ���������� ***
' Public numStr_����17 As Integer
' ***                       ***

' ���������� ����� ���� �� ��������� ������ ��� �������� �� ������������
Sub ����������_�����_����()
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xls), *.xls", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
      
      ' ������� �������
      Call clear�ontents2(ThisWorkbook.Name, "����", "A7", "I50")
      ���������������� = 6
      ����� = 0

      ' ��� ����� ��� ����������
      ��������������������� = Mid(ReportName_String, 1, InStr(ReportName_String, ".") - 1)

      ' ����
      ThisWorkbook.Sheets("����").Range("P2").Value = "���� �� ������������ " + ���������������������

      ' ������� ������� "����."
      Column_���� = ColumnByValue(ReportName_String, "����1", "����.", 100, 100)
      ' �����
      Column_�������_���_�������� = ColumnByValue(ReportName_String, "����1", "������� ��� ��������", 100, 100)
      If Column_�������_���_�������� = 0 Then
        Column_�������_���_�������� = ColumnByValue(ReportName_String, "����1", "���", 100, 100) ' ���
      End If

      rowCount = 1
      Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, 1).Value)
        
        ' ���� ��� ������� ���������
        ' If InStr(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_����).Value, "�����") <> 0 Then
        If (InStr(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_����).Value, "�����") <> 0) Or ((InStr(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_����).Value, "����") <> 0)) Then
            
          ' ��� ����������
          nameStaff = Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_�������_���_��������).Value
          fullNameStaff = (Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_�������_���_��������).Value)
          ' ��������� �� ����� ����
          ���������������� = ���������������� + 1
          ����� = ����� + 1
          ' ����� ������ �� ����
          ThisWorkbook.Sheets("����").Cells(����������������, 1).Value = CStr(�����)
          ThisWorkbook.Sheets("����").Cells(����������������, 2).Value = �������_�_���(nameStaff, 3)
            
          ' ������ ���������
          Application.StatusBar = �������_�_���(nameStaff, 3) + "..."
            
          ' ��������� ����� ����
          FileNewVar = ThisWorkbook.Path + "\Out\" + ��������������������� + "_" + �������_�_���(Workbooks(ReportName_String).Sheets("����1").Cells(rowCount, Column_�������_���_��������).Value, 3) + ".xls"
          Workbooks(ReportName_String).SaveCopyAs FileName:=FileNewVar
          shortFileNewVar = Dir(FileNewVar)
          ' ��������� ���� ���� (UpdateLinks:=0)
          Workbooks.Open FileNewVar, 0

          ' ������ � ������� ������ ��� �������������
          ' strFileNewVar_Office = strFileNewVar_Office + ThisWorkbook.Path + "\Out\" + FileNewVar + " "
          
          ' ��������� �����
          ' �������� �� ����� � ������ ������ (�� 2-��) � �������
          rowCount2 = 2
          Do While Not IsEmpty(Workbooks(shortFileNewVar).Sheets("����1").Cells(rowCount2, 1).Value)
            
            ' ���� ��� �� ��� �������� ���������� - �� ������� ������
            If InStr(Workbooks(shortFileNewVar).Sheets("����1").Cells(rowCount2, Column_�������_���_��������).Value, nameStaff) = 0 Then
              
              ' ������� ������� ������ � ����� - ��� ��������, �� ���� ������ ���������
              ' Workbooks(shortFileNewVar).Sheets("����1").Rows(CStr(rowCount2) + ":" + CStr(rowCount2)).Select
              ' Selection.Delete Shift:=xlUp
              
              ' ������� 2
              ' Workbooks(shortFileNewVar).Sheets("����1").Rows(CStr(rowCount2) + ":" + CStr(rowCount2)).Select
              Workbooks(shortFileNewVar).Sheets("����1").Rows(CStr(rowCount2) + ":" + CStr(rowCount2)).Delete Shift:=xlUp
              
              ' ���� ������� ������, �� ����� �� ��� ��
              rowCount2 = rowCount2 - 1
              
            End If
            
            
            ' ��������� ������
            rowCount2 = rowCount2 + 1
            DoEventsInterval (rowCount)
          Loop
          
          ' ������������� ������ �� ������ ������
          ' Workbooks(shortFileNewVar).Sheets("����1").Range("C1").Select
          
          ' ��������� ����
          Workbooks(shortFileNewVar).Close SaveChanges:=True
          
          ' �������� ����� � ����� ���������� ������� ���� ��� ���, �������, ����, ����
          Call ��������_Lotus_Notes_��������(fullNameStaff, FileNewVar)
          
          ' ��������� �� ���� ����
          ThisWorkbook.Sheets("����").Activate
          
                       
        End If
        
        
        ' ��������� ������
        rowCount = rowCount + 1
        ' Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
   
      ' ������ ���������
      Application.StatusBar = ""
      
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
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����").Range("A1").Select

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
Sub ��������_Lotus_Notes_��������(In_���, In_����FileName)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������
  ' If MsgBox("��������� ���� ������ ������ � �������� �������� '" + �������������� + "'?", vbYesNo) = vbYes Then
    
    ' �����_���������� = ThisWorkbook.Sheets("����8").Cells(rowByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100) + 2).Value
    �����_���������� = getFromAddrBook3(In_���)
    
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = subjectFromSheet("����")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����")

    ' ����-�������� (!!!)
    attachmentFile = In_����FileName
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + �����_���������� + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "������ ����!" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������ ���� ��� ������������" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
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

