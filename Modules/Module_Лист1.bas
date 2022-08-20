Attribute VB_Name = "Module_����1"
' ��������� ������ � ������� BASE\Mortgage
Function Insert_To_Table_Mortgage(In_�����_����������_��������, In_Date_iss, In_������_������, In_����_�������, In_CREDIT_PROGRAMM_OTHER, In_��������������_�����, In_���������, In_�����_��������_������, In_�����_������_���_����, In_CLIENT_ID, In_FIO, In_�����_��_���_�����_������, In_�����_�������_�_�������, In_������������_��������, In_���, In_��������_��������, In_���_��������, In_������_��������, In_������, In_������, In_����, In_��������_��_���������)
  
  ' ��������� � ����� Mortgage
  Workbooks("Mortgage").Activate
  Sheets("����1").Select
    
  ' ��������� �����
  Set �����_������_�������� = Columns("A:A").Find(In_�����_����������_��������, LookAt:=xlWhole)
  ' ��������� - ���� �� ����� ��������� ������ � Mortgage, ���� ���, �� ���������
  If �����_������_�������� Is Nothing Then
    ' ���� �� ������
    Workbooks("Mortgage").Sheets("����1").Rows("2:2").Select
    Selection.Insert Shift:=xlDown
    RowNumber = 2
  Else
    ' ���� ������, �� ���������� ������
    RowNumber = �����_������_��������.Row
  End If
  
  ' � ����������� ������ ���������� ������ ���� ������� �� ��� ������ ��� ��������� ���� ���� ����� ����� �������� �� ���������
  If (�����_������_�������� Is Nothing) Or (In_��������_��_��������� = True) Then
    ' � ���������� ��������
    Range("A" + CStr(RowNumber)).Value = In_�����_����������_��������
    ' Date_iss
    Range("B" + CStr(RowNumber)).Value = In_Date_iss
    ' ������ ������
    Range("C" + CStr(RowNumber)).Value = In_������_������
    ' ���� ������� (���)
    Range("D" + CStr(RowNumber)).Value = In_����_�������
    ' CREDIT_PROGRAMM_OTHER
    Range("E" + CStr(RowNumber)).Value = In_CREDIT_PROGRAMM_OTHER
    ' �������������� �����
    ' Range("F" + CStr(RowNumber)).Value = Round(In_��������������_����� / 1000, 3)
    Range("F" + CStr(RowNumber)).Value = In_��������������_�����
    ' ��������� (��� ��)
    ' Range("G" + CStr(RowNumber)).Value = Round(In_��������� / 1000, 3)
    Range("G" + CStr(RowNumber)).Value = In_���������
    ' ����� �������� ������
    Range("H" + CStr(RowNumber)).Value = In_�����_��������_������
    ' ����� ������_��� ����
    ' Range("I" + CStr(RowNumber)).Value = Round(In_�����_������_���_����, 3)
    Range("I" + CStr(RowNumber)).Value = In_�����_������_���_����
    ' CLIENT_ID
    Range("J" + CStr(RowNumber)).Value = In_CLIENT_ID
    ' FIO
    Range("K" + CStr(RowNumber)).Value = In_FIO
    ' ����� �� ���. ����� ������
    Range("L" + CStr(RowNumber)).Value = In_�����_��_���_�����_������
    ' ����� ������� � �������
    Range("M" + CStr(RowNumber)).Value = In_�����_�������_�_�������
    ' ���
    Range("N" + CStr(RowNumber)).Value = In_���
    ' ������������ ��������
    Range("O" + CStr(RowNumber)).Value = In_������������_��������
    ' �������� ��������
    Range("P" + CStr(RowNumber)).Value = In_��������_��������
    ' ��� ��������
    Range("Q" + CStr(RowNumber)).Value = In_���_��������
    ' ������ ��������
    Range("R" + CStr(RowNumber)).Value = In_������_��������
    ' ������
    Range("S" + CStr(RowNumber)).Value = In_������
    ' ������
    Range("T" + CStr(RowNumber)).Value = In_������
    ' ����
    Range("U" + CStr(RowNumber)).Value = In_����

  End If
  
  ' ������� � ����� DB_Result
  ThisWorkbook.Activate
  ThisWorkbook.Sheets("����2").Select
  
End Function

' � ��������� ML ����� ����� �� ����������� (����� ������) - ������� ��� � ���� �������
Function �����_�_�����_������_��_�����������_2(In_MLName, In_�������_���, In_count_�������_���, In_�������_�����, In_�������_�����������_������������, In_���������_������)
  
  ' ��������� ������������ ������/��������� ����� ��������
  If In_���������_������ = False Then
    
    ' ���� ��������� ������
    ' ��������� - ���� ��������� ������ ���� �������� � �����?
    If In_�������_��� <> "" Then
        ThisWorkbook.Sheets("����2").Range("B" + CStr(In_�������_�����)).Value = In_�������_���
      Else
        ThisWorkbook.Sheets("����2").Range("B" + CStr(In_�������_�����)).Value = "��� ���"
    End If
  
    ' ��������� ������������ �����������
    If In_�������_�����������_������������ <> "" Then
        ThisWorkbook.Sheets("����2").Range("C" + CStr(In_�������_�����)).Value = In_�������_�����������_������������
      Else
        ThisWorkbook.Sheets("����2").Range("C" + CStr(In_�������_�����)).Value = "�� ���������� �� ���"
    End If
  
    ThisWorkbook.Sheets("����2").Range("D" + CStr(In_�������_�����)).Value = CStr(In_count_�������_���)
        
  Else
    ' ���� ������ ���������
        
  End If
        
End Function


' � ��������� ML ����� ����� �� ����������� (����� ������)
Function �����_�_�����_������_��_�����������(In_MLName, In_�������_���, In_count_�������_���, In_�������_�����, In_�������_�����������_������������)

   ' ������� ��������, ������ ���� � �������������� ������� ����� �����������
   
   ' ��������� � ���� �������� ����� DB_Result
   ThisWorkbook.Activate
   ThisWorkbook.Sheets("����2").Select

  ' ���������� �� ����� ������ �� �����������:
  ' ��������� - ������ 10
  If In_count_�������_��� = 1 Then
    ' ���������� ������
    ThisWorkbook.Sheets("����2").Rows("10:10").Select
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
    In_�������_����� = 10
  End If
  
  ' 2 � ����� - ������ 5
  If In_count_�������_��� > 1 Then
    ' ���������� ������
    ThisWorkbook.Sheets("����2").Rows("5:5").Select
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
    In_�������_����� = 5
  End If
  
  ' ��������� - ���� ��������� ������ ���� �������� � �����?
  If In_�������_��� <> "" Then
      ThisWorkbook.Sheets("����2").Range("B" + CStr(In_�������_�����)).Value = In_�������_���
    Else
      ThisWorkbook.Sheets("����2").Range("B" + CStr(In_�������_�����)).Value = "��� ���"
  End If
  
  ThisWorkbook.Sheets("����2").Range("C" + CStr(In_�������_�����)).Value = In_�������_�����������_������������
  ThisWorkbook.Sheets("����2").Range("D" + CStr(In_�������_�����)).Value = CStr(In_count_�������_���)
    
  ' ������������ ����� � ����� ML �� ���� 1 - ��������� � ML-����
  Workbooks(In_MLName).Activate
  Sheets("����1").Select
      
End Function


' ��� ������� �� ������ $BK$25
Function ������������_�������(In_�����_������ As String) As String
  ' ������������_������� = In_�����_������
  �������_�������_�����_$ = InStr(In_�����_������, "$")
  �������_�������_�����_$ = �������_�������_�����_$ + InStr(Mid(In_�����_������, �������_�������_�����_$ + 1, Len(In_�����_������) - �������_�������_�����_$), "$")
  ������������_������� = Mid(In_�����_������, �������_�������_�����_$ + 1, �������_�������_�����_$ - �������_�������_�����_$ - 1)
End Function


' �������� - ���� �� ����� ������� ������� � �����?
Function PivotExist(Name As String) As Boolean
  Dim sh As Worksheet
  Dim pt As PivotTable
  PivotExist = False
  For Each sh In ActiveWorkbook.Worksheets
      For Each pt In sh.PivotTables
          If pt.Name = Name Then
              PivotExist = True
              Exit For
          End If
      Next
  Next
  
   ' ���� �������� ������� ��� ���� �������
   ' If PivotExist = True Then
   
   ' MyFile1 = "PivotTables.txt"
   ' Open MyFile1 For Output As #1
   ' Print #1, "--- ������� " + Name + "---"
   ' For Each pvtField In ActiveSheet.PivotTables(Name).PivotFields
   '   Print #1, "��� ����: " + pvtField.Name
   ' Next pvtField
   ' Close #1
   '
   ' End If
     
End Function

' �������� ������� ����� � �������� ������ � ����� (������ �� ��������, ������������ �� �����1)
Function Sheets_Exist(wb As Workbook, sName As String) As Boolean
    Dim wsSh As Worksheet
    On Error Resume Next
    Set wsSh = wb.Sheets(sName)
    Sheets_Exist = Not wsSh Is Nothing
End Function

' ��� ����� ��� ���������� � ����
Function FileName_WithOutExt(In_fileName As String) As String
  In_fileName = Dir(In_fileName)
  FileName_WithOutExt = Mid(In_fileName, InStr(In_fileName, ".") + 1, Len(In_fileName) - InStr(In_fileName, "."))
End Function


' ���������� ����� ����������� ��������
Function ����������_�����(In_����� As String) As String
  ����������_����� = ""
  ' In_�����
  If In_����� = "A" Then
    ����������_����� = "Z"
  End If
  If In_����� = "B" Then
    ����������_����� = "A"
  End If
  If In_����� = "C" Then
    ����������_����� = "B"
  End If
  If In_����� = "D" Then
    ����������_����� = "C"
  End If
  If In_����� = "E" Then
    ����������_����� = "D"
  End If
  If In_����� = "F" Then
    ����������_����� = "E"
  End If
  If In_����� = "G" Then
    ����������_����� = "F"
  End If
  If In_����� = "H" Then
    ����������_����� = "G"
  End If
  If In_����� = "I" Then
    ����������_����� = "H"
  End If
  If In_����� = "J" Then
    ����������_����� = "I"
  End If
  If In_����� = "K" Then
    ����������_����� = "J"
  End If
  If In_����� = "L" Then
    ����������_����� = "K"
  End If
  If In_����� = "M" Then
    ����������_����� = "L"
  End If
  If In_����� = "N" Then
    ����������_����� = "M"
  End If
  If In_����� = "O" Then
    ����������_����� = "N"
  End If
  If In_����� = "P" Then
    ����������_����� = "O"
  End If
  If In_����� = "Q" Then
    ����������_����� = "P"
  End If
  If In_����� = "R" Then
    ����������_����� = "Q"
  End If
  If In_����� = "S" Then
    ����������_����� = "R"
  End If
    
End Function

