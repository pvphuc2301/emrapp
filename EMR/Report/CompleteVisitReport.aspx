<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompleteVisitReport.aspx.cs" Inherits="EMR.Report.CompleteVisitReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
                <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">
                                            <asp:Label ID="lbTitle" runat="server" Text="" />
                                        </span>
                                    </h4>
                                </div>
                                <div class="card-body" style="padding: 0">
                                    <div class="table-responsive">
            <telerik:RadGrid CssClass="table" BorderWidth="0" 
                    AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound"
                    AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id, visible_patient_id,patient_visit_id">
                                                <Columns>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="visible_patient_id"
                                                        HeaderText="Patient ID"
                                                        DataField="visible_patient_id"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        ItemStyle-Font-Bold="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="patient_name_l"
                                                        HeaderText="Name"
                                                        DataField="patient_name_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="date_of_birth"
                                                        HeaderText="Age"
                                                        DataField="date_of_birth"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="gender_e"
                                                        HeaderText="Gender"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        DataField="gender_e"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="work_queue_l"
                                                        HeaderText="Work Queue"
                                                        DataField="work_queue_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="adtending_doctor_l"
                                                        HeaderText="Attending Doctor"
                                                        DataField="adtending_doctor_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="start_date_time"
                                                        HeaderText="Visit Date"
                                                        DataField="start_date_time"
                                                        DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" ItemStyle-Wrap="false" Visible="true"
                                                        HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                                        UniqueName="completed" HeaderText="Consult date" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>                                                            
                                                            <asp:Label ID="lbCompleted_Date" runat="server" Text='<%#Eval("completed_date_time","{0:dd/MMM/yyyy hh:mm}")%>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                        </div>
                                    </div>

        </div>
    </form>
</body>
</html>
