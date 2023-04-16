using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Order
{
    public partial class OrderControl : System.Web.UI.UserControl
    {
        string subModul = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["sub-modul"] != null)
                subModul = Request.QueryString["sub-modul"];


            switch (subModul)
            {
                case "view":
                    {
                        plhOrderControl.Controls.Add(LoadControl("View/ViewOrder.ascx"));
                        break;
                    }
                case "detail":
                    {
                        plhOrderControl.Controls.Add(LoadControl("Detail/DetailOrder.ascx"));
                        break;
                    }
                default:
                    break;
            }
        }
    }
}