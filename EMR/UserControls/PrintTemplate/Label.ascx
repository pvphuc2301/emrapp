﻿<%@ Control Language="C#" ClassName="Label" %>
<%@ Import Namespace="EMR.UserControls" %>

<script runat="server">

    public string Title { get; set; }
    public string SubTitle { get; set; }
    public string CssClass { get; set; }

    void Page_Init()
    {
    }
</script>

<div class="<%= CssClass %> d-inline-block" >
    <label class="d-block mb-0 h4"><%= Title %></label>
    <span class="text-primary"><%= SubTitle %></span>
</div>