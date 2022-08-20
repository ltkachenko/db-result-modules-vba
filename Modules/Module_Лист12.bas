Attribute VB_Name = "Module_����12"
' ���� 12

' ��������� ����������� ������ �� �����
Sub getDataFromOffice_����12_4()
  
    
  ' ��������� ����
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
    ThisWorkbook.Sheets("����12").Activate

    ' �������� ����� ������
    ' CheckFormatReportResult = CheckFormatReport(ReportName_String, "___", 6, Date)
    ' If CheckFormatReportResult = "OK" Then
    If True Then
      
      ' ��������� ������� BASE\Custflow
      OpenBookInBase ("Custflow")

      rowCount = 1
      Do While InStr(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value, "����� �� ���") = 0

        ' ������� ��:
        If InStr(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value, "������� ��:") <> 0 Then
           �������_�� = CDate(Mid(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value, 13, 10))
        End If
   
        ' ���� ��� "�� �" � �� ����� � ������ ��������
        If (InStr(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value, "�� �") <> 0) And (Len(Trim(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 2).Value)) <> 0) Then
          
          ' ID_Rec
          ID_RecVar = strDDMMYYYY(�������_��) + "-" + cityOfficeName(Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value)
          
          ' ������� ������ � ������� BASE\Custflow: ID_Rec (Date-����), Date, ����, ������������, ������_��, ���������_���, ������������_��, ������������_���, �������_��� ��_�����_�����������
          Call InsertRecordInBook("Custflow", "����1", "ID_Rec", ID_RecVar, _
                                          "ID_Rec", ID_RecVar, _
                                            "Date", �������_��, _
                                              "����", Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 1).Value, _
                                                "������������", Workbooks(ReportName_String).Sheets("���������� �����").Cells(rowCount, 2).Value, _
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

        End If
   
        ' ������������ ���������� �����
        ' ��������� ������
        rowCount = rowCount + 1
        ' Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
        ' DoEventsInterval (rowCount)
          
      Loop


      ' ��������� ���� BASE\Tasks
      CloseBook ("Custflow")
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ' ThisWorkbook.Sheets("����12").Range("L78").Select

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


' �����������: �������� ����� �� ��������� �������
Sub toSend_���������_�����_��_�������������()

Dim Range_str, �����_Ln_����, �����_Ln_����� As String
Dim Range_Row, Range_Column, i As Byte
Dim ����������, �����������, hashTag As String

  
    ' ������
    If MsgBox("��������� ���� ������ ������ �� �������������?", vbYesNo) = vbYes Then
    
      If MsgBox("���� ������ " + CStr(ThisWorkbook.Sheets("����12").Range("H2").Value) + "?", vbYesNo) = vbYes Then
        
      End If
    
      ' �������� ���������
      ' �����_Ln_���� = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)
      ' �����_Ln_����� = getFromAddrBook("��", 2)
      
      ' ���� ������ - ����:
      ���������� = "����� �� �������������"
      ' hashTag - ������:
      hashTag = "#������������"
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "������ " + strDDMM(ThisWorkbook.Sheets("����12").Range("H2").Value) + ":" + Chr(13)
      ����������� = ����������� + "������������ - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 3).Value) + Chr(13)
      ����������� = ����������� + "������ �� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 4).Value) + Chr(13)
      ����������� = ����������� + "��������� ��� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 5).Value) + Chr(13)
      ����������� = ����������� + "������������ �� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 6).Value) + Chr(13)
      ����������� = ����������� + "������������ ��� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 7).Value) + Chr(13)
      ����������� = ����������� + "������� ��� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 8).Value) + Chr(13)
      ����������� = ����������� + "�� (����� + �����.) - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 9).Value) + Chr(13)
      ����������� = ����������� + "������� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 10).Value) + Chr(13)
      ' ���� �� ���� ���� ������� ���, �� ����������
      If ThisWorkbook.Sheets("����12").Cells(11, 11).Value <> 0 Then
        ����������� = ����������� + "������� ��� - " + CStr(ThisWorkbook.Sheets("����12").Cells(11, 11).Value) + Chr(13)
      End If
      '
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(35) + hashTag
      
      ' �����
      ' Call send_Lotus_Notes(����������, �����_Ln_����, �����_Ln_�����, �����������, "")
      
      ' ����� � ��������� ���� � ������� �����
      Call send_Lotus_Notes2(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "", "", �����������, "")
  
      ' ���������
      MsgBox ("������ ����������!")
      
    End If
  
End Sub

