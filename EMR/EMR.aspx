<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EMR.aspx.cs" Inherits="EMR.EMR" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f6f6fa;
        }

        #close-sidebar:hover > i {
            color: #777598;
        }

        #RAD_SPLITTER_PANE_CONTENT_TopPane {
            height: 100%;
        }
    </style>
</head>
<body class="skin-default fixed-layout">
    <form id="form2" runat="server">
        <telerik:RadScriptManager runat="server"></telerik:RadScriptManager>
        <%--<div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">AIH Hospital</p>
            </div>
        </div>--%>
        <asp:HiddenField ID="ValueHiddenField" runat="server" />
        <asp:LinkButton id="preLoadPage" OnClick="LoadInfomation" runat="server"></asp:LinkButton>

        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->

                    <ul class="navbar-nav d-none d-lg-flex" style="background-color: #edf1f5; padding-left: 24px;">
                        <!-- This is  -->
                        <li class="nav-item"><a class="nav-link"><strong class="font-bold"><%= patient.Name %> (<%= patient.Title %>)</strong>, <small>DOB</small> <%= patient.DOB %> (<%= patient.Age %> y) <small>Sex</small> <%= patient.Gender %> <small>PID</small> <%= patient.PID %></a></li>
                        <li class="nav-item ml-2"><a class="nav-link color-secondary" href="javascript:void(0)" onclick="closePID();"><i class="fa fa-times"></i></a></li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                    </ul>

                    <ul class="navbar-nav pl-5 d-lg-none">
                        <!-- This is  -->
                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-left animated flipInY" aria-labelledby="btnGroupDrop1" style="width: 253px;">
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong class="font-bold"><%= patient.Name %> (<%= patient.Title %>)</strong></h5>
                                        <p class="card-text">
                                            DOB: <%= patient.DOB %> (<%= patient.Age %>y)<br />
                                            Sex: <%= patient.Gender %><br />
                                            PID: <%= patient.PID %>
                                        </p>
                                        <a href="javascript:void(0)" onclick="closePID();" class="btn btn-primary">Close</a>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                    </ul>

                    <ul class="navbar-nav my-lg-0 ml-auto">
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)"><i class="fa fa-home"></i></a>
                        </li>

                        <li class="nav-item dropdown u-pro mr-3">
                            <a class="nav-link btn-link pl-0 pr-0" href="javascript:void(0)" style="position: relative; padding-bottom: 8px">
                                <i class="fa fa-bell waves-effect waves-primary" style="padding: .5rem 1rem; line-height: 35px; box-sizing: border-box; margin-top: -13px; margin-bottom: -7px;"></i>
                                <span style="z-index: 100; position: absolute; top: 4px; left: 25px; border: 2px solid #fff;" class="badge badge-pill badge-danger notification">3</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown u-pro">

                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-none d-lg-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user"></i>
                                <span class="">Phan Van Phut</span>

                                <span class="hidden-md-down">&nbsp;<i class="fa fa-angle-down"></i></span>
                            </a>

                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user"></i>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1" style="width: 253px;">
                                <!-- <div class="dropdown-header">Phan Van Phut</div> -->
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-user mr-2"></i>User Settings</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-question mr-2"></i>Help</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="javascript:void(0)">Tiếng Việt</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="./Login.aspx">LOGOUT</a>
                                <div class="text-center">
                                    <img width="150" src="../images/AIH_PI_FULL.png" alt="homepage" class="dark-logo" />
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="page-wrapper1 chiller-theme">
            <main class="page-content" style="width: 100%; height: 100%; overflow: hidden">
                <a id="show-sidebar" class="btn btn-sm btn-sidebar" href="javascript:void(0)">
                    <i class="fas fa-bars"></i>
                </a>

                <nav id="sidebar" class="sidebar-wrapper">
                    <div class="scroll-sidebar">
                        <div class="sidebar-content">
                            <div class="sidebar-brand">
                                <div id="close-sidebar">
                                    <i class="fas fa-times"></i>
                                </div>
                            </div>

                            <div class="sidebar-menu">
                                <ul>
                                    <li class="header-menu">
                                        <span>General</span>
                                    </li>
                                    <li class="sidebar-dropdown">
                                        <a href="#" class="sidebar-dropdown-toggle">
                                            <i class="fa fa-tachometer-alt"></i>
                                            <span>Dashboard</span>

                                        </a>
                                        <div class="sidebar-submenu">
                                            <ul>
                                                <li>
                                                    <a href="#">Dashboard 1
                   
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">Dashboard 2</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header-menu">
                                        <span>Extra</span>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-book"></i>
                                            <span>Documentation</span>

                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- sidebar-menu  -->
                    </div>
                </nav>

                <div class="scroll-sidebar h-100 w-100" style="border-left: 2px solid #E8E9F0;">
                    <telerik:RadSplitter runat="server" ID="RadSplitter1" CssClass="border-top border-default" LiveResize="true" ResizeWithParentPane="false" SplitBarsSize="2" RenderMode="Mobile" ResizeMode="Proportional" Orientation="Vertical" Width="100%" Height="100%">
                            <telerik:RadPane runat="server" ID="TopPane" Scrolling="Both" Width="220">
                                <!-- Sidebar scroll-->
                                <div class="scroll-sidebar w-100">
                                    <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                                        <div class="sidebar-menu">
                                            <ul class="text-nowrap">
                                                <%--<li class="header-menu">
                                            <span>General</span>
                                        </li>--%>
                                                <li>
                                                    <a href="javascript:void(0)" onclick="loadForm('PatientSummary.aspx')">
                                                        <span>Patient Summary</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)" class="waves-effect" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                                                        <span>Add New Document</span>
                                                    </a>

                                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title" id="exampleModalLabel1">Add New Document</h4>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form>
                                                                        <div class="form-group">
                                                                            <!-- Nav tabs -->
                                                                            <ul class="nav nav-tabs" role="tablist">
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link active" data-toggle="tab" href="#home" role="tab">
                                                                                        <span class="hidden-sm-up"><i class="ti-home"></i></span><span class="hidden-xs-down">OPD</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" data-toggle="tab" href="#profile" role="tab">
                                                                                        <span class="hidden-sm-up"><i class="ti-user"></i></span><span class="hidden-xs-down">IPD</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" data-toggle="tab" href="#messages" role="tab">
                                                                                        <span class="hidden-sm-up"><i class="ti-email"></i></span><span class="hidden-xs-down">ERO</span>
                                                                                    </a>
                                                                                </li>
                                                                            </ul>
                                                                            <!-- Tab panes -->
                                                                            <div class="tab-content tabcontent-border">
                                                                                <div class="tab-pane active" id="home" role="tabpanel">
                                                                                    <div class="p-20">
                                                                                        <select class="form-control custom-select">
                                                                                            <option value="">Outpatient Initial Nursing Assessment </option>
                                                                                            <option value="">Outpatient Medical Record</option>
                                                                                            <option value="">Medical Certificate</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="tab-pane" id="profile" role="tabpanel">
                                                                                    <div class="p-20">
                                                                                        <select class="form-control custom-select">
                                                                                            <option value="">Inpatient Initial Medical Assessment </option>
                                                                                            <option value="">Inpatient Initial Nursing Assessment </option>
                                                                                            <option value="">Discharge Summary</option>
                                                                                            <option value="">Discharge Certificate</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="tab-pane" id="messages" role="tabpanel">
                                                                                    <div class="p-20">
                                                                                        <select class="form-control custom-select">
                                                                                            <option value="">Emergency Medical Record</option>
                                                                                            <option value="">Emergency Triage And Nursing Assessment Record </option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                    <button type="button" class="btn btn-primary">Create</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <ul id="docList">
                                                    </ul>
                                                </li>


                                                <li class="header-menu">
                                                    <span>OPD</span>
                                                </li>
                                                <li class="sidebar-dropdown">
                                                    <a class="sidebar-dropdown-toggle" href="javascript:void(0)" style="overflow: hidden; width: max-content;">List Forms
                                                <span class="badge badge-pill badge-secondary">8</span>
                                                    </a>
                                                    <ul class="sidebar-submenu sidebar-submenu-test" style="margin-bottom: 40px;">

                                                        <li class="submenu-item pl-0">
                                                            <a href="#" onclick="loadForm('OPD/OutPatIniNurAss.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">1. Outpatient Initial Nursing Assessment<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('OPD/OutpatientMedicalRecord.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">2. Outpatient Medical Record<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('OPD/OutPatMedRecPed.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">3. Pediatric Outpatient Medical Record<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('OPD/MedicalCertificate.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">4. Medical Certificate<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('OPD/UsUriSysReport.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">16. US URINARY SYSTEM REPORT<span class="badge badge-pill badge-secondary">Trãi</span>
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </li>

                                                <li class="header-menu">
                                                    <span>IPD</span>
                                                </li>
                                                <li class="sidebar-dropdown">
                                                    <a class="sidebar-dropdown-toggle" href="javascript:void(0)" style="overflow: hidden; width: max-content;">List Forms
                                                <span class="badge badge-pill badge-secondary">8</span>
                                                    </a>
                                                    <ul class="sidebar-submenu sidebar-submenu-test" style="margin-bottom: 40px;">

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/DischargeSummary.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">5. Discharge Summary<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/DisCer.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">8. Discharge Certificate<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('MedicalRecordForNeonatalVaccinationOnemonth.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">9. Medical Record For Neonatal Vaccination One Month<span class="badge badge-pill badge-secondary">Trãi</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/ObsGynIniAss.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">10. Obstetric & Gynecological Initial Assessment<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/ObsAtDeliRoom.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">11. Obstetric Observation At Delivery Room<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/SurgicalReport.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">12. Surgical Report<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/InpIniMedAss.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">13. Inpatient Initial Medical Assessment<span class="badge badge-pill badge-secondary">Trãi</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/InpIniNurAss.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">14. Inpatient Initial Nursing Assessment<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/IniMedAssForNeoInp.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">15. Initial Medical Assessment For Neonatal Inpatient<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/SurgicalCertificate.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">17. Surgical Certificate<span class="badge badge-pill badge-secondary">Trãi</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/SummaryOfMedRec.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">18. Summary Of Medical Report<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('IPD/SumOfComOutpCase.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">19. Summary Of Complex Outpatient Cases<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('MedicalRecordForNeonatalVaccination.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">20. Medical Record For Neonatal Vaccination<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>

                                                <li class="header-menu">
                                                    <span>ER</span>
                                                </li>
                                                <li class="sidebar-dropdown">
                                                    <a class="sidebar-dropdown-toggle" href="javascript:void(0)" style="overflow: hidden; width: max-content;">List Forms
                                                <span class="badge badge-pill badge-secondary">8</span>
                                                    </a>
                                                    <ul class="sidebar-submenu sidebar-submenu-test" style="margin-bottom: 40px;">

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('ER/EmergencyMedicalAssessment.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">6. Emergency Medical Assessment<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                        <li class="submenu-item ml-0 pl-0">
                                                            <a href="#" onclick="loadForm('ER/EmerTriaAndNurAssRec.aspx')" data-toggle="popover" data-html="true" data-trigger="hover" style="overflow: hidden; width: max-content;">7. Emergency Triage & Nursing Assessment Record<span class="badge badge-pill badge-secondary">Ken</span>
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>

                            </telerik:RadPane>
                            <telerik:RadSplitBar CollapseMode="none" Visible="true" runat="server" ID="RadSplitBar1" ResizeStep="3" />
                            <telerik:RadPane runat="server" Visible="true" ShowContentDuringLoad="true" ID="MiddlePane">
                                <div style="height: inherit; width: inherit">
                                    <iframe id="iframeForm" style="height: 100%; border: 0" src="Other/PatientSummary.aspx"></iframe>
                                </div>
                            </telerik:RadPane>
                        </telerik:RadSplitter>
                </div>
            </main>
        </div>

    </form>
    
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/popper.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../scripts/custom.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/emrScript.js"></script>

    <script type="text/javascript">
        let iframe = document.getElementById("iframeForm");
        let temp = document.getElementById("ValueHiddenField");
        temp.value = localStorage.getItem('pid');

        function loadForm(formName) {
            iframe.src = formName;
        }

      //  if (!"<%= this.pid %>") { document.getElementById("preLoadPage").click(); }

        let pid = localStorage.getItem('pid');
        let docList = document.getElementById("docList");

        loadDocumentList(docList, pid, function () {

            $(".sidebar-submenu > li > a").click(function () {
                //?
                // required completed render
                // waiting load data complete

                let temp = document.getElementsByClassName("sidebar-dropdown active")[0].getElementsByClassName("sidebar-submenu")[0].getElementsByClassName("submenu-item");

                for (let i = 0; i < temp.length; i++) {
                    temp[i].classList.remove("active");
                }

                if ($(this).parent().hasClass("active")) {
                    $(this).parent().removeClass("active");
                } else {
                    $(this).parent().addClass("active");
                }
            });

            $(".sidebar-dropdown > .sidebar-dropdown-toggle").click(function () {
                console.log($(this));
                $(".sidebar-submenu").slideUp(200);
                if (
                    $(this)
                        .parent()
                        .hasClass("active")
                ) {
                    console.log($(".sidebar-dropdown"));
                    $(".sidebar-dropdown").removeClass("active");
                    $(this)
                        .parent()
                        .removeClass("active");
                } else {
                    $(".sidebar-dropdown").removeClass("active");
                    $(this)
                        .next(".sidebar-submenu")
                        .slideDown(200);
                    $(this)
                        .parent()
                        .addClass("active");
                }
            });

            $("#close-sidebar").click(function () {
                $(".page-wrapper1").removeClass("toggled-fixed");

            });

            $("#show-sidebar").click(function () {
                $(".page-wrapper1").addClass("toggled-fixed");
            });
        });

    </script>

</body>
</html>
