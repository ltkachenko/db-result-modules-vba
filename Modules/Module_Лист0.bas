Attribute VB_Name = "Module_����0"
' ���� 0 � ��������� ����� �������

' *** ���������� ���������� ***
Public backUpFileName As String ' ��� ����� �����
' ***                       ***


' ��������� ������������ ����
Sub setDateNow()

Dim currentOperDate As Date
Dim firstDayOfWeek As Boolean

  ' ��������� ����
  ' currentOperDate = Date ' + 1  ' (��� ������������ ���� +1)
  
  ' ���� ����� ������������ ���������� ����, �.�. ���� = ���� + 1 "������������ ���������� ����:"
  If CStr(ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������ ���������� ����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������ ���������� ����:", 100, 100) + 3).Value) = "1" Then
    
    currentOperDate = CDate(ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100) + 3).Value) + 1
    
  Else
    
    ' ����� ���������� ��������� ����
    currentOperDate = Date
    
  End If
  
  ' �������� - ������ ���� ������
  firstDayOfWeek = False
  If CStr(ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100) + 2).Value) = "1" Then
    ' ���������� ��� ������ ���� ������?
    If MsgBox("������������ ������ ������� ��� ������?", vbYesNo) = vbYes Then
      firstDayOfWeek = True
    Else
      firstDayOfWeek = False
    End If
  End If

  ' ����� ������:
  ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������:", 100, 100) + 1).Value = WeekNumber(currentOperDate)
  ' ����
  ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100) + 3).Value = currentOperDate
  ' ��������� (��� ������)
  ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������ ����:", 100, 100) + 4).Value = "(" + ����������(currentOperDate) + ")"
  
  ' ���� ������� ����������� - �� ��������
  If (Weekday(currentOperDate, vbMonday) = 1) Or (firstDayOfWeek = True) Then
     
     ' ���� ����������� (��� ������ ���� ������)
     ' ���� �����������:
     ' ���������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100))
     ' �������� �� ������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� �������� �� ������", 100, 100))
     ' ������ ������ � ���������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100))
     ' ����������� ������� �� ������� �� ������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� ������", 100, 100))
     ' ����������� ������� �� ������� �� ����� �� ������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� ����� �� ������", 100, 100))
     '
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������� ����� ������ � ����", 100, 100))
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �� ������ ���������� �� ������", 100, 100))
     '
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� �������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� �����", 100, 100))
     
     ' ��������� �������� �������� � ����� � � ������� ����
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� �������� �������� � ����� � � ������� ����", 100, 100))
     
     ' ��������� � ����� �������� ��������
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� � ����� �������� ��������", 100, 100))
          
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �����-������� Capacity Model", 100, 100))
     
     ' ������� ������� "����.:" (��� �������� ������ �������� ��������� �������������)
     ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100) + 6).Value = ""
     ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100) + 6).Value = ""
  
     ' ������������ � �������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������ � �������", 100, 100))
       
     ' ����������������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������������", 100, 100))
  
       
  Else
     
     ' ���� �� �����������, �� ����������:
     ' �����������
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� �������� �� ������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100))
     '
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� ������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� ����� �� ������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� �������� �������� � ����� � � ������� ����", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� � ����� �������� ��������", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������� ����� ������ � ����", 100, 100))
     Call �����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �� ������ ���������� �� ������", 100, 100))
     
     ' ��������� ������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
     
     ' ������:
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� �������", 100, 100))
     
     ' �����:
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� �����", 100, 100))
    
     ' ����� �����-������� Capacity Model
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����� �����-������� Capacity Model", 100, 100))
     
     ' ��������� CRM (������ ����� ����-���� �� ��������� ���_���)
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� CRM", 100, 100))
     
     ' ������������ � �������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������ � �������", 100, 100))
     
     ' ����������������
     Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������������", 100, 100))
    
     
     ' ������ - ���� ������:
     ' Call setPriodReport("����3", currentOperDate)
          
     ' ����� - ���� ������:
     ' Call setPriodReport("����5", currentOperDate)
                         
  End If

  

  ' ��������� �������� �������:
  ' ������ - ���� ������
  Call setPriodReport("����3", currentOperDate)
          
  ' ����� - ���� ������
  Call setPriodReport("����5", currentOperDate)
  
  ' ����������������
  Call setPriodReport("����10", currentOperDate)
  
  ' ������������ - ���� ������ ���
  ThisWorkbook.Sheets("����12").Range("H2").Value = currentOperDate

  ' ��������� ���������� To-Do, ������ ����� �������� ��������� = 1
  ThisWorkbook.Sheets("To-Do").Range("I1").Value = 1

  ' ��������� ���������� To-Do
  Call ToDo_refresh

  ' ����������
  ThisWorkbook.Sheets("To-Do").Range("I1").Value = 0
  
  ' D7, D8 � D9
  ' ThisWorkbook.Sheets("����0").Cells(7, 4).Value = "1) DashBoard (��� �������)"
  ' Call ����������������������������("����0", "D7")
  ' Call ����������������������������("����0", "D8")
  ' Call ����������������������������("����0", "D9")
  
  ' Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  ' Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� �������", 100, 100))
  ' Call ����������������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� ������� �� �����", 100, 100))
  
  ' ��������� ������� ��� ������
  If firstDayOfWeek = True Then
    ThisWorkbook.Sheets("����0").Cells(rowByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����0", "������ ���� ������:", 100, 100) + 1).Value = "0"
  End If

  ' �������� ����������� � �� �������� �� BASE\Birthdays
  Call ��������_�����������_��

  ' �������� BackUp
  Call createBackUp

  ' ������� �� ����0
  ThisWorkbook.Sheets("����0").Activate

  ' ���������� ���������
  ThisWorkbook.Save

End Sub

' ������� �� ����0
Sub goToSheet0()
  ThisWorkbook.Sheets("����0").Select
End Sub

' ������� �� ����1 (DB)
Sub goToSheet1()
  ThisWorkbook.Sheets("����1").Select
End Sub

' ������� �� ����3 (������)
Sub goToSheet3()
  ThisWorkbook.Sheets("����3").Select
  ThisWorkbook.Sheets("����3").Range("A1").Select
End Sub

' ������� �� ����4 (������)
Sub goToSheet4()
  ThisWorkbook.Sheets("����4").Select
  ThisWorkbook.Sheets("����4").Range("A1").Select
End Sub

' ������� �� ����4 (���/���)
Sub goToSheet4_���_���()
  ThisWorkbook.Sheets("����4").Select
  ThisWorkbook.Sheets("����4").Range("L14").Select
  '
  ActiveWindow.SmallScroll Down:=11
End Sub

' ������� �� ����5 (�����)
Sub goToSheet5()
  ThisWorkbook.Sheets("����5").Select
  ThisWorkbook.Sheets("����5").Range("A1").Select
End Sub

' ������� �� Capacity (������ �������� �� ����6)
Sub goToSheet6()
  ThisWorkbook.Sheets("Capacity").Select
  ThisWorkbook.Sheets("Capacity").Range("A1").Select
End Sub

' UpdFr_DB
Sub goToSheet_UpdFr_DB()
  ThisWorkbook.Sheets("UpdFr_DB").Select
  ThisWorkbook.Sheets("UpdFr_DB").Range("A1").Select
End Sub

' ��������
Sub goToSheet_��������()
  ThisWorkbook.Sheets("��������").Select
  ThisWorkbook.Sheets("��������").Range("A1").Select
End Sub


' ������� �� ����7 (������������ ������� �� �����������)
Sub goToSheet7()
  ThisWorkbook.Sheets("����7").Select
  ThisWorkbook.Sheets("����7").Range("A1").Select
End Sub

' ������� �� ����12
Sub goToSheet12()
  ' ThisWorkbook.Sheets("����12").Select
  ' ThisWorkbook.Sheets("����12").Range("A1").Select
  ' ThisWorkbook.Sheets("����12").Range("A72").Select
  ' ThisWorkbook.Sheets("����12").Range("A40").Select

  ThisWorkbook.Sheets("����12").Select
  ThisWorkbook.Sheets("����12").Range("A1").Select
  row_�����_12_4 = rowByValue(ThisWorkbook.Name, "����12", "����� 12.4", 100, 100)
  ' ������������
  ActiveWindow.SmallScroll Down:=row_�����_12_4 - 2


End Sub

' ������� �� ����13
Sub goToSheet13()
  ThisWorkbook.Sheets("����13").Select
End Sub

' ������� �� ���� ������� (������������� � ��)
Sub goToSheet�������()
  ThisWorkbook.Sheets("�������").Select
  ThisWorkbook.Sheets("�������").Range("A1").Select
End Sub

' ������� �� ����16 (��������� CRM)
Sub goToSheet16()
  ThisWorkbook.Sheets("����16").Select
  ThisWorkbook.Sheets("����16").Range("A1").Select
End Sub

' ������� �� ���� ����
Sub goToSheet����()
  ThisWorkbook.Sheets("����").Select
  ThisWorkbook.Sheets("����").Range("A1").Select
End Sub

' ������� �� ���� ���
Sub goToSheet���()
  ThisWorkbook.Sheets("���").Select
End Sub

' ������� �� ���� ������� ���
Sub goToSheet����������()
  ThisWorkbook.Sheets("������� ���").Select
End Sub

' ������� �� ���� PL
Sub goToSheetPL()
  ThisWorkbook.Sheets("PL").Select
End Sub

' ������� �� ���� ����
Sub goToSheet����()
  ThisWorkbook.Sheets("����").Select
End Sub

' ������� �� ���� ' ���������� �� ��������� ������ � PA
Sub goToSheet��_PA()
  ThisWorkbook.Sheets("��_PA").Select
End Sub

' ������� �� ���� �������
Sub goToSheet�������()
  ThisWorkbook.Sheets("�������").Select
End Sub


' ������� �� ���� ��������
Sub goToSheet��������()
  ThisWorkbook.Sheets("��������").Select
End Sub

' ������� �� ���� ����
Sub goToSheet����()
  ThisWorkbook.Sheets("����").Select
End Sub

' ������� �� ����10 (����������������)
Sub goToSheet����10()
  ThisWorkbook.Sheets("����10").Select
End Sub

' ������� �� ����9 (�������)
Sub goToSheet����9()
  ThisWorkbook.Sheets("����9").Select
End Sub

' ������� �� ��_��
Sub goToSheet��_��()
  ThisWorkbook.Sheets("��_��").Select
End Sub

' ������� �� ��������
Sub goToSheet��������()
  ThisWorkbook.Sheets("��������").Select
End Sub

' ������� �� Addr.Book
Sub goToSheetAddrBook()
  ThisWorkbook.Sheets("Addr.Book").Select
End Sub

' ������� �� To-Do
Sub goToSheetToDo()
  ThisWorkbook.Sheets("To-Do").Select
End Sub

' ������� �� ����8 (��� �����������)
Sub goToSheet����8()
  ThisWorkbook.Sheets("����8").Select
End Sub

' �������
Sub ����_�_������()
  ' ����_�_������ ������
  Range("A1").Select
End Sub

Sub �������_��_���������()
  
  ' �������_��_��������� ������
  Range("A33").Select
  ActiveWindow.SmallScroll Down:=30
  ' ActiveWindow.SmallScroll ToRight:=8

End Sub
Sub �������_��_����������()
Attribute �������_��_����������.VB_ProcData.VB_Invoke_Func = " \n14"
  
  ' �������_��_���������� ������
  Range("R33").Select
  ActiveWindow.SmallScroll Down:=30 ' 9 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=17 ' 8 ' ���� 15

End Sub
Sub �������_��_���������������()
Attribute �������_��_���������������.VB_ProcData.VB_Invoke_Func = " \n14"
  
  ' �������_��_��������������� ������
  Range("AI33").Select
  ActiveWindow.SmallScroll Down:=30 ' 9 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=11

End Sub
Sub �������_��_���������������()
Attribute �������_��_���������������.VB_ProcData.VB_Invoke_Func = " \n14"

  ' �������_��_��������������� ������
  Range("AZ33").Select
  ActiveWindow.SmallScroll Down:=30 ' 9 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=11

End Sub

Sub �������_��_���������()
Attribute �������_��_���������.VB_ProcData.VB_Invoke_Func = " \n14"

  ' �������_��_��������� ������
  Range("BQ33").Select
  ActiveWindow.SmallScroll Down:=30 ' 9 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=11

End Sub

Sub �������_��_��()

  ' �������_��_�� ������
  Range("CH33").Select
  ActiveWindow.SmallScroll Down:=30 '9 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=12

End Sub

Sub �������_��_���()

  ' �������_��_��� ������
  Range("CY33").Select
  ActiveWindow.SmallScroll Down:=30 ' ���� 15
  ActiveWindow.SmallScroll ToRight:=12
  
End Sub


Sub �������_��_����_�������������()
  
  ' ������� �� ���� �������������
  Range("A33").Select
  ActiveWindow.SmallScroll Down:=0
  ActiveWindow.SmallScroll ToRight:=22

End Sub


' ��������� ����� �� ������: ���1, ���1
Sub �����������������i(In_Office, In_�_���, In_Value)
  ' ������ ������: 1- ������, 2 - ������, 3 - �������������, 4 - ����� ������� 5 - �����-����
  ' ���1
  
  ' ���1
  
End Sub

' ���� ��� ������������ DB
Sub notActualDB()
  ThisWorkbook.Sheets("����0").Cells(7, 4).Value = "1) �� " + CStr(Date) + " ��� ������������ DashBoard"
  ' ����������� ����� ���� �� ��������� ��������
  ' Call �����������������������("����0", "D7")
  Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
  Call goToSheet0
End Sub

Sub ���������������������������()
    ActiveSheet.ShowAllData
    Range("A1").Select
End Sub

Sub �������_��_��������_���()
  ThisWorkbook.Sheets("����").Select
  Range("A60").Select
  ActiveWindow.SmallScroll Down:=17
End Sub

Sub �������_DB_��()
  ThisWorkbook.Sheets("DB_��").Select
  Range("A1").Select
  ' ActiveWindow.SmallScroll Down:=17
End Sub

Sub �������_��()
  ThisWorkbook.Sheets("��").Select
  Range("A1").Select
  ' ActiveWindow.SmallScroll Down:=17
End Sub


' �������� ������� ��� �������� �� �����0
Sub createHashTag_n()
Dim Row_��������_�_��������, Column_��������_�_�������� As Byte

  ' "�������� � �������� "��������_���":"
  Row_��������_�_�������� = rowByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
  Column_��������_�_�������� = ColumnByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
  
  ' ������ ������
  ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value = createHashTag("n")

End Sub

' ���� - �������� ������ � �������� ��������
Sub ��������_�_��������_��������_���()
Dim �����������, �����_�_�����, Row_��������_�_��������, Column_��������_�_�������� As Byte

  ' ��� ����, ����� ������������� �� �������� ���������
  ' �����_�_����� = 15

  ' "�������� � �������� "��������_���":"
  Row_��������_�_�������� = rowByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
  Column_��������_�_�������� = ColumnByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
  
  If Trim(ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value) <> "" Then
  
    ' ���������� ������ ������
    If ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value = "" Then
      If MsgBox("������������� ������?", vbYesNo) = vbYes Then
        Call createHashTag_n
      End If
    End If
    
    ' �������� ������ � �������� ��������
    Call �������_������_�_��������("������� �.�.", _
                                     delSym(ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value), _
                                       ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value)

    ' ����������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    ' ������� �� ���� "����"
    ' i = 2
    ' �����_������� = 0
    ' Do While ThisWorkbook.Sheets("����").Cells(����������� + i, 1 + �����_�_�����).Value <> ""
    '   �����_������� = �����_������� + 1
    '   i = i + 1
    ' Loop
    ' �����_������� = �����_������� + 1
    ' ThisWorkbook.Sheets("����").Cells(����������� + i, 1 + �����_�_�����).Value = �����_�������
    ' ThisWorkbook.Sheets("����").Cells(����������� + i, 2 + �����_�_�����).Value = "������� �.�."
    ' ThisWorkbook.Sheets("����").Cells(����������� + i, 3 + �����_�_�����).Value = delSym(ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value)
    ' ThisWorkbook.Sheets("����").Cells(����������� + i, 13 + �����_�_�����).Value = ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value
    ' ThisWorkbook.Sheets("����").Cells(����������� + i, 14 + �����_�_�����).Value = 0
  
  
  
    ' ������� ���� ����� �� �����0 B13
    ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value = ""
    ' ������� ������
    ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value = ""
    
  End If
  
End Sub

' �������� ������ � �������� ��������
Sub �������_������_�_��������(In_FIO, In_Question, In_Tag)
Dim ����������� As Byte


    ����������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    ' ������� �� ���� "����"
    i = 2
    �����_������� = 0
    Do While ThisWorkbook.Sheets("����").Cells(����������� + i, 1 + �����_�_�����).Value <> ""
      �����_������� = �����_������� + 1
      i = i + 1
    Loop
    
    �����_������� = �����_������� + 1
    ThisWorkbook.Sheets("����").Cells(����������� + i, 1 + �����_�_�����).Value = �����_�������
    ' �����������
    ThisWorkbook.Sheets("����").Cells(����������� + i, 2 + �����_�_�����).Value = In_FIO ' "������� �.�."
    ' ������
    ThisWorkbook.Sheets("����").Cells(����������� + i, 3 + �����_�_�����).Value = In_Question ' delSym(ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value)
    ' ������
    ThisWorkbook.Sheets("����").Cells(����������� + i, 13 + �����_�_�����).Value = In_Tag ' ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value
    ' ����������� ���������� 0/1
    ThisWorkbook.Sheets("����").Cells(����������� + i, 14 + �����_�_�����).Value = 0


End Sub


' �������������� ������ � Addr.Book
Sub ��������������_������_AddrBook()
  
End Sub

' �����������: �������� ����� �� ��������� �������
Sub toSend_��������_�����_��_���������_�������()
Dim Range_str, �����_Ln_����, �����_Ln_����� As String
Dim Range_Row, Range_Column, i As Byte
Dim ����������, �����������, hashTag As String

  ' ������� ������
  Range_str = RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100)
  Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Row
  Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Column
  
  ' �������� - ������������ ��� ���
  If ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = "" Then
  
    ' ������
    If MsgBox("��������� �����������: �������� ���� ������ ������� ������ �� ��������� �������?", vbYesNo) = vbYes Then
    
      ' �������� ���������
      ' �����_Ln_���� = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)
      ' �����_Ln_����� = getFromAddrBook("��", 2)
      �����_Ln_���� = "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
      �����_Ln_����� = ""
      
      ' ���� ������ - ����:
      ���������� = "����� �� ��������� ������� �� ������� ������"
      ' hashTag - ������:
      hashTag = "#depositsfinish"
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "������ �����������: " + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2) + Chr(13)
      ����������� = ����������� + "�����: " + getFromAddrBook("��", 2) + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "��������� ������������," + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "����� ��������� ���������� �� ��������� ���������� �� ������� ������." + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(35) + hashTag
      
      ' �����
      ' Call send_Lotus_Notes(����������, �����_Ln_����, �����_Ln_�����, �����������, "")
      
      ' ����� � ��������� ���� � ������� �����
      Call send_Lotus_Notes2(����������, �����_Ln_����, �����_Ln_�����, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
  
      ' ���������
      MsgBox ("������ ����������!")

      ' ��������� ���� � ����� � ������ "�����������: �������� ����� �� ��������� �������" + 6
      ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = Now
      
      ' Call �����������������������("����0", "D9")
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� ����� �� ��������� �������", 100, 100))

    End If
  Else
    MsgBox ("��������! ��������� ��� ���� ���������� � " + CStr(ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value) + "!")
  End If
  
End Sub

' �����������: �������� ����� �� �������� ���� � �����
Sub toSend_��������_�����_��_������_�_�����()
  
Dim Range_str, �����_Ln_����, �����_Ln_����� As String
Dim Range_Row, Range_Column, i As Byte
Dim ����������, �����������, hashTag As String

  ' ������� ������
  Range_str = RangeByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100)
  Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Row
  Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Column
  
  ' �������� - ������������ ��� ���
  If ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = "" Then
  
    ' ������
    If MsgBox("��������� ���� ������: �������� ����� �� �������� ���� � ��?", vbYesNo) = vbYes Then
    
      ' �������� ���������
      ' �����_Ln_���� = "Vera Sizikova/Tyumen/PSBank/Ru"
      ' �����_Ln_����� = "Alla Cherneckaya/Tyumen/PSBank/Ru"
      
      �����_Ln_���� = "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
      �����_Ln_����� = ""
      
      
      ' ���� ������ - ����:
      ���������� = "����� ������ �� " + CStr(Date) + " �."
      ' hashTag - ������:
      hashTag = "#�����������"
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "������ �����������: " + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2) + Chr(13)
      ����������� = ����������� + "�����: " + getFromAddrBook("��", 2) + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "������ ����!" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "����� ��������� ���������� ������������ ������ ������ �� �������� ���� � ����������� ������ � �� �� " + CStr(Date) + " �. ��� ���������� �� ��������." + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(35) + hashTag
      
      ' ����� � ��������� ���� � ������� �����
      Call send_Lotus_Notes2(����������, �����_Ln_����, �����_Ln_�����, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
  
      ' ���������
      MsgBox ("������ ����������!")

      ' ��������� ���� � ����� � ������ "�����������: �������� ����� �� ��������� �������" + 6
      ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = Now
      
      ' Call �����������������������("����0", "D9")
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������������� �� �������� ���� � ��", 100, 100))

    End If
  Else
    MsgBox ("��������! ��������� ��� ���� ���������� � " + CStr(ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value) + "!")
  End If
  
  
End Sub

' �����������: �������� �������� �� ������
Sub toSend_��������_��������_��_������()
'
Dim Range_str, �����_Ln_����, �����_Ln_����� As String
Dim Range_Row, Range_Column, i As Byte
Dim ����������, �����������, hashTag As String

  ' ������� ������
  Range_str = RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� �������� �� ������", 100, 100)
  Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Row
  Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����0").Range(Range_str).Column
  
  ' �������� - ������������ ��� ���
  If ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = "" Then
  
    ' ������
    If MsgBox("��������� ���� ������: �����������: �������� �������� �� ������?", vbYesNo) = vbYes Then
    
      ' �������� ���������
      ' �����_Ln_���� = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)
      ' �����_Ln_����� = getFromAddrBook("��", 2)
      
      �����_Ln_���� = "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
      �����_Ln_����� = ""
      
      
      ' ���� ������ - ����:
      ���������� = "�������� ������"
      ' hashTag - ������:
      hashTag = "#��������"
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "������ �����������: " + getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2) + Chr(13)
      ����������� = ����������� + "�����: " + getFromAddrBook("��", 2) + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "��������� ������������," + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "����� ������� �� 13:00 ��������� �������� ������ � ������ � ������ � " + CStr(strDDMM(weekStartDate(Date))) + " �� " + CStr(weekEndDate(Date)) + " �." + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(35) + hashTag
      
      ' ����� � ��������� ���� � ������� �����
      Call send_Lotus_Notes2(����������, �����_Ln_����, �����_Ln_�����, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
  
      ' ���������
      MsgBox ("������ ����������!")

      ' ��������� ���� � ����� � ������ "�����������: �������� ����� �� ��������� �������" + 6
      ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value = Now
      
      ' Call �����������������������("����0", "D9")
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "�����������: �������� �������� �� ������", 100, 100))

    End If
  
  Else
    MsgBox ("��������! ��������� ��� ���� ���������� � " + CStr(ThisWorkbook.Sheets("����0").Cells(Range_Row, Range_Column + 6).Value) + "!")
  End If
  
  
