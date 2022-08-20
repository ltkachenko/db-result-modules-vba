Attribute VB_Name = "Module_����10"
' ���������������� (����10)
Sub ����������������()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
Dim ������_��_���, �����������_���_���, ������_��_�����������_��� As Double
Dim ������_��_��, �����������_���_��, ������_��_�����������_�� As Integer
    
    
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
    ThisWorkbook.Sheets("����10").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "�������", 11, periodFromSheet("����10"))
    
    If CheckFormatReportResult = "OK" Then
          
    ' ���� ��������� ������ � ������� ������
    dateEndInMonth = periodFromSheet2("����10", 2)
      
    ' ���� ������ ������
    dateBeginMonth = Date_begin_day_month(dateEndInMonth)
            
    ' ��������� ������
    ThisWorkbook.Sheets("����10").Cells(2, 2).Value = "���������������� �� " + ������������(dateEndInMonth)
                        
    ' ������
    ThisWorkbook.Sheets("����10").Cells(2, 12).Value = CStr(WeekNumber(dateEndInMonth))
                  
    ' ���� ������
    ThisWorkbook.Sheets("����10").Cells(2, 19).Value = "����������� ������-������� (����������������) ��  " + CStr(dateEndInMonth) + " �."
                                
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
      ������_��_��� = 0
      ������_��_�� = 0
      �����������_���_��� = 0
      �����������_���_�� = 0
      ������_��_�����������_��� = 0
      ������_��_�����������_�� = 0

      rowCount = 3
      Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 1).Value)
        
          ' ���� ��� ������ �������� �����
          If InStr(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 8).Value, officeNameInReport) <> 0 Then
          
            ' ��������� ����
            If (CDate(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 3).Value) >= dateBeginMonth) And (CDate(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 3).Value) <= dateEndInMonth) Then
              
              ' ������_��_���
              ������_��_��� = ������_��_��� + CDbl(Replace(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 6).Value, ".", ","))
              
              ' ������_��_��
              ������_��_�� = ������_��_�� + 1
              
              ' ������� �����������
              If InStr(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 9).Value, "�����������") <> 0 Then
              
                ' �����������, ���.
                ������_��_�����������_��� = ������_��_�����������_��� + CDbl(Replace(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 6).Value, ".", ","))
              
                ' �����������, ��
                ������_��_�����������_�� = ������_��_�����������_�� + 1
              
              End If
              
              
              ' �����������_���
              If InStr(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 10).Value, "��") <> 0 Then
              
                ' �����������_���_���
                �����������_���_��� = �����������_���_��� + CDbl(Replace(Workbooks(ReportName_String).Sheets("�������").Cells(rowCount, 6).Value, ".", ","))
              
                ' �����������_���_��
                �����������_���_�� = �����������_���_�� + 1
              
              End If
              
            End If ' ��������� ����
            
          End If ' ���� ��� ������ �������� �����
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
      Loop
   
        ' ������� ������ �� �����
        ThisWorkbook.Sheets("����10").Cells(5 + i, 3).Value = Round(������_��_��� / 1000, 0)
        ThisWorkbook.Sheets("����10").Cells(5 + i, 4).Value = ������_��_��
        ThisWorkbook.Sheets("����10").Cells(5 + i, 5).Value = Round(�����������_���_��� / 1000, 0)
        ThisWorkbook.Sheets("����10").Cells(5 + i, 6).Value = �����������_���_��
        ThisWorkbook.Sheets("����10").Cells(5 + i, 7).Value = �����������(������_��_��, �����������_���_��, 2)
        ' ������ ��� ����������
        ThisWorkbook.Sheets("����10").Cells(5 + i, 8).Value = Round((������_��_��� - ������_��_�����������_���) / 1000, 0)
        ThisWorkbook.Sheets("����10").Cells(5 + i, 9).Value = ������_��_�� - ������_��_�����������_��
        ThisWorkbook.Sheets("����10").Cells(5 + i, 10).Value = Round(�����������_���_��� / 1000, 0)
        ThisWorkbook.Sheets("����10").Cells(5 + i, 11).Value = �����������_���_��
        
        ' ���� �� ������
        ' ThisWorkbook.Sheets("����10").Cells(5 + i, 12).Value = �����������((������_��_�� - ������_��_�����������_��), �����������_���_��, 2)
        ' ������� ������ ��������: ����
        ' Call Full_Color_RangeII("����10", 5 + i, 12, (�����������((������_��_�� - ������_��_�����������_��), �����������_���_��, 2) * 100), 80)

        ' ���� �� ������
        ThisWorkbook.Sheets("����10").Cells(5 + i, 12).Value = �����������((������_��_��� - ������_��_�����������_���), �����������_���_���, 2)
        ' ������� ������ ��������: ����
        Call Full_Color_RangeII("����10", 5 + i, 12, (�����������((������_��_��� - ������_��_�����������_���), �����������_���_���, 2) * 100), 80)


    Next i ' ��������� ����
      
      ' ������� ����� ��������� - � ������
      ' ThisWorkbook.Sheets("����10").Cells(11, 7).Value = �����������(ThisWorkbook.Sheets("����10").Cells(11, 4).Value, ThisWorkbook.Sheets("����10").Cells(11, 6).Value, 2)
      ' ThisWorkbook.Sheets("����10").Cells(11, 12).Value = �����������(ThisWorkbook.Sheets("����10").Cells(11, 9).Value, ThisWorkbook.Sheets("����10").Cells(11, 11).Value, 2)
      
      ' � ������
      ThisWorkbook.Sheets("����10").Cells(11, 7).Value = �����������(ThisWorkbook.Sheets("����10").Cells(11, 3).Value, ThisWorkbook.Sheets("����10").Cells(11, 5).Value, 2)
      ThisWorkbook.Sheets("����10").Cells(11, 12).Value = �����������(ThisWorkbook.Sheets("����10").Cells(11, 8).Value, ThisWorkbook.Sheets("����10").Cells(11, 10).Value, 2)
      
      ' ��������� ������ ��� �������� (� "������ �����������:"):
      ThisWorkbook.Sheets("����10").Cells(rowByValue(ThisWorkbook.Name, "����10", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����10", "������ �����������:", 100, 100) + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5", 2)
      
      ' ���������� ���������� ���������
      finishProcess = True
      
      ' ����������� ����� ���� �� ��������� ��������
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������������", 100, 100))

    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����10").Range("O1").Select

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

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����10_����������������()
Dim ����������, �����������, hashTag As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = subjectFromSheet("����10")

    ' hashTag - ������:
    hashTag = hashTagFromSheet("����10")
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����10").Cells(rowByValue(ThisWorkbook.Name, "����10", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����10", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "������������� ����������� ��� � �������� �������������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
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