' ��������� ����� ����� ��� ���� c:\1.txt => 1.txt
Function getFName(pf As String) As String
  If InStrRev(pf, "\") <> 0 Then
    getFName = Mid(pf, InStrRev(pf, "\") + 1)
  Else
    getFName = pf
  End If
End Function

' ������� ������ ������ "��������"
Sub Full_Color_Range(In_list, In_Range, In_Value)
  In_Value = In_Value * 100
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = xlNone
  ' ���� ������ - ������
  ThisWorkbook.Sheets(In_list).Range(In_Range).Font.Color = vbBlack
  ' �� 100% � ���� - �������
  If (In_Value >= 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbGreen
  End If
  ' �� 90%-100% - ������
  If (In_Value >= 90) And (In_Value < 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbYellow
  End If
  ' �� 0% - 90% - �������
  If (In_Value < 90) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbRed
  End If
End Sub

' ������� ������ ������ "��������" ��� ������������� �������� - �� 50% ������� �� 100% ������, �� 100% �������
Sub Full_Color_Range_For_Int_Rating(In_list, In_Range, In_Value)
  In_Value = In_Value * 100
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = xlNone
  ' ���� ������ - ������
  ThisWorkbook.Sheets(In_list).Range(In_Range).Font.Color = vbBlack
  ' �� 100% � ���� - �������
  If (In_Value >= 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbGreen
  End If
  ' �� 90%-100% - ������
  If (In_Value >= 50) And (In_Value < 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbYellow
  End If
  ' �� 0% - 90% - �������
  If (In_Value < 50) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = vbRed
  End If
End Sub


' ������� ������ ������ ������ "��������"
Sub Full_Color_Text(In_list, In_Range, In_Value)
  In_Value = In_Value * 100
  ' ���� �� ����� ������ ���� ������� - ���������� ����
  ThisWorkbook.Sheets(In_list).Range(In_Range).Interior.Color = xlNone
  ' �� 100% � ���� - �������
  If (In_Value >= 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Font.Color = vbGreen
  End If
  ' �� 90%-100% - ������
  If (In_Value >= 90) And (In_Value < 100) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Font.Color = vbYellow
  End If
  ' �� 0% - 90% - �������
  If (In_Value < 90) Then
    ThisWorkbook.Sheets(In_list).Range(In_Range).Font.Color = vbRed
  End If
End Sub

' ��������� ������ "��������"
Sub Set_Color_circle(In_list, In_Range)
    ' ������ DB �� ������� �������� ������
    Range("C17").Select
    ' ���� �����������
    Selection.Copy
    ' �������� ���� ����������
    Range("D10").Select
    ' ���� �������
    Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, _
        SkipBlanks:=False, Transpose:=False
    Application.CutCopyMode = False
End Sub



' ���������� � ������ ������ ������
Function ����������_������_���_������_������(In_���_����_�������, In_FIO_Name, In_������_���_������_������) As String
  If In_���_����_������� >= 1 Then
        If In_������_���_������_������ <> "" Then
          In_������_���_������_������ = In_������_���_������_������ + ", " + In_FIO_Name
        Else
          In_������_���_������_������ = In_FIO_Name
        End If
  End If
  ' ���������
  ����������_������_���_������_������ = In_������_���_������_������
End Function

' ���������� � ������ ������ ��� � ����������� ������
Function ����������_������_���_�_�����������_������(In_���_����_�������, In_FIO_Name, In_������_���_�_�����������_������) As String
      
      If In_���_����_������� = 0 Then
         If In_������_���_�_�����������_������ <> "" Then
           In_������_���_�_�����������_������ = In_������_���_�_�����������_������ + ", " + In_FIO_Name
        Else
          In_������_���_�_�����������_������ = In_FIO_Name
        End If
      End If
      
      ' ���������
      ����������_������_���_�_�����������_������ = In_������_���_�_�����������_������
      
End Function


' �������������� ������ � ����� ������������_�������_��_�����������
Sub ������������_�������_��_�����������(In_DBstrName As String)

' ����������
Dim KuratorVar, FIO_Name, Office2_Name As String
' ���� ���������� �����������
Dim ���_��_����_�������, ���_���������_�_��_����_�������, ���_��_����_�������, ���_��_����_�������, ���_��_����_�������, ���_��_����_�������, ���_���_����_�������, ���_���_����_�������, ���_��_����_�������, ���_��_����_�������, ���_���_����_�������, ������������_�������_������� As Double
' ������ ������
Dim ������_���_������_������_��, ������_���_������_������_�����������, ������_���_������_������_��, ������_���_������_������_��, ������_���_������_������_���, ������_���_������_������_���  As String
' ���������� ������
Dim ������_���_�_�����������_������_��, ������_���_�_�����������_������_�����������, ������_���_�_�����������_������_KK, ������_���_�_�����������_������_�K, ������_���_�_�����������_������_���, ������_���_�_�����������_������_��� As String
' ������ ������
Dim RowToPrint As Byte
' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' �������_�_������������_���������
Dim �������_���_������_�����_������, �������_���_DP3_�����_������_�����_������, �������_��2_DP4_�����_������_�����_������, �������_�_������������_���������_������_�����_������, �������_��_����_������_�����_������, �������_���_���������_�_��_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_���_����_������_�����_������, �������_���_���_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_��_����_������_�����_������, �������_���_���_����_������_�����_������ As String

  Application.StatusBar = "������������_�������_��_����������� ..."
  
  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "4. ������������ ���-� �� ������"
  Sheets("4. ������������ ���-� �� ������").Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then

    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_���_����_����_1_log.txt"
    Open MyFile1 For Output As #1

    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_���_����_����_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2

  End If
  
  ' ������������� ����������
  ' ��� ������ 072?
  ThiStringIs072 = False
  ' ������� ���
  CountMRK = 0
  ' ������������ �����
  Office2_Name = ""
  ' ��� ����������
  FIO_Name = ""
  ' ����� � ��� ���� ������
  �����_������_�_���_���������� = False
  
  ' ��������� �������
  ������_���_������_������_�� = ""
  ������_���_�_�����������_������_�� = ""
  ������_���_������_������_����������� = ""
  ������_���_�_�����������_������_����������� = ""
  ������_���_������_������_�� = ""
  ������_���_�_�����������_������_�� = ""
  ������_���_������_������_�� = ""
  ������_���_�_�����������_������_�� = ""
  ������_���_������_������_��� = ""
  ������_���_�_�����������_������_��� = ""
  ������_���_������_������_��� = ""
  ������_���_�_�����������_������_��� = ""

  ' ������� ������ ����� ������
  �������_�_������������_���������_������_�����_������ = ""
  �������_���_������_�����_������ = ""
  �������_���_DP3_�����_������_�����_������ = ""
  �������_��2_DP4_�����_������_�����_������ = ""
  �������_��_����_������_�����_������ = ""
  �������_���_���������_�_��_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_���_����_������_�����_������ = ""
  �������_���_���_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_��_����_������_�����_������ = ""
  �������_���_���_����_������_�����_������ = ""
  
  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then
    
        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If
    
        ' ������� � ������� ����� ���������� �� ������
        ' ThisWorkbook.Sheets("����1").Range("A2").Value = Workbooks("Dashboard_new_��_25.09.2019.xlsm").Sheets("1. ������������ �������").Range("A1")
     
        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
      
        ' ���� ����� ������� �, �� �������, ��� ������ �� "��������� ��1"
        If Mid(Cell.Address, 1, 3) = "$A$" Then
            ' ���� �� ��������� OO1
            ThiStringIs072 = False
            ' �����_������_�_���_����������
            �����_������_�_���_���������� = False
        End If
            
        ' ���� ����� ������ $B$XXX - ������ ��� ���, ���������� � ���������� (��� ������ �����). ������������ ������� "���"
        ' If Mid(cell.Address, 1, 3) = "$B$" Then
        ' If Mid(cell.Address, 1, 3) = �������_���_������_�����_������ Then
        If ������������_�������(Cell.Address) = �������_���_������_�����_������ Then
          FIO_Name = CStr(Cells(intR, intC).Value)
        End If
                        
        ' ���� ��� ������� D ("��������� ��1"). ������������ ������� "DP3_�����". �������_���_DP3_�����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$D$") Then
        ' If (Mid(cell.Address, 1, 3) = �������_���_DP3_�����_������_�����_������) Then
        If ������������_�������(Cell.Address) = �������_���_DP3_�����_������_�����_������ Then
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            ' ���� ���� ��������� OO1
            ThiStringIs072 = True
            ' �������
            CountMRK = CountMRK + 1
            ' �����_������_�_���_����������
            �����_������_�_���_���������� = True
          Else
            ' ���� ���� �� ��������� OO1
            ThiStringIs072 = False
          End If
        End If
    
        ' ���� ����� ������ $E$X - ������ ��� ���� ������� ������. ������������ ������� "DP4_�����". �������_��2_DP4_�����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$E$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 3) = �������_��2_DP4_�����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_��2_DP4_�����_������_�����_������) And (ThiStringIs072 = True) Then
          Office2_Name = CStr(Cells(intR, intC).Value)
          ThisWorkbook.Sheets("����1").Range("O" + CStr(9 + CountMRK)).Value = cityOfficeName(Office2_Name)
        End If
        
        ' === ���� ������ ����������� �� DB � ��� ����� ===
    
        ' ������� � ��� ����� � � ��� ����������
        If (�����_������_�_���_���������� = True) And (ThiStringIs072 = True) Then
          ThisWorkbook.Sheets("����1").Range("A" + CStr(9 + CountMRK)).Value = CountMRK
          ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK)).Value = �������_�_���(FIO_Name, 3)
          �����_������_�_���_���������� = False
        End If
        
    
        ' 1 ����������: ���� ����� ������ $J$8 - ������ ��� ��_����. ������������ �������: "����_��, ���. ���.". �������_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$J$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 3) = �������_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK))
          ' ����� ���� �� ��
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������_���_������_������_�� = ""
          ������_���_������_������_�� = ����������_������_���_������_������(���_��_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_��)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_�� = ����������_������_���_�_�����������_������(���_��_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_��)
        End If

        ' 2 ����������: ���� ����� ������ $O$8 - ������ ���_���������_�_��_����_�������. ������������ �������: "% ���_��������� � ��_����". �������_���_���������_�_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$O$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 3) = �������_���_���������_�_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_���������_�_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("D" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(9 + CountMRK))
          ' ����� ���_���������_�_��_����_�������
          ���_���������_�_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(9 + CountMRK)).Value = ���_���������_�_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "D" + CStr(9 + CountMRK), ���_���������_�_��_����_�������)
          ' ������_���_������_������_����������� = ""
          ������_���_������_������_����������� = ����������_������_���_������_������(���_���������_�_��_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_�����������)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_����������� = ����������_������_���_�_�����������_������(���_���������_�_��_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_�����������)
        End If

        ' 3 ����������: ���� ����� ������ $T$8 - ������ ���_��_����_�������. ������������ �������: "% ���_�� _����". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$T$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 3) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("E" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(9 + CountMRK))
          ' ����� ���_��_����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "E" + CStr(9 + CountMRK), ���_��_����_�������)
          ' ������_���_������_������_�� = ""
          ������_���_������_������_�� = ����������_������_���_������_������(���_��_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_��)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_KK = ����������_������_���_�_�����������_������(���_��_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_KK)
        End If
 
        ' 4 ����������: ���� ����� ������ $Y$8 - ������ ���_��_����_�������. ������������ �������: "% ���_�� _����". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 3) = "$Y$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 3) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("F" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(9 + CountMRK))
          ' ����� ���_�� _����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "F" + CStr(9 + CountMRK), ���_��_����_�������)
          ' ������_���_������_������ = ""
          ������_���_������_������_�� = ����������_������_���_������_������(���_��_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_��)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_�K = ����������_������_���_�_�����������_������(���_��_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_�K)
         End If

        ' 5 ����������: ���� ����� ������ $AD$8 - ������ ���_��_����_�������. ������������ �������: "% ���_�� _����". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$AD$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("G" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(9 + CountMRK))
          ' ����� ���_��_����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "G" + CStr(9 + CountMRK), ���_��_����_�������)
        End If

        ' 6 ����������: ���� ����� ������ $AI$8 - ������ ���_��_����_�������. ������������ �������: "% ���_�� _����". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$AI$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("H" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(9 + CountMRK))
          ' ����� ���_��_����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "H" + CStr(9 + CountMRK), ���_��_����_�������)
        End If

        ' 7 ����������: ���� ����� ������ $AN$8 - ������ ���_���_����_�������. ������������ �������: "% ���_ ���_����". �������_���_���_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$AN$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("I" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(9 + CountMRK))
          ' ����� ���_���_����_�������
          ���_���_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(9 + CountMRK)).Value = ���_���_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "I" + CStr(9 + CountMRK), ���_���_����_�������)
          ' ������_���_������_������ = ""
          ������_���_������_������_��� = ����������_������_���_������_������(���_���_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_���)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_��� = ����������_������_���_�_�����������_������(���_���_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_���)
        End If

        ' 8 ����������: ���� ����� ������ $AS$8 - ������ ���_���_����_�������. ������������ �������: "% ���_���_����". �������_���_���_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$AS$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("J" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(9 + CountMRK))
          ' ����� ���_���_����_�������
          ���_���_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(9 + CountMRK)).Value = ���_���_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "J" + CStr(9 + CountMRK), ���_���_����_�������)
          ' ������_���_������_������ = ""
          ������_���_������_������_��� = ����������_������_���_������_������(���_���_����_�������, �������_�_���(FIO_Name, 1), ������_���_������_������_���)
          ' ������_���_�_�����������_������
          ������_���_�_�����������_������_��� = ����������_������_���_�_�����������_������(���_���_����_�������, �������_�_���(FIO_Name, 2), ������_���_�_�����������_������_���)
        End If

        ' 9 ����������: ���� ����� ������ $AX$8 - ������ ���_��_����_�������. ������������ �������: "% ���_�� _����". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$AX$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("K" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("K" + CStr(9 + CountMRK))
          ' ����� ���_��_����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("K" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "K" + CStr(9 + CountMRK), ���_��_����_�������)
        End If

        ' 10 ����������: ���� ����� ������ $BC$8 - ������ ���_��_����_�������. ������������ �������: "% ���_ ��". �������_���_��_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$BC$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_��_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("L" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("L" + CStr(9 + CountMRK))
          ' ����� ���_��_����_�������
          ���_��_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("L" + CStr(9 + CountMRK)).Value = ���_��_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "L" + CStr(9 + CountMRK), ���_��_����_�������)
        End If

        ' 11 ����������: ���� ����� ������ $BH$8 - ������ ���_���_����_�������. ������������ �������: "% ���_ ���". �������_���_���_����_������_�����_������
        ' If (Mid(cell.Address, 1, 4) = "$BH$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_���_���_����_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("M" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("M" + CStr(9 + CountMRK))
          ' ����� ���_���_����_�������
          ���_���_����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("M" + CStr(9 + CountMRK)).Value = ���_���_����_�������
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "M" + CStr(9 + CountMRK), ���_���_����_�������)
        End If

        ' 12 ����������: ���� ����� ������ $BK$8 - ������ ������������_�������_�������
        ' If (Mid(cell.Address, 1, 4) = "$BK$") And (ThiStringIs072 = True) Then
        ' If (Mid(cell.Address, 1, 4) = �������_�_������������_���������_������_�����_������) And (ThiStringIs072 = True) Then
        If (������������_�������(Cell.Address) = �������_�_������������_���������_������_�����_������) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ThisWorkbook.Sheets("����1").Range("N" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          ' Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("N" + CStr(9 + CountMRK))
            
          ' ����� ������������_�������_�������
          ������������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("N" + CStr(9 + CountMRK)).Value = ������������_�������_�������
            
          ' ������ ���� ������ � ������ � ���������
          ' Call Full_Color_Text("����1", "N" + CStr(9 + CountMRK), ������������_�������_�������)
          Call Full_Color_Range_For_Int_Rating("����1", "N" + CStr(9 + CountMRK), ������������_�������_�������)
      
        End If
        
        ' --- ������ ������� �������� ������ ����� ������ ---
        ' ������� ������� "������������ �������"
        If (CStr(Cells(intR, intC).Value) = "������������ �������") And (�������_�_������������_���������_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "������ �������_�_������������_���������_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_�_������������_���������_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_�_������������_���������_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_�_������������_���������_������_�����_������: " + �������_�_������������_���������_������_�����_������
          End If
        End If

        ' �������_���_������_�����_������ If Mid(cell.Address, 1, 3) = "$B$" Then
        If (CStr(Cells(intR, intC).Value) = "���") And (�������_���_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "������ �������_���_������_�����_������"
          End If
          ' ����� ������� � �������
          
          ' �������_���_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_���_������_�����_������ = ������������_�������(Cell.Address)
        
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_������_�����_������: " + �������_���_������_�����_������
          End If
        End If
        
        ' �������_���_DP3_�����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$D$") Then
        If (CStr(Cells(intR, intC).Value) = "DP3_�����") And (�������_���_DP3_�����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_DP3_�����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_DP3_�����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_���_DP3_�����_������_�����_������ = ������������_�������(Cell.Address)
          
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_DP3_�����_������_�����_������: " + �������_���_DP3_�����_������_�����_������
          End If
        End If
                
        ' �������_��2_DP4_�����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$E$") And (ThiStringIs072 = True) Then
        If (CStr(Cells(intR, intC).Value) = "DP4_�����") And (�������_��2_DP4_�����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_��2_DP4_�����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_��2_DP4_�����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_��2_DP4_�����_������_�����_������ = ������������_�������(Cell.Address)
          
          If �����������_�_���������_����� = True Then
            Print #1, "�������_��2_DP4_�����_������_�����_������: " + �������_��2_DP4_�����_������_�����_������
          End If
        End If

        ' �������_��_����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$J$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_��_����") And (�������_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_��_����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_��_����_������_�����_������ = ������������_�������(Cell.Address)
          
          If �����������_�_���������_����� = True Then
            Print #1, "�������_��_����_������_�����_������: " + �������_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_���������_�_��_����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$O$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_��������� � ��_����") And (�������_���_���������_�_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���������_�_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_���������_�_��_����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_���_���������_�_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���������_�_��_����_������_�����_������: " + �������_���_���������_�_��_����_������_�����_������
          End If
        End If

        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$T$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_�� _����") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If

        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 3) = "$Y$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_�� _����") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 3)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$AD$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_�� _����") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$AI$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_�� _����") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_���_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$AN$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_ ���_����") And (�������_���_���_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_���_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_���_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������: " + �������_���_���_����_������_�����_������
          End If
        End If
        
        ' �������_���_���_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$AS$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_���_����") And (�������_���_���_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_���_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_���_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������: " + �������_���_���_����_������_�����_������
          End If
        End If
        
        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$AX$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_�� _����") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_��_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$BC$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_ ��") And (�������_���_��_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_��_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_��_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_��_����_������_�����_������: " + �������_���_��_����_������_�����_������
          End If
        End If
        
        ' �������_���_���_����_������_�����_������ If (Mid(cell.Address, 1, 4) = "$BH$") And (ThiStringIs072 = True) Then
        If (Trim(CStr(Cells(intR, intC).Value)) = "% ���_ ���") And (�������_���_���_����_������_�����_������ = "") Then
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������"
          End If
          ' ����� ������� � �������
          ' �������_���_���_����_������_�����_������ = Mid(cell.Address, 1, 4)
          �������_���_���_����_������_�����_������ = ������������_�������(Cell.Address)
          If �����������_�_���������_����� = True Then
            Print #1, "�������_���_���_����_������_�����_������: " + �������_���_���_����_������_�����_������
          End If
        End If
        
        ' --- ����� ������ ������� �������� ������ ����� ������ ---

        ' ==== ��������� ��������� ������ ====
    
        ' ���� � ������� D ��� "��������� ��1", �� ���������� ������ �� ����� ����� � ����������
        If (ThiStringIs072 = True) Then
      
          ' �����������
          If �����������_�_���������_����� = True Then
            ' ������� ������ � ������
            Print #2, Cell.Address, CStr(CountMRK) + "." + FIO_Name + ":" + Cell.Formula
          End If
      
        End If
        
        ' ����� �� ����� ��� ���������� ������ "����� ����"
        ' If CStr(Cells(intR, intC).Value) = "����� ����" Then
        '   MsgBox ("����� �� ����� �� ������ ����� ����")
        '   Exit For
        ' End If
    
      End If ' ���� ������ �� ������
      
  Next

  ' ����� ������ ��������� ������������� �������� �����������
  RowToPrint = 2
  
  ' ������ ������ ��
  If ������_���_������_������_�� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ��������������� ��������: " + ������_���_������_������_��
    RowToPrint = RowToPrint + 2
  End If
  
  ' ������ ������ ��������� ��
  If ������_���_������_������_����������� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ��������� � ��������������� ��������: " + ������_���_������_������_�����������
    RowToPrint = RowToPrint + 2
  End If
  
  ' ������ ������ ��
  If ������_���_������_������_�� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ��������� ����: " + ������_���_������_������_��
    RowToPrint = RowToPrint + 2
  End If
  
  ' ������ ������ ��
  If ������_���_������_������_�� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ��������� ����: " + ������_���_������_������_��
    RowToPrint = RowToPrint + 2
  End If
  
  ' ������ ������ ���
  If ������_���_������_������_��� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ���: " + ������_���_������_������_���
    RowToPrint = RowToPrint + 2
  End If
  
  ' ������ ������ ���
  If ������_���_������_������_��� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "������ ������ ���: " + ������_���_������_������_���
    RowToPrint = RowToPrint + 2
  End If
  
  ' ���������� ������ ��
  If ������_���_�_�����������_������_�� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ��������������� ��������: " + ������_���_�_�����������_������_��
    RowToPrint = RowToPrint + 2
  End If
  
  ' ���������� ������ ��
  If ������_���_�_�����������_������_����������� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ��������� � ��������������� ��������: " + ������_���_�_�����������_������_�����������
    RowToPrint = RowToPrint + 2
  End If
  ' ���������� ������ ��
  If ������_���_�_�����������_������_KK <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ��������� ����: " + ������_���_�_�����������_������_KK
    RowToPrint = RowToPrint + 2
  End If
  ' ���������� ������ ��
  If ������_���_�_�����������_������_�K <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ��������� ����: " + ������_���_�_�����������_������_�K
    RowToPrint = RowToPrint + 2
  End If
  ' ���������� ������ ���
  If ������_���_�_�����������_������_��� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ���: " + ������_���_�_�����������_������_���
    RowToPrint = RowToPrint + 2
  End If
  ' ���������� ������ ���
  If ������_���_�_�����������_������_��� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B" + CStr(9 + CountMRK + RowToPrint)).Value = "���������� ��� ������ ���: " + ������_���_�_�����������_������_���
    RowToPrint = RowToPrint + 2
  End If

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If

End Sub

' � ������������ ������ ������� ����� - �������, ������, �����, ������
Sub �������_�����_�_������(In_Sheet As String, In_Cell As String)
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlDiagonalDown).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlDiagonalUp).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlEdgeLeft).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlEdgeTop).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlEdgeBottom).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlEdgeRight).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlInsideVertical).LineStyle = xlNone
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).Borders(xlInsideHorizontal).LineStyle = xlNone
End Sub

Sub �������_��������_��������������_�_������(In_Sheet As String, In_Cell As String)
  
  ThisWorkbook.Sheets(In_Sheet).Range(In_Cell).FormatConditions.Delete
  
End Sub

' ������� ������ � ����� 1.1�����-�� �������  �� ������
Sub ������������_�������_��_������(In_DBstrName As String)

Dim Office2_Name As String
' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' ���� ���������� �����������
Dim ��_����, �������, ��, ��, ��������, �������_�������, ��_��, OPC_��, ������_������� As Double
Dim ������_��������������_�����������_��, ������_��������������_��_�����_�����������_��, ������_��������������_��_�����_�����������, ������_����������_�����_���_��_�������� As String
Dim ������������_�����_������������� As String
Dim ���������������������, ������������������, �������������������_�����, �����������������������������, ��������������_����, �������������������, ��������������, ��������������, ��������������������, �������������������_�������, ��������������_��, ������������OPC_��, ������������������_������� As Byte

  Application.StatusBar = "������������_�������_��_������ ..."

  ' ���� ����� ���� � �����?
  If (Sheets_Exist(ActiveWorkbook, "1.1�����-�� �������  �� ������") = True) Or (Sheets_Exist(ActiveWorkbook, "1.1 �����-�� �������  �� ������") = True) Then

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "1.1�����-�� �������  �� ������"
  If (Sheets_Exist(ActiveWorkbook, "1.1�����-�� �������  �� ������") = True) Then
    Sheets("1.1�����-�� �������  �� ������").Select
    ������������_�����_������������� = "1.1�����-�� �������  �� ������"
  End If
  ' ������ ������� ������
  If (Sheets_Exist(ActiveWorkbook, "1.1 �����-�� �������  �� ������") = True) Then
    Sheets("1.1 �����-�� �������  �� ������").Select
    ������������_�����_������������� = "1.1 �����-�� �������  �� ������"
  End If

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then

    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_���_����_�����_1_log.txt"
    Open MyFile1 For Output As #1

    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_���_����_�����_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2

  End If

  ������_��������������_��_�����_����������� = ""
  ������_����������_�����_���_��_�������� = ""

  ' ������������� ����������
  ' ��� ������ 072?
  ThiStringIs072 = False
  ' ������� ���
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ����� � ��� ���� ������
  �����_�����_�_���_���� = False

  ' ����� ������ � �����������: ������ �� ��������� � ���������� ���������  � �/�   ID_PROFIT   ����    ������  % ��_����   % ��_DSA     % �������   % ��    % ��    % ��    % ���.�����    ������������ �������_������� �������     % ��_��.   % OPC_��.   ������������ ������� *  ������������ �������_���������� ������� ��������
  ��������������������� = rowByValue(In_DBstrName, ������������_�����_�������������, "������ �� ��������� � ���������� ���������", 40, 250)
  ' ������
  ������������������ = ColumnByNameAndNumber(In_DBstrName, ������������_�����_�������������, ���������������������, "������", 1, 60)
  ' �������_�����
  �������������������_����� = ColumnByNameAndNumber(In_DBstrName, ������������_�����_�������������, ���������������������, "� �/�", 1, 60)
  ' �����������������������������
  ����������������������������� = ColumnByNameAndNumber(In_DBstrName, ������������_�����_�������������, ���������������������, "����", 1, 60)
  ' ��������������_���� (� ��������� ����� �������, ������� ����� �� ������� ���������� ����� � �������� �������)
  ��������������_���� = ������������������ + 1
  ' �������������������
  ������������������� = ������������������ + 3
  ' �������������� +6
  �������������� = ������������������ + 6
  ' ��������������
  �������������� = ������������������ + 14
  ' ��������������������
  �������������������� = ������������������ + 7
  ' �������������������_�������
  �������������������_������� = ������������������ + 8
  ' ��������������_��
  ��������������_�� = ������������������ + 9
  ' ������������OPC_��
  ������������OPC_�� = ������������������ + 10
  ' ������������������_�������
  ������������������_������� = ������������������ + 11

  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row

        ' ���� ����� ������� $C$, �� �������, ��� ������ �� "��������� ��1"
        ' If Mid(Cell.Address, 1, 3) = "$C$" Then
        ' If ������������������ = intC Then
        If ����������������������������� = intC Then
            ' ���� �� ��������� OO1
            ThiStringIs072 = False
            ' ����� ����� � ��� ����
            �����_�����_�_���_���� = False
        End If

        ' �������_����� - $C$
        ' If Mid(Cell.Address, 1, 3) = "$C$" Then
        If �������������������_����� = intC Then
          �������_����� = CStr(Cells(intR, intC).Value)
        End If

        ' ���� ����� ������ $E$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
        ' If Mid(Cell.Address, 1, 3) = "$E$" Then
        ' If ����������������������������� = intC Then
        If ������������������ = intC Then
          Office2_Name = CStr(Cells(intR, intC).Value)
        End If
                        
        ' ���� ��� ������� F ("��������� ��1")
        ' If (Mid(Cell.Address, 1, 3) = "$F$") Then
        ' If ������������������ = intC Then
        If ����������������������������� = intC Then
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            ' ���� ���� ��������� OO1
            ThiStringIs072 = True
            ' �������
            CountOffice = CountOffice + 1
            ' �����_������_�_���_����������
            �����_�����_�_���_���� = True
          Else
            ' ���� ���� �� ��������� OO1
            ThiStringIs072 = False
          End If
        End If

        ' ���� ��� ��������� ���, �� ���� ������� ��� ������������ �����
        If (CStr(Cells(intR, �����������������������������).Value) = "��������� ��1") Then
          Office2_Name = CStr(Cells(intR, ����������������������������� + 1).Value)
        End If

        ' ������� � ��� ����� ������� � ����
        If (�����_�����_�_���_���� = True) And (ThiStringIs072 = True) Then
          ThisWorkbook.Sheets("����1").Range("A" + CStr(51 + CountOffice)).Value = �������_�����
          ThisWorkbook.Sheets("����1").Range("B" + CStr(51 + CountOffice)).Value = Office2_Name
          �����_�����_�_���_���� = False
          ' �������� ��������� ������� � ������ �����
          ������_��������������_�����������_�� = ""
          ������_��������������_��_�����_�����������_�� = ""
        End If


        ' 1 ����������: ���� ����� ������ $G$ - ������ ��� ��_����
        ' If (Mid(Cell.Address, 1, 3) = "$G$") And (ThiStringIs072 = True) Then
        If (��������������_���� = intC) And (ThiStringIs072 = True) Then
      
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(51 + CountOffice))
          ' ����� ��_���� (�������� � 0,92)
          ��_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(51 + CountOffice)).Value = ��_����
           ' ������� �����
          Call �������_�����_�_������("����1", "C" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If ��_���� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "���������������� ������������"
          End If
          ' ������_����������_�����_���_��_��������
          If ��_���� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "���������������� ������������"
          End If
        End If
      
        ' 2 ����������: �������
        ' If (Mid(Cell.Address, 1, 3) = "$I$") And (ThiStringIs072 = True) Then
        If (������������������� = intC) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(51 + CountOffice))
          ' ����� �������
          ������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(51 + CountOffice)).Value = �������
           ' ������� �����
          Call �������_�����_�_������("����1", "D" + CStr(51 + CountOffice))
        End If
        
        ' 3 ���������� ��
        ' If (Mid(Cell.Address, 1, 3) = "$J$") And (ThiStringIs072 = True) Then
        If (�������������� = intC) And (ThiStringIs072 = True) Then
          
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(51 + CountOffice))
          ' ����� ��
          �� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(51 + CountOffice)).Value = ��
           ' ������� �����
          Call �������_�����_�_������("����1", "E" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If �� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "��������-�����"
          End If
          ' ������_����������_�����_���_��_��������
          If �� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "��������-�����"
          End If
        End If
        
        ' 4 ���������� ��
        ' If (Mid(Cell.Address, 1, 3) = "$K$") And (ThiStringIs072 = True) Then
        If (�������������� = intC) And (ThiStringIs072 = True) Then
          
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(51 + CountOffice))
          ' ����� ��
          �� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(51 + CountOffice)).Value = ��
           ' ������� �����
          Call �������_�����_�_������("����1", "F" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If �� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "������������� ������"
          End If
          ' ������_����������_�����_���_��_��������
          If �� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "������������� ������"
          End If
        End If
        
        ' 5 ���������� ��������
        ' If (Mid(Cell.Address, 1, 3) = "$L$") And (ThiStringIs072 = True) Then
        If (�������������������� = intC) And (ThiStringIs072 = True) Then
          
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(51 + CountOffice))
          ' ����� ��������
          �������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(51 + CountOffice)).Value = ��������
           ' ������� �����
          Call �������_�����_�_������("����1", "G" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If �������� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "������������� ������"
          End If
          ' ������_����������_�����_���_��_��������
          If �������� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "������������� ������"
          End If

        End If
        
        ' 6 ���������� �������_�������
        ' If (Mid(Cell.Address, 1, 3) = "$M$") And (ThiStringIs072 = True) Then
        If (�������������������_������� = intC) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(51 + CountOffice))
          ' ����� �������_�������
          �������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(51 + CountOffice)).Value = �������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "H" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If �������_������� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "������� ��������"
          End If
          ' ������_����������_�����_���_��_��������
          If �������_������� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "������� ��������"
          End If

        End If
        
        ' 7 ���������� ��_��
        ' If (Mid(Cell.Address, 1, 3) = "$N$") And (ThiStringIs072 = True) Then
        If (��������������_�� = intC) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(51 + CountOffice))
          ' ����� ��_��
          ��_�� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(51 + CountOffice)).Value = ��_��
           ' ������� �����
          Call �������_�����_�_������("����1", "I" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If ��_�� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "���������� ������"
          End If
          ' ������_����������_�����_���_��_��������
          If ��_�� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "���������� ������"
          End If

        End If
        
        ' 8 ���������� OPC_��
        ' If (Mid(Cell.Address, 1, 3) = "$O$") And (ThiStringIs072 = True) Then
        If (������������OPC_�� = intC) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(51 + CountOffice))
          ' ����� OPC_��
          OPC_�� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(51 + CountOffice)).Value = OPC_��
           ' ������� �����
          Call �������_�����_�_������("����1", "J" + CStr(51 + CountOffice))
          ' ���� ���������� �� �����������, ��
          If OPC_�� >= 1 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_�����������_�� <> "" Then
              ������_��������������_�����������_�� = ������_��������������_�����������_�� + ", "
            End If
            ������_��������������_�����������_�� = ������_��������������_�����������_�� + "OPC"
          End If
          ' ������_����������_�����_���_��_��������
          If OPC_�� < 0.5 Then
            ' ���� � ������ ���-�� ����, �� ������ ", "
            If ������_��������������_��_�����_�����������_�� <> "" Then
              ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + ", "
            End If
            ������_��������������_��_�����_�����������_�� = ������_��������������_��_�����_�����������_�� + "OPC"
          End If

        End If
        
        ' 9 ���������� ������_�������
        ' If (Mid(Cell.Address, 1, 3) = "$P$") And (ThiStringIs072 = True) Then
        If (������������������_������� = intC) And (ThiStringIs072 = True) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("K" + CStr(51 + CountOffice))
          ' ����� ������_�������
          ������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("K" + CStr(51 + CountOffice)).Value = ������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "K" + CStr(51 + CountOffice))
          
          ' �������� ����� �� ��������������
          If ������_��������������_�����������_�� <> "" Then
            ������_��������������_�����������_�� = cityOfficeName(Office2_Name) + " �� " + ������_��������������_�����������_�� + ". "
            ������_��������������_��_�����_����������� = ������_��������������_��_�����_����������� + ������_��������������_�����������_��
          End If
          ' �������� ����� �� ��������������
          If ������_��������������_��_�����_�����������_�� <> "" Then
            ������_��������������_��_�����_�����������_�� = cityOfficeName(Office2_Name) + " �� " + ������_��������������_��_�����_�����������_�� + ". "
            ������_����������_�����_���_��_�������� = ������_����������_�����_���_��_�������� + ������_��������������_��_�����_�����������_��
          End If
          
        End If
        
      End If ' ���� ������ �� ������
      
  Next

  ' ������� �����
  If ������_��������������_��_�����_����������� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B58").Value = "�������������� ������ � ��������: " + ������_��������������_��_�����_�����������
    Else: ThisWorkbook.Sheets("����1").Range("B58").Value = "�� ���� �� ������ �� ��������� �������� ����������!"
  End If
  
  ' ������_����������_�����_���_��_��������
  If ������_����������_�����_���_��_�������� <> "" Then
    ThisWorkbook.Sheets("����1").Range("B60").Value = "������� ���������� ������ ����� 50%: " + ������_����������_�����_���_��_��������
    Else: ThisWorkbook.Sheets("����1").Range("B58").Value = "��� ����� ��������� ���������� ����� ��� �� 50%"
  End If
  
  
  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If
  
  ' ���� ����� ���� � �����?
  End If

