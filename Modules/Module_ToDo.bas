Attribute VB_Name = "Module_ToDo"
' ���� To-Do

' �������� ���� � �� ������� ToDo
Sub ToDo_refresh()
Attribute ToDo_refresh.VB_ProcData.VB_Invoke_Func = " \n14"

  ' 1. ������� �������� ����� �� �����
  Call clear�ontents2(ThisWorkbook.Name, "To-Do", "A6", "L1000")

  ' 2. ��������� ������� BASE\ToDo
  OpenBookInBase ("ToDo")

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("To-Do").Activate

  ' ������ �������
  Application.StatusBar = "���������..."

  ' ������ ������
  ThisWorkbook.Sheets("To-Do").Range("E1").Value = ""
  
  ' ���������
  ThisWorkbook.Sheets("To-Do").Range("B2").Value = "��������� � ������� �� �������� �� " + CStr(Date)

  ' ����� �� �������
  �������������� = 0

  ' �������� ��� ������ �� ������, ������� �������� - Date_Control
  rowCount = 2
  rowCount2 = 5
  
  Do While Not IsEmpty(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value)
        
    ' ���� ��������� ���� � ���� ��������� �� �������� = 1 (� ������)
    If (CDate(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value) <= Date) And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 1) Then
              
      ' ������������� ����������
      ��������_������ = False
      
      ' ���� ��� ��������� �� ��������� � ����� ����� ��������� = 1
      If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (ThisWorkbook.Sheets("To-Do").Range("I1").Value = 1) Then
        ��������_������ = True
      End If
      
      ' ���� ��� ��������� �� ��������� � ����� ����� ��������� = 0
      If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (ThisWorkbook.Sheets("To-Do").Range("I1").Value = 0) Then
        ��������_������ = False
      End If
      
      ' ���� ��� ��������� �� �� ���������
      If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value = "") Then
        ��������_������ = True
      End If
      
      ' ���� ��� ��������� �� �� ���������
      If ��������_������ = True Then
      
        ' ������� ��������� ����� �� ����� "To-Do"
        rowCount2 = rowCount2 + 1
      
        ' ����� �� �������
        �������������� = �������������� + 1
      
        ' ������� �� ���� "To-Do"
        ' �
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 1).Value = CStr(��������������) + "."
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 1).HorizontalAlignment = xlCenter
      
        ' ���� ��������
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 2).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 2).HorizontalAlignment = xlCenter
      
        ' Id_Task
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 3).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 2).Value
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 3).HorizontalAlignment = xlCenter
            
        ' Task
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 4).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value
      
        ' ���� �����
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 5).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 4).Value
      
        ' 6 HashTag (���� �� ���������, �� ������ "")
        If IsEmpty(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 6).Value) Then
          ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 6).Value = " "
        Else
          ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 6).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 6).Value
        End If
        
        ' 7 ������ ������
        If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 1 Then
          ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).Value = "� ������"
        End If
        '
        If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 0 Then
          ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).Value = "�������"
        End If

        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).HorizontalAlignment = xlCenter
        
        ' 8 �������������
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 8).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 8).HorizontalAlignment = xlCenter
      
        ' 9 ���� ��������
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 9).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 9).HorizontalAlignment = xlCenter
      
        ' 10 �����������
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 10).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value
      
        ' 11 �������� �������� (Protocol_Number)
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 11).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value
      
        ' 12 �������� � �������� Placed_Agenda
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 12).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 16).Value
      
      End If ' �������� ��������� �� ����������
      
    End If
                  
    ' ��������� ������
    rowCount = rowCount + 1
    ' Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
    ' DoEventsInterval (rowCount)
          
  Loop
  
  
  ' ��������� ������� BASE\ToDo
  CloseBook ("ToDo")
 
  ' ���������� ���������
  ThisWorkbook.Save

  ' ������ �������
  Application.StatusBar = ""
 
 
End Sub