End Sub

' ������� ����� � ������
Sub createBackUp_withMsgBox()
    ' ������
    If MsgBox("������� BackUp � ��������� � �����?", vbYesNo) = vbYes Then
      
      ' ����� ���������
      Call createBackUp
      
      ' ���������
      MsgBox ("������ � ������ " + Dir(backUpFileName) + " ����������!")

    End If

End Sub

' ������� ����� � ������
Sub createBackUp()
Dim attachmentFile As String
      
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ��� BackUp �����
      backUpFileName = ThisWorkbook.Path + "\BackUp\DB_Result_" + str��_MM_YYYY(Date) + ".xlsm"
    
      ' ������ �������
      Application.StatusBar = "BackUp: �������� ����� " + Dir(backUpFileName) + "..."
    
      ' ��������� ������� ��������� � �����
      ThisWorkbook.SaveCopyAs FileName:=backUpFileName

      ' ��������� ��������� ����� �����
      ' Shell ("C:\Program Files\7-Zip\7z a -tzip -ssw -mx9 C:\Users\PROSCHAEVSF\Documents\#DB_Result\db_result.zip C:\Users\PROSCHAEVSF\Documents\#DB_Result")

      ' ������ �������
      Application.StatusBar = "BackUp: ����� " + Dir(backUpFileName) + "�������!"

      ' �������� ��������� ���������
      ' ������ �������
      Application.StatusBar = "BackUp: ���������� ��������� LotusNotes..."
      ' ����-��������
      attachmentFile = backUpFileName
      ' ��������� ���������
      �����_Ln_���� = "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru"
      �����_Ln_����� = ""
      ' ���� ������ - ����:
      ���������� = "BackUp DB_Result �� " + str��_MM_YYYY(Date) + " �."
      ' hashTag - ������:
      hashTag = "#BackUp #BackUp_DB_Result_" + strDDMMYYYY(Date) + " #�����������"
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "����� DB_Result �� " + CStr(Date) + " �." + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(35) + hashTag
      ' ������ �������
      Application.StatusBar = "BackUp: �������� ��������� � LotusNotes..."
      Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
      ' ������ �������
      Application.StatusBar = "BackUp: ��������� � LotusNotes ����������!"
                
      ' ������ �������
      Application.StatusBar = "BackUp: �������� ����� ���������"

    
End Sub
