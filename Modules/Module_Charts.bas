Attribute VB_Name = "Module_Charts"
' *** ���� Charts (�������) ***

' *** ���������� ���������� ***
' Public numStr_����8 As Integer


' ***                       ***

' ������� ������ �� ������ �� �������
Sub �������_������()
Attribute �������_������.VB_ProcData.VB_Invoke_Func = " \n14"

    ' ����� ��������� � �������� �� Y Range("C8:I9").Select
    ThisWorkbook.Sheets("Charts").Range("C9:I9").Select
    
    ' ���������� �������
    ActiveSheet.Shapes.AddChart2(332, xlLineMarkers, 1000, 150).Select
    
    ' ActiveChart.SetSourceData Source:=Range("�������!$C$8:$I$9")
    ActiveChart.SetSourceData Source:=ThisWorkbook.Sheets("Charts").Range("Charts!$C$8:$I$9")
    
    ActiveChart.ChartTitle.Select
    ActiveChart.Axes(xlValue).MajorGridlines.Select
    
    ' ������� ������������ �������
    ActiveChart.ChartTitle.Text = "������ ��"
    ActiveChart.ChartTitle.Format.TextFrame2.TextRange.Characters.Text = "������ ��"
    
    ' ������������ ������� ����
    ActiveChart.FullSeriesCollection(1).Name = "=""���_1"""
    
    ' ���������� ������� ����
    ActiveChart.PlotArea.Select
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = "=""���_2"""
    ActiveChart.FullSeriesCollection(2).Values = "=Charts!$C$10:$I$10"
    
    ' ���������� �������� ���� - ������ ���� ����� ��������� FullSeriesCollection(2, ����� 3 � �.�.)
    ActiveChart.PlotArea.Select
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(3).Name = "=""���_3"""
    ActiveChart.FullSeriesCollection(3).Values = "=Charts!$C$11:$I$11"
    
    ' ���������� �������
    ' ActiveSheet.ChartObjects("��������� 23").Activate
    ActiveChart.SetElement (msoElementLegendRight)
    ' ActiveSheet.ChartObjects("��������� 23").Activate
    ' ActiveChart.Legend.Select
    ' ActiveChart.Legend.LegendEntries(1).Select
    ' Application.CommandBars("Format Object").Visible = False

    
End Sub
Sub ������4()
Attribute ������4.VB_ProcData.VB_Invoke_Func = " \n14"
'
' ������4 ������
'

'
    ActiveSheet.ChartObjects("��������� 9").Activate
    ActiveChart.PlotArea.Select
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = "=""���2"""
    ActiveChart.FullSeriesCollection(2).Values = "=Charts!$C$10:$I$10"
End Sub
Sub ������5()
Attribute ������5.VB_ProcData.VB_Invoke_Func = " \n14"
'
' ������5 ������
'

'
    ActiveSheet.ChartObjects("��������� 23").Activate
    ActiveChart.SetElement (msoElementLegendRight)
    ActiveSheet.ChartObjects("��������� 23").Activate
    ActiveChart.Legend.Select
    ActiveChart.Legend.LegendEntries(1).Select
    Application.CommandBars("Format Object").Visible = False
End Sub
