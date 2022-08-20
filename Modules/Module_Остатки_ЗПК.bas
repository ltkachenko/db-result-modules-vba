Attribute VB_Name = "Module_�������_���"
' ���� "������� ���"

' �������� �� ����������� ������ ���������� � ����������� ���
Sub ����������_������_��_��_Way4()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
' Dim i, rowCount As Integer
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
    ThisWorkbook.Sheets("������� ���").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
      
      ' ������� �������
      Call clear�ontents2(ThisWorkbook.Name, "������� ���", "A7", "I50")
      ���������������� = 6
      ����� = 0

      ' ������� ������� "��� ��-�����������"
      Column_���_��_����������� = ColumnByValue(ReportName_String, "BranchClientReport", "��� ��-�����������", 100, 100)
      ' ������ "���������� ��������"
      rowCount = rowByValue(ReportName_String, "BranchClientReport", "���������� ��������", 100, 100) + 1
      
      ' ��������� ���� ���
      ' ��� ������ �����
      ' "������ �� ������� �� ������ � ���� 01.10.2020 00:00:00 ( report_id = 381 )"
      typeDownload = ""
      If InStr(Workbooks(ReportName_String).Sheets("BranchClientReport").Range("A1").Value, "������ �� ������� �� ������") <> 0 Then
        typeDownload = "�������"
        dateReport = CDate(Mid(Workbooks(ReportName_String).Sheets("BranchClientReport").Range("A1").Value, 36, 10))
        ' ����
        ThisWorkbook.Sheets("������� ���").Range("P2").Value = "������� �� ������ - " + Workbooks(ReportName_String).Sheets("BranchClientReport").Range("A1").Value
        ' ����
        ThisWorkbook.Sheets("������� ���").Range("P2").Value = "������� �� ������ - �������"
      End If
      
      ' "������ �� ������� �� ����������� � ���� 01.10.2020 00:00:00 ( report_id = 382 )"
      If InStr(Workbooks(ReportName_String).Sheets("BranchClientReport").Range("A1").Value, "������ �� ������� �� �����������") <> 0 Then
        typeDownload = "��-�������"
        dateReport = CDate(Mid(Workbooks(ReportName_String).Sheets("BranchClientReport").Range("A1").Value, 41, 10))
        ' ����
        ThisWorkbook.Sheets("������� ���").Range("P2").Value = "������� �� ������ - �� �������"
      End If
      
      ' ��� ������ �����
      FileNewVar = "�������_��_������_" + typeDownload + "_" + CStr(Date_last_day_quarter(dateReport)) + ".xls"
      Workbooks(ReportName_String).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileNewVar, createBackUp:=False
      ' ��� ����� ��� ����������
      ��������������������� = "�������_��_������_" + typeDownload + "_" + CStr(Date_last_day_quarter(dateReport))
      ' ��� ����� ��� ���������
      strFilesNameForArch = ThisWorkbook.Path + "\Out\" + FileNewVar
      ' �������� Q3
      ThisWorkbook.Sheets("������� ���").Range("Q3").Value = strFilesNameForArch
      
      ' ����� � �������
      ' �
      ThisWorkbook.Sheets("������� ���").Cells(7, 1).Value = "1"
      ' ��� �����
      ThisWorkbook.Sheets("������� ���").Cells(7, 2).Value = FileNewVar
      
      ' ����������
      �����_������� = 0
      �������_������� = 0
      ���������_������� = 0
      
      ' ���������
      Do While Not IsEmpty(Workbooks(FileNewVar).Sheets("BranchClientReport").Cells(rowCount, 1).Value)
        
        ' ����������
        �����_������� = �����_������� + 1
        ���������_������� = ���������_������� + 1
        
        ' ���� ��� ��� ����������� - ������� ���������� ����� ��� ��� ����������� 00128
        If InStr(Workbooks(FileNewVar).Sheets("BranchClientReport").Cells(rowCount, Column_���_��_�����������).Value, "00128") <> 0 Then
          
          ' ������� ������� ������ � ����� - ��� ��������, �� ���� ������ ���������
          Workbooks(FileNewVar).Sheets("BranchClientReport").Rows(CStr(rowCount) + ":" + CStr(rowCount)).Delete Shift:=xlUp
              
          ' ���� ������� ������, �� ����� �� ��� ��
          rowCount = rowCount - 1
        
          ' ����������
          �������_������� = �������_������� + 1
          ���������_������� = ���������_������� - 1
        
        End If
        
        
        ' ��������� ������
        rowCount = rowCount + 1
        Application.StatusBar = "���������: " + CStr(rowCount) + "..."
        DoEventsInterval (rowCount)
      Loop
   
      ' ������ ���������
      Application.StatusBar = ""
      
      ' ������� ����� ���������
      ' ����� � �������
      ' �������
      ThisWorkbook.Sheets("������� ���").Cells(7, 3).Value = �����_�������
      ' �������
      ThisWorkbook.Sheets("������� ���").Cells(7, 4).Value = �������_�������
      ' ���������
      ThisWorkbook.Sheets("������� ���").Cells(7, 5).Value = ���������_�������

      ' ���������� ���������
      ThisWorkbook.Save
    
     ' ��������� ������ ��� �������� (� "������ �����������:"):
     ThisWorkbook.Sheets("������� ���").Cells(rowByValue(ThisWorkbook.Name, "������� ���", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "������� ���", "������ �����������:", 100, 100) + 2).Value _
       = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����", 2)
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(FileNewVar).Close SaveChanges:=True
    
    ' ��������� � ������ M2
    ' ThisWorkbook.Sheets("������� ���").Range("A1").Select

    ' ���������� ����
    Application.StatusBar = "�������� ������..."

    ' ��������� ��������� ����� �����, ������� https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd
    ' -sdel ������� ����� ����� �������� ������
    ' ��� ����� ������
    File7zipName = ��������������������� + ".zip"
    Shell ("C:\Program Files\7-Zip\7z a -tzip -ssw -mx9 C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\" + File7zipName + " " + strFilesNameForArch)
    ' �������� Q3
    ThisWorkbook.Sheets("������� ���").Range("Q3").Value = "C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\" + File7zipName
    ' ���������
    Application.StatusBar = "����� ������!"

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D9")
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
      Call ��������_Lotus_Notes_�������_���2
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������
    
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������
Sub ��������_Lotus_Notes_�������_���2()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = ThisWorkbook.Sheets("������� ���").Range("P2").Value

    ' hashTag - ������:
    hashTag = hashTagFromSheet("������� ���")
    
    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Sheets("������� ���").Range("Q3").Value
    
    ' ������ �����������
    ������_����������� = recipientList("������� ���")
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ������_����������� + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� �������� �� ���������� ������ " + ������� + ThisWorkbook.Sheets("������� ���").Range("B7").Value + ������� + " ��� ��������� ��������/���/���" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(25) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub



' ��� ��� �� �������� - ����� ��������� �������������� � Way4
' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������
Sub ��������_Lotus_Notes_�������_���()
Dim ����������, �����������, hashTag As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = "��������� ��� - ����� �������� ���� DPK"

    ' hashTag - ������:
    hashTag = "#����������"
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "Elena Alexandrovna Belova/CardCentre/PSBank/Ru" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "�����, ������ ����!" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� �� ���������� ���������� ������ ���������� ��� ������������ �������� ������ DPK." + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    ' �����
    Call send_Lotus_Notes2(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "", �����������, "")
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub

