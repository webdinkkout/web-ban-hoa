using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin
{
    public partial class AdminControl : System.Web.UI.UserControl
    {
        string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];

            switch (modul)
            {
                case "category":
                    {
                        plAdminControl.Controls.Add(LoadControl("Category/CategoryControl.ascx"));
                        break;
                    }
                default:
                    break;
            }
        }
    }
}