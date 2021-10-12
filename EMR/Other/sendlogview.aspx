<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sendlogview.aspx.cs" Inherits="EMR.Other.sendlogview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />--%>
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>

                    <!-- ============================================================== -->
                    <!-- Main wrapper - style you can find in pages.scss -->
                    <!-- ============================================================== -->
                    <!-- Row -->    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4><label class="flex-grow-1" runat="server" id="lblTitle"></label>
                                        <asp:Button runat="server" OnClick="btnNew_Click" ID="btnNewMail" class="btn btn-primary" Text="Compose New Mail" Visible="false"/>
                                        <asp:Button runat="server" OnClick="btnNew_Click" ID="btnNewSMS" class="btn btn-primary" Text="Compose New SMS" Visible="false"/>
                                    </h4>
                                </div>                                
                                <div class="row mt-4">
                                    <div class="col-md-12">
                                        <%--<asp:UpdatePanel ID="Upd" runat="server" OnLoad="Upd_Load" UpdateMode="Conditional">
                                            <ContentTemplate>--%>
            <table id="newMail" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 464px" visible="false">  
                <tr>  
                    <td class="auto-style1">To:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtTo" runat="server" Width="800px"></asp:TextBox>  
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1">Subject:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtSubject" runat="server" Width="800px"></asp:TextBox>  
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1">Attachment:  
                    </td>  
                    <td>  
                        <asp:FileUpload ID="fileUploader" runat="server" />  
                    </td>  
                </tr>  
                <tr>  
                    <td valign="top" class="auto-style1">Body:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="150" Width="800px"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="auto-style1">   
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1"></td>  
                    <td>
                        <p>
                                By signing below, I consent to the use of email communication between myself/ <asp:Label runat="server" ID="Label1" Font-Bold="true" /> and <asp:Label runat="server" ID="Label2" Font-Bold="true" />.  I recognize that there are risks to its use, and despite <asp:Label runat="server" ID="Label3" />’s best efforts, he/she cannot absolutely guarantee confidentiality.  I understand and accept those risks and the policies for email use outlined in the form.  I further agree to follow these policies and agree that should I fail do so, <asp:Label runat="server" ID="Label4" Font-Bold="true" /> may cease to allow me to use email to communicate with him/her.  I also understand that I may withdraw my consent to communicate via email at any time by notifying <asp:Label runat="server" ID="Label5" Font-Bold="true" /> in writing.
                        </p>
                        <asp:Button ID="bttn_Send" Text="Send Message" runat="server" OnClick="bttn_Send_Click" />  
                    </td>  
                </tr>  
            </table>                      

                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" Visible="false" 
                                                    OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="STT">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="mail_from_name" HeaderText="From" DataField="mail_from_name" ItemStyle-Wrap="false" HeaderStyle-Width="20%"
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="mail_subject" HeaderText="Subject" DataField="mail_subject" ItemStyle-Wrap="false" HeaderStyle-Width="30%" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="CREATED_DATE" SortExpression="CREATED_DATE" HeaderText="Send date" DataField="CREATED_DATE" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="mail_to" HeaderText="To" DataField="mail_to" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>                                                                                
        <table id="newSMS" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 464px" visible="false">  
                <tr>  
                    <td class="auto-style1">To:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="sms_to" runat="server" Width="800px"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td valign="top" class="auto-style1">Body:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="sms_body" runat="server" TextMode="MultiLine" Height="150" Width="800px"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="auto-style1">   
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1"></td>  
                    <td>  
                        <asp:Button ID="Button1" Text="Send SMS" runat="server" OnClick="bttn_Send_Click" />  
                    </td>  
                </tr>  
        </table>
                                        <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid2" runat="server" AllowPaging="True" Visible="false" 
                                                    OnNeedDataSource="RadGrid2_NeedDataSource" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="STT">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="sms_from_name" HeaderText="From" DataField="sms_from_name" ItemStyle-Wrap="false" HeaderStyle-Width="20%"
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="CREATED_DATE" SortExpression="CREATED_DATE" HeaderText="Send date" 
                                                                DataField="CREATED_DATE" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="sms_to" HeaderText="To" DataField="sms_to" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            <%--</ContentTemplate>    
                                        </asp:UpdatePanel>--%>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </form>

</body>
</html>