' �������� ����� � ������ �� ����
Sub clearGrid_Sheet12()
Dim i, j, new_j As Byte

    ' ������
    If MsgBox("�������� �����?", vbYesNo) = vbYes Then
    
      For i = 17 To 21
        
        For j = 3 To 11
          
          ' 1. ������� - ����� 12.2
          ThisWorkbook.Sheets("����12").Cells(i, j).Value = 0
          
          ' 2. ������� - ����� 12.3
          ' �������� �� Y
          Select Case j
            Case 3 ' ������������
              new_j = 3
            Case 4 ' ������ ��
              new_j = 4
            Case 5 ' ��������� ���
              new_j = 8
            Case 6 ' ������������ ��
              new_j = 6
            Case 7 ' ������������ ���
              new_j = 9
            Case 8 ' ������� ���
              new_j = 10
            Case 9 ' �� (����� + �����.)
              new_j = 11
            Case 10 ' �������
              new_j = 12
            Case 11 ' ������� ���
              new_j = 13
          
          End Select

          ThisWorkbook.Sheets("����12").Cells(i + 11, new_j).Value = 0
        Next j
        
      Next i
      
      ' ���������� �������� �������
      Call reFreshDataFromDay_Sheet12
      
      ' ���������
      MsgBox ("����� �������!")
  
    End If
    
End Sub

' ������ ������ �� ����
Sub insertDataFromDay_Sheet12()
Dim i, j As Byte

    ' �������� ������ � ��������� ������������ �������
    
    ' ��������� ������?
    Call toSend_���������_�����_��_�������������
    
    ' ������
    If MsgBox("������ ������ �� " + CStr(ThisWorkbook.Sheets("����12").Range("H2").Value) + "?", vbYesNo) = vbYes Then
    
      ' ��������� ������� BASE\Custflow
      OpenBookInBase ("Custflow")
    
      ' �������� �1: ���������� � ������ ������ ������ ���
      For i = 6 To 10
        
        ' ��������� ���� � �������
        For j = 3 To 11
          
          ' ������� ������
          ThisWorkbook.Sheets("����12").Cells(i + 11, j).Value = ThisWorkbook.Sheets("����12").Cells(i + 11, j).Value + ThisWorkbook.Sheets("����12").Cells(i, j).Value
                    
        Next j
        
        ' ������� ������ � ������� BASE\Custflow: ID_Rec (Date-����), Date, ����, ������������, ������_��, ���������_���, ������������_��, ������������_���, �������_��� ��_�����_�����������
        Call InsertRecordInBook("Custflow", "����1", "ID_Rec", strDDMMYYYY(ThisWorkbook.Sheets("����12").Range("H2").Value) + "-" + cityOfficeName(ThisWorkbook.Sheets("����12").Cells(i, 2).Value), _
                                          "ID_Rec", strDDMMYYYY(ThisWorkbook.Sheets("����12").Range("H2").Value) + "-" + cityOfficeName(ThisWorkbook.Sheets("����12").Cells(i, 2).Value), _
                                            "Date", ThisWorkbook.Sheets("����12").Range("H2").Value, _
                                              "����", ThisWorkbook.Sheets("����12").Cells(i, 2).Value, _
                                                "������������", ThisWorkbook.Sheets("����12").Cells(i, 3).Value, _
                                                  "������_��", ThisWorkbook.Sheets("����12").Cells(i, 4).Value, _
                                                    "���������_���", ThisWorkbook.Sheets("����12").Cells(i, 5).Value, _
                                                      "������������_��", ThisWorkbook.Sheets("����12").Cells(i, 6).Value, _
                                                        "������������_���", ThisWorkbook.Sheets("����12").Cells(i, 7).Value, _
                                                          "�������_���", ThisWorkbook.Sheets("����12").Cells(i, 8).Value, _
                                                            "��_�����_�����������", ThisWorkbook.Sheets("����12").Cells(i, 9).Value, _
                                                               "�������", ThisWorkbook.Sheets("����12").Cells(i, 10).Value, _
                                                                 "�������_���", ThisWorkbook.Sheets("����12").Cells(i, 11).Value, _
                                                                   "", "", _
                                                                     "", "", _
                                                                       "", "", _
                                                                         "", "", _
                                                                           "", "", _
                                                                             "", "", _
                                                                               "", "", _
                                                                                 "", "")
                                                                                  

        
      Next i
      
      ' �������� �2: ������� �����
      For i = 6 To 10
        
        For j = 3 To 11
          
          ' �������� ������ ����� - �� ������ ����� �� ��������
          ThisWorkbook.Sheets("����12").Cells(i, j).Value = 0
          
        Next j
        
      Next i
      
      ' ��������� ���� BASE\Tasks
      CloseBook ("Custflow")

      ' ��������� ������������� �� �����
      Call reFreshDataFromDay_Sheet12
      
      ' ���������� �� ����� 0 "������������ � �������"
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������ � �������", 100, 100))

      ' ���������
      MsgBox ("������ �� " + CStr(ThisWorkbook.Sheets("����12").Range("H2").Value) + " ������� �������!")
  
    End If
  
End Sub