End Sub

' ���������� ����� �� ��: 3.1 ���������������  �������
Sub ���������������_�������(In_DBstrName As String, In_�����_������ As Byte)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' ���� ���������� �����������
Dim ����_������_�����_����, ����_������_�����_����, ����_������_�����_����������_�������, ����_�����_�������������_���������_�������, ����_������_�����_�������_������� As Double
Dim ����_������_�������_����, ����_������_�������_����, ����_������_�������_����������_�������, ����_�������_�������������_���������_�������, ����_������_�������_�������_������� As Double
' ������ � ����� ����� ������
Dim startOffice2Row, endOffice2Row As Byte
' ��� ����������� ����� ����� � ��
Dim �������_���� As Worksheet
Dim ����_���������������_������� As String
Dim ������_������� As Boolean

  Application.StatusBar = "���������������_������� ..."

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ����������: ����� ���� ��������� "2.1 ���������������  �������"
  ' ������� �� "3.1 ���������������  �������"
  For Each �������_���� In Worksheets
    If InStr(�������_����.Name, "���������������  �������") <> 0 Then ����_���������������_������� = �������_����.Name
  Next
  
  ' Sheets("3.1 ���������������  �������").Select
  Sheets(����_���������������_�������).Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_��_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_��_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If

  ' ������������� ����������
  ' ������� ������
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ������ � ����� ����� ������ �� ������� �������
  startOffice2Row = 0
  endOffice2Row = 0
  ����_������_�����_���� = 0
  ����_������_�����_���� = 0
  ����_������_�����_����������_������� = 0
  ����_�����_�������������_���������_������� = 0
  ����_������_�����_�������_������� = 0
  ����_������_�������_���� = 0
  ����_������_�������_���� = 0
  ����_������_�������_����������_������� = 0
  ����_�������_�������������_���������_������� = 0
  ����_������_�������_�������_������� = 0
  
  ' ������������ ����� �������� ��������
  ������_1 = ""
  ' ���������� �����
  ������_2 = ""
  ' ������������� ��������� � �� > 75%
  ������_3 = ""

  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
                        
        ' ���� ��� ������� B ("��������� ��1")
        If (Mid(Cell.Address, 1, 3) = "$B$") Then
          ' ���� ����� ������ $B$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
          Office2_Name = CStr(Cells(intR, intC).Value)
          ' ���� ��� ��� ���������
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            
            ' ��������
            ' ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            
            ' �������� ������
            ������_������� = False
            If (PivotExist("������� �������2") = True) And (������_������� = False) Then
              
              On Error Resume Next
              ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
              ActiveSheet.PivotTables("������� �������4").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
              
              ������_������� = True
            End If
            ' � ������ ������� ������� ���������� "��������������2" (��� �������)
            If (PivotExist("��������������2") = True) And (������_������� = False) Then
              ActiveSheet.PivotTables("��������������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
              ������_������� = True
            End If


            ' ������ � ����� ����� ������
            startOffice2Row = intR + 1
            endOffice2Row = intR + In_�����_������
          End If
          
          
        End If
        
        ' ������� � ��� ����� ���������� ����� � ������������ �����
        If (Mid(Cell.Address, 1, 3) = "$B$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������� ������
          CountOffice = CountOffice + 1
          ThisWorkbook.Sheets("����1").Range("A" + CStr(70 + CountOffice)).Value = CountOffice
          ThisWorkbook.Sheets("����1").Range("B" + CStr(70 + CountOffice)).Value = Office2_Name
                  
        End If

        ' 1 ����������: ���� ����� ������ $BG$ - ������ ��� ����_������_�����_����
        If (Mid(Cell.Address, 1, 4) = "$BG$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(70 + CountOffice))
          ' ����� ����_������_�����_����
          ����_������_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(70 + CountOffice)).Value = ����_������_�����_����
          ' ������� �����
          Call �������_�����_�_������("����1", "C" + CStr(70 + CountOffice))
        End If
            
        ' 2 ����������: ���� ����� ������ $BH$ - ������ ��� ����_������_�����_����
        If (Mid(Cell.Address, 1, 4) = "$BH$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(70 + CountOffice))
          ' ����� ����_������_�����_����
          ����_������_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(70 + CountOffice)).Value = ����_������_�����_����
          ' ������� �����
          Call �������_�����_�_������("����1", "D" + CStr(70 + CountOffice))
          Call �������_��������_��������������_�_������("����1", "D" + CStr(70 + CountOffice))
        End If
            
        ' 3 ����������: ���� ����� ������ $BJ$ - ������ ��� ����_������_�����_����������_�������
        If (Mid(Cell.Address, 1, 4) = "$BJ$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(70 + CountOffice))
          ' ����_������_�����_����������_�������
          ����_������_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(70 + CountOffice)).Value = ����_������_�����_����������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "E" + CStr(70 + CountOffice))
        End If
            
        ' 4 ����������: ���� ����� ������ $CQ$ - ������ ��� ����_�����_�������������_���������_�������
        If (Mid(Cell.Address, 1, 4) = "$CQ$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(70 + CountOffice))
          ' ����_�����_�������������_���������_�������
          ����_�����_�������������_���������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(70 + CountOffice)).Value = ����_�����_�������������_���������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "F" + CStr(70 + CountOffice))
        End If
            
        ' 5 ����������: ���� ����� ������ $BK$ - ������ ��� ����_������_�����_�������_�������
        If (Mid(Cell.Address, 1, 4) = "$BK$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(70 + CountOffice))
          ' ����_������_�����_�������_�������
          ����_������_�����_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(70 + CountOffice)).Value = ����_������_�����_�������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "G" + CStr(70 + CountOffice))
        End If
            
        ' == ������� ==
        
        ' 6 (1) ����������: ���� ����� ������ $BX$ - ������ ��� ����_������_�������_����
        If (Mid(Cell.Address, 1, 4) = "$BX$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(70 + CountOffice))
          ' ����� ����_������_�������_����
          ����_������_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(70 + CountOffice)).Value = ����_������_�������_����
          ' ������� �����
          Call �������_�����_�_������("����1", "H" + CStr(70 + CountOffice))
        End If
            
        ' 7 (2) ����������: ���� ����� ������ $BY$ - ������ ��� ����_������_�������_����
        If (Mid(Cell.Address, 1, 4) = "$BY$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(70 + CountOffice))
          ' ����� ����_������_�������_����
          ����_������_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(70 + CountOffice)).Value = ����_������_�������_����
          ' ������� �����
          Call �������_�����_�_������("����1", "I" + CStr(70 + CountOffice))
        End If
            
        ' 8 (3) ����������: ���� ����� ������ $CA$ - ������ ��� ����_������_�������_����������_�������
        If (Mid(Cell.Address, 1, 4) = "$CA$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(70 + CountOffice))
          ' ����� ����_������_�������_����������_�������
          ����_������_�������_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(70 + CountOffice)).Value = ����_������_�������_����������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "J" + CStr(70 + CountOffice))
        End If
            
        ' 9 (4) ����������: ���� ����� ������ $DK$ - ������ ��� ����_�������_�������������_���������_�������
        If (Mid(Cell.Address, 1, 4) = "$DK$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("K" + CStr(70 + CountOffice))
          ' ����� ����_�������_�������������_���������_�������
          ����_�������_�������������_���������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("K" + CStr(70 + CountOffice)).Value = ����_�������_�������������_���������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "K" + CStr(70 + CountOffice))
        End If
            
        ' 10 (5) ����������: ���� ����� ������ $CB$ - ������ ��� ����_������_�������_�������_�������
        If (Mid(Cell.Address, 1, 4) = "$CB$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("L" + CStr(70 + CountOffice))
          ' ����� ����_������_�������_�������_�������
          ����_������_�������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("L" + CStr(70 + CountOffice)).Value = ����_������_�������_�������_�������
          ' ������� �����
          Call �������_�����_�_������("����1", "L" + CStr(70 + CountOffice))
        End If
                    
      End If ' ���� ������ �� ������
  
  Next
 
  ' ������� ���� �� ������ �������� ������ �� ����3 � ����������� ������-������� (������)
  ' ��������_�����_�������������
  If False Then ' ���� �� ��������� ����3
    
    rowCount = 71
    ' ����� ���� �� ������� "Date"
    Do While Not IsEmpty(ThisWorkbook.Sheets("����1").Cells(rowCount, 2).Value)
      ������������_����� = ��������_�����_�������������(ThisWorkbook.Sheets("����1").Cells(rowCount, 2).Value, Chr(34), 1, 2)
    
      ' ��������� ����� ����� �� �����3 � ������� B6
      rowCount2 = 6
      ����_������ = False
      Do While (Not IsEmpty(ThisWorkbook.Sheets("����3").Cells(rowCount2, 2).Value)) And (����_������ = False)
        ' ��������� ����� ���������
        If InStr(ThisWorkbook.Sheets("����3").Cells(rowCount2, 2).Value, ������������_�����) <> 0 Then
          ' ���� ������� - ������� ���� �� ����
          ThisWorkbook.Sheets("����3").Cells(rowCount2, 5).Value = ThisWorkbook.Sheets("����1").Cells(rowCount, 3).Value
          ' ����� 2
          ThisWorkbook.Sheets("����3").Cells(rowCount2 + 32, 5).Value = ThisWorkbook.Sheets("����1").Cells(rowCount, 3).Value
          ����_������ = True
        End If
        ' ��������� ������
        rowCount2 = rowCount2 + 1
      Loop ' ��������� ����� � ����� �� �����3
    
      ' ��������� ������
      rowCount = rowCount + 1
    Loop ' ��������� ����� � ����� �� �����1
  
  End If
 
  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If


End Sub

' 4. ���������� ����� �� ��: 3.2 ��������� �����. ����� ������=5
Sub ���������_�����(In_DBstrName As String, In_�����_������ As Byte)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
Dim ������_�������_�_��_�����_�������, ������������_�������_�������_�_��_�����_�������, ������_��_�����_����������_������� As Double
' ���� ���������� �����������
Dim ���������_�����_�_�����, ������_��_�����_���������� As Byte
Dim ��������������_�����_�����_����, ��������������_�����_�����_����, ��������������_�����_�����_����������_�������, ��������������_�����_�����_����������_�������_������� As Double
Dim ��������������_�����_�������_����, ��������������_�����_�������_����, ��������������_�����_�������_����������_������� As Double
' ������ � ����� ����� ������
Dim startOffice2Row, endOffice2Row As Byte
Dim ����_���������_����� As String
Dim ������_������� As Boolean
Dim ���������������������, ��������������������������_�����_�����_����, ��������������������������_�����_�����_����, ��������������������������_�����_�����_����������_�������, ��������������������������_�����_�����_����������_�������_�������, ��������������������������_�����_�������_����, ��������������������������_�����_�������_����, ��������������������������_�����_�������_����������_�������, ��������������������������_�����_�������_����������_�������_�������, ���������������������_�����_�_�����, ������������������_�������_�_��_�����_�������, ������������������������_�������_�������_�_��_�����_�������, ������������������_��_�����_����������_�������, ������������������_��_�����_���������� As Byte

  Application.StatusBar = "���������_����� ..."

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "... ��������� �����"
  For Each �������_���� In Worksheets
    If InStr(�������_����.Name, "��������� �����") <> 0 Then ����_���������_����� = �������_����.Name
  Next
  
  ' ������� �� "3.2 ��������� �����"
  ' Sheets("3.2 ��������� �����").Select
  Sheets(����_���������_�����).Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_��_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_��_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If

  ' ������������� ����������
  ' ������� ������
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ������ � ����� ����� ������ �� ������� �������
  startOffice2Row = 0
  endOffice2Row = 0
  ' ������� ���������� (�����)
  ���������_�����_�_����� = 0
  ������_�������_�_��_�����_������� = 0
  ������������_�������_�������_�_��_�����_������� = 0
  ������_��_�����_���������� = 0
  ������_��_�����_����������_������� = 0
  ' �����
  ��������������_�����_�����_���� = 0
  ��������������_�����_�����_���� = 0
  ��������������_�����_�����_����������_������� = 0
  ��������������_�����_�����_����������_�������_������� = 0
  ' �������
  ��������������_�����_�������_���� = 0
  ��������������_�����_�������_���� = 0
  ��������������_�����_�������_����������_������� = 0
  
  ' ����� ������ � �����������: ������  ����            ����_����   ����_����-1             ��������                                  ��������, %                          % ���-�                      ����                    ����_����       ����_����-1         ��������, ��.        ��������, %        % ���-�         ����    ����    ������� % ���-� % ���-�_������� ����    ����    �������         % ���-�     % ���-�_����    �������������� ����-�� �� ���. (�������), ��.   ���-�� �������� �� �� �������   ���-�� �������� ������� ���� �������� ������� �� ������� �� �� ��������, %  ���-�� �������������� �������   ���� �����-� ������� �� ��������, % % ���-�     % ���-� _�������
  ��������������������� = rowByValue(In_DBstrName, "3.2 ��������� �����", "������", 200, 200)
  ' ����� ������� ��������������_�����_�����_����
  ��������������������������_�����_�����_���� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "����", 4, 60)
  ' ����� ������� ��������������_�����_�����_����
  ��������������������������_�����_�����_���� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "����", 2, 60)
  ' ��������������_�����_�����_����������_�������
  ��������������������������_�����_�����_����������_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "% ���-�", 4, 60)
  ' ��������������_�����_�����_����������_�������_�������
  ��������������������������_�����_�����_����������_�������_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "% ���-�_����", 1, 60)
  ' ��������������_�����_�������_����
  ��������������������������_�����_�������_���� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "����", 6, 60)
  ' ��������������_�����_�������_����
  ��������������������������_�����_�������_���� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "����", 4, 60)
  ' ��������������_�����_�������_����������_�������
  ��������������������������_�����_�������_����������_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "% ���-�", 6, 60)
  ' ��������������_�����_�������_����������_�������_�������
  ��������������������������_�����_�������_����������_�������_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "% ���-�_����", 3, 60)
  ' ���������_�����_�_�����
  ���������������������_�����_�_����� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "���-�� ���� � �����", 1, 60)
  ' ������_�������_�_��_�����_�������
  ������������������_�������_�_��_�����_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "���� �������� ������� �� ������� �� �� ��������, %", 1, 60)
  ' ������������_�������_�������_�_��_�����_�������
  ������������������������_�������_�������_�_��_�����_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "���� �����-� ������� �� ��������, %", 1, 60)
  ' ������_��_�����_����������_�������
  ������������������_��_�����_����������_������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "% ���-�", 3, 60)
  ' ������_��_�����_����������
  ������������������_��_�����_���������� = ColumnByNameAndNumber(In_DBstrName, "3.2 ��������� �����", ���������������������, "����", 1, 60)
  
  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
                        
        ' ���� ��� ������� B ("��������� ��1")
        If (Mid(Cell.Address, 1, 3) = "$B$") Then
          ' ���� ����� ������ $B$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
          Office2_Name = CStr(Cells(intR, intC).Value)
          ' ���� ��� ��� ���������
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            
            ' ��������
            ' ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            
            ' ��������������� �� �������� ������������ ������� ������ ��� �������� ������������ ����� ��������� ������ - ��������!
            On Error Resume Next
            ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            ActiveSheet.PivotTables("��������������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            ' � ������� 2020 �. c Dashboard_new_��_11.02.2020.xlsm
            ActiveSheet.PivotTables("������� �������4").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            
            
            ' �������� ������
            ' ������_������� = False
            ' If (PivotExist("������� �������2") = True) And (������_������� = False) Then
            '   ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            '   ������_������� = True
            ' End If
            ' � ������ ������� ������� ���������� "��������������2" (��� �������)
            ' If (PivotExist("��������������2") = True) And (������_������� = False) Then
            '   ActiveSheet.PivotTables("��������������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            '   ������_������� = True
            ' End If
            
            ' ������ � ����� ����� ������
            startOffice2Row = intR + 1
            endOffice2Row = intR + In_�����_������
          End If
                    
        End If
        
        ' ������� � ��� ����� ���������� ����� � ������������ �����
        If (Mid(Cell.Address, 1, 3) = "$B$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������� ������
          CountOffice = CountOffice + 1
          ThisWorkbook.Sheets("����1").Range("A" + CStr(89 + CountOffice)).Value = CountOffice
          ThisWorkbook.Sheets("����1").Range("B" + CStr(89 + CountOffice)).Value = Office2_Name
                  
        End If

        ' 1 ����������: ���� ����� ������ $R$ - ������ ��� ��������������_�����_�����_����
        ' If (Mid(Cell.Address, 1, 3) = "$R$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        ' ���� �� ��������� � ������� "����" �� ����� 3
        If (��������������������������_�����_�����_���� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(89 + CountOffice))
          ' ��������������_�����_�����_����
          ��������������_�����_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(89 + CountOffice)).Value = ��������������_�����_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "H" + CStr(89 + CountOffice))
          
        End If

        ' 2 ����������: ���� ����� ������ $S$ - ������ ��� ��������������_�����_�����_����
        ' If (Mid(Cell.Address, 1, 3) = "$S$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�����_���� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(89 + CountOffice))
          ' ��������������_�����_�����_����
          ��������������_�����_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(89 + CountOffice)).Value = ��������������_�����_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "I" + CStr(89 + CountOffice))
        End If

        ' 3 ����������: ���� ����� ������ $U$ - ������ ��� ��������������_�����_�����_����������_�������
        ' If (Mid(Cell.Address, 1, 3) = "$U$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�����_����������_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(89 + CountOffice))
          ' ��������������_�����_�����_����������_�������
          ��������������_�����_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(89 + CountOffice)).Value = ��������������_�����_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "J" + CStr(89 + CountOffice))
        End If

        ' 4 ����������: ���� ����� ������ $V$ - ������ ��� ��������������_�����_�����_����������_�������_�������
        ' If (Mid(Cell.Address, 1, 3) = "$V$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�����_����������_�������_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("K" + CStr(89 + CountOffice))
          ' ��������������_�����_�����_����������_�������_�������
          ��������������_�����_�����_����������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("K" + CStr(89 + CountOffice)).Value = ��������������_�����_�����_����������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "K" + CStr(89 + CountOffice))
        End If

        ' 5 ����������: ���� ����� ������ $AF$ - ������ ��� ��������������_�����_�������_����
        ' If (Mid(Cell.Address, 1, 4) = "$AF$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�������_���� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("L" + CStr(89 + CountOffice))
          ' ��������������_�����_�������_����
          ��������������_�����_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("L" + CStr(89 + CountOffice)).Value = ��������������_�����_�������_����
           ' ������� �����
          Call �������_�����_�_������("����1", "L" + CStr(89 + CountOffice))
        End If

        ' 6 ����������: ���� ����� ������ $AG$ - ������ ��� ��������������_�����_�������_����
        ' If (Mid(Cell.Address, 1, 4) = "$AG$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�������_���� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("M" + CStr(89 + CountOffice))
          ' ��������������_�����_�������_����
          ��������������_�����_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("M" + CStr(89 + CountOffice)).Value = ��������������_�����_�������_����
           ' ������� �����
          Call �������_�����_�_������("����1", "M" + CStr(89 + CountOffice))
        End If

        ' 7 ����������: ���� ����� ������ $AI$ - ������ ��� ��������������_�����_�������_����������_�������
        ' If (Mid(Cell.Address, 1, 4) = "$AI$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�������_����������_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("N" + CStr(89 + CountOffice))
          ' ��������������_�����_�������_����������_�������
          ��������������_�����_�������_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("N" + CStr(89 + CountOffice)).Value = ��������������_�����_�������_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "N" + CStr(89 + CountOffice))
        End If

        ' 8 ����������: ���� ����� ������ $AJ$ - ������ ��� ��������������_�����_�������_����������_�������_�������
        ' If (Mid(Cell.Address, 1, 4) = "$AJ$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (��������������������������_�����_�������_����������_�������_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("O" + CStr(89 + CountOffice))
          ' ��������������_�����_�������_����������_�������_�������
          ��������������_�����_�������_����������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("O" + CStr(89 + CountOffice)).Value = ��������������_�����_�������_����������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "O" + CStr(89 + CountOffice))
        End If

        ' ===========
        ' 9 ����������: ���� ����� ������ $AQ$ - ������ ��� ���������_�����_�_�����
        ' If (Mid(Cell.Address, 1, 4) = "$AQ$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (���������������������_�����_�_����� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(89 + CountOffice))
          ' ���������_�����_�_�����
          ���������_�����_�_����� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(89 + CountOffice)).Value = ���������_�����_�_�����
           ' ������� �����
          Call �������_�����_�_������("����1", "C" + CStr(89 + CountOffice))
        End If

        ' 10 ����������: ���� ����� ������ $Z$ - ������ ��� ������_�������_�_��_�����_�������
        ' If (Mid(Cell.Address, 1, 3) = "$Z$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (������������������_�������_�_��_�����_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(89 + CountOffice))
          ' ������_�������_�_��_�����_�������
          ������_�������_�_��_�����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(89 + CountOffice)).Value = ������_�������_�_��_�����_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "D" + CStr(89 + CountOffice))
        End If

        ' 11 ����������: ���� ����� ������ $AB$ - ������ ��� ������������_�������_�������_�_��_�����_�������
        ' If (Mid(Cell.Address, 1, 4) = "$AB$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (������������������������_�������_�������_�_��_�����_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(89 + CountOffice))
          ' ������������_�������_�������_�_��_�����_�������
          ������������_�������_�������_�_��_�����_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(89 + CountOffice)).Value = ������������_�������_�������_�_��_�����_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "E" + CStr(89 + CountOffice))
        End If

        ' 12 ����������: ���� ����� ������ $Q$ - ������ ��� ������_��_�����_����������_�������
        ' If (Mid(Cell.Address, 1, 3) = "$Q$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (������������������_��_�����_����������_������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(89 + CountOffice))
          ' ������_��_�����_����������_�������
          ������_��_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(89 + CountOffice)).Value = ������_��_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "G" + CStr(89 + CountOffice))
        End If

        ' 13 ����������: ���� ����� ������ $P$ - ������ ��� ������_��_�����_����������
        ' If (Mid(Cell.Address, 1, 3) = "$P$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
        If (������������������_��_�����_���������� = intC) And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(89 + CountOffice))
          ' ������_��_�����_����������
          ������_��_�����_���������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(89 + CountOffice)).Value = ������_��_�����_����������
           ' ������� �����
          Call �������_�����_�_������("����1", "F" + CStr(89 + CountOffice))
        End If


      End If ' ���� ������ �� ������
  
  Next

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If


