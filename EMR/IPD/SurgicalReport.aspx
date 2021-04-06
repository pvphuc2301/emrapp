<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalReport.aspx.cs" Inherits="Emr_client.emr.SurgicalReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">AIH Hospital</p>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div class="scroll-sidebar h-100 w-100">
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <h4 class="m-b-0 text-white font-bold">Patient details</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne" aria-labelledby="headingOne">
                                <form class="form-horizontal" role="form">
                                    <div class="form-body">
                                        <h4 class="box-title font-bold">Person Info</h4>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">First Name:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> John </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Last Name:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> Doe </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Gender:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> Male </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Date of Birth:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> 11/06/1987 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Contact Person:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Relationship:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Address:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> 19/1 Phan Tây Hồ,P.7, Quận Phú Nhuận, Tp. HCM, Việt Nam </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->
                                        <!--/row-->
                                        <h4 class="box-title font-bold">Visit Details</h4>
                                        <hr class="m-t-0 m-b-40">
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Encounter:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> OPD 8536 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Admit Date:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> 15-05-2019 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <h4 class="m-b-0 text-white font-bold"><a>SURGICAL REPORT</a></h4>
                            </div>
                            <div class="card-body">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">

                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1 font-bold">3. Ngày phẫu thuật/ <span class="text-primary">Procedure Date:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker RenderMode="Classic" Width="218px"  ID="RadDatePicker4" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Giờ bắt đầu/ <span class="text-primary">Procedure Date:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTimePicker RenderMode="Classic" Width="218px"  ID="RadTimePicker2" runat="server"></telerik:RadTimePicker>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Giờ kết thúc/ <span class="text-primary">Finish time:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTimePicker RenderMode="Classic" Width="218px"  ID="RadTimePicker1" runat="server"></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">6. Phương pháp phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">7. Phương pháp vô cảm/ <span class="text-primary">Type of Anesthesia:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">8. Bác sĩ phẫu thuật/ <span class="text-primary">Surgeon:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">9. Phụ mổ/ <span class="text-primary">Assistant surgeon:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">10. Bác sĩ gây mê hồi sức/ <span class="text-primary">Anesthesiologist:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">11. Điều dưỡng gây mê/ <span class="text-primary">Anesthetic nurse:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">12. Điều dưỡng vòng trong/ <span class="text-primary">Scrub nurse:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">13. Điều dưỡng vòng ngoài/ <span class="text-primary">Circulating nurse:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">14. Ước lượng lượng máu mất/ <span class="text-primary">Estimated bloodloss:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">15. Giải phẫu bệnh/ <span class="text-primary">Biopsy pathology:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">16. Biến chứng/ <span class="text-primary">Complications:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <label class="control-label mb-1 font-bold">LƯỢC ĐỒ PHẪU THUẬT<br /><span class="text-primary">PROCEDURECHART</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                -
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <label class="control-label mb-1 font-bold">TƯỜNG TRÌNH PHẪU THUẬT<br /><span class="text-primary">PROCEDURE NARRATIVE</span></label>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                    <!-- End Hospitalisation required -->
                
                                        <div class="form-actions mb-3">
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Complete</button>
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
                                            <button type="button" class="btn btn-secondary">Revert</button>
                                            <button type="button" class="btn btn-secondary">Delete</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->

    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/popper.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
</body>
</html>

