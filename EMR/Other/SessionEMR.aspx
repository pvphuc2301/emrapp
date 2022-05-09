<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionEMR.aspx.cs" Inherits="EMR.Other.SessionEMR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div style="display: grid; grid-gap: 8px; margin-top:8px; margin-bottom: 80px">
            <div>
                <telerik:RadButton runat="server" ID="btnRefresh" OnClick="btnRefresh_Click" Text="Refresh"></telerik:RadButton>
            </div>
            <telerik:RadGrid ItemStyle-Wrap="false" OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" HeaderStyle-Height="32px" 
                                            BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="false" OnItemDataBound="RadGrid1_ItemDataBound">
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id">
                    <Columns>
                        <telerik:GridBoundColumn ItemStyle-Width="100px" SortExpression="model_name" HeaderText="model_name" DataField="model_name" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true"></telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="created name" SortExpression="created_name_l">
                            <ItemTemplate>
                                <telerik:RadLabel runat="server" ID="lblcreated_name_l" Text='<%#Eval("created_name_l") %>'></telerik:RadLabel>
                                (<telerik:RadLabel runat="server" ID="lblcreated_user_id" Text='<%#Eval("created_user_id") %>'></telerik:RadLabel>)
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="blocked by" SortExpression="user_name">
                            <ItemTemplate>
                                <telerik:RadLabel runat="server" ID="lblfull_name_l" Text='<%#Eval("full_name_l") %>'></telerik:RadLabel>
                                (<telerik:RadLabel runat="server" ID="lbluser_name" Text='<%#Eval("user_name") %>'></telerik:RadLabel>)
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn SortExpression="min" HeaderText="min" DataField="min" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="lu_date_time" HeaderText="lu_date_time" DataField="lu_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