End Sub

' 5. ���������� ����� �� ���������: 2. ��� �����. ����� ������=5
Sub ���_�����(In_DBstrName As String, In_�����_������ As Byte)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' ����������
Dim ���������_�_��_�����_����, ���������_�_��_�����_����, ���������_�_��_�����_����������_�������, ���������_�_��_�����_����������_�������_������� As Double
Dim ���_�����_����, ���_�����_����, ���_�����_����������_�������, ���_�����_����������_�������_������� As Double
Dim ���_�����_����, ���_�����_����, ���_�����_����������_�������, ���_�����_����������_�������_������� As Double
' ������ � ����� ����� ������
Dim startOffice2Row, endOffice2Row As Byte
Dim ����_���_����� As String
Dim ������_������� As Boolean

  Application.StatusBar = "���_����� ..."

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "... ��� �����"
  For Each �������_���� In Worksheets
    If InStr(�������_����.Name, "��� �����") <> 0 Then ����_���_����� = �������_����.Name
  Next

  ' ������� �� "... ��� �����"
  ' Sheets("2. ��� �����").Select
  Sheets(����_���_�����).Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_��_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_��_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If

  ' ������������� ����������
  ' ������� ������
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ������ � ����� ����� ������ �� ������� �������
  startOffice2Row = 0
  endOffice2Row = 0
  ' ������� ���������� (�����)
  ���������_�_��_�����_���� = 0
  ���������_�_��_�����_���� = 0
  ���������_�_��_�����_����������_������� = 0
  ���������_�_��_�����_����������_�������_������� = 0
  ���_�����_���� = 0
  ���_�����_���� = 0
  ���_�����_����������_������� = 0
  ���_�����_����������_�������_������� = 0
  ���_�����_���� = 0
  ���_�����_���� = 0
  ���_�����_����������_������� = 0
  ���_�����_����������_�������_������� = 0
    
  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
                        
        ' ���� ��� ������� B ("��������� ��1")
        If (Mid(Cell.Address, 1, 3) = "$B$") Then
          ' ���� ����� ������ $B$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
          Office2_Name = CStr(Cells(intR, intC).Value)
          ' ���� ��� ��� ���������
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            
            ' �������� ������
            ������_������� = False
            If (PivotExist("������� �������2") = True) And (������_������� = False) Then
              ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
              ������_������� = True
            End If
            ' � ������ ������� ������� ���������� "��������������2" (��� �������)
            If (PivotExist("��������������2") = True) And (������_������� = False) Then
              ActiveSheet.PivotTables("��������������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
              ������_������� = True
            End If

            ' ������ � ����� ����� ������
            startOffice2Row = intR + 1
            endOffice2Row = intR + In_�����_������
          End If
                    
        End If
        
        ' ������� � ��� ����� ���������� ����� � ������������ �����
        If (Mid(Cell.Address, 1, 3) = "$B$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������� ������
          CountOffice = CountOffice + 1
          ThisWorkbook.Sheets("����1").Range("A" + CStr(108 + CountOffice)).Value = CountOffice
          ThisWorkbook.Sheets("����1").Range("B" + CStr(108 + CountOffice)).Value = Office2_Name
                  
        End If

        ' 1 ����������: ���� ����� ������ $C$ - ������ ��� ���������_�_��_�����_����
        If (Mid(Cell.Address, 1, 3) = "$C$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(108 + CountOffice))
          ' ���������_�_��_�����_����
          ���������_�_��_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(108 + CountOffice)).Value = ���������_�_��_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "C" + CStr(108 + CountOffice))
          
          ' *** ������ ��� ������ ������ �������, ��� ��� ���� ���������. ���� ���������_�_��_�����_����=0, �� ���������� �� ������� endOffice2Row
          If ���������_�_��_�����_���� = 0 Then
            endOffice2Row = endOffice2Row + 1
          End If
          
        End If

        ' 2 ����������: ���� ����� ������ $D$ - ������ ��� ���������_�_��_�����_����
        If (Mid(Cell.Address, 1, 3) = "$D$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(108 + CountOffice))
          ' ���������_�_��_�����_����
          ���������_�_��_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(108 + CountOffice)).Value = ���������_�_��_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "D" + CStr(108 + CountOffice))
        End If

        ' 3 ����������: ���� ����� ������ $E$ - ������ ��� ���������_�_��_�����_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$E$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(108 + CountOffice))
          ' ���������_�_��_�����_����������_�������
          ���������_�_��_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(108 + CountOffice)).Value = ���������_�_��_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "E" + CStr(108 + CountOffice))
        End If

        ' 4 ����������: ���� ����� ������ $F$ - ������ ��� ���������_�_��_�����_����������_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$F$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(108 + CountOffice))
          ' ���������_�_��_�����_����������_�������_�������
          ���������_�_��_�����_����������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(108 + CountOffice)).Value = ���������_�_��_�����_����������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "F" + CStr(108 + CountOffice))
        End If

        ' 5 ����������: ���� ����� ������ $G$ - ������ ��� ���_�����_����
        If (Mid(Cell.Address, 1, 3) = "$G$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(108 + CountOffice))
          ' ���_�����_����
          ���_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(108 + CountOffice)).Value = ���_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "G" + CStr(108 + CountOffice))
        End If

        ' 6 ����������: ���� ����� ������ $H$ - ������ ��� ���_�����_����
        If (Mid(Cell.Address, 1, 3) = "$H$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(108 + CountOffice))
          ' ���_�����_����
          ���_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(108 + CountOffice)).Value = ���_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "H" + CStr(108 + CountOffice))
        End If

        ' 7 ����������: ���� ����� ������ $I$ - ������ ��� ���_�����_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$I$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(108 + CountOffice))
          ' ���_�����_����������_�������
          ���_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(108 + CountOffice)).Value = ���_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "I" + CStr(108 + CountOffice))
        End If

        ' 8 ����������: ���� ����� ������ $J$ - ������ ��� ���_�����_����������_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$J$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(108 + CountOffice))
          ' ���_�����_����������_�������_�������
          ���_�����_����������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(108 + CountOffice)).Value = ���_�����_����������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "J" + CStr(108 + CountOffice))
        End If

        ' 9 ����������: ���� ����� ������ $K$ - ������ ��� ���_�����_����
        If (Mid(Cell.Address, 1, 3) = "$K$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("K" + CStr(108 + CountOffice))
          ' ���_�����_����
          ���_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("K" + CStr(108 + CountOffice)).Value = ���_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "K" + CStr(108 + CountOffice))
        End If
       
        ' 10 ����������: ���� ����� ������ $L$ - ������ ��� ���_�����_����
        If (Mid(Cell.Address, 1, 3) = "$L$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("L" + CStr(108 + CountOffice))
          ' ���_�����_����
          ���_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("L" + CStr(108 + CountOffice)).Value = ���_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "L" + CStr(108 + CountOffice))
        End If
       
        ' 11 ����������: ���� ����� ������ $M$ - ������ ��� ���_�����_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$M$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("M" + CStr(108 + CountOffice))
          ' ���_�����_����������_�������
          ���_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("M" + CStr(108 + CountOffice)).Value = ���_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "M" + CStr(108 + CountOffice))
        End If

        ' 12 ����������: ���� ����� ������ $N$ - ������ ��� ���_�����_����������_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$N$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("N" + CStr(108 + CountOffice))
          ' ���_�����_����������_�������_�������
          ���_�����_����������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("N" + CStr(108 + CountOffice)).Value = ���_�����_����������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "N" + CStr(108 + CountOffice))
        End If


      End If ' ���� ������ �� ������
  
  Next

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If



End Sub

' 6. ���������� ����� �� ���: 3.10 OPC. ����� ������=5
Sub OPC(In_DBstrName As String, In_�����_������ As Byte)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' ����������
Dim OPC_�����_����, OPC_�����_����, OPC_�����_����������_�������, OPC_�����_�������_������� As Double
Dim OPC_�������_����, OPC_�������_����, OPC_�������_����������_�������, OPC_�������_�������_������� As Double
' ������ � ����� ����� ������
Dim startOffice2Row, endOffice2Row As Byte
Dim ����_OPC As String

  Application.StatusBar = "OPC ..."

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "... OPC"
  For Each �������_���� In Worksheets
    If InStr(�������_����.Name, "OPC") <> 0 Then ����_OPC = �������_����.Name
  Next

  ' ������� �� "3.1 ���������������  �������" ����_OPC
  ' Sheets("3.10 OPC").Select
  Sheets(����_OPC).Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_OPC_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_OPC_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If

  ' ������������� ����������
  ' ������� ������
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ������ � ����� ����� ������ �� ������� �������
  startOffice2Row = 0
  endOffice2Row = 0
  ' ������� ���������� (�����)
  OPC_�����_���� = 0
  OPC_�����_���� = 0
  OPC_�����_����������_������� = 0
  OPC_�����_�������_������� = 0
  OPC_�������_���� = 0
  OPC_�������_���� = 0
  OPC_�������_����������_������� = 0
  OPC_�������_�������_������� = 0
    
  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
                        
        ' ���� ��� ������� B ("��������� ��1")
        If (Mid(Cell.Address, 1, 3) = "$B$") Then
          ' ���� ����� ������ $B$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
          Office2_Name = CStr(Cells(intR, intC).Value)
          ' ���� ��� ��� ���������
          If (CStr(Cells(intR, intC).Value) = "��������� ��1") Then
            
            ' ��������
                        
            ' ActiveSheet.PivotTables("��������������26").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            ' ��� 25.12.2019
            ' ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True

            ' �������� ������
            ' ������_������� = False
            ' If (PivotExist("������� �������2") = True) And (������_������� = False) Then
            '   ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            '   ������_������� = True
            ' End If
            
            ' �������� "��������������26"
            ' If (PivotExist("��������������26") = True) And (������_������� = False) Then
            '   ActiveSheet.PivotTables("��������������26").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            '   ������_������� = True
            ' End If

            ' ���� �������� ������� ��� ���� �������
            ' rw = 0
            ' For Each pvtField In ActiveSheet.PivotTables("������� �������2").PivotFields
            ' rw = rw + 1
            ' ActiveSheet.Cells(rw, 12).Value = pvtField.Name
            ' Next pvtField

            ' ��������������� �� �������� ������������ ������� ������ ��� �������� ������������ ����� ��������� ������ - ��������!
            On Error Resume Next
            ActiveSheet.PivotTables("������� �������2").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True
            ActiveSheet.PivotTables("��������������26").PivotFields("DP3_�����").PivotItems("��������� ��1").ShowDetail = True

            ' ������ � ����� ����� ������
            startOffice2Row = intR + 1
            endOffice2Row = intR + In_�����_������
          End If
                    
        End If
        
        ' ������� � ��� ����� ���������� ����� � ������������ �����
        If (Mid(Cell.Address, 1, 3) = "$B$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������� ������
          CountOffice = CountOffice + 1
          ThisWorkbook.Sheets("����1").Range("A" + CStr(127 + CountOffice)).Value = CountOffice
          ThisWorkbook.Sheets("����1").Range("B" + CStr(127 + CountOffice)).Value = Office2_Name
        End If

        ' 1 ����������: ���� ����� ������ $C$ - ������ ��� OPC_�����_����
        If (Mid(Cell.Address, 1, 3) = "$C$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C" + CStr(127 + CountOffice))
          ' OPC_�����_����
          OPC_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C" + CStr(127 + CountOffice)).Value = OPC_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "C" + CStr(127 + CountOffice))
        End If

        ' 2 ����������: ���� ����� ������ $D$ - ������ ��� OPC_�����_����
        If (Mid(Cell.Address, 1, 3) = "$D$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D" + CStr(127 + CountOffice))
          ' OPC_�����_����
          OPC_�����_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D" + CStr(127 + CountOffice)).Value = OPC_�����_����
           ' ������� �����
          Call �������_�����_�_������("����1", "D" + CStr(127 + CountOffice))
        End If

        ' 3 ����������: ���� ����� ������ $F$ - ������ ��� OPC_�����_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$F$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E" + CStr(127 + CountOffice))
          ' OPC_�����_����������_�������
          OPC_�����_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E" + CStr(127 + CountOffice)).Value = OPC_�����_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "E" + CStr(127 + CountOffice))
        End If

        ' 4 ����������: ���� ����� ������ $G$ - ������ ��� OPC_�����_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$G$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F" + CStr(127 + CountOffice))
          ' OPC_�����_�������_�������
          OPC_�����_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F" + CStr(127 + CountOffice)).Value = OPC_�����_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "F" + CStr(127 + CountOffice))
        End If

        ' 5 ����������: ���� ����� ������ $H$ - ������ ��� OPC_�������_����
        If (Mid(Cell.Address, 1, 3) = "$H$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G" + CStr(127 + CountOffice))
          ' OPC_�������_����
          OPC_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G" + CStr(127 + CountOffice)).Value = OPC_�������_����
           ' ������� �����
          Call �������_�����_�_������("����1", "G" + CStr(127 + CountOffice))
        End If

        ' 6 ����������: ���� ����� ������ $I$ - ������ ��� OPC_�������_����
        If (Mid(Cell.Address, 1, 3) = "$I$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H" + CStr(127 + CountOffice))
          ' OPC_�������_����
          OPC_�������_���� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H" + CStr(127 + CountOffice)).Value = OPC_�������_����
           ' ������� �����
          Call �������_�����_�_������("����1", "H" + CStr(127 + CountOffice))
        End If

        ' 7 ����������: ���� ����� ������ $K$ - ������ ��� OPC_�������_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$K$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I" + CStr(127 + CountOffice))
          ' OPC_�������_����������_�������
          OPC_�������_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("I" + CStr(127 + CountOffice)).Value = OPC_�������_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "I" + CStr(127 + CountOffice))
        End If

        ' 7 ����������: ���� ����� ������ $L$ - ������ ��� OPC_�������_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$L$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("J" + CStr(127 + CountOffice))
          ' OPC_�������_�������_�������
          OPC_�������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("J" + CStr(127 + CountOffice)).Value = OPC_�������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "J" + CStr(127 + CountOffice))
        End If


      End If ' ���� ������ �� ������
  
  Next

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If

End Sub

