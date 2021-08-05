<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="EMR.Other.Test" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="uc1" TagName="TextField" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />

    <style>
        div[contenteditable="true"] font {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div contenteditable="true" id="pre"></div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <%--<script src="../scripts/myScript.js"></script>--%>
    <%--<script src="../scripts/contenteditable.min.js"></script>--%>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>



    <script>

        //console.log(document.querySelectorAll('[contenteditable=true]'));

        $("div[contentEditable]").keydown = function (e) {
            console.log($("div[contentEditable]").innerHTML);

        }

        document.querySelectorAll('[contenteditable=true]')[0].addEventListener("input", function () {

        });

        function format(e, t) { document.execCommand(e, !1, t) }

        window.addEventListener("load", function () {
            let t, o;
            
            //document.onkeyup = function (e) { (13 === e.keyCode || 32 === e.keyCode && window.getSelection().anchorNode.textContent.includes(t)) && (format("foreColor", "black"), format("insertText", "")) },

            //    document.onkeydown = function (e) { o = "red" === window.getSelection().focusNode.parentNode.color, 32 === e.keyCode && o && (e.preventDefault(), format("foreColor", "black"), format("insertText", " ")) }

            document.addEventListener('paste', (event) => {
                let paste = (event.clipboardData || window.clipboardData).getData('text');

                paste = paste.trim();

                const selection = window.getSelection();
                if (!selection.rangeCount) return false;
                selection.deleteFromDocument();

                let text;

                if (window.getSelection().focusNode.parentNode.color == "red") {
                    text = this.document.createTextNode(paste);
                }
                else {
                    text = document.createElement("font");
                    text.color = 'red';
                    text.innerText = paste;
                }

                selection.getRangeAt(0).insertNode(text);

                $("div[contentEditable]").blur()

                event.preventDefault();
            });

            document.body.addEventListener('dragover', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false);

            document.body.addEventListener('drop', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false);
        });

    </script>

</body>
</html>
