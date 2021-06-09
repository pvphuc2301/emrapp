using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Other
{
    public partial class PageNotFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dynamic response = (dynamic)Session["PageNotFound"];
            lbl_Status.Text = Convert.ToString(response.Status);
            lbl_Data.Text = Convert.ToString(response.Data);

            if (WebHelpers.IsPropertyExist(response, "Details")) {
                foreach(PropertyInfo prop in response.Details.GetType().GetProperties())
                {
                    var type = Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType;
                    if (type == typeof(string))
                    {
                        //lbl_details.Text += prop.GetValue(type.Name, null);
                    }
                }
            }

            
            //gridView1.DataSource = response.Details;
        }
    }
}