' 7. ���������� ����� �� ���: 3.15 �������
Sub �������(In_DBstrName As String)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
' ����������
Dim �������_����_���_���, �������_����_���_���, �������_����������_�������, �������_�������_�������, �������_����_����� As Double
Dim �������_����_��, �������_����_�� As Byte
Dim �����_��_���������_�� As String
' ������ � ����� ����� ������
Dim startOffice2Row, endOffice2Row As Byte
Dim ����_������� As String

  Application.StatusBar = "������� ..."

  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ������� �� "... �������"
  For Each �������_���� In Worksheets
    If InStr(�������_����.Name, "�������") <> 0 Then ����_������� = �������_����.Name
  Next

  ' ������� �� "... �������"
  ' Sheets("3.15 �������").Select
  Sheets(����_�������).Select

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = In_DBstrName & "_�������_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = In_DBstrName & "_�������_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If

  ' ������������� ����������
  ' ������� ������
  CountOffice = 0
  ' ������������ ����� 2-�� ������
  Office2_Name = ""
  ' ������ � ����� ����� ������ �� ������� �������
  startOffice2Row = 0
  endOffice2Row = 0
  ' ������� ���������� (�����)
  �������_����_���_��� = 0
  �������_����_���_��� = 0
  �������_����_�� = 0
  �������_����_�� = 0
  �������_����������_������� = 0
  �������_�������_������� = 0
  �������_����_����� = 0
    
  ' �����, �� ����� ������ ������������ ������ �� �������
  ThisWorkbook.Sheets("����1").Range("B144").Value = "7. ������� (" + Workbooks(In_DBstrName).Sheets(����_�������).Cells(1, 3) + ")"
    
  ' ���� ��������� ����� Excel
  For Each Cell In ActiveSheet.UsedRange
  
      ' ���� ������ �� ������
      If Not IsEmpty(Cell) Then

        ' ������� ��� ������ � ������
        If �����������_�_���������_����� = True Then
          Print #1, Cell.Address, ":" + Cell.Formula
        End If

        ' ����� ������ � �������
        ' ����� �������
        intC = Cell.Column
        ' ����� ������
        intR = Cell.Row
                        
        ' ���� ��� ������� � ("�� "���������")
        If (Mid(Cell.Address, 1, 3) = "$C$") Then
          ' ���� ����� ������ $B$XXX - ������ ��� ������������ �����, ���������� � ���������� (��� ������ �����)
          Office2_Name = CStr(Cells(intR, intC).Value)
          ' ���� ��� ��� ���������
          If CStr(Cells(intR, intC).Value) = ("�� " & Chr(34) & "���������" & Chr(34)) Or CStr(Cells(intR, intC).Value) = "��������� ��1" Then
            ' ������ � ����� ����� ������
            startOffice2Row = intR
            endOffice2Row = intR
          End If
                    
        End If
        
        ' ������� � ��� ����� ���������� ����� � ������������ �����
        If (Mid(Cell.Address, 1, 3) = "$C$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������� ������
          CountOffice = CountOffice + 1
          ThisWorkbook.Sheets("����1").Range("A147").Value = CountOffice
          ThisWorkbook.Sheets("����1").Range("B147").Value = Office2_Name
        End If

        ' 1 ����������: ���� ����� ������ $F$ - ������ ��� �������_����_���_���
        If (Mid(Cell.Address, 1, 3) = "$F$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C147")
          ' �������_����_���_���
          �������_����_���_��� = Round((Cells(intR, intC).Value), 0)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("C147").Value = �������_����_���_���
          
          ' ������� ���� ������ � ����������� ������-�������
          If False Then
            ThisWorkbook.Sheets("����3").Range("E19").Value = �������_����_���_���
            ThisWorkbook.Sheets("����3").Range("E51").Value = �������_����_���_���
          End If
           
           ' ������� �����
          Call �������_�����_�_������("����1", "C147")
        End If

        ' 2 ����������: ���� ����� ������ $G$ - ������ ��� �������_����_���_���
        If (Mid(Cell.Address, 1, 3) = "$G$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D147")
          ' �������_����_���_���
          �������_����_���_��� = Round((Cells(intR, intC).Value), 0)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("D147").Value = �������_����_���_���
           ' ������� �����
          Call �������_�����_�_������("����1", "D147")
          ' ��� ������ ������������� ������ ��� ������ ����� �������
          ThisWorkbook.Sheets("����1").Range("D147").NumberFormat = "#,##0"
        End If

        ' 3 ����������: ���� ����� ������ $K$ - ������ ��� �������_����_��
        If (Mid(Cell.Address, 1, 3) = "$K$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E147")
          ' �������_����_��
          �������_����_�� = Round((Cells(intR, intC).Value), 0)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("E147").Value = �������_����_��
           ' ������� �����
          Call �������_�����_�_������("����1", "E147")
        End If

        ' 4 ����������: ���� ����� ������ $L$ - ������ ��� �������_����_��
        If (Mid(Cell.Address, 1, 3) = "$L$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F147")
          ' �������_����_��
          �������_����_�� = Round((Cells(intR, intC).Value), 0)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("F147").Value = �������_����_��
           ' ������� �����
          Call �������_�����_�_������("����1", "F147")
        End If

        ' 5 ����������: ���� ����� ������ $I$ - ������ ��� �������_����������_�������
        If (Mid(Cell.Address, 1, 3) = "$I$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G147")
          ' �������_����������_�������
          �������_����������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("G147").Value = �������_����������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "G147")
        End If

        ' 6 ����������: ���� ����� ������ $N$ - ������ ��� �������_�������_�������
        If (Mid(Cell.Address, 1, 3) = "$N$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("H147")
          ' �������_�������_�������
          �������_�������_������� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ThisWorkbook.Sheets("����1").Range("H147").Value = �������_�������_�������
           ' ������� �����
          Call �������_�����_�_������("����1", "H147")
        End If

        ' 7 ����������: ���� ����� ������ $E$ - ������ ��� �������_����_�����
        If (Mid(Cell.Address, 1, 3) = "$E$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("I147")
          ' �������_����_�����
          �������_����_����� = Round((Cells(intR, intC).Value), 2)
          ' ������� ������ � ��� �����
          ' ThisWorkbook.Sheets("����1").Range("H" + CStr(146 + CountOffice)).Value = �������_����_�����
           ' ������� �����
          Call �������_�����_�_������("����1", "I147")
        End If

        ' 8 ����������: ���� ����� ������ $P$ - ������ ��� ����_������_��
        If (Mid(Cell.Address, 1, 3) = "$P$") And (intR >= startOffice2Row) And (intR <= endOffice2Row) Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
          Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range("C159")
           ' ������� �����
          Call �������_�����_�_������("����1", "C159")
          ' ����������� ������
          ThisWorkbook.Sheets("����1").Range("C159").NumberFormat = "0"
          ThisWorkbook.Sheets("����1").Range("C159").Font.Bold = True

        End If

        ' 8 ����� �� ��������� �� ___
        ' If (Mid(cell.Address, 1, 4) = "$C$1") Then
          ' ������������� ������ ������ - ���������� "0.00%"
          ' ThisWorkbook.Sheets("����1").Range("C" + CStr(9 + CountMRK)).NumberFormat = "0%"
          ' �������� ������ ������
        '  Cells(intR, intC).Copy Destination:=ThisWorkbook.Sheets("����1").Range(�144)
          ' �������_����_�����
        '  �����_��_���������_�� = Cells(intR, intC).Value
          ' ������� ������ � ��� �����
        '  ThisWorkbook.Sheets("����1").Range(�144).Value = "(" + �����_��_���������_�� + ")"
          ' ������� �����
        '  Call �������_�����_�_������("����1", "�144")
        ' End If
        
      End If ' ���� ������ �� ������
  
  Next
    
  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If


End Sub

' 8. ������� �� ML (� 2021)
Sub �������_ML_new(In_MLName)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
Dim �������_�_�������_������_�����_������, ������_�����_������, ������_��������_���_���, ������_������ As String
Dim ������_���_�����, ������_�������_�������_�����, ������_��������_�������_�����, ������_�����������_�����, ������_���������_�����_�����, ������_������_���������_����� As Double
Dim ������_���_��, ������_�������_�������_��, ������_��������_�������_��, ������_�����������_��, ������_���������_�����_��, ������_������_���������_�� As Integer
Dim �������_�_���������_�������� As Boolean
Dim ������������_�������_CREDIT_PROGRAMM_OTHER, ������������_�������_�����_������, ������������_�������_STATUS_RETAIL, ������������_�������_���, ������������_�������_������������_��������, ������������_�������_������, ������������_�������_�����_��������_������, ������������_�������_FIO, ������������_�������_���_��������, ������������_�������_��������_��������, ������������_�������_�������, ������������_�������_����, ������������_�������_�����_�����������, ������������_�������_����_������, ������������_�������_������, ������������_�������_�����_��_���_�����_������, ������������_�������_�����_����������_�������� As Integer
Dim ������������_�������_Date_iss, ������������_�������_������_������, ������������_�������_����_�������, ������������_�������_��������������_�����, ������������_�������_���������, ������������_�������_�����_������_���_����, ������������_�������_CLIENT_ID, ������������_�������_�����_�������_�_�������, ������������_�������_������_�������� As Integer
Dim �������_���, �������_�����������_������������ As String
Dim count_�������_���, �������_�����_�_DB_Result_����2 As Integer
Dim �������_�����_���_��_�������, �������_�����_��_�������, �������_���_��_������� As String

  ' ���� ��� ������ ML-����
  Application.StatusBar = "�������_ML ..."
  
  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = Dir(In_MLName) & "_�������_ML_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = Dir(In_MLName) & "_�������_ML_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If
        
  ' ������� ��� ������ � ������
  If �����������_�_���������_����� = True Then
    Print #1, "��������� ML-�����:"
  End If
    
  ' ��������� ������� BASE\Mortgage.xlsx
  Workbooks.Open (ThisWorkbook.Path + "\Base\Mortgage.xlsx")
        
  ' ��������� � ML-����
  Workbooks(In_MLName).Activate
  
  ' ������� �� ������� "������_������"
  Sheets("������_������").Select
  
  ' ������������� ������� ��������� ��� � ��� ���� ������
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("������").CurrentPage = "��������� ��1"
  
  ' ������� ������� "����� ����"
  column_�����_���� = ColumnByValue(In_MLName, "������_������", "����� ����", 100, 100)
  
  ' ������� ������ " ����� ������"
  row_�����_������ = rowByValue(In_MLName, "������_������", " ����� ������", 100, 100)

  ' ��������� ������� �������
  Workbooks(In_MLName).Sheets("������_������").Cells(row_�����_������, column_�����_����).ShowDetail = True

  ' ������� �� ����������� ������� "����3"
  Sheets("����3").Select
  
  ' ��������� ����� � �����
  rowCount = 2
  ' ������
  ������_���_����� = 0
  ������_���_�� = 0
  ������_�������_�������_�� = 0
  ������_�������_�������_����� = 0
  ������_��������_�������_�� = 0
  ������_��������_�������_����� = 0
  ������_�����������_�� = 0
  ������_�����������_����� = 0
  ������_���������_�����_�� = 0
  ������_���������_�����_����� = 0
  ������_������_���������_�� = 0
  ������_������_���������_����� = 0
  ' ���� ������ ������� � ������ 1
  ������������_�������_CREDIT_PROGRAMM_OTHER = 0
  ������������_�������_�����_������ = 0
  ������������_�������_STATUS_RETAIL = 0
  ������������_�������_��� = 0
  ������������_�������_������������_�������� = 0
  ������������_�������_������ = 0
  ������������_�������_�����_��������_������ = 0
  ������������_�������_FIO = 0
  ������������_�������_���_�������� = 0
  ������������_�������_��������_�������� = 0
  ������������_�������_������� = 0
  ������������_�������_���� = 0
  ������������_�������_�����_����������� = 0
  ������������_�������_����_������ = 0
  ������������_�������_������ = 0
  ������������_�������_�����_����������_�������� = 0
  ������������_�������_Date_iss = 0
  ������������_�������_������_������ = 0
  ������������_�������_����_������� = 0
  ������������_�������_��������������_����� = 0
  ������������_�������_��������� = 0
  ������������_�������_�����_������_���_���� = 0
  ������������_�������_CLIENT_ID = 0
  ������������_�������_�����_�������_�_������� = 0
  ������������_�������_������_�������� = 0

  ' ��������: ���������� �����, ����� ������ �� ML, ������ ��� ���� ��� ���, �� ����� ������ � ����� ������! (31-01-2020) � ���� � ���� � �������� ��������� ������������ ���� ������, ���� ������� � ������� ������� �� �������

  ColumnCount = 1
  Do While (IsEmpty(Cells(1, ColumnCount)) = False)
    
    ' ���� �������� ������� CREDIT_PROGRAMM_OTHER
    If Cells(1, ColumnCount).Value = "CREDIT_PROGRAMM_OTHER" Then
      ������������_�������_CREDIT_PROGRAMM_OTHER = ColumnCount
    End If
    ' ���� �������� ������� �����_������
    If Cells(1, ColumnCount).Value = "����� ������" Then
      ������������_�������_�����_������ = ColumnCount
    End If
    ' ���� �������� ������� STATUS_RETAIL
    If Cells(1, ColumnCount).Value = "STATUS_RETAIL" Then
      ������������_�������_STATUS_RETAIL = ColumnCount
    End If
    ' ���� �������� ������� ���
    If Cells(1, ColumnCount).Value = "���" Then
      ������������_�������_��� = ColumnCount
    End If
    ' ���� �������� ������� ������������ ��������
    If Cells(1, ColumnCount).Value = "������������ ��������" Then
      ������������_�������_������������_�������� = ColumnCount
    End If
    ' ���� �������� ������� ������
    If Cells(1, ColumnCount).Value = "������" Then
      ������������_�������_������ = ColumnCount
    End If
    ' ���� �������� ������� �����_��������_������
    If Cells(1, ColumnCount).Value = "����� �������� ������" Then
      ������������_�������_�����_��������_������ = ColumnCount
    End If
    ' ���� �������� ������� FIO
    If Cells(1, ColumnCount).Value = "FIO" Then
      ������������_�������_FIO = ColumnCount
    End If
    ' ���� �������� ������� ���_��������
    If Cells(1, ColumnCount).Value = "��� ��������" Then
      ������������_�������_���_�������� = ColumnCount
    End If
    ' ���� �������� ������� ��������_��������
    If Cells(1, ColumnCount).Value = "�������� ��������" Then
      ������������_�������_��������_�������� = ColumnCount
    End If
    ' ���� �������� ������� �������
    If Cells(1, ColumnCount).Value = "�������" Then
      ������������_�������_������� = ColumnCount
    End If
    ' ���� �������� ������� ����
    If Cells(1, ColumnCount).Value = "����" Then
      ������������_�������_���� = ColumnCount
    End If
   ' ���� �������� ������� ����� �����������
    If Cells(1, ColumnCount).Value = "����� �����������" Then
      ������������_�������_�����_����������� = ColumnCount
    End If
    ' ���� �������� ������� ���� ������
    If Cells(1, ColumnCount).Value = "���� ������" Then
      ������������_�������_����_������ = ColumnCount
    End If
    ' ���� �������� ������� ������
    If Cells(1, ColumnCount).Value = "������" Then
      ������������_�������_������ = ColumnCount
    End If
    ' ����� �� ���. ����� ������
    If Cells(1, ColumnCount).Value = "����� �� ���. ����� ������" Then
      ������������_�������_�����_��_���_�����_������ = ColumnCount
    End If
    ' ���� ����� ��������
    If Cells(1, ColumnCount).Value = "� ���������� ��������" Then
      ������������_�������_�����_����������_�������� = ColumnCount
    End If
    ' ���� Date_iss
    If Cells(1, ColumnCount).Value = "Date_iss" Then
      ������������_�������_Date_iss = ColumnCount
    End If
    ' ���� ������ ������
    If Cells(1, ColumnCount).Value = "������ ������" Then
      ������������_�������_������_������ = ColumnCount
    End If
    ' ���� ����_�������
    If Cells(1, ColumnCount).Value = "���� ������� (���)" Then
      ������������_�������_����_������� = ColumnCount
    End If
    ' ���� ��������������_�����
    If Cells(1, ColumnCount).Value = "�������������� �����" Then
      ������������_�������_��������������_����� = ColumnCount
    End If
    ' ���� ���������
    If Cells(1, ColumnCount).Value = "��������� (��� ��)" Then
      ������������_�������_��������� = ColumnCount
    End If
    ' ���� ����� ������_��� ����
    If Cells(1, ColumnCount).Value = "����� ������_��� ����" Then
      ������������_�������_�����_������_���_���� = ColumnCount
    End If
    ' ���� CLIENT_ID
    If Cells(1, ColumnCount).Value = "CLIENT_ID" Then
      ������������_�������_CLIENT_ID = ColumnCount
    End If
    ' ���� ����� ������� � �������
    If Cells(1, ColumnCount).Value = "����� ������� � �������" Then
      ������������_�������_�����_�������_�_������� = ColumnCount
    End If
    ' ���� ������_��������
    If Cells(1, ColumnCount).Value = "������ ��������" Then
      ������������_�������_������_�������� = ColumnCount
    End If
    
    ' ��������� ������
    ColumnCount = ColumnCount + 1
  
  Loop ' ��������� ����� � �����
  
  ' ������� ��� ������ �� ������� ������ = "��������� ��1"
  Do While (Trim(Cells(rowCount, ������������_�������_������).Value) = "��������� ��1")
   
    ' ��������� ������ ���� "������ ����� (������ �����)"
    ' If Cells(RowCount, ������������_�������_STATUS_RETAIL).Value = "������ ����� (������ �����)" Then
    
    ' � ������ ������� ML-����� ��� ������� STATUS_RETAIL, ������� ��������� �� "������" = "1"
    If Cells(rowCount, ������������_�������_������).Value = "1" Then
    
     ' ������ "12" �������_�����_��_�������, ������ "2019" �������_���_��_�������
     If (Mid(CStr(CDate(Cells(rowCount, ������������_�������_����_������).Value)), 4, 2) = �������_�����_��_�������) And (Mid(CStr(CDate(Cells(rowCount, ������������_�������_����_������).Value)), 7, 4) = �������_���_��_�������) Then

      ' ������ �� ����������
      ������_���_����� = ������_���_����� + Cells(rowCount, ������������_�������_�����_������).Value
      ������_���_�� = ������_���_�� + 1
      ' ���������� ������
      �������_�_���������_�������� = False
      ' �������_�������
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "������� �������/���������������� ������� �������/����� ������������� ������������/��������/��������� �����" Then
        ������_�������_�������_�� = ������_�������_�������_�� + 1
        ������_�������_�������_����� = ������_�������_�������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_��������_�������
      If (Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "���.���������/�������� �������/����� ������������� ������������/��������/��������� �����") Or (Cells(rowCount, "AW").Value = "���.���������/�������� �������/����� ������������� ������������/��������/��������� �����") Then
        ������_��������_�������_�� = ������_��������_�������_�� + 1
        ������_��������_�������_����� = ������_��������_�������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_�����������
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "����� ������������� ������������(����)/��������/ ��������� �����" Then
        ������_�����������_�� = ������_�����������_�� + 1
        ������_�����������_����� = ������_�����������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_���������_�����
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "����� ������������� ������������(����)/��������/ ��������� �����" Then
        ������_���������_�����_�� = ������_���������_�����_�� + 1
        ������_���������_�����_����� = ������_���������_�����_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������ ���������
      If �������_�_���������_�������� = False Then
        ������_������_���������_�� = ������_������_���������_�� + 1
        ������_������_���������_����� = ������_������_���������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If

      End If ' ������� ����� � ���
      
    End If ' ������ �����
      
    ' ��������� ������
    rowCount = rowCount + 1
  Loop ' ��������� ����� � �����
  
  ' ������� ������ � ��� �������
  
  ' ������ ������� �������
  ThisWorkbook.Sheets("����1").Range("D148").Value = ������_�������_�������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F148").Value = ������_�������_�������_��
  ' ������_��������_�������
  ThisWorkbook.Sheets("����1").Range("D149").Value = ������_��������_�������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F149").Value = ������_��������_�������_��
  ' ������_�����������
  ThisWorkbook.Sheets("����1").Range("D150").Value = ������_�����������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F150").Value = ������_�����������_��
  ' ������_���������_�����
  ThisWorkbook.Sheets("����1").Range("D151").Value = ������_���������_�����_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F151").Value = ������_���������_�����_��
  ' ������ ���������
  ThisWorkbook.Sheets("����1").Range("D152").Value = ������_������_���������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F152").Value = ������_������_���������_��
  ' ����������_�����_����
  ThisWorkbook.Sheets("����1").Range("D147").Value = Round(������_���_����� / 1000, 0)
  ' ��� ������ ������������� ������ ��� ������ ����� �������
  ThisWorkbook.Sheets("����1").Range("D147").NumberFormat = "#,##0"
  ' ����������_��_����
  ThisWorkbook.Sheets("����1").Range("F147").Value = ������_���_��
  ' ��������� ������� � % ����������
  ThisWorkbook.Sheets("����1").Range("G147").FormulaR1C1 = "=IF(RC[-3]>0,((RC[-3]*100)/RC[-4])/100,0)"
  ' ����������� ���� � ������� ���������
  ' ���� �� (����������� �����) �� ����� 50-60%
  ' ������� =����(D147>0;((����*100)/����)/100;0)
  ' ThisWorkbook.Sheets("����1").Range("G150").Value = "���� " + CStr(Round(((ThisWorkbook.Sheets("����1").Range("F150").Value * 100) / ThisWorkbook.Sheets("����1").Range("F147").Value), 1)) + "%"
  ' ThisWorkbook.Sheets("����1").Range("H150").Value = "" ' "(��������: 50%)"
  ' ���� �� �������� ������� �� ����� 20%
  ' ThisWorkbook.Sheets("����1").Range("G149").Value = "���� " + CStr(Round(((ThisWorkbook.Sheets("����1").Range("F149").Value * 100) / ThisWorkbook.Sheets("����1").Range("F147").Value), 1)) + "%"
  ' ThisWorkbook.Sheets("����1").Range("H149").Value = "" ' "(��������: 20%)"
  
  ' TR �� �� �� ����� 70%
  ' TR �� �� �� ����� 35%
       
  ' ���� �� 2020
  ' ������ ����!
  ' ������� ��������� ����� ����� �� �����:
  ' ��  �������,
  ' ���,
  ' ���� ��/�� -40/60,
  ' ���� ������������,
  ' ���� SRG �������,
  ' ����������� �������� ����� �� ���������� ������������� �����.
  ' ����� ��� ������ ���� 3  KPI �� �����:
  ' ��������� ��������� ������ �� ������:
  ' ���� �� ������� �� ��������� 460 ��.
  ' ��  ��������� ������� ������ � 15/85 �� 35/65 (��/��)
  ' �� ���������� ������ ����������  TR � 18% (2019 �.) �� 35%, �� ��������� �������� - �� 50%.
       
  ' --- ����� ����������� ������ ---

  ' --- ������� ������������� ������������ ---
        
  ' ���������� ����� 1 �� ������� ��� ����������� �������, ����������� �������
  
  ' �������� ������ � ������� BASE\Mortgage �� ��������� � ��� ��������� �� ML
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "��������_��_���������") = "1" Then
    ��������_��_��������� = True
  Else
    ��������_��_��������� = False
  End If
  
  ' ��������� ���� �� ���� ������� � ������� � ������ ������� ���� 0 ���� 1
  �������_��� = ""
  �������_�����������_������������ = ""
  count_�������_��� = 0
  �������_�����_�_DB_Result_����2 = 4
  ' ������� - ����� �������� ����������� � ��� ���� 2  (���� ���� � ����)
  �����_��������_����������� = 0
  ' �������� �� ������ ������
  rowCount = 2
  ' ����� ���� �� ������� "������", � ������� ������ ���� "��������� ��1"
  Do While (Cells(rowCount, ������������_�������_������) = ("��������� ��1"))
      
    ' ���� � ������ ������ �����?
    ' If Cells(RowCount, ������������_�������_STATUS_RETAIL).Value = "������ ����� (������ �����)" Then � ������ ������� ML-����� ��� ������� STATUS_RETAIL, ������� ��������� �� "������" = "1"
    If Cells(rowCount, ������������_�������_������).Value = "1" Then
               
      ' ���� ������� ��� �� ����� �����������, �� ��� ������
      If �������_��� <> Cells(rowCount, ������������_�������_���).Value Then
                
        ' ��������� � ���� ������ � ������������� ����������� � ������ ��������, ���� ������� �� ����� 0
        If count_�������_��� > 0 Then
          Call �����_�_�����_������_��_�����������_2(In_MLName, �������_���, count_�������_���, �������_�����_�_DB_Result_����2, �������_�����������_������������, False)
          ' ���� ���� �� � ���� � � ����� ������ ������ ������ � ����� 1
          �������_�����_�_DB_Result_����2 = �������_�����_�_DB_Result_����2 + 1
          ' ������� - ����� �������� ����������� � ��� ���� 2  (���� ���� � ����)
          �����_��������_����������� = �����_��������_����������� + 1
        End If
        
        ' �������� �������
        count_�������_��� = 0
        
        ' ����������� �������� ���
        �������_��� = Cells(rowCount, ������������_�������_���).Value
        ' ������������ ��������
        �������_�����������_������������ = Cells(rowCount, ������������_�������_������������_��������).Value
        
        ' ������ �� ��������� ������
        ' ����� �������� ������
        ' FIO
        ' ��� ��������
        ' �������� ��������
        ' �������
        ' ���� (��������� ��� ����������)

      End If
      
      ' ������� �������� ������� �� �����������
      count_�������_��� = count_�������_��� + 1
      
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop ' ��������� ����� � �����
  
  ' ��������� - ���� ��������� ������ ���� �������� � �����?
  If count_�������_��� > 0 Then
    Call �����_�_�����_������_��_�����������_2(In_MLName, �������_���, count_�������_���, �������_�����_�_DB_Result_����2, �������_�����������_������������, False)
    �������_�����_�_DB_Result_����2 = �������_�����_�_DB_Result_����2 + 1
    ' ������� - ����� �������� ����������� � ��� ���� 2 (���� ���� � ����)
    �����_��������_����������� = �����_��������_����������� + 1
  End If
    
  ' ������� �� ��� ���� 2 � �������������
  ThisWorkbook.Activate
  ThisWorkbook.Sheets("����2").Select
  Range("D4").Select
  ThisWorkbook.Worksheets("����2").Sort.SortFields.Clear
  ThisWorkbook.Worksheets("����2").Sort.SortFields.Add Key:=Range("D4"), SortOn:=xlSortOnValues, Order:=xlDescending, DataOption:=xlSortNormal
    With ThisWorkbook.Worksheets("����2").Sort
        .SetRange Range("B3:D" + CStr(�����_��������_�����������))
        .Header = xlNo
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

  ' ������ ������ � ��������������� ����� �� ����� 2 ��� ��������
  If True Then
    
    ' ������� �����
    rowCount = 2
  
    ' ����� ���� �� ������� "������", � ������� ������ ���� "��������� ��1"
    Do While (Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������) = "��������� ��1")
      
      ' ���� � ������ ������ �����?
      If Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value = "1" Then
          
        ' ����������� �������� ���
        If Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���).Value <> "" Then
          �������_��� = Trim(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���).Value)
        Else
          �������_��� = "��� ���"
        End If
                
        ' ������
        �������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value
        ' ���� ������ - CDate(Cells(RowCount, ������������_�������_����_������
        �������_����_������ = CDate(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����_������).Value)
        ' ������������ ��������
        �������_�����������_������������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������������_��������).Value
        ' ����� �������� ������
        �������_�����_��������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_��������_������).Value
        ' FIO
        �������_FIO = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_FIO).Value
        ' ��� ��������
        ' �������� ��������
        �������_��������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_��������_��������).Value
        ' �������
        ' ������
        �������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value
        ' ���� (��������� ��� ����������)
        �������_���� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����).Value
        ' ����� �� ��� ����� ������
        �������_�����_��_���_�����_������ = Round(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_��_���_�����_������).Value / 1000, 1)
        ' ����� ��������
        �������_�����_����������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_����������_��������).Value
        ' �������_Date_iss
        �������_Date_iss = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_Date_iss).Value
        ' �������_������_������
        �������_������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������_������).Value
        ' �������_����_�������
        �������_����_������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����_�������).Value
        ' + �������_CREDIT_PROGRAMM_OTHER
        �������_CREDIT_PROGRAMM_OTHER = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value
        ' �������_��������������_�����
        �������_��������������_����� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_��������������_�����).Value
        ' �������_���������
        �������_��������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���������).Value
        ' + �������_�����_��������_������
        ' �������_�����_������_���_����
        �������_�����_������_���_���� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_������_���_����).Value
        ' �������_CLIENT_ID
        �������_CLIENT_ID = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_CLIENT_ID).Value
        ' + �������_FIO
        ' + �������_�����_��_���_�����_������
        ' �������_�����_�������_�_�������
        �������_�����_�������_�_������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_�������_�_�������).Value
        ' + �������_������������_��������
        ' + �������_���
        ' + �������_��������_��������
        ' �������_���_��������
        �������_���_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���_��������).Value
        ' �������_������_��������
        �������_������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������_��������).Value
        ' � DB_Result �� ���� 2 �� ������� "B" ���� ���
        ' ���� � ������� ��� ������ ����, �� ��� �������
        If Mid(�������_���, 1, 1) = "0" Then
          �������_��� = Mid(�������_���, 2, Len(�������_���) - 1)
        End If
        
        ' ��������� �����
        Set fcell = Columns("B:B").Find(�������_���, LookAt:=xlWhole)
        If Not fcell Is Nothing Then
          
          ' MsgBox "����� � ������: " + CStr(fcell.Row)
          
          ' �������� ������ ������, ��������� �� ��������� Rows("6:6").Select
          Rows(CStr(fcell.Row + 1) + ":" + CStr(fcell.Row + 1)).Select
          
          ' ��������� ����� ������
          Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
          
          ' ������ ������ � ����� ������
          ThisWorkbook.Sheets("����2").Range("C" + CStr(fcell.Row + 1)).Value = �������_FIO
          ' �������������� ����� - "����� �� ���. ����� ������"
          ' ��� ����������� ��� � ��� 7744000912 �������� �����
          If �������_��� = "7744000912" Then
            �������_�����_��_���_�����_������ = 0
          End If
          ' �����_��_���_�����_������
          ThisWorkbook.Sheets("����2").Range("D" + CStr(fcell.Row + 1)).Value = �������_�����_��_���_�����_������
          ' ����� �������
          ThisWorkbook.Sheets("����2").Range("E" + CStr(fcell.Row + 1)).Value = ��������_�����_�������������(�������_�����_��������_������, ";", 2, 3)
          ' �������
          ThisWorkbook.Sheets("����2").Range("F" + CStr(fcell.Row + 1)).Value = �������_��������_��������
          ' ���� ������
          ThisWorkbook.Sheets("����2").Range("G" + CStr(fcell.Row + 1)).Value = CStr(�������_����_������)
          ' ������
          ThisWorkbook.Sheets("����2").Range("H" + CStr(fcell.Row + 1)).Value = �������_������_������
          ' � ������� H ������ ������ �� ������������ �����������, ���� ��� ���
          If �������_��� = "��� ���" Then
            ThisWorkbook.Sheets("����2").Range("I" + CStr(fcell.Row + 1)).Value = "�����������: " + �������_�����������_������������
          End If
          ' � ������� J ������ Client ID
          ThisWorkbook.Sheets("����2").Range("J" + CStr(fcell.Row + 1)).Value = �������_CLIENT_ID
                    
        End If
                    
        ' ��������� ������ � ������� BASE\Mortgage
        Call Insert_To_Table_Mortgage(�������_�����_����������_��������, �������_Date_iss, �������_������_������, �������_����_�������, �������_CREDIT_PROGRAMM_OTHER, �������_��������������_�����, �������_���������, �������_�����_��������_������, �������_�����_������_���_����, �������_CLIENT_ID, �������_FIO, �������_�����_��_���_�����_������, �������_�����_�������_�_�������, �������_�����������_������������, �������_���, �������_��������_��������, �������_���_��������, �������_������_��������, �������_������, �������_������, �������_����, ��������_��_���������)
                                                           
      End If
    
      ' ��������� ������
      rowCount = rowCount + 1
    
    Loop ' ��������� ����� � �����

    ' ������ �������� - ����������� �������� �� ���
      
    ' ������� ����� - �������� � ������ ������
    rowCount = 4
    ������_�����_�����������_������� = 0
    ����_����� = False
    ' ���� � "���" � "������������ �����������" �� ����� �����
    Do While (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value <> "") Or (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "")
      
      ' ������ ����� �����������
      If (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value = "") And (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "") And (����_����� = False) Then
        ' ������ ����� ����������� �������
        ������_�����_�����������_������� = rowCount
        ����_����� = True
      End If

      ' ����� ����� �����������
      If (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value <> "") And (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "") And (������_�����_�����������_������� <> 0) Then
        ' ���������� � ���������� ����� �� -1
        ThisWorkbook.Sheets("����2").Range("C" + CStr(������_�����_�����������_�������) + ":C" + CStr(rowCount - 1)).Select
        Selection.Rows.Group
        ����_����� = False
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    
    Loop ' ��������� ����� � �����
        
    Columns("E:I").Select
    Selection.Columns.Group
                
    ' ��������� ������
    ActiveSheet.Outline.ShowLevels RowLevels:=1, ColumnLevels:=1

    ' ��������� � ������ ������
    Range("A1").Select
    
  End If
  
  ' ��������� ������� BASE\Mortgage.xlsx � ����������� ��������� ���������
  Workbooks("Mortgage.xlsx").Close SaveChanges:=True
  
  ' --- ����� ������� ������������� ������������ ---

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If

