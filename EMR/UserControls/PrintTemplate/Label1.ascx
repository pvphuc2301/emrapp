<%@ Control Language="C#" ClassName="Label1" %>
<%@ Import Namespace="EMR.UserControls" %>

<script runat="server">
    public string Title { get; set; }
    public string SubTitle { get; set; }
    public string CssClass { get; set; }
    public string No { get; set; }

    void Page_Init()
    {
    }
</script>
<div class="<%= CssClass %> align-top d-flex no-block" >
    <label style="width: 32px; text-align: right; flex-shrink: 0;" class="font-bold align-top h5 mr-1"><%= No %></label>
    <div class="d-inline-block">
        <label class="font-bold h5"><%= Title %></label>
        <div class="text-primary"><%= SubTitle %></div>
    </div>
</div>