' ��������� ��� ������ � ������� ToDo
Sub ToDo_save()
  
  ' ��������� ������� BASE\ToDo
  OpenBookInBase ("ToDo")

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("To-Do").Activate

  ' ������ �������
  Application.StatusBar = "����������..."

  ' �������� ��� ������ �� ������, ������� �������� - Date_Control
  rowCount = 6
  �����_������ = 0
    
  ' Do While Not IsEmpty(ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value)
  Do While ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value <> ""
  
    ' �������������� ������� ������: "� ������" -> 1
    If ThisWorkbook.Sheets("To-Do").Cells(rowCount, 7).Value = "� ������" Then
      Task_Status_Var = 1
    Else
      Task_Status_Var = 0
    End If
    
    ' ������ � ��������
    If ThisWorkbook.Sheets("To-Do").Cells(rowCount, 12).Value = 1 Then
                
                
      ' ��������� ������
      Call �������_������_�_��������("������� �.�.", _
                                       ThisWorkbook.Sheets("To-Do").Cells(rowCount, 4).Value, _
                                         ThisWorkbook.Sheets("To-Do").Cells(rowCount, 6).Value)

      ' �������� ������ � 1 (�������� � ��������) �� 2 (������� � ��������)
      ThisWorkbook.Sheets("To-Do").Cells(rowCount, 12).Value = 2

      ' ��������� � �������� � ��������
      MsgBox ("������� � �������� ������������ ��������!(" + ThisWorkbook.Sheets("To-Do").Cells(rowCount, 6).Value + ")")

    End If
    
    ' ������ ������ � BASE\ToDo
    Call InsertRecordInBook("ToDo", "����1", "Id_Task", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 3).Value, _
                                            "Date_Create", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 2).Value, _
                                              "Id_Task", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 3).Value, _
                                                "Task", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 4).Value, _
                                                  "Lotus_subject", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 5).Value, _
                                                    "Responsible", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 8).Value, _
                                                      "Lotus_hashtag", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 6).Value, _
                                                        "Task_Status", Task_Status_Var, _
                                                          "Date_Control", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 9).Value, _
                                                            "Comment", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 10).Value, _
                                                              "Protocol_Number", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 11).Value, _
                                                                "Placed_Agenda", ThisWorkbook.Sheets("To-Do").Cells(rowCount, 12).Value, _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
          
    ' ��������� ������
    Application.StatusBar = "���������� (" + ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value + ") ..."
    rowCount = rowCount + 1
    ' DoEventsInterval (rowCount)
          
  Loop
  
  Application.StatusBar = "����������..."
    
  ' ��������� ������� BASE\ToDo
  CloseBook ("ToDo")
 
  ' ������ �������
  Application.StatusBar = ""
  
  ' ��������� ���������� (� � ToDo_refresh ���� ����������)
  Call ToDo_refresh
  
End Sub

' �������� ������ � ������� �� ����� To-DO
Sub add_Task_ToDo()
  
  ' �������� �� ����� ������� � ��������� ����� ������
  rowCount = 6
  �����_��_������ = 0
  
  ' Do While Not IsEmpty(ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value)
  Do While Len(ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value) <> 0
  
    �����_��_������ = �����_��_������ + 1
  
    ' ��������� ������
    Application.StatusBar = CStr(rowCount) + "..."
    rowCount = rowCount + 1
    ' DoEventsInterval (rowCount)
          
  Loop
  
  ' ��������� ����� ������ � �����
  hashTag = createHashTag("t")
  �����_��_������ = �����_��_������ + 1
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).Value = CStr(�����_��_������) + "."
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 1).HorizontalAlignment = xlCenter
  
  ' ���� ��������
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 2).Value = Date
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 2).HorizontalAlignment = xlCenter
      
  ' Id_Task
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 3).Value = Replace(hashTag, "#t", "")
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 3).HorizontalAlignment = xlCenter
            
  ' Task
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 4).Value = ""
      
  ' ���� �����
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 5).Value = ""
      
  ' 6 HashTag (���� �� ���������, �� ������ "")
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 6).Value = hashTag
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 6).HorizontalAlignment = xlCenter
  
  ' 7 ������ ������
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 7).Value = "� ������"
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 7).HorizontalAlignment = xlCenter
        
  ' 8 �������������
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 8).Value = ""
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 8).HorizontalAlignment = xlCenter
      
  ' 9 ���� ��������
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 9).Value = Date
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 9).HorizontalAlignment = xlCenter
      
  ' 10 �����������
  ThisWorkbook.Sheets("To-Do").Cells(rowCount, 10).Value = ""
 
  ' ���������� ���������
  ThisWorkbook.Save

End Sub

' ������� ������ � ������� �� ����� To-DO
Sub Task_ToClose()
        
  ' ������
  ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 7).Value = "�������"

  ' ���������� ���������
  ThisWorkbook.Save

  ' ������ �� ������ ��������� ToDo_save() ���������� � BASE\To-Do
  If MsgBox("��������� ��������� � BASE\ToDo?", vbYesNo) = vbYes Then
    Call ToDo_save
  End If


End Sub

' ��������� ���� �� In_Day ���� � ������� ������ � ������� �� ����� To-DO
Sub Task_AddDay(In_Day)
          
  ' ��������� - ����� �� ������ �� ������ � �������
  If Len(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 1).Value) <> 0 Then
        
    ' ������
    ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 9).Value = CDate(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 9).Value) + In_Day

    ' ���������� ���������
    ThisWorkbook.Save
  Else
    
    ' ���������
    MsgBox ("�������� ������!")

  End If

End Sub

' ��������� ���� �� 1 ���� � ������� ������ � ������� �� ����� To-DO
Sub Task_Add_1_Day()
          
  Call Task_AddDay(1)

End Sub

' ��������� ���� �� 7 ���� (������) � ������� ������ � ������� �� ����� To-DO
Sub Task_Add_7_Day()
          
  Call Task_AddDay(7)

End Sub

' ��������� ���� �� 30 ���� (�����) � ������� ������ � ������� �� ����� To-DO
Sub Task_Add_30_Day()
          
  Call Task_AddDay(30)

End Sub