End Sub


' 8. ������� �� ML (�� 2021)
Sub �������_ML(In_MLName)

' ����������� � ��������� ���� ������ DB
Dim �����������_�_���������_����� As Boolean
Dim �������_�_�������_������_�����_������, ������_�����_������, ������_��������_���_���, ������_������ As String
Dim ������_���_�����, ������_�������_�������_�����, ������_��������_�������_�����, ������_�����������_�����, ������_���������_�����_�����, ������_������_���������_����� As Double
Dim ������_���_��, ������_�������_�������_��, ������_��������_�������_��, ������_�����������_��, ������_���������_�����_��, ������_������_���������_�� As Integer
Dim �������_�_���������_�������� As Boolean
Dim ������������_�������_CREDIT_PROGRAMM_OTHER, ������������_�������_�����_������, ������������_�������_STATUS_RETAIL, ������������_�������_���, ������������_�������_������������_��������, ������������_�������_������, ������������_�������_�����_��������_������, ������������_�������_FIO, ������������_�������_���_��������, ������������_�������_��������_��������, ������������_�������_�������, ������������_�������_����, ������������_�������_�����_�����������, ������������_�������_����_������, ������������_�������_������, ������������_�������_�����_��_���_�����_������, ������������_�������_�����_����������_�������� As Integer
Dim ������������_�������_Date_iss, ������������_�������_������_������, ������������_�������_����_�������, ������������_�������_��������������_�����, ������������_�������_���������, ������������_�������_�����_������_���_����, ������������_�������_CLIENT_ID, ������������_�������_�����_�������_�_�������, ������������_�������_������_�������� As Integer
Dim �������_���, �������_�����������_������������ As String
Dim count_�������_���, �������_�����_�_DB_Result_����2 As Integer
Dim �������_�����_���_��_�������, �������_�����_��_�������, �������_���_��_������� As String

  ' ���� ��� ������ ML-����
  Application.StatusBar = "�������_ML ..."
  
  ' ����������� � ��������� ���� ������ DB: True - ��������, False - �� ��������
  �����������_�_���������_����� = False

  ' ����������� � ��������� �����
  If �����������_�_���������_����� = True Then
    ' � ���� ������� ���:
    MyFile1 = Dir(In_MLName) & "_�������_ML_1_log.txt"
    Open MyFile1 For Output As #1
    ' ������ ������� ����� ����� - ����� � ���������� �������
    MyFile2 = Dir(In_MLName) & "_�������_ML_2_log.txt"
    ' ������� ��� ������
    Open MyFile2 For Output As #2
  End If
        
  ' ������� ��� ������ � ������
  If �����������_�_���������_����� = True Then
    Print #1, "��������� ML-�����:"
  End If
    
  ' ��������� ������� BASE\Mortgage.xlsx
  Workbooks.Open (ThisWorkbook.Path + "\Base\Mortgage.xlsx")
        
  ' ��������� � ML-����
  Workbooks(In_MLName).Activate
  
  ' ������� �� ������� "������_������"
  Sheets("������_������").Select
  
  ' --- ����� ������� ML-����� ---
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("������").CurrentPage = "��������� ��1"
     
     
  ' *** ������ ������ ML
     
     
  ' 1. ����� ������ �� �����������
  ' ��������� �������
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").CurrentPage = "�����������"
          
  ' ���������� ���������� - ��� �������� �� ������ ��������
  �������_�_�������_������_�����_������ = ""
  ������_�����_������ = ""
  ������_��������_���_��� = ""
  ������_������ = ""
  ������_AR = ""
  
  ' ���� ��������� ����� Excel - ���������� ������� �������� ������ �� ������ $P$12 :����� ����
  For Each Cell In ActiveSheet.UsedRange
    
    ' ���� ������ �� ������
    If Not IsEmpty(Cell) Then
      
      ' ����� ������ � �������
      ' ����� �������
      intC = Cell.Column
      ' ����� ������
      intR = Cell.Row

      ' ������� ��� ������ � ������
      If �����������_�_���������_����� = True Then
        Print #1, Cell.Address, ":" + Cell.Formula
      End If
        
      ' --- ��������� ������ ML-����� ---
      
      ' ������� ������� ������ ����� ������
      If (CStr(Cells(intR, intC).Value) = "����� ����") And (�������_�_�������_������_�����_������ = "") Then
      
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ����"
        End If
        ' ����� ������� � �������
        �������_�_�������_������_�����_������ = ����������_�����(Mid(Cell.Address, 2, 1))
        If �����������_�_���������_����� = True Then
          Print #1, "������� � �������: " + �������_�_�������_������_�����_������
        End If
      End If
            
      ' ������� ������ "����� ������"
      If Trim(CStr(Cells(intR, intC).Value)) = "����� ������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ����� ������"
        End If
        ' ����� ������
        ������_�����_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ������: " + ������_�����_������
        End If
      End If
      
      ' ������� ������ "�������� (��� ���)"
      If Trim(CStr(Cells(intR, intC).Value)) = "�������� (��� ���)" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ �������� (��� ���)"
        End If
        ' ����� ������
        ������_��������_���_��� = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_��������_���_���: " + ������_��������_���_���
        End If
      End If
      
      ' ������� ������ "������"
      If Trim(CStr(Cells(intR, intC).Value)) = "������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_������"
        End If
        ' ����� ������
        ������_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_������: " + ������_������
        End If
      End If
            
      ' ������� ������ AR
      If Trim(CStr(Cells(intR, intC).Value)) = "AR (�����������), %" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_AR"
        End If
        ' ����� ������
        ������_AR = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_AR: " + ������_AR
        End If
      End If
                        
      ' --- ����� ��������� ������ ML-����� ---
      
    End If ' ���� ������ �� ������
        
  Next
  
  ' ����������� ������
  Range(�������_�_�������_������_�����_������ + ������_�����_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D155")
  Range(�������_�_�������_������_�����_������ + ������_��������_���_���).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E155")
  Range(�������_�_�������_������_�����_������ + ������_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G155")
  ' AR
  Range(�������_�_�������_������_�����_������ + ������_AR).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F155")
  
  ' 2. ����� ������ �� ��������� �����
  ' ��������� �������
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").CurrentPage = "��������� �����"
            
  ' ���������� ���������� - ��� �������� �� ������ ��������
  �������_�_�������_������_�����_������ = ""
  ������_�����_������ = ""
  ������_��������_���_��� = ""
  ������_������ = ""
  ������_AR = ""
  
  ' ���� ��������� ����� Excel - ���������� ������� �������� ������ �� ������ $P$12 :����� ����
  For Each Cell In ActiveSheet.UsedRange
    
    ' ���� ������ �� ������
    If Not IsEmpty(Cell) Then
      
      ' ����� ������ � �������
      ' ����� �������
      intC = Cell.Column
      ' ����� ������
      intR = Cell.Row

      ' ������� ��� ������ � ������
      If �����������_�_���������_����� = True Then
        Print #1, Cell.Address, ":" + Cell.Formula
      End If
        
      ' --- ��������� ������ ML-����� ---
      
      ' ������� ������� ������ ����� ������
      If (CStr(Cells(intR, intC).Value) = "����� ����") And (�������_�_�������_������_�����_������ = "") Then
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ����"
        End If
        ' ����� ������� � �������
        �������_�_�������_������_�����_������ = ����������_�����(Mid(Cell.Address, 2, 1))
        If �����������_�_���������_����� = True Then
          Print #1, "������� � �������: " + �������_�_�������_������_�����_������
        End If
      End If
      
      ' ������� ������ "����� ������"
      If Trim(CStr(Cells(intR, intC).Value)) = "����� ������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ����� ������"
        End If
        ' ����� ������
        ������_�����_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ������: " + ������_�����_������
        End If
      End If
      
      ' ������� ������ "�������� (��� ���)"
      If Trim(CStr(Cells(intR, intC).Value)) = "�������� (��� ���)" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ �������� (��� ���)"
        End If
        ' ����� ������
        ������_��������_���_��� = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_��������_���_���: " + ������_��������_���_���
        End If
      End If
      
      ' ������� ������ "������"
      If Trim(CStr(Cells(intR, intC).Value)) = "������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_������"
        End If
        ' ����� ������
        ������_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_������: " + ������_������
        End If
      End If
      
      ' ������� ������ AR
      If Trim(CStr(Cells(intR, intC).Value)) = "AR (�����������), %" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_AR"
        End If
        ' ����� ������
        ������_AR = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_AR: " + ������_AR
        End If
      End If

      
      ' --- ����� ��������� ������ ML-����� ---
      
    End If ' ���� ������ �� ������
        
  Next
  
  ' ����������� ������
  Range(�������_�_�������_������_�����_������ + ������_�����_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D156")
  Range(�������_�_�������_������_�����_������ + ������_��������_���_���).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E156")
  Range(�������_�_�������_������_�����_������ + ������_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G156")
  ' AR
  Range(�������_�_�������_������_�����_������ + ������_AR).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F156")
 
  ' 3. ����� ������ �� ����������������
  
  ' ��������� �������
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").CurrentPage = "����������������"
  
  ' ���������� ���������� - ��� �������� �� ������ ��������
  �������_�_�������_������_�����_������ = ""
  ������_�����_������ = ""
  ������_��������_���_��� = ""
  ������_������ = ""
  ������_AR = ""
  
  ' ���� ��������� ����� Excel - ���������� ������� �������� ������ �� ������ $P$12 :����� ����
  For Each Cell In ActiveSheet.UsedRange
    
    ' ���� ������ �� ������
    If Not IsEmpty(Cell) Then
      
      ' ����� ������ � �������
      ' ����� �������
      intC = Cell.Column
      ' ����� ������
      intR = Cell.Row

      ' ������� ��� ������ � ������
      If �����������_�_���������_����� = True Then
        Print #1, Cell.Address, ":" + Cell.Formula
      End If
        
      ' --- ��������� ������ ML-����� ---
      
      ' ������� ������� ������ ����� ������
      If (CStr(Cells(intR, intC).Value) = "����� ����") And (�������_�_�������_������_�����_������ = "") Then
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ����"
        End If
        ' ����� ������� � �������
        �������_�_�������_������_�����_������ = ����������_�����(Mid(Cell.Address, 2, 1))
        If �����������_�_���������_����� = True Then
          Print #1, "������� � �������: " + �������_�_�������_������_�����_������
        End If
      End If
      
      ' ������� ������ "����� ������"
      If Trim(CStr(Cells(intR, intC).Value)) = "����� ������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ����� ������"
        End If
        ' ����� ������
        ������_�����_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ������: " + ������_�����_������
        End If
      End If
      
      ' ������� ������ "�������� (��� ���)"
      If Trim(CStr(Cells(intR, intC).Value)) = "�������� (��� ���)" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ �������� (��� ���)"
        End If
        ' ����� ������
        ������_��������_���_��� = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_��������_���_���: " + ������_��������_���_���
        End If
      End If
      
      ' ������� ������ "������"
      If Trim(CStr(Cells(intR, intC).Value)) = "������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_������"
        End If
        ' ����� ������
        ������_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_������: " + ������_������
        End If
      End If
      
      ' ������� ������ AR
      If Trim(CStr(Cells(intR, intC).Value)) = "AR (�����������), %" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_AR"
        End If
        ' ����� ������
        ������_AR = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_AR: " + ������_AR
        End If
      End If
      
      ' --- ����� ��������� ������ ML-����� ---
      
    End If ' ���� ������ �� ������
        
  Next
    
  ' ����������� ������
  Range(�������_�_�������_������_�����_������ + ������_�����_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D157")
  Range(�������_�_�������_������_�����_������ + ������_��������_���_���).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E157")
  Range(�������_�_�������_������_�����_������ + ������_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G157")
  ' AR
  Range(�������_�_�������_������_�����_������ + ������_AR).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F157")
  
  

  ' 4. ����� ������ �� ��������� �������
  ' ��������� �������
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").ClearAllFilters
  ActiveSheet.PivotTables("SASApp:CARDS.ALL_IPOT").PivotFields("�������").CurrentPage = "��������� �������"
  
  ' ���������� ���������� - ��� �������� �� ������ ��������
  �������_�_�������_������_�����_������ = ""
  ������_�����_������ = ""
  ������_��������_���_��� = ""
  ������_������ = ""
  ������_AR = ""
  
  ' ���� ��������� ����� Excel - ���������� ������� �������� ������ �� ������ $P$12 :����� ����
  For Each Cell In ActiveSheet.UsedRange
    
    ' ���� ������ �� ������
    If Not IsEmpty(Cell) Then
      
      ' ����� ������ � �������
      ' ����� �������
      intC = Cell.Column
      ' ����� ������
      intR = Cell.Row

      ' ������� ��� ������ � ������
      If �����������_�_���������_����� = True Then
        Print #1, Cell.Address, ":" + Cell.Formula
      End If
        
      ' --- ��������� ������ ML-����� ---
      
      ' ������� ������� ������ ����� ������
      If (CStr(Cells(intR, intC).Value) = "����� ����") And (�������_�_�������_������_�����_������ = "") Then
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ����"
        End If
        ' ����� ������� � �������
        �������_�_�������_������_�����_������ = ����������_�����(Mid(Cell.Address, 2, 1))
        If �����������_�_���������_����� = True Then
          Print #1, "������� � �������: " + �������_�_�������_������_�����_������
        End If
      End If
      
      ' ������� ������ "����� ������"
      If Trim(CStr(Cells(intR, intC).Value)) = "����� ������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ����� ������"
        End If
        ' ����� ������
        ������_�����_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������ ����� ������: " + ������_�����_������
        End If
      End If
      
      ' ������� ������ "�������� (��� ���)"
      If Trim(CStr(Cells(intR, intC).Value)) = "�������� (��� ���)" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ �������� (��� ���)"
        End If
        ' ����� ������
        ������_��������_���_��� = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_��������_���_���: " + ������_��������_���_���
        End If
      End If
      
      ' ������� ������ "������"
      If Trim(CStr(Cells(intR, intC).Value)) = "������" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_������"
        End If
        ' ����� ������
        ������_������ = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_������: " + ������_������
        End If
      End If
            
      ' ������� ������ AR
      If Trim(CStr(Cells(intR, intC).Value)) = "AR (�����������), %" Then
        If �����������_�_���������_����� = True Then
          Print #1, "������� ������ ������_AR"
        End If
        ' ����� ������
        ������_AR = Mid(Cell.Address, 4, 2)
        If �����������_�_���������_����� = True Then
          Print #1, "������_AR: " + ������_AR
        End If
      End If
            
      ' --- ����� ��������� ������ ML-����� ---
      
    End If ' ���� ������ �� ������
        
  Next
  
  ' ����������� ������
  Range(�������_�_�������_������_�����_������ + ������_�����_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("D158")
  Range(�������_�_�������_������_�����_������ + ������_��������_���_���).Copy Destination:=ThisWorkbook.Sheets("����1").Range("E158")
  Range(�������_�_�������_������_�����_������ + ������_������).Copy Destination:=ThisWorkbook.Sheets("����1").Range("G158")
  ' AR
  Range(�������_�_�������_������_�����_������ + ������_AR).Copy Destination:=ThisWorkbook.Sheets("����1").Range("F158")

  ' --- ����������� ������ ---
  ' ������� ������� � ������ ��� ��������
  ������������_�������_������_������ = 0
  ������������_������_�����_����_��_������� = 0
  ������������_�������_�����_������ = 0
  
  ' ������ �����, ��� ������
  �������_�����_���_��_������� = ""
  �������_�����_��_������� = ""
  �������_���_��_������� = ""
  
  ' ���� ������������ ������ �������� � ����� �� �������
  For Each Cell In ActiveSheet.UsedRange
    
    ' ���� ������ �� ������
    If Not IsEmpty(Cell) Then
      
      ' ����� ������ � �������
      ' ����� �������
      intC = Cell.Column
      ' ����� ������
      intR = Cell.Row
      
      ' ������� ������� ������ ����� ������. � ���� ������� ���� ������ "�������� �����" - ������� "S"
      If Trim(CStr(Cells(intR, intC).Value)) = "�������� �����" Then
        ������������_�������_������_������ = intC
      End If
      
      ' ������� ������ � ������� ������, ��� �������� "����� ����"
      If (Trim(CStr(Cells(intR, intC).Value)) = "����� ����") And (������������_�������_������_������ <> 0) Then
        ������������_������_�����_����_��_������� = intR
      End If
      
      ' ������� ������� ����� ������
      If Trim(CStr(Cells(intR, intC).Value)) = "����� ������" Then
        ������������_�������_�����_������ = intC
      End If
      
      
    End If
  Next
  
  ' ������� ����� �� ������� - ����� �� ���������� ������, �� "����� ����". ����� � ������� "201912"
  �������_�����_���_��_������� = Range(ConvertToLetter(������������_�������_������_������) + CStr(������������_������_�����_����_��_������� - 1))
  ' ������ "12"
  �������_�����_��_������� = Mid(�������_�����_���_��_�������, 5, 2)
  ' ������ "2019"
  �������_���_��_������� = Mid(�������_�����_���_��_�������, 1, 4)
          
  ' ��������� ������ - ���������� �������� ����� 1
  ActiveSheet.PivotTables("��������������3").PivotFields("������").ClearAllFilters
  ActiveSheet.PivotTables("��������������3").PivotFields("������").CurrentPage = "��������� ��1"
  ' Range("U24").Select ' ������ �� �������
  Range(ConvertToLetter(������������_�������_�����_������) + CStr(������������_������_�����_����_��_�������)).Select ' �� ���� ���
  Selection.ShowDetail = True


  ' *** ��������� ������� ML ***







  ' ������� �� ����������� ������� "����1"
  Sheets("����1").Select
  
  ' ��������� ����� � �����
  rowCount = 2
  ' ������
  ������_���_����� = 0
  ������_���_�� = 0
  ������_�������_�������_�� = 0
  ������_�������_�������_����� = 0
  ������_��������_�������_�� = 0
  ������_��������_�������_����� = 0
  ������_�����������_�� = 0
  ������_�����������_����� = 0
  ������_���������_�����_�� = 0
  ������_���������_�����_����� = 0
  ������_������_���������_�� = 0
  ������_������_���������_����� = 0
  ' ���� ������ ������� � ������ 1
  ������������_�������_CREDIT_PROGRAMM_OTHER = 0
  ������������_�������_�����_������ = 0
  ������������_�������_STATUS_RETAIL = 0
  ������������_�������_��� = 0
  ������������_�������_������������_�������� = 0
  ������������_�������_������ = 0
  ������������_�������_�����_��������_������ = 0
  ������������_�������_FIO = 0
  ������������_�������_���_�������� = 0
  ������������_�������_��������_�������� = 0
  ������������_�������_������� = 0
  ������������_�������_���� = 0
  ������������_�������_�����_����������� = 0
  ������������_�������_����_������ = 0
  ������������_�������_������ = 0
  ������������_�������_�����_����������_�������� = 0
  ������������_�������_Date_iss = 0
  ������������_�������_������_������ = 0
  ������������_�������_����_������� = 0
  ������������_�������_��������������_����� = 0
  ������������_�������_��������� = 0
  ������������_�������_�����_������_���_���� = 0
  ������������_�������_CLIENT_ID = 0
  ������������_�������_�����_�������_�_������� = 0
  ������������_�������_������_�������� = 0

  ' ��������: ���������� �����, ����� ������ �� ML, ������ ��� ���� ��� ���, �� ����� ������ � ����� ������! (31-01-2020) � ���� � ���� � �������� ��������� ������������ ���� ������, ���� ������� � ������� ������� �� �������

  ColumnCount = 1
  Do While (IsEmpty(Cells(1, ColumnCount)) = False)
    
    ' ���� �������� ������� CREDIT_PROGRAMM_OTHER
    If Cells(1, ColumnCount).Value = "CREDIT_PROGRAMM_OTHER" Then
      ������������_�������_CREDIT_PROGRAMM_OTHER = ColumnCount
    End If
    ' ���� �������� ������� �����_������
    If Cells(1, ColumnCount).Value = "����� ������" Then
      ������������_�������_�����_������ = ColumnCount
    End If
    ' ���� �������� ������� STATUS_RETAIL
    If Cells(1, ColumnCount).Value = "STATUS_RETAIL" Then
      ������������_�������_STATUS_RETAIL = ColumnCount
    End If
    ' ���� �������� ������� ���
    If Cells(1, ColumnCount).Value = "���" Then
      ������������_�������_��� = ColumnCount
    End If
    ' ���� �������� ������� ������������ ��������
    If Cells(1, ColumnCount).Value = "������������ ��������" Then
      ������������_�������_������������_�������� = ColumnCount
    End If
    ' ���� �������� ������� ������
    If Cells(1, ColumnCount).Value = "������" Then
      ������������_�������_������ = ColumnCount
    End If
    ' ���� �������� ������� �����_��������_������
    If Cells(1, ColumnCount).Value = "����� �������� ������" Then
      ������������_�������_�����_��������_������ = ColumnCount
    End If
    ' ���� �������� ������� FIO
    If Cells(1, ColumnCount).Value = "FIO" Then
      ������������_�������_FIO = ColumnCount
    End If
    ' ���� �������� ������� ���_��������
    If Cells(1, ColumnCount).Value = "��� ��������" Then
      ������������_�������_���_�������� = ColumnCount
    End If
    ' ���� �������� ������� ��������_��������
    If Cells(1, ColumnCount).Value = "�������� ��������" Then
      ������������_�������_��������_�������� = ColumnCount
    End If
    ' ���� �������� ������� �������
    If Cells(1, ColumnCount).Value = "�������" Then
      ������������_�������_������� = ColumnCount
    End If
    ' ���� �������� ������� ����
    If Cells(1, ColumnCount).Value = "����" Then
      ������������_�������_���� = ColumnCount
    End If
   ' ���� �������� ������� ����� �����������
    If Cells(1, ColumnCount).Value = "����� �����������" Then
      ������������_�������_�����_����������� = ColumnCount
    End If
    ' ���� �������� ������� ���� ������
    If Cells(1, ColumnCount).Value = "���� ������" Then
      ������������_�������_����_������ = ColumnCount
    End If
    ' ���� �������� ������� ������
    If Cells(1, ColumnCount).Value = "������" Then
      ������������_�������_������ = ColumnCount
    End If
    ' ����� �� ���. ����� ������
    If Cells(1, ColumnCount).Value = "����� �� ���. ����� ������" Then
      ������������_�������_�����_��_���_�����_������ = ColumnCount
    End If
    ' ���� ����� ��������
    If Cells(1, ColumnCount).Value = "� ���������� ��������" Then
      ������������_�������_�����_����������_�������� = ColumnCount
    End If
    ' ���� Date_iss
    If Cells(1, ColumnCount).Value = "Date_iss" Then
      ������������_�������_Date_iss = ColumnCount
    End If
    ' ���� ������ ������
    If Cells(1, ColumnCount).Value = "������ ������" Then
      ������������_�������_������_������ = ColumnCount
    End If
    ' ���� ����_�������
    If Cells(1, ColumnCount).Value = "���� ������� (���)" Then
      ������������_�������_����_������� = ColumnCount
    End If
    ' ���� ��������������_�����
    If Cells(1, ColumnCount).Value = "�������������� �����" Then
      ������������_�������_��������������_����� = ColumnCount
    End If
    ' ���� ���������
    If Cells(1, ColumnCount).Value = "��������� (��� ��)" Then
      ������������_�������_��������� = ColumnCount
    End If
    ' ���� ����� ������_��� ����
    If Cells(1, ColumnCount).Value = "����� ������_��� ����" Then
      ������������_�������_�����_������_���_���� = ColumnCount
    End If
    ' ���� CLIENT_ID
    If Cells(1, ColumnCount).Value = "CLIENT_ID" Then
      ������������_�������_CLIENT_ID = ColumnCount
    End If
    ' ���� ����� ������� � �������
    If Cells(1, ColumnCount).Value = "����� ������� � �������" Then
      ������������_�������_�����_�������_�_������� = ColumnCount
    End If
    ' ���� ������_��������
    If Cells(1, ColumnCount).Value = "������ ��������" Then
      ������������_�������_������_�������� = ColumnCount
    End If
    
    ' ��������� ������
    ColumnCount = ColumnCount + 1
  
  Loop ' ��������� ����� � �����
  
  ' ������� ��� ������ �� ������� ������ = "��������� ��1"
  Do While (Trim(Cells(rowCount, ������������_�������_������).Value) = "��������� ��1")
   
    ' ��������� ������ ���� "������ ����� (������ �����)"
    ' If Cells(RowCount, ������������_�������_STATUS_RETAIL).Value = "������ ����� (������ �����)" Then
    
    ' � ������ ������� ML-����� ��� ������� STATUS_RETAIL, ������� ��������� �� "������" = "1"
    If Cells(rowCount, ������������_�������_������).Value = "1" Then
    
     ' ������ "12" �������_�����_��_�������, ������ "2019" �������_���_��_�������
     If (Mid(CStr(CDate(Cells(rowCount, ������������_�������_����_������).Value)), 4, 2) = �������_�����_��_�������) And (Mid(CStr(CDate(Cells(rowCount, ������������_�������_����_������).Value)), 7, 4) = �������_���_��_�������) Then

      ' ������ �� ����������
      ������_���_����� = ������_���_����� + Cells(rowCount, ������������_�������_�����_������).Value
      ������_���_�� = ������_���_�� + 1
      ' ���������� ������
      �������_�_���������_�������� = False
      ' �������_�������
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "������� �������/���������������� ������� �������/����� ������������� ������������/��������/��������� �����" Then
        ������_�������_�������_�� = ������_�������_�������_�� + 1
        ������_�������_�������_����� = ������_�������_�������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_��������_�������
      If (Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "���.���������/�������� �������/����� ������������� ������������/��������/��������� �����") Or (Cells(rowCount, "AW").Value = "���.���������/�������� �������/����� ������������� ������������/��������/��������� �����") Then
        ������_��������_�������_�� = ������_��������_�������_�� + 1
        ������_��������_�������_����� = ������_��������_�������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_�����������
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "����� ������������� ������������(����)/��������/ ��������� �����" Then
        ������_�����������_�� = ������_�����������_�� + 1
        ������_�����������_����� = ������_�����������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������_���������_�����
      If Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value = "����� ������������� ������������(����)/��������/ ��������� �����" Then
        ������_���������_�����_�� = ������_���������_�����_�� + 1
        ������_���������_�����_����� = ������_���������_�����_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If
      ' ������ ���������
      If �������_�_���������_�������� = False Then
        ������_������_���������_�� = ������_������_���������_�� + 1
        ������_������_���������_����� = ������_������_���������_����� + Cells(rowCount, ������������_�������_�����_������).Value
        �������_�_���������_�������� = True
      End If

      End If ' ������� ����� � ���
      
    End If ' ������ �����
      
    ' ��������� ������
    rowCount = rowCount + 1
  Loop ' ��������� ����� � �����
  
  ' ������� ������ � ��� �������
  
  ' ������ ������� �������
  ThisWorkbook.Sheets("����1").Range("D148").Value = ������_�������_�������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F148").Value = ������_�������_�������_��
  ' ������_��������_�������
  ThisWorkbook.Sheets("����1").Range("D149").Value = ������_��������_�������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F149").Value = ������_��������_�������_��
  ' ������_�����������
  ThisWorkbook.Sheets("����1").Range("D150").Value = ������_�����������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F150").Value = ������_�����������_��
  ' ������_���������_�����
  ThisWorkbook.Sheets("����1").Range("D151").Value = ������_���������_�����_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F151").Value = ������_���������_�����_��
  ' ������ ���������
  ThisWorkbook.Sheets("����1").Range("D152").Value = ������_������_���������_����� / 1000
  ThisWorkbook.Sheets("����1").Range("F152").Value = ������_������_���������_��
  ' ����������_�����_����
  ThisWorkbook.Sheets("����1").Range("D147").Value = Round(������_���_����� / 1000, 0)
  ' ��� ������ ������������� ������ ��� ������ ����� �������
  ThisWorkbook.Sheets("����1").Range("D147").NumberFormat = "#,##0"
  ' ����������_��_����
  ThisWorkbook.Sheets("����1").Range("F147").Value = ������_���_��
  ' ��������� ������� � % ����������
  ThisWorkbook.Sheets("����1").Range("G147").FormulaR1C1 = "=IF(RC[-3]>0,((RC[-3]*100)/RC[-4])/100,0)"
  ' ����������� ���� � ������� ���������
  ' ���� �� (����������� �����) �� ����� 50-60%
  ' ������� =����(D147>0;((����*100)/����)/100;0)
  ThisWorkbook.Sheets("����1").Range("G150").Value = "���� " + CStr(Round(((ThisWorkbook.Sheets("����1").Range("F150").Value * 100) / ThisWorkbook.Sheets("����1").Range("F147").Value), 1)) + "%"
  ThisWorkbook.Sheets("����1").Range("H150").Value = "" ' "(��������: 50%)"
  ' ���� �� �������� ������� �� ����� 20%
  ThisWorkbook.Sheets("����1").Range("G149").Value = "���� " + CStr(Round(((ThisWorkbook.Sheets("����1").Range("F149").Value * 100) / ThisWorkbook.Sheets("����1").Range("F147").Value), 1)) + "%"
  ThisWorkbook.Sheets("����1").Range("H149").Value = "" ' "(��������: 20%)"
  
  ' TR �� �� �� ����� 70%
  ' TR �� �� �� ����� 35%
       
  ' ���� �� 2020
  ' ������ ����!
  ' ������� ��������� ����� ����� �� �����:
  ' ��  �������,
  ' ���,
  ' ���� ��/�� -40/60,
  ' ���� ������������,
  ' ���� SRG �������,
  ' ����������� �������� ����� �� ���������� ������������� �����.
  ' ����� ��� ������ ���� 3  KPI �� �����:
  ' ��������� ��������� ������ �� ������:
  ' ���� �� ������� �� ��������� 460 ��.
  ' ��  ��������� ������� ������ � 15/85 �� 35/65 (��/��)
  ' �� ���������� ������ ����������  TR � 18% (2019 �.) �� 35%, �� ��������� �������� - �� 50%.
       
  ' --- ����� ����������� ������ ---

  ' --- ������� ������������� ������������ ---
        
  ' ���������� ����� 1 �� ������� ��� ����������� �������, ����������� �������
  ActiveWorkbook.Worksheets("����1").Range(ConvertToLetter(������������_�������_���) + "2").Select
  ActiveWorkbook.Worksheets("����1").ListObjects("�������1").Sort.SortFields.Clear
  ActiveWorkbook.Worksheets("����1").ListObjects("�������1").Sort.SortFields.Add Key:=Range(ConvertToLetter(������������_�������_���) + "2"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    
  ' ���� ���������� (����� �� ����������� �������)
  With ActiveWorkbook.Worksheets("����1").ListObjects("�������1").Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
  End With
  
  ' �������� ������ � ������� BASE\Mortgage �� ��������� � ��� ��������� �� ML
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "��������_��_���������") = "1" Then
    ��������_��_��������� = True
  Else
    ��������_��_��������� = False
  End If
  
  ' ��������� ���� �� ���� ������� � ������� � ������ ������� ���� 0 ���� 1
  �������_��� = ""
  �������_�����������_������������ = ""
  count_�������_��� = 0
  �������_�����_�_DB_Result_����2 = 4
  ' ������� - ����� �������� ����������� � ��� ���� 2  (���� ���� � ����)
  �����_��������_����������� = 0
  ' �������� �� ������ ������
  rowCount = 2
  ' ����� ���� �� ������� "������", � ������� ������ ���� "��������� ��1"
  Do While (Cells(rowCount, ������������_�������_������) = ("��������� ��1"))
      
    ' ���� � ������ ������ �����?
    ' If Cells(RowCount, ������������_�������_STATUS_RETAIL).Value = "������ ����� (������ �����)" Then � ������ ������� ML-����� ��� ������� STATUS_RETAIL, ������� ��������� �� "������" = "1"
    If Cells(rowCount, ������������_�������_������).Value = "1" Then
               
      ' ���� ������� ��� �� ����� �����������, �� ��� ������
      If �������_��� <> Cells(rowCount, ������������_�������_���).Value Then
                
        ' ��������� � ���� ������ � ������������� ����������� � ������ ��������, ���� ������� �� ����� 0
        If count_�������_��� > 0 Then
          Call �����_�_�����_������_��_�����������_2(In_MLName, �������_���, count_�������_���, �������_�����_�_DB_Result_����2, �������_�����������_������������, False)
          ' ���� ���� �� � ���� � � ����� ������ ������ ������ � ����� 1
          �������_�����_�_DB_Result_����2 = �������_�����_�_DB_Result_����2 + 1
          ' ������� - ����� �������� ����������� � ��� ���� 2  (���� ���� � ����)
          �����_��������_����������� = �����_��������_����������� + 1
        End If
        
        ' �������� �������
        count_�������_��� = 0
        
        ' ����������� �������� ���
        �������_��� = Cells(rowCount, ������������_�������_���).Value
        ' ������������ ��������
        �������_�����������_������������ = Cells(rowCount, ������������_�������_������������_��������).Value
        
        ' ������ �� ��������� ������
        ' ����� �������� ������
        ' FIO
        ' ��� ��������
        ' �������� ��������
        ' �������
        ' ���� (��������� ��� ����������)

      End If
      
      ' ������� �������� ������� �� �����������
      count_�������_��� = count_�������_��� + 1
      
    End If
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop ' ��������� ����� � �����
  
  ' ��������� - ���� ��������� ������ ���� �������� � �����?
  If count_�������_��� > 0 Then
    Call �����_�_�����_������_��_�����������_2(In_MLName, �������_���, count_�������_���, �������_�����_�_DB_Result_����2, �������_�����������_������������, False)
    �������_�����_�_DB_Result_����2 = �������_�����_�_DB_Result_����2 + 1
    ' ������� - ����� �������� ����������� � ��� ���� 2 (���� ���� � ����)
    �����_��������_����������� = �����_��������_����������� + 1
  End If
    
  ' ������� �� ��� ���� 2 � �������������
  ThisWorkbook.Activate
  ThisWorkbook.Sheets("����2").Select
  Range("D4").Select
  ThisWorkbook.Worksheets("����2").Sort.SortFields.Clear
  ThisWorkbook.Worksheets("����2").Sort.SortFields.Add Key:=Range("D4"), SortOn:=xlSortOnValues, Order:=xlDescending, DataOption:=xlSortNormal
    With ThisWorkbook.Worksheets("����2").Sort
        .SetRange Range("B3:D" + CStr(�����_��������_�����������))
        .Header = xlNo
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

  ' ������ ������ � ��������������� ����� �� ����� 2 ��� ��������
  If True Then
    
    ' ������� �����
    rowCount = 2
  
    ' ����� ���� �� ������� "������", � ������� ������ ���� "��������� ��1"
    Do While (Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������) = "��������� ��1")
      
      ' ���� � ������ ������ �����?
      If Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value = "1" Then
          
        ' ����������� �������� ���
        If Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���).Value <> "" Then
          �������_��� = Trim(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���).Value)
        Else
          �������_��� = "��� ���"
        End If
                
        ' ������
        �������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value
        ' ���� ������ - CDate(Cells(RowCount, ������������_�������_����_������
        �������_����_������ = CDate(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����_������).Value)
        ' ������������ ��������
        �������_�����������_������������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������������_��������).Value
        ' ����� �������� ������
        �������_�����_��������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_��������_������).Value
        ' FIO
        �������_FIO = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_FIO).Value
        ' ��� ��������
        ' �������� ��������
        �������_��������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_��������_��������).Value
        ' �������
        ' ������
        �������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������).Value
        ' ���� (��������� ��� ����������)
        �������_���� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����).Value
        ' ����� �� ��� ����� ������
        �������_�����_��_���_�����_������ = Round(Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_��_���_�����_������).Value / 1000, 1)
        ' ����� ��������
        �������_�����_����������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_����������_��������).Value
        ' �������_Date_iss
        �������_Date_iss = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_Date_iss).Value
        ' �������_������_������
        �������_������_������ = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������_������).Value
        ' �������_����_�������
        �������_����_������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_����_�������).Value
        ' + �������_CREDIT_PROGRAMM_OTHER
        �������_CREDIT_PROGRAMM_OTHER = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_CREDIT_PROGRAMM_OTHER).Value
        ' �������_��������������_�����
        �������_��������������_����� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_��������������_�����).Value
        ' �������_���������
        �������_��������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���������).Value
        ' + �������_�����_��������_������
        ' �������_�����_������_���_����
        �������_�����_������_���_���� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_������_���_����).Value
        ' �������_CLIENT_ID
        �������_CLIENT_ID = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_CLIENT_ID).Value
        ' + �������_FIO
        ' + �������_�����_��_���_�����_������
        ' �������_�����_�������_�_�������
        �������_�����_�������_�_������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_�����_�������_�_�������).Value
        ' + �������_������������_��������
        ' + �������_���
        ' + �������_��������_��������
        ' �������_���_��������
        �������_���_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_���_��������).Value
        ' �������_������_��������
        �������_������_�������� = Workbooks(In_MLName).Worksheets("����1").Cells(rowCount, ������������_�������_������_��������).Value
        ' � DB_Result �� ���� 2 �� ������� "B" ���� ���
        ' ���� � ������� ��� ������ ����, �� ��� �������
        If Mid(�������_���, 1, 1) = "0" Then
          �������_��� = Mid(�������_���, 2, Len(�������_���) - 1)
        End If
        
        ' ��������� �����
        Set fcell = Columns("B:B").Find(�������_���, LookAt:=xlWhole)
        If Not fcell Is Nothing Then
          
          ' MsgBox "����� � ������: " + CStr(fcell.Row)
          
          ' �������� ������ ������, ��������� �� ��������� Rows("6:6").Select
          Rows(CStr(fcell.Row + 1) + ":" + CStr(fcell.Row + 1)).Select
          
          ' ��������� ����� ������
          Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
          
          ' ������ ������ � ����� ������
          ThisWorkbook.Sheets("����2").Range("C" + CStr(fcell.Row + 1)).Value = �������_FIO
          ' �������������� ����� - "����� �� ���. ����� ������"
          ' ��� ����������� ��� � ��� 7744000912 �������� �����
          If �������_��� = "7744000912" Then
            �������_�����_��_���_�����_������ = 0
          End If
          ' �����_��_���_�����_������
          ThisWorkbook.Sheets("����2").Range("D" + CStr(fcell.Row + 1)).Value = �������_�����_��_���_�����_������
          ' ����� �������
          ThisWorkbook.Sheets("����2").Range("E" + CStr(fcell.Row + 1)).Value = ��������_�����_�������������(�������_�����_��������_������, ";", 2, 3)
          ' �������
          ThisWorkbook.Sheets("����2").Range("F" + CStr(fcell.Row + 1)).Value = �������_��������_��������
          ' ���� ������
          ThisWorkbook.Sheets("����2").Range("G" + CStr(fcell.Row + 1)).Value = CStr(�������_����_������)
          ' ������
          ThisWorkbook.Sheets("����2").Range("H" + CStr(fcell.Row + 1)).Value = �������_������_������
          ' � ������� H ������ ������ �� ������������ �����������, ���� ��� ���
          If �������_��� = "��� ���" Then
            ThisWorkbook.Sheets("����2").Range("I" + CStr(fcell.Row + 1)).Value = "�����������: " + �������_�����������_������������
          End If
          ' � ������� J ������ Client ID
          ThisWorkbook.Sheets("����2").Range("J" + CStr(fcell.Row + 1)).Value = �������_CLIENT_ID
                    
        End If
                    
        ' ��������� ������ � ������� BASE\Mortgage
        Call Insert_To_Table_Mortgage(�������_�����_����������_��������, �������_Date_iss, �������_������_������, �������_����_�������, �������_CREDIT_PROGRAMM_OTHER, �������_��������������_�����, �������_���������, �������_�����_��������_������, �������_�����_������_���_����, �������_CLIENT_ID, �������_FIO, �������_�����_��_���_�����_������, �������_�����_�������_�_�������, �������_�����������_������������, �������_���, �������_��������_��������, �������_���_��������, �������_������_��������, �������_������, �������_������, �������_����, ��������_��_���������)
                                                           
      End If
    
      ' ��������� ������
      rowCount = rowCount + 1
    
    Loop ' ��������� ����� � �����

    ' ������ �������� - ����������� �������� �� ���
      
    ' ������� ����� - �������� � ������ ������
    rowCount = 4
    ������_�����_�����������_������� = 0
    ����_����� = False
    ' ���� � "���" � "������������ �����������" �� ����� �����
    Do While (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value <> "") Or (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "")
      
      ' ������ ����� �����������
      If (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value = "") And (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "") And (����_����� = False) Then
        ' ������ ����� ����������� �������
        ������_�����_�����������_������� = rowCount
        ����_����� = True
      End If

      ' ����� ����� �����������
      If (ThisWorkbook.Sheets("����2").Cells(rowCount, 2).Value <> "") And (ThisWorkbook.Sheets("����2").Cells(rowCount, 3).Value <> "") And (������_�����_�����������_������� <> 0) Then
        ' ���������� � ���������� ����� �� -1
        ThisWorkbook.Sheets("����2").Range("C" + CStr(������_�����_�����������_�������) + ":C" + CStr(rowCount - 1)).Select
        Selection.Rows.Group
        ����_����� = False
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    
    Loop ' ��������� ����� � �����
        
    Columns("E:I").Select
    Selection.Columns.Group
                
    ' ��������� ������
    ActiveSheet.Outline.ShowLevels RowLevels:=1, ColumnLevels:=1

    ' ��������� � ������ ������
    Range("A1").Select
    
  End If
  
  ' ��������� ������� BASE\Mortgage.xlsx � ����������� ��������� ���������
  Workbooks("Mortgage.xlsx").Close SaveChanges:=True
  
  ' --- ����� ������� ������������� ������������ ---

  ' �����������
  If �����������_�_���������_����� = True Then
    ' ��������� �����
    Close #1
    Close #2
  End If

