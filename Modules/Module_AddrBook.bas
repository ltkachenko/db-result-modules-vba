Attribute VB_Name = "Module_AddrBook"
' Addr.Book

' �������� ������ ������� ���+�������
Sub list_creation_1()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� ������ ������� ���+�������+���+��
Sub list_creation_2()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� ������ ������� ���+�������+���+��+���
Sub list_creation_3()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� ������ ������� ���
Sub list_creation_���()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("����,����,���", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� ������ ������� ��
Sub list_creation_��()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("����,���,������", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� ������ ������� ���� ��
Sub list_creation_����_��()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column
  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���,����,���,������", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub

' �������� �����: ���������� ������
Sub createNumberingAddrBook()
Dim �����������_��������_�����, rowCount As Integer

  �����������_��������_����� = ThisWorkbook.Sheets("Addr.Book").Range(RangeByValue(ThisWorkbook.Name, "Addr.Book", "�������� �����", 100, 100)).Row
  rowCount = 1
  Do While ThisWorkbook.Sheets("Addr.Book").Cells(�����������_��������_����� + 4 + rowCount, 2).Value <> ""
    
    ThisWorkbook.Sheets("Addr.Book").Cells(�����������_��������_����� + 4 + rowCount, 1).Value = rowCount
    
    ' ��������� ������
    rowCount = rowCount + 1
  
  Loop

End Sub

' �������� ������ �������� ���
Sub list_creation_��������_���()
'
Dim ������_�����������_Range_str As String
Dim ������_�����������_Range_Row, ������_�����������_Range_Column As Byte

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column

  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = getFromAddrBook("����", 2)
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy

End Sub


' ���������� ����� ���������� � �����
Sub ����������_�����_����������()
      
      
  ' �������� ������ � ������ ������
  ' ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 5).Copy

  ' ������� ������ (�������� G41), � ������� �������� �������� In_�_���
  ������_�����������_Range_str = RangeByValue(ThisWorkbook.Name, "Addr.Book", "������ �����������:", 100, 100)
  ������_�����������_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Row
  ������_�����������_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("Addr.Book").Range(������_�����������_Range_str).Column
  '
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Value = ThisWorkbook.Sheets("Addr.Book").Cells(ActiveCell.Row, 10).Value
  ThisWorkbook.Sheets("Addr.Book").Cells(������_�����������_Range_Row, ������_�����������_Range_Column + 1).Copy


End Sub

