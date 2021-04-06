<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DischargeSummary.aspx.cs" Inherits="Emr_client.emr.DischargeSummary" %>

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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <h4 class="m-b-0 text-white font-bold">Discharge Summary</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
                            <form action="#" class="form-horizontal form-bordered">
                                <div class="form-body">

                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker2" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker3" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                
                                            </div>
                                            </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">10.	Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Nếu có nêu rõ lý do/ <span class="text-primary">If yes, specify the reason:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox15" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">11.	Xuất viện trái với lời khuyên của bác sĩ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Nếu có nêu rõ lý do/ <span class="text-primary">If yes, specify the reason:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox16" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1 font-bold">12.	Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            Xin xem thông tin chi tiết về kê đơn thuốc trong toa thuốc xuất viện đính kèm /<span class="text-primary">Please see the attached prescription</span>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">13.	Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                            <label class="control-label mb-1">Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Complete</button>
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
                                        <button type="button" class="btn btn-secondary">Revert</button>
                                        <button type="button" class="btn btn-secondary">Delete</button>
                                    </div>
                                    <div id="grid-info" class="alert alert-primary" style="position: fixed; top: 10px; right: 10px; display: none"></div>

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
    <script src="../../scripts/custom.js"></script>
    <script src="../../scripts/myScript.js"></script>

    <script>
        showGridDetail();

        function showGridDetail() {
            document.getElementById("grid-info").style.display = "block";
            getGridDetail();
            window.addEventListener("resize", getGridDetail);
        }

        function getGridDetail() {
            var width = window.innerWidth;
            var range;
            let col;

            if (width < 576) { range = "0-575"; col = "xs"; }
            else if (width < 768) { range = "576-767"; col = "sm"; }
            else if (width < 992) { range = "768-991"; col = "md"; }
            else if (width < 1200) { range = "992-1199"; col = "lg"; }
            else { range = "> 1200"; col = "xl"; }

            document.getElementById("grid-info").innerHTML = "size: " + window.innerWidth + "<br>" + "range: " + range + "<br>" + "grid system: " + " [col-" + col + "]";

        }
    </script>
</body>
</html>