End Sub

' ===================================
' === �������_������_��_DB ������ ===
' ===================================
Sub �������_������_��_Db()
Attribute �������_������_��_Db.VB_ProcData.VB_Invoke_Func = " \n14"

' ����������
Dim FileName As String
Dim DBstrName_String As String
Dim ���������_���������, ���������_Capacity_Model, ���������_CRM_ML, ���������_������_������� As Boolean


' ������ ������� ������� ����� DB Dashboard_new_��_��.��.����.xlsm - ������� ������ ����� ��� ������������� ����������
' FileName = Application.GetOpenFilename("Excel files(*.xlsm), *.xlsm, All files(*.*), *.*", 1, "�������� Dashboard", , True)
FileName = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm", , "�������� ����� Dashboard")

' DBstrName = getFName(Application.GetOpenFilename())
���������_��������� = False

' �������� ������� ����� � �������
Call �������_������_��_�����1

' ������� �� �������� �������������� ����:
���������_Capacity_Model = False
���������_CRM_ML = False
���������_������_������� = False

' ������� ����� Capacity Model ��� ��������� ������
' If (Len(FileName) > 5) Then
'  If MsgBox("������� Capacity Model?", vbYesNo) = vbYes Then
'    CapacityModelName = getFName(Application.GetOpenFilename())
'    If CapacityModelName <> False Then
'      Workbooks.Open (CapacityModelName)
'      ���������_Capacity_Model = True
'    End If
'  End If
' End If