' �������� �� ������ ������ � ������� ���� ������ � ����������� � ������ ������
Sub ToDo_InsertTheme()
  
  ' ��������� - ����� �� ������ �� ������ � �������
  If Len(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 1).Value) <> 0 Then
        
            
    ' ��������� ������� ���������� � ������� ������! �������� - ������ ������, ���� � ������� ������ ������ ���
    If Len(ClipboardText()) <> 0 Then
      
      ' ��������� ���� Lotus Notes �� ������� ������
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 5).Select

      ActiveSheet.Paste
    
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' �������� ������ � ������ ������
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 6).Copy

    Else
    
      ' ���������
      MsgBox ("������ ������ ����!")
      
    End If
        
    
  Else
    
    ' ���������
    MsgBox ("�������� ������!")

  End If
  
End Sub

' ����������� � ����� ������ � ������� ������
Sub ToDo_CopyTag()
  
  ' ��������� - ����� �� ������ �� ������ � �������
  If Len(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 1).Value) <> 0 Then
                           
      ' �������� ������ � ������ ������
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 6).Copy
            
  Else
    
    ' ���������
    MsgBox ("�������� ������!")

  End If
  
End Sub

' ����������� � ����� ������ � ������� ����
Sub ToDo_CopyTheme()
  
  ' ��������� - ����� �� ������ �� ������ � �������
  If Len(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 1).Value) <> 0 Then
                           
      ' �������� ������ � ������ ������
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 5).Copy
            
  Else
    
    ' ���������
    MsgBox ("�������� ������!")

  End If
  
End Sub

' �������� �����������
Sub ToDo_Add_Upd()
  
  ' ��������� - ����� �� ������ �� ������ � �������
  If Len(ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 1).Value) <> 0 Then
                           
      ' ��������� �����������  =(Upd.����) � �����������
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 10).Select
      ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 10).Value = ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 10).Value + " =(Upd." + strDDMM(Date) + ") "
            
      ' ���������� ���������
      ThisWorkbook.Save
      
  Else
    
    ' ���������
    MsgBox ("�������� ������!")

  End If
  
End Sub

' ����� ������ �� BASE\To-Do
Sub ToDo_Find_Tasks()
Dim SearchString As String
Dim find_in_Task, find_in_Lotus_subject, find_in_Responsible, find_in_Lotus_hashtag, find_in_Comment, find_in_Protocol_Number As Byte

  ' 1. ������� �������� ����� �� �����
  Call clear�ontents2(ThisWorkbook.Name, "To-Do", "A6", "L100")

  ' 2. ��������� ������� BASE\ToDo
  OpenBookInBase ("ToDo")

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("To-Do").Activate

  ' ������ �������
  Application.StatusBar = "���������..."

  ' ������ ������
  SearchString = ThisWorkbook.Sheets("To-Do").Range("E1").Value

  ' ���������
  ThisWorkbook.Sheets("To-Do").Range("B2").Value = "�����: " + SearchString

  ' ����� �� �������
  �������������� = 0

  ' �������� ������ �� SearchString
  rowCount = 2
  rowCount2 = 5
  
  Do While Not IsEmpty(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value)
        
    ' ����� � Task (3) (����.: 1 - ����� ��� ����� �������� ��������)
    find_in_Task = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value, SearchString, 1)
    ' ����� � Lotus_subject (4)
    find_in_Lotus_subject = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 4).Value, SearchString, 1)
    ' ����� � Responsible (5)
    find_in_Responsible = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value, SearchString, 1)
    ' ����� � Lotus_hashtag (6)
    find_in_Lotus_hashtag = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 6).Value, SearchString, 1)
    ' ����� � Comment (9)
    find_in_Comment = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value, SearchString, 1)
    ' ����� � Protocol_Number (10)
    find_in_Protocol_Number = InStr(1, Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value, SearchString, 1)
        
    ' ���� ����������� �������
    If (find_in_Task <> 0) Or (find_in_Lotus_subject <> 0) Or (find_in_Responsible <> 0) Or (find_in_Lotus_hashtag <> 0) Or (find_in_Comment <> 0) Or (find_in_Protocol_Number <> 0) Then
      
      ' ������� ��������� ����� �� ����� "To-Do"
      rowCount2 = rowCount2 + 1
      
      ' ����� �� �������
      �������������� = �������������� + 1
      
      ' ������� �� ���� "To-Do"
      ' �
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 1).Value = CStr(��������������) + "."
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 1).HorizontalAlignment = xlCenter
      
      ' ���� ��������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 2).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 2).HorizontalAlignment = xlCenter
      
      ' Id_Task
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 3).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 2).Value
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 3).HorizontalAlignment = xlCenter
            
      ' Task
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 4).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value
      
      ' ���� �����
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 5).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 4).Value
      
      ' 6 HashTag (���� �� ���������, �� ������ "")
      If IsEmpty(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 6).Value) Then
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 6).Value = " "
      Else
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 6).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 6).Value
      End If
        
      ' 7 ������ ������
      If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 1 Then
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).Value = "� ������"
      End If
      '
      If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 0 Then
        ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).Value = "�������"
      End If
      
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 7).HorizontalAlignment = xlCenter
        
      ' 8 �������������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 8).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 8).HorizontalAlignment = xlCenter
      
      ' 9 ���� ��������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 9).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 9).HorizontalAlignment = xlCenter
      
      ' 10 �����������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 10).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value
      
      ' 11 ��������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 11).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value
      
      ' 12 � ��������
      ThisWorkbook.Sheets("To-Do").Cells(rowCount2, 12).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 16).Value
      
    End If
                  
    ' ��������� ������
    rowCount = rowCount + 1
    ' Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
    ' DoEventsInterval (rowCount)
          
  Loop
  
  
  ' ��������� ������� BASE\ToDo
  CloseBook ("ToDo")
 
  ' ���������� ���������
  ThisWorkbook.Save

  ' ������ �������
  Application.StatusBar = ""
    

