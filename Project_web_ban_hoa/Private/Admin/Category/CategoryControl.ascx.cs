using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Category
{
    public partial class CategoryControl : System.Web.UI.UserControl
    {
        string modulePhu = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul-phu"] != null)
                modulePhu = Request.QueryString["modul-phu"];

            switch (modulePhu)
            {
                case "test":
                    {
                        plCategoryControl.Controls.Add(LoadControl("Test/TestControl.ascx"));
                        break;
                    }
                default:
                    break;
            }
        }
    }
}