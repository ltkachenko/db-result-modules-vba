Attribute VB_Name = "Module_Test"
' ***           ���� Test             ***
' *** ������������ �������� � ������� ***

' 1. ������������ ������� getDataFrom_BASE_Workbook
Sub test_getDataFrom_BASE_Workbook()
  
  ThisWorkbook.Sheets("Test").Range("C5").Value = ""
  ThisWorkbook.Sheets("Test").Range("C5").Value = getDataFrom_BASE_Workbook(ThisWorkbook.Sheets("Test").Range("C6").Value, _
                                                                                ThisWorkbook.Sheets("Test").Range("E6").Value, _
                                                                                  ThisWorkbook.Sheets("Test").Range("G6").Value, _
                                                                                    ThisWorkbook.Sheets("Test").Range("I6").Value, _
                                                                                      ThisWorkbook.Sheets("Test").Range("K6").Value, _
                                                                                        1)
End Sub


' 2. ������������ ������� Product_Name_to_Product_Code(In_Product_Name) As String
Sub test_Product_Name_to_Product_Code()
  
  ThisWorkbook.Sheets("Test").Range("C9").Value = ""
  ThisWorkbook.Sheets("Test").Range("C9").Value = Product_Name_to_Product_Code(ThisWorkbook.Sheets("Test").Range("C10").Value)
  
End Sub

' 3. ������������ ������� ������������ �������� ��� � ����������� �������� Function Product_Code_to_Product_Name(In_Product_Code) As String
Sub test_Product_Code_to_Product_Name()
  
  ThisWorkbook.Sheets("Test").Range("C13").Value = ""
  ThisWorkbook.Sheets("Test").Range("C13").Value = Product_Code_to_Product_Name(ThisWorkbook.Sheets("Test").Range("C14").Value)
  
End Sub

' 4. ������������ ������� getDataFrom_BASE_Workbook2
Sub test_getDataFrom_BASE_Workbook2()
  
  ThisWorkbook.Sheets("Test").Range("C17").Value = ""
  ThisWorkbook.Sheets("Test").Range("C17").Value = getDataFrom_BASE_Workbook2(ThisWorkbook.Sheets("Test").Range("C18").Value, _
                                                                                ThisWorkbook.Sheets("Test").Range("E18").Value, _
                                                                                  ThisWorkbook.Sheets("Test").Range("G18").Value, _
                                                                                    ThisWorkbook.Sheets("Test").Range("I18").Value, _
                                                                                      ThisWorkbook.Sheets("Test").Range("K18").Value, _
                                                                                        1)
End Sub


' 5. ������������ ������� Function ����_Q_��_����(In_OfficeNumber, In_Product_Code, In_Date) As Double
Sub test_����_Q_��_����()
  
  ThisWorkbook.Sheets("Test").Range("C21").Value = ""
  ThisWorkbook.Sheets("Test").Range("C21").Value = ����_Q_��_����(ThisWorkbook.Sheets("Test").Range("C22").Value, _
                                                                                ThisWorkbook.Sheets("Test").Range("E22").Value, _
                                                                                  ThisWorkbook.Sheets("Test").Range("G22").Value)
End Sub

' 6. ������������ ������� Function ������_�����������_��_����(In_Date) As Date
Sub test_������_�����������_��_����()
  ThisWorkbook.Sheets("Test").Range("C25").Value = ""
  ThisWorkbook.Sheets("Test").Range("C25").Value = ������_�����������_��_����(ThisWorkbook.Sheets("Test").Range("C26").Value)
End Sub

' 7. ������������ ������� Function ����_��_����_���_��������_��������(In_Date, In_Plan, In_��������_��������_����, In_working_days_in_the_week, In_NonWorkingDays) As Double
Sub test_����_��_����_���_��������_��������()
  
  ThisWorkbook.Sheets("Test").Range("C29").Value = ""
  ThisWorkbook.Sheets("Test").Range("C29").Value = ����_��_����_���_��������_��������(ThisWorkbook.Sheets("Test").Range("C30").Value, _
                                                                                        ThisWorkbook.Sheets("Test").Range("E30").Value, _
                                                                                          ThisWorkbook.Sheets("Test").Range("G30").Value, _
                                                                                            ThisWorkbook.Sheets("Test").Range("I30").Value, _
                                                                                              ThisWorkbook.Sheets("Test").Range("K30").Value)
End Sub


' 8. ������� �������� � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays) Function �������_��������(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
Sub test_�������_��������()
  
  ThisWorkbook.Sheets("Test").Range("C33").Value = ""
  ThisWorkbook.Sheets("Test").Range("C33").Value = �������_��������(ThisWorkbook.Sheets("Test").Range("C34").Value, _
                                                                                        ThisWorkbook.Sheets("Test").Range("E34").Value, _
                                                                                          ThisWorkbook.Sheets("Test").Range("G34").Value, _
                                                                                            ThisWorkbook.Sheets("Test").Range("I34").Value, _
                                                                                              ThisWorkbook.Sheets("Test").Range("K34").Value)
End Sub



' 9. ������� �������� � ������ � ��� ����� ��������� ����: In_Date, In_Plan, In_Fact, In_working_days_in_the_week (5-��/6-�� ������), In_NonWorkingDays = 1/0 (��������� ��������� ��� �� BASE\NonWorkingDays) Function �������_��������_����(In_Date, In_Plan, In_Fact, In_working_days_in_the_week, In_NonWorkingDays) As Double
Sub test_�������_��������_����()
  
  ThisWorkbook.Sheets("Test").Range("C37").Value = ""
  ThisWorkbook.Sheets("Test").Range("C37").Value = �������_��������_����(ThisWorkbook.Sheets("Test").Range("C38").Value, _
                                                                                        ThisWorkbook.Sheets("Test").Range("E38").Value, _
                                                                                          ThisWorkbook.Sheets("Test").Range("G38").Value, _
                                                                                            ThisWorkbook.Sheets("Test").Range("I38").Value, _
                                                                                              ThisWorkbook.Sheets("Test").Range("K38").Value)
End Sub

' 10. ���������� - ���� "�� ������:" � "M9" Sub ����_��_������_����8()
Sub test_����_��_������_����8()
  
  Call ����_��_������_����8
  
End Sub

' 11. ���� ������ �� �������� �� ���� "Fact", �� In_Date ���������� ������ ����� ������ � ���
Sub test_����_�() ' Function ����_�(In_Date, In_OfficeNumber, In_Product_Code) As Date
  
  ThisWorkbook.Sheets("Test").Range("C45").Value = ""
  ThisWorkbook.Sheets("Test").Range("C45").Value = ����_�(ThisWorkbook.Sheets("Test").Range("C46").Value, _
                                                                                        ThisWorkbook.Sheets("Test").Range("E46").Value, _
                                                                                          ThisWorkbook.Sheets("Test").Range("G46").Value)
  
  
End Sub

' 12. Function �������_Q_��_������(In_OfficeNumber, In_Product_Code, In_DateStart, In_DateEnd) As Double
Sub test_�������_Q_��_������()
  
  ThisWorkbook.Sheets("Test").Range("C49").Value = ""
  ThisWorkbook.Sheets("Test").Range("C49").Value = �������_Q_��_������(ThisWorkbook.Sheets("Test").Range("C50").Value, _
                                                                                        ThisWorkbook.Sheets("Test").Range("E50").Value, _
                                                                                          ThisWorkbook.Sheets("Test").Range("G50").Value, _
                                                                                            ThisWorkbook.Sheets("Test").Range("I50").Value)
  
  
End Sub