End Sub

' ������������ ������� �� ���������� �� ���������� �� ������� ����
Sub �������_��_���������()
Dim �������_�����������_���������, �������_�����������_���, ����_�������_���������_str, ������_�����������_������� As String
Dim ����_��������� As Boolean
Dim �����_������_������� As Byte

  ' ������ �� ������������
  If MsgBox("������������ ������� �� ������������?", vbYesNo) = vbYes Then


    ' ��������� ������� To-Do � �������� ��� ����������� ��������� �� �����/����������
    

    ' ��������� ������� BASE\ToDo
    OpenBookInBase ("ToDo")

    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("To-Do").Activate

    ' ������ �������
    Application.StatusBar = "���������..."

    ' ������� ������ ������������
    �����_������_������� = 0

    ' ������ ����������� �������
    ������_�����������_������� = ""

    ' ��������� � ������ "������� ������� �� ����������"
    For i = 1 To 11
    
      ' ����������� 9 ��.: �������1, �������2, �������3, �������4, �������5, ���2, ���3, ���4, ���5
      �������_�����������_��������� = ""
      Select Case i
        Case 1
          �������_�����������_��������� = "�������1"
        Case 2
          �������_�����������_��������� = "�������2"
        Case 3
          �������_�����������_��������� = "�������3"
        Case 4
          �������_�����������_��������� = "�������4"
        Case 5
          �������_�����������_��������� = "�������5"
        Case 6
          �������_�����������_��������� = "���2"
        Case 7
          �������_�����������_��������� = "���3"
        Case 8
          �������_�����������_��������� = "���4"
        Case 9
          �������_�����������_��������� = "���5"
        Case 10
          �������_�����������_��������� = "����"
        Case 11
          �������_�����������_��������� = "���"
          
      End Select

      ' ���������� �������_�����������_���
      �������_�����������_��� = �������_�_���(getFromAddrBook(�������_�����������_���������, 4), 3)
      ' ���� ��������� �� ����� �����������?
      ����_��������� = False
      ����_�������_���������_str = ""
    
      ' ���� ������� �����������<>""
      If �������_�����������_��� <> "" Then
      
        ' ��������� ����� - ���� �� �� ������� ����������� ���������, ���������� � ������ �������?
        rowCount = 2
        Do While (Trim(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value) <> "") And (����_��������� = False)
        
            ' ���� (Protocol_Number<>"" � Protocol_Number2="") ��� (Protocol_Number<>"" � Protocol_Number2=�������� ���������)
            If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = "") And (InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value, �������_�����������_���)) Then
              ����_��������� = True
              ����_�������_���������_str = CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 11).Value)
            End If
          
            ' ��������� ������
            DoEvents
            rowCount = rowCount + 1
        
          Loop ' Do While
      
      End If
      
      ' ���� ������� ���������
      If ����_��������� = True Then
      
        ' ����� ������-�������
        �����_������_������� = �����_������_������� + 1
    
        ' ������ ����������� �������
        If ������_�����������_������� <> "" Then
          ������_�����������_������� = ������_�����������_������� + ", " + getFromAddrBook(�������_�����������_���������, 5)
        Else
          ������_�����������_������� = getFromAddrBook(�������_�����������_���������, 5)
        End If

        ' ��������� ������ "������� �� ����������.xlsx" ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
        Workbooks.Open (ThisWorkbook.Path + "\Templates\������� �� ����������.xlsx")
         
        ' ��� ����� � ���������� - ����� �� G2 "10-02032020"
        FileProtocolName = "������� �� ���������� " + Replace(�������_�����������_���, ".", "") + " (" + str��_MM_YY(Date) + ").xlsx"
        Workbooks("������� �� ����������.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileProtocolName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False

        ' ��������� ��������� � ��������������
        Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(1, 3).Value = "������� �� ���������� �� " + ������������(Date)
        ' �������������
        Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(4, 4).Value = getFromAddrBook(�������_�����������_���������, 1)
        Workbooks(FileProtocolName).Sheets("����� ���������").Cells(4, 4).Value = Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(4, 4).Value
       
        ' ������������ ��������� �� �����, ��� ����� ����
        �����_��������� = 0
        �����_���������_����� = 0
        ' �������
        �����_���������_�������� = 0
        �����_���������_��������� = 0
        �����_���������_��_��������� = 0
        
        rowCount = 2
        Do While Trim(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value) <> ""
        
            ' ���� �� ����������� (Protocol_Number<>"" � Protocol_Number2="") ��� (Protocol_Number<>"")
            If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = "") And (InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value, �������_�����������_���)) Then
            
              �����_��������� = �����_��������� + 1
              
              ' �������
              ' ���������
              If InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value, "���������") <> 0 Then
                �����_���������_��������� = �����_���������_��������� + 1
                �����_���������_�������� = �����_���������_�������� + 1
              End If
                  
              ' �� ���������
              If InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value, "�� ���������") <> 0 Then
                �����_���������_��_��������� = �����_���������_��_��������� + 1
                �����_���������_�������� = �����_���������_�������� + 1
              End If
            
            
              ' *** ������� � ������� ***
            
              If �����_��������� > 1 Then
            
                ' ��������� ������ ������ � ���� "���������"
                Workbooks(FileProtocolName).Sheets("����������� ���������").Activate
                Workbooks(FileProtocolName).Sheets("����������� ���������").Range(CStr(10 + �����_���������) + ":" + CStr(10 + �����_���������)).Select
                Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
            
                ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
                Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 1).NumberFormat = "@"
                
                ' ���������� B, �, D
                Workbooks(FileProtocolName).Sheets("����������� ���������").Range("B" + CStr(10 + �����_���������) + ":D" + CStr(10 + �����_���������)).MergeCells = True
            
                ' ������� F
                Workbooks(FileProtocolName).Sheets("����������� ���������").Range("F" + CStr(10 + �����_���������) + ":F" + CStr(10 + �����_���������)).Select
                With Selection.Validation
                    .Delete
                    .Add Type:=xlValidateList, AlertStyle:=xlValidAlertStop, Operator:=xlBetween, Formula1:="=����1!$A$1:$A$2"
                    .IgnoreBlank = True
                    .InCellDropdown = True
                    .InputTitle = ""
                    .ErrorTitle = ""
                    .InputMessage = ""
                    .ErrorMessage = ""
                    .ShowInput = True
                    .ShowError = True
                End With

            
                ' ���������� G, �
                Workbooks(FileProtocolName).Sheets("����������� ���������").Range("G" + CStr(10 + �����_���������) + ":H" + CStr(10 + �����_���������)).MergeCells = True
            
                ' �����
                Call �����_�_������_�������_���������(FileProtocolName, "����������� ���������", �����_���������)

            End If ' ��������� ����� ������ ��������� � ��������
          
            ' ����� ��������� � ����� �������
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 1).Value = "�. " + CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 12).Value) + " ����.�" + Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value
            Workbooks(FileProtocolName).Sheets("����������� ���������").Range("A" + CStr(10 + �����_���������) + ":A" + CStr(10 + �����_���������)).WrapText = True
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 1).HorizontalAlignment = xlCenter
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 1).VerticalAlignment = xlCenter

            ' ���������
            str_���������i = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value
          
            ' ��������� - "���������� �� ������"
            Workbooks(FileProtocolName).Sheets("����������� ���������").Range("B" + CStr(10 + �����_���������) + ":D" + CStr(10 + �����_���������)).WrapText = True
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 2).HorizontalAlignment = xlLeft
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 2).VerticalAlignment = xlTop
            ' ��������� - ������ ������
            Workbooks(FileProtocolName).Sheets("����������� ���������").Range(CStr(10 + �����_���������) + ":" + CStr(10 + �����_���������)).RowHeight = lineHeight(str_���������i, 15, 37) ' 20 - ����
            ' ��������� - ������ � �������
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 2).Value = str_���������i

            ' ���� ����������
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 5).Value = CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value)
            Workbooks(FileProtocolName).Sheets("����������� ���������").Range("E" + CStr(10 + �����_���������) + ":E" + CStr(10 + �����_���������)).WrapText = True
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 5).VerticalAlignment = xlTop
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 5).HorizontalAlignment = xlCenter
          
            ' ������
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 6).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 6).HorizontalAlignment = xlCenter
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 6).VerticalAlignment = xlTop

            ' ����������� (������������)
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 7).HorizontalAlignment = xlLeft
            Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(10 + �����_���������, 7).VerticalAlignment = xlTop


            ' *** ������� � ������� (�����) ***
            
            
          End If ' ���� Protocol_Number<>"" � Protocol_Number2=""
        
        
          ' *** ����� ��������� ***
          
                ' ���� �� ����������� (Protocol_Number<>"" � Protocol_Number2<>"")
                If (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value <> "") And (InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value, �������_�����������_���)) Then
                
                  �����_���������_����� = �����_���������_����� + 1
                
                  ' �������
                  ' ���������
                  If InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value, "���������") <> 0 Then
                    �����_���������_��������� = �����_���������_��������� + 1
                    �����_���������_�������� = �����_���������_�������� + 1
                  End If
                  
                  ' �� ���������
                  If InStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value, "�� ���������") <> 0 Then
                    �����_���������_��_��������� = �����_���������_��_��������� + 1
                    �����_���������_�������� = �����_���������_�������� + 1
                  End If
                  

                  ' *** ������� � ������� ***
                
                  If �����_���������_����� > 1 Then
                
                    ' ��������� ������ ������ � ���� "���������"
                    Workbooks(FileProtocolName).Sheets("����� ���������").Activate
                    Workbooks(FileProtocolName).Sheets("����� ���������").Range(CStr(10 + �����_���������_�����) + ":" + CStr(10 + �����_���������_�����)).Select
                    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
                
                    ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
                    Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 1).NumberFormat = "@"
                    
                    ' ���������� B, �, D
                    Workbooks(FileProtocolName).Sheets("����� ���������").Range("B" + CStr(10 + �����_���������_�����) + ":D" + CStr(10 + �����_���������_�����)).MergeCells = True
                
                    ' ���������� G, �
                    Workbooks(FileProtocolName).Sheets("����� ���������").Range("G" + CStr(10 + �����_���������_�����) + ":H" + CStr(10 + �����_���������_�����)).MergeCells = True
                
                    ' �����
                    Call �����_�_������_�������_���������(FileProtocolName, "����� ���������", �����_���������_�����)
    
                End If ' ��������� ����� ������ ��������� � ��������
              
                ' ����� ��������� � ����� �������
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 1).Value = "�. " + CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 12).Value) + " ����.�" + Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value
                Workbooks(FileProtocolName).Sheets("����� ���������").Range("A" + CStr(10 + �����_���������_�����) + ":A" + CStr(10 + �����_���������_�����)).WrapText = True
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 1).HorizontalAlignment = xlCenter
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 1).VerticalAlignment = xlCenter
    
                ' ���������
                str_���������i = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value
              
                ' ��������� - "���������� �� ������"
                Workbooks(FileProtocolName).Sheets("����� ���������").Range("B" + CStr(10 + �����_���������_�����) + ":D" + CStr(10 + �����_���������_�����)).WrapText = True
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 2).HorizontalAlignment = xlLeft
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 2).VerticalAlignment = xlTop
                ' ��������� - ������ ������
                Workbooks(FileProtocolName).Sheets("����� ���������").Range(CStr(10 + �����_���������_�����) + ":" + CStr(10 + �����_���������_�����)).RowHeight = lineHeight(str_���������i, 15, 37) ' 20 - ����
                ' ��������� - ������ � �������
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 2).Value = str_���������i
    
                ' ���� ����������
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 5).Value = CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value)
                Workbooks(FileProtocolName).Sheets("����� ���������").Range("E" + CStr(10 + �����_���������_�����) + ":E" + CStr(10 + �����_���������_�����)).WrapText = True
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 5).VerticalAlignment = xlTop
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 5).HorizontalAlignment = xlCenter
              
                ' ������
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 6).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 6).HorizontalAlignment = xlCenter
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 6).VerticalAlignment = xlTop
    
                ' �����������
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 7).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 17).Value
                ' ����������� - ���� � �������
                If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 18).Value <> "" Then
                  Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 7).Value = CStr(Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 7).Value) + " �����: " + CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 18).Value)
                End If
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 7).HorizontalAlignment = xlLeft
                Workbooks(FileProtocolName).Sheets("����� ���������").Cells(10 + �����_���������_�����, 7).VerticalAlignment = xlTop
    
                ' *** ������� � ������� (�����) ***
                
                
              End If ' ���� Protocol_Number<>"" � Protocol_Number2<>""

          
          ' *** ����� ������ � ����� ���������
        
          ' ���������
          Application.StatusBar = "��������� " + CStr(i) + "..."
        
          ' ��������� ������
          DoEvents
          rowCount = rowCount + 1
        Loop ' Do While
    
        ' ������
        Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(5, 4).Value = "� " + ����_�������_���������_str + " �� " + CStr(Date)
        Workbooks(FileProtocolName).Sheets("����� ���������").Cells(5, 4).Value = "� " + ����_�������_���������_str + " �� " + CStr(Date)

        ' ���� ����������� ��������� �� ������, %
        Workbooks(FileProtocolName).Sheets("����������� ���������").Cells(6, 4).Value = CStr(�����������(�����_���������_��������, �����_���������_���������, 2) * 100) + "%"
        Workbooks(FileProtocolName).Sheets("����� ���������").Cells(6, 1).Value = "���� ����������� ��������� �� ������, ��."
        Workbooks(FileProtocolName).Sheets("����� ���������").Cells(6, 4).Value = "����� ���������: " + CStr(�����_���������_��������) + " ��., � �.�. �� �������� ���������: " + CStr(�����_���������_���������) + " ��."
    
        ' �������� ����� � ���������� ��������
        Workbooks(FileProtocolName).Sheets("����������� ���������").Activate
        Workbooks(FileProtocolName).Close SaveChanges:=True
      
      End If ' ���� ��������� �� ������� �� �������� �����������
      
    Next i ' ��������� ����
    
    ' ��������� ������ ������ ��� �������� �� ����� 1 ������� = 1 ������
  
    ' ��������� ������� BASE\ToDo
    CloseBook ("ToDo")
 
    ' ������ �������
    Application.StatusBar = ""
      
    ' ���������
    MsgBox ("������������ " + CStr(�����_������_�������) + " �������!")

    ' ������ �� �������� ������� ��������� ������2 ����� � ����� ����
    If MsgBox("��������� ������ ������ � ��������� � ������?", vbYesNo) = vbYes Then
          
      ' ������������ �������� ������
      ' ���� ������ - ����:
      ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
      ���������� = ">>: " + ThisWorkbook.Sheets("����").Range("Q1").Value ' + subjectFromSheet("����")

      ' hashTag - ������:
      hashTag = "#protocol" ' hashTagFromSheetII("����", 1)

      ' ����-�������� (!!!)
      ' attachmentFile = ThisWorkbook.Sheets("����8").Cells(3, 17).Value
    
      ' ����� ������
      ����������� = "" + Chr(13)
      ����������� = ����������� + "" + ������_�����������_������� + Chr(13) ' ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100) + 2).Value + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "��������� ������������," + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "��������� �������������� ������� �� ��������� �� " + CStr(Date) + " �." + Chr(13)
      ����������� = ����������� + "" + Chr(13)
      ����������� = ����������� + "����� � ���� �� " + strDDMM(������_�����������_��_����(Date)) + " �� ������ ���������� ������ ���������� ������� (���������/�� ���������), ��� ������������� ��������� ����������� � ��������� ���� � ��� ����� ��� �������� � ��������." + Chr(13)
      ' ������� (������� � ��., )
      ����������� = ����������� + ��������������()
      ' ������
      ����������� = ����������� + createBlankStr(27) + hashTag
      ' �����
      Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, "")
  
      ' ���������
      MsgBox ("������ ����������!")
    
    End If

    ' ���������� ���������
    ' ThisWorkbook.Save
  
  End If
  
