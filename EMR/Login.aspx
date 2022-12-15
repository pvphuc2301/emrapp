<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Emr_client.Emr.Login" %>

<%@ Register Src="~/UserControls/Spinner1.ascx" TagPrefix="webUI" TagName="Spinner1" %>
<%@ Register Src="~/icons/Eye.ascx" TagPrefix="webUI" TagName="Eye" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="images/aih.ico"/>
    <link href="./styles/default.css" rel="stylesheet" />
    <link href="./styles/style.css" rel="stylesheet" />
    <link href="./styles/myStyle.css" rel="stylesheet" />
    <link href="./styles/style-login.css" rel="stylesheet" />

    <style>
        .k-loader{position:relative;display:inline-block;vertical-align:middle;box-sizing:border-box;line-height:0}.k-loader-canvas{display:-ms-flexbox;display:flex;position:relative}.k-loader-segment{border-radius:50%;background-color:currentColor;position:absolute}.k-loader-sm{padding:2px}.k-loader-sm .k-loader-segment{width:4px;height:4px}.k-loader-md{padding:4px}.k-loader-md .k-loader-segment{width:8px;height:8px}.k-loader-lg{padding:8px}.k-loader-lg .k-loader-segment{width:16px;height:16px}@-webkit-keyframes pulsing-2-segment{0%{-webkit-transform:scale(1);transform:scale(1)}50%{-webkit-transform:scale(1.5);transform:scale(1.5)}100%{-webkit-transform:scale(1);transform:scale(1)}}@keyframes pulsing-2-segment{0%{-webkit-transform:scale(1);transform:scale(1)}50%{-webkit-transform:scale(1.5);transform:scale(1.5)}100%{-webkit-transform:scale(1);transform:scale(1)}}.k-loader-pulsing-2 .k-loader-canvas{-ms-flex-align:center;align-items:center}.k-loader-pulsing-2 .k-loader-segment:nth-child(1){left:0;-webkit-transform:scale(1.5);-ms-transform:scale(1.5);transform:scale(1.5);-webkit-transform-origin:0 50%;-ms-transform-origin:0 50%;transform-origin:0 50%;-webkit-animation:pulsing-2-segment 1s ease infinite;animation:pulsing-2-segment 1s ease infinite;-webkit-animation-delay:-.5s;animation-delay:-.5s}.k-loader-pulsing-2 .k-loader-segment:nth-child(2){right:0;-webkit-transform-origin:100% 50%;-ms-transform-origin:100% 50%;transform-origin:100% 50%;-webkit-animation:pulsing-2-segment 1s ease infinite;animation:pulsing-2-segment 1s ease infinite}.k-loader-pulsing-2.k-loader-sm .k-loader-canvas{width:12px;height:6px}.k-loader-pulsing-2.k-loader-md .k-loader-canvas{width:24px;height:12px}.k-loader-pulsing-2.k-loader-lg .k-loader-canvas{width:48px;height:24px}@-webkit-keyframes spinner-3-segment{0%{top:0;left:50%}33.3333%{top:100%;left:0}66.6666%{top:100%;left:100%}100%{top:0;left:50%}}@keyframes spinner-3-segment{0%{top:0;left:50%}33.3333%{top:100%;left:0}66.6666%{top:100%;left:100%}100%{top:0;left:50%}}.k-loader-spinner-3 .k-loader-segment{-webkit-transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%);transform:translate(-50%,-50%)}.k-loader-spinner-3 .k-loader-segment:nth-child(1){top:0;left:50%;-webkit-animation:spinner-3-segment 2s ease infinite;animation:spinner-3-segment 2s ease infinite}.k-loader-spinner-3 .k-loader-segment:nth-child(2){top:100%;left:0;-webkit-animation:spinner-3-segment 2s ease infinite;animation:spinner-3-segment 2s ease infinite;-webkit-animation-delay:-.66666667s;animation-delay:-.66666667s}.k-loader-spinner-3 .k-loader-segment:nth-child(3){top:100%;left:100%;-webkit-animation:spinner-3-segment 2s ease infinite;animation:spinner-3-segment 2s ease infinite;-webkit-animation-delay:-1.33333333s;animation-delay:-1.33333333s}.k-loader-spinner-3.k-loader-sm .k-loader-canvas{margin:2px;width:12px;height:9.85640646px}.k-loader-spinner-3.k-loader-md .k-loader-canvas{margin:4px;width:24px;height:19.71281292px}.k-loader-spinner-3.k-loader-lg .k-loader-canvas{margin:8px;width:48px;height:39.42562584px}@-webkit-keyframes spinner-4-segment-1{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:0;left:0;-webkit-transform:translateX(0) translateY(0);transform:translateX(0) translateY(0)}66.6%{top:0;left:0;-webkit-transform:translateX(0) translateY(0);transform:translateX(0) translateY(0)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@keyframes spinner-4-segment-1{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:0;left:0;-webkit-transform:translateX(0) translateY(0);transform:translateX(0) translateY(0)}66.6%{top:0;left:0;-webkit-transform:translateX(0) translateY(0);transform:translateX(0) translateY(0)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@-webkit-keyframes spinner-4-segment-2{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:0;left:100%;-webkit-transform:translateX(-100%) translateY(0);transform:translateX(-100%) translateY(0)}66.6%{top:0;left:100%;-webkit-transform:translateX(-100%) translateY(0);transform:translateX(-100%) translateY(0)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@keyframes spinner-4-segment-2{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:0;left:100%;-webkit-transform:translateX(-100%) translateY(0);transform:translateX(-100%) translateY(0)}66.6%{top:0;left:100%;-webkit-transform:translateX(-100%) translateY(0);transform:translateX(-100%) translateY(0)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@-webkit-keyframes spinner-4-segment-3{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:100%;left:100%;-webkit-transform:translateX(-100%) translateY(-100%);transform:translateX(-100%) translateY(-100%)}66.6%{top:100%;left:100%;-webkit-transform:translateX(-100%) translateY(-100%);transform:translateX(-100%) translateY(-100%)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@keyframes spinner-4-segment-3{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:100%;left:100%;-webkit-transform:translateX(-100%) translateY(-100%);transform:translateX(-100%) translateY(-100%)}66.6%{top:100%;left:100%;-webkit-transform:translateX(-100%) translateY(-100%);transform:translateX(-100%) translateY(-100%)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@-webkit-keyframes spinner-4-segment-4{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:100%;left:0;-webkit-transform:translateX(0) translateY(-100%);transform:translateX(0) translateY(-100%)}66.6%{top:100%;left:0;-webkit-transform:translateX(0) translateY(-100%);transform:translateX(0) translateY(-100%)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@keyframes spinner-4-segment-4{0%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}33.3%{top:100%;left:0;-webkit-transform:translateX(0) translateY(-100%);transform:translateX(0) translateY(-100%)}66.6%{top:100%;left:0;-webkit-transform:translateX(0) translateY(-100%);transform:translateX(0) translateY(-100%)}100%{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}}@-webkit-keyframes spinner-4{0%{-webkit-transform:rotate(0);transform:rotate(0)}33.3%{-webkit-transform:rotate(0);transform:rotate(0)}66.6%{-webkit-transform:rotate(180deg);transform:rotate(180deg)}100%{-webkit-transform:rotate(180deg);transform:rotate(180deg)}}@keyframes spinner-4{0%{-webkit-transform:rotate(0);transform:rotate(0)}33.3%{-webkit-transform:rotate(0);transform:rotate(0)}66.6%{-webkit-transform:rotate(180deg);transform:rotate(180deg)}100%{-webkit-transform:rotate(180deg);transform:rotate(180deg)}}.k-loader-spinner-4 .k-loader-canvas{-webkit-animation:spinner-4 1.833s ease infinite;animation:spinner-4 1.833s ease infinite}.k-loader-spinner-4 .k-loader-segment{top:50%;left:50%;-webkit-transform:translateX(-50%) translateY(-50%);-ms-transform:translateX(-50%) translateY(-50%);transform:translateX(-50%) translateY(-50%)}.k-loader-spinner-4 .k-loader-segment:nth-child(1){-webkit-animation:spinner-4-segment-1 1.833s ease infinite;animation:spinner-4-segment-1 1.833s ease infinite}.k-loader-spinner-4 .k-loader-segment:nth-child(2){-webkit-animation:spinner-4-segment-2 1.833s ease infinite;animation:spinner-4-segment-2 1.833s ease infinite}.k-loader-spinner-4 .k-loader-segment:nth-child(3){-webkit-animation:spinner-4-segment-3 1.833s ease infinite;animation:spinner-4-segment-3 1.833s ease infinite}.k-loader-spinner-4 .k-loader-segment:nth-child(4){-webkit-animation:spinner-4-segment-4 1.833s ease infinite;animation:spinner-4-segment-4 1.833s ease infinite}.k-loader-spinner-4.k-loader-sm .k-loader-canvas{width:16px;height:16px}.k-loader-spinner-4.k-loader-md .k-loader-canvas{width:32px;height:32px}.k-loader-spinner-4.k-loader-lg .k-loader-canvas{width:64px;height:64px}.k-loader-container{display:-ms-flexbox;display:flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center;z-index:2001}.k-loader-container .k-loader{padding:0}.k-loader-container,.k-loader-container-overlay{width:100%;height:100%;position:absolute;top:0;right:0;bottom:0;left:0}.k-loader-container-overlay{opacity:.5}.k-loader-container-inner{display:-ms-flexbox;display:flex;-ms-flex-align:center;align-items:center;position:relative;z-index:2}.k-loader-container-panel{border-width:1px;border-style:solid;border-radius:4px}.k-loader-container-sm .k-loader-container-inner{padding:16px;gap:4px}.k-loader-container-sm .k-loader-container-label{font-size:12px}.k-loader-container-md .k-loader-container-inner{padding:20px;gap:8px}.k-loader-container-md .k-loader-container-label{font-size:14px}.k-loader-container-lg .k-loader-container-inner{padding:24px;gap:12px}.k-loader-container-lg .k-loader-container-label{font-size:16px}.k-loader-top .k-loader-container-inner{-ms-flex-direction:column;flex-direction:column;text-align:center}.k-loader-end .k-loader-container-label{-ms-flex-order:-1;order:-1}.k-loader-primary{color:#1274ac}.k-loader-secondary{color:#656565}.k-loader-tertiary{color:#007f84}.k-loader-info{color:#0058e9}.k-loader-success{color:#278200}.k-loader-warning{color:#f5a600}.k-loader-error{color:#d51923}.k-loader-dark{color:#424242}.k-loader-light{color:#757575}.k-loader-inverse{color:#424242}.k-loader-container-panel{background-color:#fff;border-color:rgba(0,0,0,.08)}.k-loader-container-inner .\!k-text-secondary,.k-loader-container-inner .k-text-secondary{color:#656565!important}
        /*.login-register {
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100%;
            width: 100%;
            padding: 10% 0;
            position: fixed;
        }

        .login-box {
            width: 400px;
            margin: 0 auto;
        }

            .login-box .footer {
                width: 100%;
                left: 0px;
                right: 0px;
            }

            .login-box .social {
                display: block;
                margin-bottom: 30px;
            }

        #recoverform {
            display: none;
        }

        .login-sidebar {
            padding: 0px;
            margin-top: 0px;
        }

            .login-sidebar .login-box {
                right: 0px;
                position: absolute;
                height: 100%;
            }

        .spinner {
  margin: 10px auto 0;
  width: 70px;
  text-align: center;
}

.spinner > div {
  width: 18px;
  height: 18px;
  background-color: #03a9f3;

  border-radius: 100%;
  display: inline-block;
  -webkit-animation: sk-bouncedelay 1.4s infinite ease-in-out both;
  animation: sk-bouncedelay 1.4s infinite ease-in-out both;
}

.spinner .bounce1 {
  -webkit-animation-delay: -0.32s;
  animation-delay: -0.32s;
}

.spinner .bounce2 {
  -webkit-animation-delay: -0.16s;
  animation-delay: -0.16s;
}

@-webkit-keyframes sk-bouncedelay {
  0%, 80%, 100% { -webkit-transform: scale(0) }
  40% { -webkit-transform: scale(1.0) }
}

@keyframes sk-bouncedelay {
  0%, 80%, 100% { 
    -webkit-transform: scale(0);
    transform: scale(0);
  } 40% { 
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
  }
}*/
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1" ></asp:ScriptManager>
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <div class="card" style="width: 354px; margin: auto; padding: 10px; margin-top: 50px">
                    <div class="card-body">
                        <h3 class="text-center m-b-20">Sign In</h3>
                        <div class="form-group">
                            <div class="col-xs-12 mb-2">
                                <input class="form-control" type="text" placeholder="Username" name="username" id="UserName" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12  mb-2">
                                <div class="input-group mb-3">
                                    <input class="form-control" type="password" placeholder="Password"
                                    name="password" id="Password" runat="server" />
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('Password', 'EyeIcon')">
                                            <div id="EyeIcon">
                                                <webUI:Eye runat="server" id="Eye" />
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12 mb-2">
                                <div class="d-flex no-block align-items-center">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1" />
                                        <label class="custom-control-label" for="customCheck1">Remember this user ID and password on this computer and automatically log me in the next time I access Clinical Portal</label>
                                    </div>
                                </div>
                                <p><asp:Label ID="lblInfo" CssClass="text-danger" runat="server"></asp:Label></p>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <asp:LinkButton runat="server" ID="btnLogin" OnClick="cmdLogin_Click" CssClass="btn btn-primary w-100 waves-effect">
                                <div class="waviy">
                                    Login
                                    <div style="display: inline-block">
                                        <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" runat="server" >
                                            <ProgressTemplate>
                                                <span style="--i:1">.</span>
                                                <span style="--i:2">.</span>
                                                <span style="--i:3">.</span>
                                                <span style="--i:4">.</span>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="scripts/waves.js"></script>
    <script>

        onEnter(document.getElementById("form1"), document.getElementById("btnLogin"));

        function onEnter(form, button) {
            form.addEventListener("keyup", function (event) {
                // Number 13 is the "Enter" key on the keyboard
                if (event.keyCode === 13) {
                    // Cancel the default action, if needed
                    event.preventDefault();
                    // Trigger the button element with a click
                    button.click();
                }
            });
        }

        function togglePassword(id, eyeID) {
            let x = document.getElementById(id);
            let eye = document.getElementById(eyeID);
            if (x.type === "password") {
                x.type = "text";
                eye.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash" viewBox="0 0 16 16">
  <path d="M13.359 11.238C15.06 9.72 16 8 16 8s-3-5.5-8-5.5a7.028 7.028 0 0 0-2.79.588l.77.771A5.944 5.944 0 0 1 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.134 13.134 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755-.165.165-.337.328-.517.486l.708.709z"/>
  <path d="M11.297 9.176a3.5 3.5 0 0 0-4.474-4.474l.823.823a2.5 2.5 0 0 1 2.829 2.829l.822.822zm-2.943 1.299.822.822a3.5 3.5 0 0 1-4.474-4.474l.823.823a2.5 2.5 0 0 0 2.829 2.829z"/>
  <path d="M3.35 5.47c-.18.16-.353.322-.518.487A13.134 13.134 0 0 0 1.172 8l.195.288c.335.48.83 1.12 1.465 1.755C4.121 11.332 5.881 12.5 8 12.5c.716 0 1.39-.133 2.02-.36l.77.772A7.029 7.029 0 0 1 8 13.5C3 13.5 0 8 0 8s.939-1.721 2.641-3.238l.708.709zm10.296 8.884-12-12 .708-.708 12 12-.708.708z"/>
</svg>`
            } else {
                x.type = "password";
                eye.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
</svg>`
            }
        }
    </script>
</body>
</html>