' �������� ������
Sub reFreshDataFromDay_Sheet12()
Dim i, j, new_j As Byte

  ' ������
  If MsgBox("�������� ������?", vbYesNo) = vbYes Then
    
    ' ������� ������� � C27 �� K32
    Call clear�ontents2(ThisWorkbook.Name, "����12", "C28", "M32")
    
    ' � B24: "����������� ������-������� ������������ � �����-������� �� ��� 2020 �. (�� 26.05.2020)"
    ThisWorkbook.Sheets("����12").Cells(24, 2).Value = "����������� ������-������� ������������ � �����-������� �� " + ���������(ThisWorkbook.Sheets("����12").Cells(2, 8).Value) + " (�� " + CStr(ThisWorkbook.Sheets("����12").Cells(2, 8).Value) + ")"
    
    ' ������� ������
      ' �������� �1: ���������� � ������ ������ ������ ���
      For i = 28 To 32
        
        ' ��������� ���� � �������
        For j = 3 To 11
          
          ' �������� �� Y
          Select Case j
            Case 3 ' ������������
              new_j = 3
            Case 4 ' ������ ��
              new_j = 4
            Case 5 ' ��������� ���
              new_j = 8
            Case 6 ' ������������ ��
              new_j = 6
            Case 7 ' ������������ ���
              new_j = 9
            Case 8 ' ������� ���
              new_j = 10
            Case 9 ' �� (����� + �����.)
              new_j = 11
            Case 10 ' �������
              new_j = 12
            Case 11 ' ������� ���
              new_j = 13
              
          End Select

          ' ������� ������
          ThisWorkbook.Sheets("����12").Cells(i, new_j).Value = ThisWorkbook.Sheets("����12").Cells(i - 11, j).Value
          ThisWorkbook.Sheets("����12").Cells(i, new_j).HorizontalAlignment = xlRight
                    
        Next j
      
      Next i
         
    ' ������ ������ ������
    For i = 28 To 32
      
      ' ������ ��
      ThisWorkbook.Sheets("����12").Cells(i, 5).Value = �����������(ThisWorkbook.Sheets("����12").Cells(i, 3).Value, ThisWorkbook.Sheets("����12").Cells(i, 4).Value, 3)
      ThisWorkbook.Sheets("����12").Cells(i, 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����12").Cells(i, 5).Value)
      ThisWorkbook.Sheets("����12").Cells(i, 5).HorizontalAlignment = xlRight
      ' ������� ������ ��������: ����
      Call Full_Color_RangeII("����12", i, 5, (�����������(ThisWorkbook.Sheets("����12").Cells(i, 3).Value, ThisWorkbook.Sheets("����12").Cells(i, 4).Value, 3) * 100), 15)
      
      ' ��
      ThisWorkbook.Sheets("����12").Cells(i, 7).Value = �����������(ThisWorkbook.Sheets("����12").Cells(i, 3).Value, ThisWorkbook.Sheets("����12").Cells(i, 6).Value, 3)
      ThisWorkbook.Sheets("����12").Cells(i, 7).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����12").Cells(i, 7).Value)
      ThisWorkbook.Sheets("����12").Cells(i, 7).HorizontalAlignment = xlRight
      ' ������� ������ ��������: ����
      Call Full_Color_RangeII("����12", i, 7, (�����������(ThisWorkbook.Sheets("����12").Cells(i, 3).Value, ThisWorkbook.Sheets("����12").Cells(i, 6).Value, 3) * 100), 15)
      
      ' ��� ����
      ' ������� ������ ��������: ����
      If ThisWorkbook.Sheets("����12").Cells(i, 8).Value = 0 Then
        Call Full_Color_RangeII("����12", i, 8, 0, 100)
      End If
      
      ' ������� ����
      ' ������� ������ ��������: ����
      If ThisWorkbook.Sheets("����12").Cells(i, 12).Value = 0 Then
        Call Full_Color_RangeII("����12", i, 12, 0, 100)
      End If
      
    Next i
         
  End If

End Sub

' �������� ����� ����� 12.4
Sub clearForm2_����12_4()
  ' ������
  If MsgBox("�������� �����?", vbYesNo) = vbYes Then
    
    Call clear�ontents2(ThisWorkbook.Name, "����12", "C44", "M48")
    
    ' ���������
    MsgBox ("����� �������!")
    
  End If
End Sub

' �������� ����� ����� 12.5
Sub clearForm2_����12_5()
  ' ������
  ' If MsgBox("�������� �����?", vbYesNo) = vbYes Then
    
    Call clear�ontents2(ThisWorkbook.Name, "����12", "C55", "M59")
    
    ' ���������
    ' MsgBox ("����� �������!")
    
  ' End If
End Sub



' ��������� �����
Sub sendReport_����12()
  ' ������
  If MsgBox("��������� �����?", vbYesNo) = vbYes Then
        
    
    ' ���������
    MsgBox ("����� ���������!")
        
  End If
End Sub