End Sub


' �����
Sub �����_�_������_�������_���������(In_FileProtocolName, In_Sheets, In_�����_���������)

                Workbooks(In_FileProtocolName).Sheets(In_Sheets).Range("A" + CStr(10 + In_�����_���������) + ":H" + CStr(10 + In_�����_���������)).Select
                With Selection.Borders(xlEdgeLeft)
                  .LineStyle = xlContinuous
                  .ThemeColor = 3
                  .TintAndShade = -0.749992370372631
                  .Weight = xlThin
                End With
                With Selection.Borders(xlEdgeTop)
                  .LineStyle = xlContinuous
                  .ThemeColor = 3
                  .TintAndShade = -0.749992370372631
                  .Weight = xlThin
                End With
                With Selection.Borders(xlEdgeBottom)
                  .LineStyle = xlContinuous
                  .ThemeColor = 3
                  .TintAndShade = -0.749992370372631
                  .Weight = xlThin
                End With
                With Selection.Borders(xlEdgeRight)
                  .LineStyle = xlContinuous
                  .ThemeColor = 3
                  .TintAndShade = -0.749992370372631
                  .Weight = xlThin
                End With
                With Selection.Borders(xlInsideVertical)
                  .LineStyle = xlContinuous
                  .ThemeColor = 3
                  .TintAndShade = -0.749992370372631
                  .Weight = xlThin
                End With

