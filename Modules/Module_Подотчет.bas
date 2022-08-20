Attribute VB_Name = "Module_��������"
' ���� "��������"
Sub ������������_���������_�����()

Dim ������_�����������������_�������, expenseReportName, ������_����������_����������� As String
Dim �����������_�����������������_�������, ������������_�����������������_�������, i As Byte
Dim expenseReportDate As Date
Dim ������_���������_row As Integer

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_�����������������_������� = RangeByValue(ThisWorkbook.Name, "��������", "����������������� �������", 100, 100)
  �����������_�����������������_������� = ThisWorkbook.Sheets("��������").Range(������_�����������������_�������).Row
  ������������_�����������������_������� = ThisWorkbook.Sheets("��������").Range(������_�����������������_�������).Column
  
  ' �������� ���������
  If (ActiveCell.Row >= �����������_�����������������_������� + 4) And (ActiveCell.Row <= �����������_�����������������_������� + 20) And (ActiveCell.Column >= ������������_�����������������_������� - 1) And ((ActiveCell.Column <= ������������_�����������������_������� + 30)) And (ThisWorkbook.Sheets("��������").Cells(ActiveCell.Row, ������������_�����������������_������� + 1).Value <> "") Then
    
    ' ������ �� ������������
    If MsgBox("������������ ��������� ����� �� " + CStr(ThisWorkbook.Sheets("��������").Cells(ActiveCell.Row, ������������_�����������������_�������).Value) + "?", vbYesNo) = vbYes Then
      
      ' ������
      ������_���������_row = ActiveCell.Row
      
      ' ���� ���������� ������
      expenseReportDate = CDate(ThisWorkbook.Sheets("��������").Cells(ActiveCell.Row, ������������_�����������������_�������).Value)
      
      ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
      Workbooks.Open (ThisWorkbook.Path + "\Templates\��������� �����.xlsx")
      
      ' ��� �����
      expenseReportName = "��������� ����� ��� ����� �� " + ������������(expenseReportDate) + " (����������������� ������� ����� ��.1637)" + ".xlsx"
      
      ' ��������� ���� � ��������� �������
      Workbooks("��������� �����.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + expenseReportName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
      
      ' ��������� ����
    
      ' ������������
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AV13").Value = "������������ ��������"
      ' Workbooks(expenseReportName).Sheets("��������� �����").Range("AV13").Value = "����������� ������������� ��������� �� �������� ���������� �������"
      Workbooks(expenseReportName).Sheets("���").Range("G4").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AV13").Value
      Workbooks(expenseReportName).Sheets("�����").Range("G4").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AV13").Value
      
      ' ��� ������������
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AX15").Value = "������� �.�."
      ' Workbooks(expenseReportName).Sheets("��������� �����").Range("AX15").Value = "������� �.�."
      Workbooks(expenseReportName).Sheets("���").Range("I6").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AX15").Value
      Workbooks(expenseReportName).Sheets("�����").Range("I6").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AX15").Value
      
      ' ����
      Workbooks(expenseReportName).Sheets("���").Range("D10").Value = "�� " + CStr(expenseReportDate) + " �."
      Workbooks(expenseReportName).Sheets("���").Range("B16").Value = CStr(expenseReportDate) + " �."
      Workbooks(expenseReportName).Sheets("�����").Range("D14").Value = CStr(expenseReportDate) + " �."
      
      ' �����
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AS17").Value = ���������2(expenseReportDate)
      
      ' ���
      Workbooks(expenseReportName).Sheets("��������� �����").Range("BC17").Value = CStr(Year(expenseReportDate))
      
      ' ���������� ������
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AR24").Value = "����������������� �������"
      
      ' ����� ��������
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AH33").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 9).Value
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AH35").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH33").Value
      
      ' �������������
      Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 31).Value
      
      ' ������� AH37 ��� ���������� AH38
      If (Workbooks(expenseReportName).Sheets("��������� �����").Range("AH33").Value - Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value) >= 0 Then
        ' ������� AH37
        Workbooks(expenseReportName).Sheets("��������� �����").Range("AH37").Value = (Workbooks(expenseReportName).Sheets("��������� �����").Range("AH33").Value - Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value)
        
      Else
        ' ���������� AH38
        Workbooks(expenseReportName).Sheets("��������� �����").Range("AH38").Value = Abs((Workbooks(expenseReportName).Sheets("��������� �����").Range("AH33").Value - Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value))
        
      End If
            
      ' ���� "��������� ����� (������)"
      ' ��������� ������
      For i = 1 To 5

        If ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 18 + (3 * (i - 1))).Value <> 0 Then

          ' ����� ������ � ��������� ������
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 1).Value = CStr(i)
        
          ' ���������, �������������� �������: ����1. � 16
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 4).Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 16 + (3 * (i - 1))).Value
      
          ' ���������, �������������� �������: �����1. � 17
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 11).Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 17 + (3 * (i - 1))).Value
            
          ' ���������, �������������� �������: �����1. � 18
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 29).Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 18 + (3 * (i - 1))).Value
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 43).Value = Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 29).Value
        
          ' ���������, �������������� �������: ������������ ��������� R7
          Workbooks(expenseReportName).Sheets("��������� ����� (������)").Cells(6 + i, 18).Value = "�������� ���"
        
        End If ' ���� ����� ���� <>0
        
      Next i
            
      ' --- ��� ---
      ' ���� D16
      Workbooks(expenseReportName).Sheets("���").Range("D16").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 1).Value
      
      ' ��������� H16
      ������_����������_����������� = ""
      For i = 1 To 6
        
        If ������_����������_����������� = "" Then
          ������_����������_����������� = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 9 + i).Value
        Else
          ������_����������_����������� = ������_����������_����������� + ", " + ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 9 + i).Value
        End If
        
      Next i
      
      ' ������� ����������
      Workbooks(expenseReportName).Sheets("���").Range("H16").Value = ������_����������_�����������
      Workbooks(expenseReportName).Sheets("���").Range("16:16").RowHeight = lineHeight(������_����������_�����������, 15, 40)
      
      ' �����:
      Workbooks(expenseReportName).Sheets("���").Range("B19").Value = "� ���������� �������� ��������������� ��������� �.�. ���������� �����������, ��� ����������������� ������� �� ����������� " + CStr(expenseReportDate) + " �. ��������� ����� " + CStr(Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value) + " ���."
      ' ����������:
      Workbooks(expenseReportName).Sheets("���").Range("B25").Value = "1. �������� ������������� ����������������� �������, ������������� " + CStr(expenseReportDate) + " �. � ����� " + CStr(Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value) + " ���."
      
      ' ���������
      Workbooks(expenseReportName).Sheets("���").Range("B35").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 13).Value
      Workbooks(expenseReportName).Sheets("���").Range("B39").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 14).Value
      Workbooks(expenseReportName).Sheets("���").Range("B41").Value = ThisWorkbook.Sheets("��������").Cells(������_���������_row, ������������_�����������������_������� + 15).Value
      ' "___________"
      Workbooks(expenseReportName).Sheets("���").Range("H35").Value = "___________"
      Workbooks(expenseReportName).Sheets("���").Range("H39").Value = "___________"
      Workbooks(expenseReportName).Sheets("���").Range("H41").Value = "___________"
             
      ' ����� �����������
      
      ' --- ����� ---
      ' �����:
      Workbooks(expenseReportName).Sheets("�����").Range("D16").Value = "������, ��.��������� 51/1"
      ' �������������� ���������� ����������:
      Workbooks(expenseReportName).Sheets("�����").Range("F18").Value = "6"
      ' ����� - ������������ ��������� �������
      Workbooks(expenseReportName).Sheets("�����").Range("E25").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      Workbooks(expenseReportName).Sheets("�����").Range("H25").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      ' ����� ������������ ������������:
      Workbooks(expenseReportName).Sheets("�����").Range("E29").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      Workbooks(expenseReportName).Sheets("�����").Range("H29").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      ' �����
      Workbooks(expenseReportName).Sheets("�����").Range("E38").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      Workbooks(expenseReportName).Sheets("�����").Range("H38").Value = Workbooks(expenseReportName).Sheets("��������� �����").Range("AH36").Value
      
      ' �������� ����� � ��������� �������
      Workbooks(expenseReportName).Close SaveChanges:=True
     
      ' ������������
      ' ��������� �����

      ' ��� � ������������� �������� ������ �����������

      ' ����� �9899,82�

      ' ����� ����� (����������� � ������ 223-��)  �1�

      ' ���/��� �3004600100�

      ' ����������/������ �1637�

      ' ������ �000026�

      ' ��� �������������� �����* ��

      ' ������������/��� ����������� �������** ��

      ' ����������:

      ' !!!����������� �������:

      ' � ����������� ��������� ����� � ������� ����� Excel�

      ' � ����� ��������� ����������

      ' � ��� (�����) � ����������������� �������� - ��� ��������� ������� �� ����������������� ��������

      ' *����������� ����������� ��� ���������������� ��������

      ' �����! �������� �/� ��������������� ����� ������������ ��� �� ������� ����������� ����������� � ������ �� ����� ��������������� ����������� ������ ���� ������� � ������������� ������������� �� ������������ ���������� ���
    
      ' ���������
      MsgBox ("��������� ����� " + ThisWorkbook.Path + "\Out\" + expenseReportName + " �����������!")

    End If
  Else
    MsgBox ("������� ������ � ��������� �������!")
  End If


End Sub

' ������� ���� � �������: "O:\DirectSales\01_�� �������\����������������� �������\���� ����������������� ��������.xlsx"
Sub ��������_�������_����_�_�������()
    
    ' ������� ���� � �������
    FileName = ThisWorkbook.Sheets("��������").Range("H2").Value

    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0

End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_��������()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = "���������� ����������� �����������"
    ' ���������� = subjectFromSheet("����8")

    ' hashTag - ������:
    ' hashTag = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "������:", 100, 100) + 1).Value
    ' hashTag - ������:
    hashTag = "#�������� #�����������������"

    ' ����-�������� (!!!)
    attachmentFile = "" ' ThisWorkbook.Sheets("����8").Cells(3, 17).Value
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("����, ����", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "�� ������ ���������� ����������� ����������� ����� ������� ������ � ����� ����������� ����� ����������� ���������� � ���������: " + Chr(13)
    ����������� = ����������� + " - ���" + Chr(13)
    ����������� = ����������� + " - ���������" + Chr(13)
    ����������� = ����������� + " - ������������ �������� � ���" + Chr(13)
    ����������� = ����������� + " - ��� ���� ��������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "���� � ������ ����������� �����: " + ThisWorkbook.Sheets("��������").Range("H2").Value + Chr(13)
        
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(27) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ����������
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
End Sub

