<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="EMR.Other.GridView"  ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        
.tb-responsive {
    border: 1px solid #ccc;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    width: 100%;
    table-layout: fixed;
}

@media screen and (max-width: 600px) {
    .tb-responsive {
        border: 0;
    }


        .tb-responsive > thead {
            border: none;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

            .tb-responsive > thead > tr {
                display: block;
                border: 1px solid #ddd;
                margin-bottom: .625em;
            }

                .tb-responsive > thead > tr > th {
                    padding: 12px !important;
                }

        .tb-responsive > tbody > tr {
            border: 1px solid #ddd;
        }

            .tb-responsive > tbody > tr > td {
                padding: 4px;
                display: block;
                text-align: right;
            }

                .tb-responsive > tbody > tr > td::before {
                    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
                    content: attr(data-label);
                    float: left;
                }

                .tb-responsive > tbody > tr > td:last-child {
                    border-bottom: 0;
                }
}

    </style>
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
    <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow: auto">  
         <h1>  
            <a href="../adminIndex.aspx">Back </a>| Service Master  
        </h1>  
        <asp:updatepanel id="UpdatePanelService" runat="server" updatemode="Conditional">  
                <ContentTemplate>  
                    <asp:GridView ID="gridService" runat="server" CssClass="tb-responsive" AutoGenerateColumns="false" ShowFooter="true" OnRowEditing="gridService_RowEditing"
                        
                         OnRowUpdating="gridService_RowUpdating">  
                        <Columns>  
                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="SR.NO">  
                                <ItemTemplate>  
                                    <asp:Label ID="lblID" runat="server"  
                                      Text='<%#Eval("service_id")%>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>  
                            <asp:TemplateField ItemStyle-Width="600px" HeaderText="Service">  
                                <ItemTemplate>  
                                    <asp:Label ID="lblService" runat="server" Text='<%#Eval("service_name")%>'></asp:Label>  
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtService" runat="server" Text='<%#Eval("service_name")%>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <FooterTemplate>  
                                    <asp:TextBox ID="txtServiceNew" runat="server"></asp:TextBox>  
                                </FooterTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField>  
                                <ItemTemplate>  
                                    <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%#  
                                             Eval("service_id")%>'  
                                        OnClientClick="return confirm('Do you want to delete?')"  
                                      Text="Delete"></asp:LinkButton>  
                                </ItemTemplate> 
                                <FooterTemplate> 
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click1"/>  
                                </FooterTemplate>
                            </asp:TemplateField> 
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>  
                    </asp:GridView>  
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server"  
                         AssociatedUpdatePanelID="UpdatePanelService">  
                        <ProgressTemplate>  
                            Please wait image is getting uploaded....  
                        </ProgressTemplate>  
                    </asp:UpdateProgress>  
                </ContentTemplate>  
                <Triggers>
                </Triggers>
           </asp:updatepanel>  
    </div>  
    

    </form>
</body>
</html>
