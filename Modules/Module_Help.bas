Attribute VB_Name = "Module_Help"
' *** ���� "����������" ***

' ������� InStr https://docs.microsoft.com/ru-ru/office/vba/language/reference/user-interface-help/instr-function
' InStr([ ������ ], ������1_���_����, ������2_���_����, [ ��������� ])

' � �����, ����� ���������� ����� ������:
' 1) ���������� ������, � ������ ������ ����� ������� ������� ������ ������. �������� ����� Character Map.
' 2) � ������� VBA ����� ������� ? AscW(ActiveCell.Text) �������� ��� ����� ������� ��� ��� �������� VBA (��� ������� �������������� ����� � ������ Arial ��� ����� 9552)
' ����� ��� ��� ����� �������� ActiveCell.Value = String(10, ChrW(9552))
'    ����������� = ����������� + "" + Chr(13)
'    ����������� = ����������� + "" + ChrW(9484) + ChrW(9472) + ChrW(9472) + ChrW(9516) + Chr(13)
'    ����������� = ����������� + "" + ChrW(9474) + "1. " + ChrW(9474) + Chr(13)

' Function �������() As String => "

