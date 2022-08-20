Attribute VB_Name = "Module_CheckFormatReport"
' �������� ������� ����������� ������ (���������� ���� �� Module_DLL)

' 34. �������� ������� ����������� �������
Function CheckFormatReport(In_Workbooks, In_Sheets, In_TypeReport, In_Date) As String

Dim find_office_1, find_office_2, find_office_3, find_office_4, find_office_5, stop_process As Boolean

  CheckFormatReport = ""

  ' 1 - DB: � �� ����� "����������" � A1="����� �� ��������� �� 04.08.2020"
  If In_TypeReport = 1 Then
            
    ' ���� �� ����� F1 � "A1" ��������� "��� ����", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "����� �� ��������� ��") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If

  
  ' 2 - ML
  
  ' 3 - ����� ���������� �������� � ����������� �� ������
  If In_TypeReport = 3 Then
    
    ' ���� � A1 "����� ���������� �������� � ������ ��������� �� ������ c 01.01.2020 �� 17.03.2020"
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
    
      If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "����� ���������� �������� � ������ ��������� �� ������") <> 0 Then
      
        ' ��������� ���� ������ - � A2  "�� ������ � 01.01.2020 �� 12.03.2020"
        If (CDate(Mid(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, 58, 10)) = YearStartDate(In_Date)) And (CDate(Mid(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, 72, 10)) = In_Date) Then
          
          
          find_office_1 = False
          find_office_2 = False
          find_office_3 = False
          find_office_4 = False
          find_office_5 = False
          stop_process = False
          
          RecCount = 8
          Do While (Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value <> "") And (stop_process = False)
            
            ' ��������� ����
            If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value, "���������") <> 0 Then
              find_office_1 = True
            End If
            ' ��������� ���� 2
            If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value, "����������") <> 0 Then
              find_office_2 = True
            End If
            ' ��������� ���� 3
            If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value, "���������������") <> 0 Then
              find_office_3 = True
            End If
            ' ��������� ���� 4
            If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value, "���������������") <> 0 Then
              find_office_4 = True
            End If
            ' ��������� ���� 5
            If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(RecCount, 2).Value, "�����-����") <> 0 Then
              find_office_5 = True
            End If
            
            ' ���� ����� ��� 5, �� ������������� �������
            If (find_office_1 = True) And (find_office_2 = True) And (find_office_3 = True) And (find_office_4 = True) And (find_office_5 = True) Then
              stop_process = True
            End If
            
            RecCount = RecCount + 1
          Loop
          
          ' ����� ��������� ������ 5-�� ������
          If (find_office_1 = True) And (find_office_2 = True) And (find_office_3 = True) And (find_office_4 = True) And (find_office_5 = True) Then
              ' ������ ����� ������ � ���������� ����
              CheckFormatReport = "OK"
            Else
              
              ' ������ � ������ ��� ���� ������
              CheckFormatReport = "�� ��� ����� � ������!"
            
          End If
          
        Else
          
          CheckFormatReport = "�������� ���� � ������"
        
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
      
  End If
  

  ' 4 - �������� � �������� � ������� 30 ����
 
  ' 5 - ����� �� ������� ���������� ���� ���. ������� �������
  If In_TypeReport = 5 Then
    
    ' ���� � A1 "����� �� ������� ���������� ���� ���. ������� �������"
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      If (Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value = "����� �� ������� ���������� ���� ���. ������� �������") Then
        ' ��������� ���� ������ - � A2  "�� ������ � 01.01.2020 �� 12.03.2020"
        If (CDate(Mid(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A2").Value, 28, 10)) = In_Date) And (Mid(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A2").Value, 14, 10) = "01.01." + Mid(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A2").Value, 34, 4)) Then
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
      
  End If
  
  ' 6 - ��������� �������� � ��������� ��� ���.��� (�� ���. ������)
  If In_TypeReport = 6 Then
    ' ���� � A1 "��������� �������� � ��������� �� "
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      If (Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value = "��������� �������� � ��������� �� ") Then
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date Then
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  ' --- 6 - ��������� �������� � ��������� ��� ���.��� (�� ���. ������)
  
  ' 7 - ����� Capacity
  If In_TypeReport = 7 Then
    ' ���� � A1 "��������� �������� � ��������� �� "
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      
      ' ������ ������ ������ ������
      If (Workbooks(In_Workbooks).Sheets(In_Sheets).Range("B6").Value = "���-�� ��������") Or (Workbooks(In_Workbooks).Sheets(In_Sheets).Range("B7").Value = "���-�� ��������") Then
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 8 - ����� ����/���� �� ��.��.���� �� ��������� ���_���
  If In_TypeReport = 8 Then
    
    ' ���� � E2 "����� �������� �� 19.03.2020 �� 18.03.2020 (������ ����)"
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("E2").Value, "����� �������� �� ") <> 0 Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 9 - ���������� ����_���� 15.03.2020 (�� ������)
  If In_TypeReport = 9 Then
    
    ' ���� � C2 ��������� �����: ������ ����� ��������� ���������������� ���������� ������������� ����������  � ����� �� ���������� �������������� ����������  � "�������� ��������� ������������"
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C2").Value, "������ ����� ��������� ���������������� ���������� ������������� ����������") <> 0 Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  
  ' 10 - "������������ ������ ������_X��.20YY" + " ��������� ����������"
  If In_TypeReport = 10 Then
    
    ' ���� � "B1" ��������� "�� ���/��, ���. ���."
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      ' If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("B1").Value, "�� ���/��, ���. ���.") <> 0 Then
      ' C 2021 ���� "�� ���/�� (����+��), ���. ���."
      If InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("B1").Value, "�� ���/�� (����+��), ���. ���.") <> 0 Then
      
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 11 - "�������� ������� �� �������������"
  If In_TypeReport = 11 Then
    
    ' ���� ������ ������� ������
    ' 01.01.2020 => "01 ������ 2020"
    dateInStringFormat1 = "01 ������ " + CStr(Year(In_Date)) + " �."
    
    ' 01.01.2020 => "01 ������ 2020"
    dateInStringFormat2 = CStr(Day(In_Date)) + " " + ���������2(In_Date) + " " + CStr(Year(In_Date)) + " �."
        
    ' ���� � "A1" ��������� "�������� ������� �� ������������� �� ������ � 01 ������ 2020 �. �� 06 ���� 2020 �."
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, dateInStringFormat1) <> 0) And ((InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, dateInStringFormat2) <> 0)) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 12 - Cards_emisssion_��_��_��_(2019)_2
  If In_TypeReport = 12 Then
            
    ' ���� �� ����� F1 � "A1" ��������� "��� ����", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "��� ����") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 14 - ������� �� ���������� (���������/�� ���������)
  If In_TypeReport = 14 Then
            
    ' ���� �� ����� F1 � "A1" ��������� "��� ����", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value, "������� �� ����������") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 15 - �������
  If In_TypeReport = 15 Then
            
    ' ���� �� ����� F1 � "A1" ��������� "��� ����", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "Flag_action") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 16 - PL
  If In_TypeReport = 16 Then
            
    ' ���� �� ����� F1 � "A1" ��������� "��� ����", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("B2").Value, "����������") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
  
  ' 17 - ��������� ������ http://isrb.psbnk.msk.ru/inf/6601/6622/otchet_zp_org/
  If In_TypeReport = 17 Then
            
    ' ���� �� ����� "������� �� ��" � "A4" ��������� "����� �� ����������� ���", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      ' If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A4").Value, "����� �� ����������� ���") <> 0) Then
      
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A4").Value, "���������") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
    
  ' 18 - ��������� ������ "���������� �� ��������� ������ � PA" http://isrb.psbnk.msk.ru/inf/6601/6622/ochet_PA/
  If In_TypeReport = 18 Then
            
    ' ���� �� ����� "��. ����� � ��-�� (���)" � "A6" ��������� "������", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A6").Value, "������") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
    
  ' 19 - ����� Capacity (Capacity_new)
  If In_TypeReport = 19 Then
            
    ' ���� �� ����� "��. ����� � ��-�� (���)" � "A6" ��������� "������", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "��-���") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
    
  ' 20 - ����� �� ��_N��_YYYY_DD.MM.YYYY_v1 (1)
  If In_TypeReport = 20 Then
            
    ' ���� �� ����� "����. ����." � "A" ��������� "������� ���", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "������� ���") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
    
  ' 21 - Pipe ��
  If In_TypeReport = 21 Then
            
    ' ���� �� ����� "����. ����." � "A" ��������� "������� ���", �� �������, ��� ������ ������
    If Sheets_Exist2(In_Workbooks, In_Sheets) = True Then
      '
      If (InStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("A1").Value, "������") <> 0) Then
        
        ' ��������� ���� ������
        If True Then ' CDate(Workbooks(In_Workbooks).Sheets(In_Sheets).Range("C1").Value) = In_Date
          ' ������ ����� ������ � ���������� ����
          CheckFormatReport = "OK"
        Else
          CheckFormatReport = "�������� ���� � ������"
        End If
      Else
        ' ���� � ����� ��� � �������� ������ ��������� ��������
        CheckFormatReport = "������ �������� ������"
      End If
    Else
        ' ���� � ����� ��� ����� � ����� ������
        CheckFormatReport = "������ �������� ������"
    End If
  End If
    
    
End Function