' ������� ����� CRM_ML ��� ��������� ������ �� �������
If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_�������_ML") = "1" Then
  ' ��������
  If (Len(FileName) > 5) Then
    If MsgBox("������� ML-����?", vbYesNo) = vbYes Then
      ' .xlsx
      MLName = getFName(Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� ML"))
      If MLName <> False Then
        ' Workbooks.Open (MLName) - �������� ��������� ����
        ���������_CRM_ML = True
      End If
    End If
  End If
End If

' ������ - ����� �� �� ��� ����� ��� �� ML?
' ������� ����� ������ ������� ��� ���������� �� �������:
' If (Len(FileName) > 5) Then
'   If MsgBox("������� ������ �������?", vbYesNo) = vbYes Then
'     ReestrIpotekaName = getFName(Application.GetOpenFilename())
'     If ReestrIpotekaName <> False Then
'       Workbooks.Open (ReestrIpotekaName)
'       ���������_������_������� = True
'     End If
'   End If
' End If

' �������� - ������� �� �����?
If (Len(FileName) > 5) Then

  ' �������� ������� ����� � �������
  ' Call �������_������_��_�����1
  
  ' ������� ��� ���� ������ �� ����� �����
  DBstrName_String = Dir(FileName)
  Range("A1") = "��� ����� ������� ������: " + DBstrName_String
  
  ' ��������� ��������� ����� (UpdateLinks:=0)
  Workbooks.Open FileName, 0
  
  ' 1. �������������� ������ � �����: 4. ������������ ���-� �� ������
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_������������_�������_��_�����������") = "1" Then
    Call ������������_�������_��_�����������(DBstrName_String)
    DoEventsInterval (100)
  End If

  ' 2. ������� �� ������: 1.1�����-�� �������  �� ������ ����������: �� ������� 2019 �. � DB ����� "1.1�����-�� �������  �� ������ ����������" �� ����
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_������������_�������_��_������") = "1" Then
    Call ������������_�������_��_������(DBstrName_String)
    DoEventsInterval (100)
  End If

  ' 3. ���������� ����� �� ��: 3.1 ���������������  �������. ����� ������=5. ����������: ����� ���� ��������� "2.1 ���������������  �������"
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_���������������_�������") = "1" Then
    Call ���������������_�������(DBstrName_String, 5)
    DoEventsInterval (100)
  End If

  ' 4. ���������� ����� �� ��: 3.2 ��������� �����. ����� ������=5 ����������: ����� ���� ��������� "2.2 ��������� �����"
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_���������_�����") = "1" Then
    Call ���������_�����(DBstrName_String, 5)
    DoEventsInterval (100)
  End If

  ' 5. ���������� ����� �� ���������: 2. ��� �����. ����� ������=5 ����������: ����� ���� ��������� "3. ��� �����"
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_���_�����") = "1" Then
    Call ���_�����(DBstrName_String, 5)
    DoEventsInterval (100)
  End If
  
  ' 6. ���������� ����� �� ���: 3.10 OPC. ����� ������=5 ����������: ����� ���� ��������� "2.11 OPC"
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_OPC") = "1" Then
    Call OPC(DBstrName_String, 5)
    DoEventsInterval (100)
  End If
  
  ' 7. ���������� ����� �� �������: 3.15 ������� ����������: ����� ���� ��������� "2.14 �������"
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_�������") = "1" Then
    Call �������(DBstrName_String)
    DoEventsInterval (100)
  End If
  
  ' 8. ������� �� ML-�����
  If param_from_ini(ThisWorkbook.Path + "\DB_Result.ini", "Call_�������_ML") = "1" Then
  
    If ���������_CRM_ML = True Then
      Workbooks.Open (MLName)
      Call �������_ML(MLName)
      DoEventsInterval (100)
    End If
  
  End If
  
  ' ��������� ����� ������ �� ����������� ������ ��� ���������� ��������� (�������� SaveChanges:=False)
  Workbooks(Dir(FileName)).Close SaveChanges:=False
  
  ���������_��������� = True

' �������� - ������� �� �����?
End If

' ���� ���� ������� ��������� ����� - ���������
' ������� ����� Capacity Model ��� ��������� ������
If ���������_Capacity_Model = True Then
  Workbooks(CapacityModelName).Close SaveChanges:=False
End If

' ������� ����� CRM_ML ��� ��������� ������ �� �������
If ���������_CRM_ML = True Then
  Workbooks(MLName).Close SaveChanges:=False
End If

' ������� ����� ������ ������� ��� ���������� �� �������:
If ���������_������_������� = True Then
  Workbooks(ReestrIpotekaName).Close SaveChanges:=False
End If

' ����� StatusBar � �������� ���������� ���� ������� � Excel
Application.StatusBar = False


' ��������� ���������_���������
If ���������_��������� = True Then
  
  ' ���� ��� ������
  ThisWorkbook.Sheets("����1").Range("P5").Value = " �� " + Mid(DBstrName_String, 18, 10) + " �."

  ' ����������� ����� ���� �� ��������� ��������
  ' ThisWorkbook.Sheets("����0").Cells(7, 4).Value = "1) DashBoard �� " + Mid(DBstrName_String, 18, 10) + " ���������"
  
  ' Call �����������������������("����0", "D7")
  Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "DashBoard (��� �������)", 100, 100))
  
  ' ��������� �� ���� 1
  ThisWorkbook.Sheets("����1").Select
  Range("A1").Select
  MsgBox ("��������� " + DBstrName_String + " ���������!")
  
End If

End Sub



' ���-�� �������������� ...
Sub ��������������_������()

' ��������������_������ ������
    Range("C17").Select
    Selection.Copy
    Range("D10").Select
    Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, SkipBlanks:=False, Transpose:=False
    Application.CutCopyMode = False
End Sub

Sub �������_������_��_�����1()
'
' �������_������_��_�����1 ������

    Range("A10:O48").Select
    Selection.ClearContents
    Range("O10").Select
    Selection.Copy
    Range("N10:N27").Select
    Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, SkipBlanks:=False, Transpose:=False
    Application.CutCopyMode = False
        
    Range("B29:B47").Select
    Selection.ClearContents
        
    Range("A52:K56").Select
    Selection.ClearContents
    
    Range("B57:B67").Select
    Selection.ClearContents
    
    Range("A71:L75").Select
    Selection.ClearContents
    
    Range("B76:B86").Select
    Selection.ClearContents
    
    Range("A90:O94").Select
    Selection.ClearContents
    
    Range("B95:B105").Select
    Selection.ClearContents
    Range("I90").Select
    Selection.Copy
    Range("I94").Select
    Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, SkipBlanks:=False, Transpose:=False
    Application.CutCopyMode = False
    
    Range("A109:N114").Select
    Selection.ClearContents
    
    Range("B114:B124").Select
    Selection.ClearContents
    
    Range("A128:J132").Select
    Selection.ClearContents
    
    Range("B133:B143").Select
    Selection.ClearContents
    
    ' �������
    Range("A147:I147").Select
    Selection.ClearContents
    
    Range("C148:I152").Select
    Selection.ClearContents
    
    Range("C155:G158").Select
    Selection.ClearContents
    
    Range("C159").Select
    ActiveCell.FormulaR1C1 = "0"
        
    ' �������� ��� ������� ������� � ������
    Columns("A:O").Select
    Selection.EntireColumn.Hidden = False
    Rows("1:174").Select
    Selection.EntireRow.Hidden = False
    
    Range("A1").Select
    
    ' ������� �� ����� 2
    Sheets("����2").Select
    ' ������� ����������� ����� �� �����
    Selection.ClearOutline
    
    ' Range("B4:J1000").Select
    Range("B4:J50000").Select
    Selection.ClearContents
    Range("A1").Select
    
    ' ������-������� - �� ������!
    ' ThisWorkbook.Sheets("����3").Cells(2, 2).Value = "����������� ������-������� (������) �� <...>"
    ' ������� ���� � ��������� C5, ���� �� <...>
    ' ThisWorkbook.Sheets("����3").Cells(5, 3).Value = "���� �� <...>"
    ' ������� ���� � ��������� I4, <...>, ���. ���.
    ' ThisWorkbook.Sheets("����3").Cells(4, 9).Value = "������ �� <...>"
    ' �������: ������� ���� � ��������� C5, ���� �� <...>
    ' ThisWorkbook.Sheets("����3").Cells(18, 3).Value = "���� �� <...>"
    ' �������: ������� ���� � ��������� I4, <...>, ���. ���.
    ' ThisWorkbook.Sheets("����3").Cells(17, 9).Value = "������ �� <...>"

    ' ������� �� �������� ���� 1
    Sheets("����1").Select
    
End Sub

