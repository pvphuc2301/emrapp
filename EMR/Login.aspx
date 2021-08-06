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
    <style>
        .login-register {
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
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1" ></asp:ScriptManager>
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
            <section id="wrapper">
                <div class="login-register">
                    <div class="login-box card" style="width: 354px;">
                        <div class="card-body">

                            <h3 class="text-center m-b-20">Sign In</h3>
                            <div class="form-group ">
                                <div class="col-xs-12 mb-2">
                                    <input class="form-control" type="text" placeholder="Username"
                                        name="username" id="UserName" runat="server"/>
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
                                <asp:LinkButton runat="server" ID="btnLogin" OnClick="cmdLogin_Click" CssClass="btn btn-primary w-100 waves-effect">Login</asp:LinkButton>
                                <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" runat="server" >
                                    <ProgressTemplate>
                                        <div class="spinner">
                                            <div class="bounce1"></div>
                                            <div class="bounce2"></div>
                                            <div class="bounce3"></div>
                                        </div>
                                        <div>Loading...</div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="scripts/waves.js"></script>
    <script>

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