End Sub

' ���������� ���������� ���������
Sub ���������_����������_���������()
Dim ReportName_String, officeNameInReport, CheckFormatReportResult, Id_TaskVar As String
Dim i, rowCount, rowCount_searchResults As Integer
Dim finishProcess As Boolean
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� �������..."
  
    ' ���������� ������ ���������
    finishProcess = False

    ' ������� ��� ���� ������ �� ����� �����
    ReportName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� ������� BASE\ToDo
    OpenBookInBase ("ToDo")
  
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("To-Do").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "����������� ���������", 14, Date)
    If CheckFormatReportResult = "OK" Then
      
        ' ������� ������ (������������ ������� ����������)
        Count_error = 0
        ' ���������� ���������
        ������������������� = 0
        
        ' ��������� - ��� �� ����� ���������
        If Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Value <> "" Then
          MsgBox ("�������� ���� " + Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Value + "!")
        End If
        
        ' ������� ������� "� ����., �����."
        rowCount = rowByValue(ReportName_String, "����������� ���������", "� ����., �����.", 100, 100) + 1
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 1).Value)
        
       
                 
          ' ���� ��� ������� ����
          If (Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 6).Value = "���������") Or (Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 6).Value = "�� ���������") Then
            
            ' ������ ��������� ���������� ����� - �������� ������� To-Do ��� ���� ������
            
            ' Id_Task = ����� "431910202019" �� "�. 19 ����.�43-19102020"
            Id_TaskVar = genId_Task(Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 1).Value)
            
            ' ��������� ����� � To-DO
            Set searchResults = Workbooks("ToDo").Sheets("����1").Columns("B:B").Find(Id_TaskVar, LookAt:=xlWhole)
  
            ' ���� �������, �� ��������
            If searchResults Is Nothing Then
              ' ����� - ��������� �� ������, ��� �� ������� ����� ������!
              ' ������� ������
              Count_error = Count_error + 1
              ' ��������� � �������� ������� ������ ��� ����
              MsgBox ("�� ������� ������: " + CStr(Id_TaskVar) + "!")
            Else
              
              ' ���� �������, �� �������� � ������ searchResults.Row
              rowCount_searchResults = searchResults.Row
              
              ' 1) ������� I (9)  "Comment" - ������������� "���������/�� ���������"
              Workbooks("ToDo").Sheets("����1").Cells(rowCount_searchResults, 9).Value = Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 6).Value
              
              ' 2) ������� Q (17) "OfficeComment_protocolReport"  - ����������� �����
              Workbooks("ToDo").Sheets("����1").Cells(rowCount_searchResults, 17).Value = Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 7).Value
              
              ' 3) ������� R (18) "FileName_protocolReport"  - ��� ����� � ������� �� ���������� ��������� �� �������� ��������� ���������� ReportName_String
              Workbooks("ToDo").Sheets("����1").Cells(rowCount_searchResults, 18).Value = ReportName_String
            
              ' 4) ������� G (7) "Task_Status" = 0
              Workbooks("ToDo").Sheets("����1").Cells(rowCount_searchResults, 7).Value = 0
            
              ' ���������� ���������
              ������������������� = ������������������� + 1
          
            
            End If

            
          Else
            ' ������� ������
            Count_error = Count_error + 1
            ' ��������� � �������� ������� ������ ��� ����
            MsgBox ("�� ����� ����������� ����������: " + Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 1).Value + " ������ - " + Workbooks(ReportName_String).Sheets("����������� ���������").Cells(rowCount, 6).Value + "!")
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ������� ������ �� �����
      
      ' ������� ����� ���������
      
      ' ������ �������
      Application.StatusBar = "����������..."
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ���� ������ ���, �� ��������� ���� � In\Completed
    If Count_error = 0 Then
      ' � "H1" ������ ������ ���������� ���� � �����
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Value = "���������� " + CStr(Date) + " " + CStr(Time)
      
      ' �����
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Name = "Calibri"
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Size = 8
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Strikethrough = False
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Superscript = False
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Subscript = False
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.OutlineFont = False
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Shadow = False
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Underline = xlUnderlineStyleNone
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.ThemeColor = xlThemeColorLight1
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.TintAndShade = 0
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.ThemeFont = xlThemeFontMinor
      Workbooks(ReportName_String).Sheets("����������� ���������").Range("H1").Font.Italic = True

      ' C�������� ���� � In\Completed
      Workbooks(Dir(FileName)).SaveAs FileName:=ThisWorkbook.Path + "\In\Completed\" + Dir(FileName), FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
      Workbooks(Dir(FileName)).Close SaveChanges:=True
    Else
      ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
      Workbooks(Dir(FileName)).Close SaveChanges:=False
    End If
    
    ' ��������� ������� BASE\ToDo
    CloseBook ("ToDo")

    ' ��������� � ������ M2
    ThisWorkbook.Sheets("To-Do").Activate

    ' ������ �������
    Application.StatusBar = ""
    
    ' �������� ���������
    If finishProcess = True Then
      ' ���� ������?
      If Count_error = 0 Then
        MsgBox ("��������� " + Dir(ReportName_String) + " ���������. ���������� ������� " + CStr(�������������������) + " ���������!")
      Else
        ' ���� ���� ������
        MsgBox ("��������� " + Dir(ReportName_String) + " ���������! ������: " + CStr(Count_error))
      
        ' ��������� ������ - ��������� ��������� � LN �����������?
        If MsgBox("��������� ����������� � ����� �����������?", vbYesNo) = vbYes Then
          
          ' ������������ �������� ������
          
          
          ' ���������
          MsgBox ("������ ������ ���������!")
        End If
      
      End If
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������

