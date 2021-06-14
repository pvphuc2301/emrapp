using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using Telerik.Web.UI;

namespace EMR.UserControls
{
    public partial class CustomPagination : System.Web.UI.UserControl
    {
        public override string ID { get; set; }
        public string RadGridID { get; set; }
        public dynamic pageInfo { get; set; }
        public string ApiString { get; set; }
        public RadGrid _RadGrid { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            _RadGrid = FindControl(RadGridID) as RadGrid;
            dynamic response = WebHelpers.GetAPI(ApiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                JObject json = JObject.Parse(response.Data);
                string strJSON = "";
                strJSON += json["items"];

                _RadGrid.DataSource = WebHelpers.GetJSONToDataTable(strJSON);

                pageInfo.pageIndex = Int32.Parse(json["pageIndex"].ToString());
                pageInfo.pageSize = Int32.Parse(json["pageSize"].ToString());
                pageInfo.totalRows = Int32.Parse(json["totalRows"].ToString());
                pageInfo.totalPages = Int32.Parse(json["totalPages"].ToString());

                HtmlGenericControl li = new HtmlGenericControl("li");

                li.Attributes.Add("class", pageInfo.pageIndex == 1 ? "page-item disabled" : "page-item");

                HtmlGenericControl anchor = new HtmlGenericControl("a");
                anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", pageInfo.varPID, 1, pageInfo.pageSize, pageInfo.userName));
                anchor.Attributes.Add("class", "page-link");
                anchor.Attributes.Add("href", "javascript:void(0)");

                li.Controls.Add(anchor);

                pagination1.Controls.Add(li);

                for (int i = 0; i < int.Parse(Convert.ToString(pageInfo.totalPages)); i++)
                {
                    li = new HtmlGenericControl("li");
                    li.Attributes.Add("class", pageInfo.pageIndex == (i + 1) ? "page-item active" : "page-item");

                    anchor = new HtmlGenericControl("a");

                    anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", pageInfo.varPID, (i + 1), pageInfo.pageSize, pageInfo.userName));
                    anchor.InnerText = (i + 1).ToString();
                    anchor.Attributes.Add("class", "page-link");
                    anchor.Attributes.Add("href", "javascript:void(0)");

                    li.Controls.Add(anchor);

                    pagination1.Controls.Add(li);
                }

                li = new HtmlGenericControl("li");
                li.Attributes.Add("class", pageInfo.pageIndex == pageInfo.totalPages ? "page-item disabled" : "page-item");

                anchor = new HtmlGenericControl("a");

                anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", pageInfo.varPID, pageInfo.totalPages, pageInfo.pageSize, pageInfo.userName));

                anchor.Attributes.Add("class", "page-link");
                anchor.Attributes.Add("href", "javascript:void(0)");

                li.Controls.Add(anchor);

                pagination1.Controls.Add(li);
            }
        }
    }
}