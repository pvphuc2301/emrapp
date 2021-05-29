using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Other
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable("Services");
            DataColumn dtColumn;
            DataRow dtRow;

            // Create OrderId column    
            dtColumn = new DataColumn();
            dtColumn.DataType = typeof(String);
            dtColumn.ColumnName = "service_id";
            dtColumn.AutoIncrement = true;
            dtColumn.Caption = "service_id";
            dtColumn.ReadOnly = true;
            dtColumn.Unique = true;
            dataTable.Columns.Add(dtColumn);

            // Create OrderId column    
            dtColumn = new DataColumn();
            dtColumn.DataType = typeof(String);
            dtColumn.ColumnName = "service_name";
            dtColumn.AutoIncrement = true;
            dtColumn.Caption = "service_name";
            dtColumn.ReadOnly = true;
            dtColumn.Unique = true;
            dataTable.Columns.Add(dtColumn);

            dtRow = dataTable.NewRow();
            dtRow["service_id"] = 1;
            dtRow["service_name"] = 1;

            dataTable.Rows.Add(dtRow);

            gridService.DataSource = dataTable;
            gridService.DataBind();
        }
        private void _BindService()
        {
            //try
            //{
            //    List<BOService> service = dALService.Service.ToList();
            //    if (service.Count > 0 && service != null)
            //    {
            //        gridService.DataSource = service;
            //        gridService.DataBind();
            //    }
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string servicename = ((TextBox)gridService.FooterRow.FindControl("txtService")).Text;
                string filePath = ((FileUpload)gridService.FooterRow.FindControl("fuService")).FileName;
                //bOService.Service_name = servicename;
                //bOService.Service_image = "../images/service/" + filePath;
                //if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
                //{
                //}
                //else
                //{
                //    ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //}
        ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //dALService.SetService(bOService);
                _BindService();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //try
            //{
            //    gridService.EditIndex = e.NewEditIndex;
            _BindService();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

        protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string servicename = ((TextBox)gridService.Rows[e.RowIndex].FindControl("txtService")).Text;
                string filePath = ((FileUpload)gridService.Rows[e.RowIndex].FindControl("fuService")).FileName;
                //bOService.Service_name = servicename;
                //bOService.Service_image = "../images/service/" + filePath;
                //if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
                //{
                //}
                //else
                //{
                //    ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //}
                //dALService.UpdateService(bOService);
                _BindService();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {

        }
    }
}