End Sub

' ��������� Id_Task � To-DO
Function genId_Task(In_NumberStr) As String

  ' ����� ��������� 43-19102020 �� "�. 19 ����.�43-19102020"
  �����_��������� = Mid(In_NumberStr, InStr(In_NumberStr, "�") + 1, Len(In_NumberStr) - InStr(In_NumberStr, "�"))
  �����_��������� = Replace(�����_���������, "-", "")
  
  ' ����� ������ 19 �� "�. 19 ����.�43-19102020"
  ' t1 = InStr(In_NumberStr, "�.") + 3
  ' t2 = InStr(In_NumberStr, "����.") - 1
  ' t3 = InStr(In_NumberStr, "����.") - InStr(In_NumberStr, "�.") - 4
  
  ' �����_������ = Mid(In_NumberStr, )
  �����_������ = Mid(In_NumberStr, InStr(In_NumberStr, "�.") + 3, InStr(In_NumberStr, "����.") - InStr(In_NumberStr, "�.") - 4)
  
  ' Id_Task = ����� "431910202019" �� "�. 19 ����.�43-19102020"
  t = �����_��������� + �����_������
  genId_Task = t
  
End Function

' ������� ��������� � ������� �� ����� To-DO �� ���������
Sub Task_From_Protocol_ToClose()
        
  ' ������
  ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 7).Value = "�������"

  ' ����������� = ���������
  ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 10).Value = "���������"

  ' ���������� ���������
  ThisWorkbook.Save

  ' ������ �� ������ ��������� ToDo_save() ���������� � BASE\To-Do
  If MsgBox("��������� ��������� � BASE\ToDo?", vbYesNo) = vbYes Then
    Call ToDo_save
  End If


End Sub

' ������� ��������� � ������� �� ����� To-DO �� ��������� - ������ "�� ���������"
Sub Task_From_Protocol_ToClose_2()
        
  ' ������
  ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 7).Value = "�������"

  ' ����������� = ���������
  ThisWorkbook.Sheets("To-Do").Cells(ActiveCell.Row, 10).Value = "�� ���������"

  ' ���������� ���������
  ThisWorkbook.Save

  ' ������ �� ������ ��������� ToDo_save() ���������� � BASE\To-Do
  If MsgBox("��������� ��������� � BASE\ToDo?", vbYesNo) = vbYes Then
    Call ToDo_save
  End If


End Sub


