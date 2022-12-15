<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageLink.aspx.cs" Inherits="EMR.Report.ImageLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style1.css" />
</head>
<body>
<form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <div class="text-center">
        <h4 class="mt-4 mb-4">View Image</h4>
        <ul id="viewimg"></ul>
    </div>
    <script>
        function rwndviewimage(token) {
            console.log(token);
            let wp = parseJwt(token);

            wp.forEach(myFunction);
        }
        function myFunction(value, index, array) {
            let study_date = "";

            study_date = value.study_date.substring(0, 4) + "-" + value.study_date.substring(4, 2) + "-" + value.study_date.substring(value.study_date.length - 2, 2);
            let liElement = document.createElement("li");
            let a = document.createElement("a");
            a.innerHTML = value.modality + " - " + study_date + " - " + value.study_desc;
            a.href = value.imglink;
            liElement.append(a);
            document.getElementById("viewimg").append(liElement);
        }
        function parseJwt(token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function (c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));
            return JSON.parse(jsonPayload);
        };
    </script>
</form>
</body>
</html>
