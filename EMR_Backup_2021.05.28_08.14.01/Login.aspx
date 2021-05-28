<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Emr_client.Emr.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../styles/default.css" rel="stylesheet" />
    <link href="../styles/style.min.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/login-register-look.css" rel="stylesheet" />
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section id="wrapper">
            <div class="login-register" style="background-image: url(../assets/images/background/login-register.jpg);">
                <div class="login-box card">
                    <div class="card-body">

                        <h3 class="text-center m-b-20">Sign In</h3>
                        <div class="form-group ">
                            <div class="col-xs-12 mb-2">
                                <input class="form-control" type="text" placeholder="Username"
                                    name="username" id="UserName" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12  mb-2">
                                <input class="form-control" type="password" placeholder="Password"
                                    name="password" id="Password" runat="server" />
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
                            <div class="col-xs-12 p-b-20">
                                <button class="btn btn-block btn-lg btn-info btn-rounded" runat="server" id="btnLogin" onserverclick="cmdLogin_Click">
                                    <img
                                        src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA==" />

                                    Login

                                </button>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
