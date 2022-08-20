Attribute VB_Name = "Module_Capacity"
' ���� "Capacity"

' ������_���������_5_������
Sub �����_Capacity_New()
  
' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
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
  
    ' ������ �������
    Application.StatusBar = "�������� ����� Capacity..."
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("Capacity").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "�������� �����", 19, Date)
    
    If CheckFormatReportResult = "OK" Then
      
      ' ���������� ������� �� ������� "�������"
      ' Call ��������_�������_Capacity_New_�������(ReportName_String, "�������")
      
      ' ������� (�����)
      Application.StatusBar = "�������� ������� (�����)..."
      Call ��������_�������_Capacity_New_�������_�����(ReportName_String, "������� (�����)")
      
      ' PA ��
      Application.StatusBar = "�������� PA ��..."
      Call ��������_�������_Capacity_New_�������_�����(ReportName_String, "PA ��")
      
      ' PA KK
      Application.StatusBar = "�������� PA KK..."
      Call ��������_�������_Capacity_New_�������_�����(ReportName_String, "PA KK")
      
      ' �� � ����
      Application.StatusBar = "�������� �� � ����..."
      Call ��������_�������_Capacity_New_�������_�����(ReportName_String, "�� � ����")
      
      ' ������ �������
      Application.StatusBar = "����������� ��������..."
      
      row_����Capacity_�����61 = rowByValue(ThisWorkbook.Name, "Capacity", "����� 6.1", 100, 100)
      
      ' ����������� �������� �� "������� (�����)"
      ' ��������
      column_Capacity_������������_�������� = ColumnByValue(ReportName_String, "������� (�����)", "��������", 300, 300)
      ' ���������� ��
      column_Capacity_������������_������������ = ColumnByValue(ReportName_String, "������� (�����)", "���������� ��", 300, 300)
      ' ���� ���������� ��
      column_Capacity_������������_���������������� = ColumnByValue(ReportName_String, "������� (�����)", "���� ���������� ��", 300, 300)
      ' ������ �� ������
      column_Capacity_������������_�������������� = ColumnByValue(ReportName_String, "������� (�����)", "������ �� ������", 300, 300)
      ' ���� ������ �� ������
      column_Capacity_������������_������������������ = ColumnByValue(ReportName_String, "������� (�����)", "���� ������ �� ������", 300, 300)
            
               
            
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

        ' 1) ������� (�����)
        rowCount = 1
        Do While InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, "����� ����") = 0
        
          ' ���� ��� ������� ����
          If (InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, officeNameInReport) <> 0) And (InStr(Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, 1).Value, "��") <> 0) Then
            
            ' ��������� row_����Capacity_�����61
            ' �
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).Value = CStr(i)
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).HorizontalAlignment = xlCenter

            ' ����
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).Value = getNameOfficeByNumber(i)
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).NumberFormat = "@"
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).HorizontalAlignment = xlLeft
            
            ' �������
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_��������).Value
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).HorizontalAlignment = xlRight
            
            ' ������ ��
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_������������).Value
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).NumberFormat = "#,##0"
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).HorizontalAlignment = xlRight
            
            ' ����
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_����������������).Value
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).NumberFormat = "0%"
            ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).HorizontalAlignment = xlRight

            
                
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
        ' 2) �� � ����
        ' rowCount = 1
        ' Do While InStr(Workbooks(ReportName_String).Sheets("�� � ����").Cells(rowCount, 1).Value, "����� ����") = 0
        
          ' ���� ��� ������� ����
        '  If (InStr(Workbooks(ReportName_String).Sheets("�� � ����").Cells(rowCount, 1).Value, officeNameInReport) <> 0) And (InStr(Workbooks(ReportName_String).Sheets("�� � ����").Cells(rowCount, 1).Value, "��") <> 0) Then
            
            ' ��������� row_����Capacity_�����61
            ' �
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).Value = CStr(i)
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).NumberFormat = "#,##0"
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 1).HorizontalAlignment = xlCenter

            ' ����
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).Value = getNameOfficeByNumber(i)
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).NumberFormat = "@"
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 2).HorizontalAlignment = xlLeft
            
            ' �������
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_��������).Value
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).NumberFormat = "#,##0"
        '    ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 3).HorizontalAlignment = xlRight
            
            ' ������ ��
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_������������).Value
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).NumberFormat = "#,##0"
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 4).HorizontalAlignment = xlRight
            
            ' ����
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).Value = Workbooks(ReportName_String).Sheets("������� (�����)").Cells(rowCount, column_Capacity_������������_����������������).Value
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).NumberFormat = "0%"
         '   ThisWorkbook.Sheets("Capacity").Cells(row_����Capacity_�����61 + 2 + i, 5).HorizontalAlignment = xlRight

            
                
         ' End If
        
        
          ' ��������� ������
         ' rowCount = rowCount + 1
        '  Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
       '   DoEventsInterval (rowCount)
      '  Loop
   
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
    ' Workbooks(Dir(FileName)).Close SaveChanges:=False - �������
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("Capacity").Range("A1").Select

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

' �������� ������� ������ � Capacity �� ������� "������� (�����)"
Sub ��������_�������_Capacity_New_�������_�����(In_ReportName_String, In_Sheet)
      
    ' Range("A11").Select
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[�������].[�������].[�������]").PivotItems("[�������].[�������].&[������� ��������� ���������]").DrilledDown = True
    
    ' Range("A17").Select
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").PivotItems("[������].[������].&[���������]").DrilledDown = True

End Sub

' �������� ������� ������ � Capacity �� ������� "PRE-APPROVED"
Sub ��������_�������_Capacity_New_PREAPPROVED(In_ReportName_String, In_Sheet)

    ' ���������� ClientIdRetail
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").CubeFields ("[������].[ClientIdRetail]")
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").Orientation = xlRowField
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").Position = 4
    
    ' ��������� ��������� ���
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").VisibleItemsList = Array("[������].[������].&[���������]")
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").PivotItems("[������].[������].&[���������]").DrilledDown = True
    
    ' �������� 5 ������
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[��].[��]").PivotItems("[������].[��].&[�� ""���������������""]").DrilledDown = True
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[��].[��]").PivotItems("[������].[��].&[�� ""���������������""]").DrilledDown = True
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[��].[��]").PivotItems("[������].[��].&[�� ""����������""]").DrilledDown = True
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[��].[��]").PivotItems("[������].[��].&[�� ""�����-����"" ���������� ������� ��� ""�������������""]").DrilledDown = True
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[��].[��]").PivotItems("[������].[��].&[�� ""���������""]").DrilledDown = True
    
End Sub

' �������� ������� ������ � Capacity �� ������� "�������"
Sub ��������_�������_Capacity_New_�������(In_ReportName_String, In_Sheet)
  
  ' Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").PivotItems("[������].[������].&[����������]").DrilledDown = True
  ' Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").PivotItems("[������].[������].&[������������]").DrilledDown = True

    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[�������].[�������].[�������]").PivotItems("[�������].[�������].&[������� ��������� ���������]").DrilledDown = True
    Workbooks(In_ReportName_String).Sheets(In_Sheet).PivotTables("������� �������2").PivotFields("[������].[������].[������]").PivotItems("[������].[������].&[���������]").DrilledDown = True


End Sub


' ���������� ������� �� ������� "�������"
Sub setFilter_Capacity_�������()
  
  
  
End Sub

