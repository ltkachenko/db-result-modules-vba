Attribute VB_Name = "Module_Templates"
' ������

' ������_���������_5_������
Sub ������_���������_5_������()
  
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xml), *.xml", , "�������� ����� � �������")

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
    ThisWorkbook.Sheets("����3").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    If CheckFormatReportResult = "OK" Then
      
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

        rowCount = 1
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("������").Cells(rowCount, 1).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("����� � ������").Cells(rowCount, 2).Value, officeNameInReport) <> 0 Then
            
            
                
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
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
    ThisWorkbook.Sheets("����3").Range("L78").Select

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


' ������ ������� ������ � BASE\���_����� �� ���� 1, �������� ����
Sub ������_�������_������_�_BASE()
    
    Call InsertRecordInBook("���_�����", "����1", "��������_����", "��������_�����", _
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
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

End Sub


' ���������� ������ �� �����
Sub ������_��������_������_��_�����()
Dim Range_str As String
Dim Range_Row, Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  Range_str = RangeByValue(In_Workbooks, In_Sheets, In_�_���, 100, 100)
  Range_Row = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range_str).Row
  Range_Column = Workbooks(In_Workbooks).Sheets(In_Sheets).Range(Range_str).Column

End Sub
