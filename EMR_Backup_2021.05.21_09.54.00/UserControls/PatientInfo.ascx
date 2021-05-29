<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PatientInfo.ascx.cs" Inherits="EMR.UserControls.PatientInfo" %>
<div class="row">
    <div class="col-lg-12" id="accordionExample">
        <div class="card">
            <div class="card-header">
                <h4 class="text-primary">Patient details</h4>
                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapsePatientInfo" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
            </div>
            <div class="card-body collapse show" id="collapsePatientInfo" aria-labelledby="headingPatientInfo">
                <h5 class="box-title">Patient Info</h5>
                <hr style="margin: 8px 0 12px 0;" />
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">First Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblFirstName">John</label>
                        </div>
                    </div>

                    <!--/span-->
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Last Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblLastName"></label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Gender:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblGender"></label>
                        </div>
                    </div>
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblDoB"></label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Contact Person:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblContactPerson"></label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Relationship:</label>

                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblRelationship"></label>
                        </div>
                    </div>

                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-lg-6 d-sm-flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Address:</label>
                        </div>
                        <div class="flex-grow-1">
                            <%--<label class="control-label text-sm-right" id="lblPatientAddress"><%=patient.address_line_l%></label>--%>
                            <label class="control-label text-sm-right" runat="server" id="lblPatientAddress"></label>
                        </div>
                    </div>

                </div>
                <!--/row-->
                <!--/row-->
                <!-- Header: Patient Visit Info -->
                <h5 class="box-title">Visit Info</h5>
                <hr style="margin: 8px 0 12px 0;" />

                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Encounter:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label runat="server" id="lblVisitCode" class="control-label text-sm-right"></label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Admit Date:</label>
                        </div>
                        <div class="flex-grow-1">
                            <label class="control-label text-sm-right" runat="server" id="lblVisitDate"></label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
            </div>
        </div>
    </div>
</div>
