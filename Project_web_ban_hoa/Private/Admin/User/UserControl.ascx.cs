using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.User
{
    public partial class UserControl : System.Web.UI.UserControl
    {
        string tag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["t"] != null)
                tag = Request.QueryString["t"];
            ChoicePage(tag);
        }

        private void ChoicePage(string tag)
        {
            switch (tag)
            {
                case "user-info":
                    {
                        plhUser.Controls.Add(LoadControl("UserInfo/UserInfo.ascx"));
                        break;
                    }
                case "view":
                    {
                        plhUser.Controls.Add(LoadControl("View/ViewUser.ascx"));
                        break;
                    }
                default:
                    break;
            }
        }
    }
}