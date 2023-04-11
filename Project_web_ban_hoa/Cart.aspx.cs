using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Cart : System.Web.UI.Page
    {
        UserModel user = new UserModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ISLOGIN"] == null)
            {
                Session.Add("CURRENT_URL", Request.Url);
                Response.Redirect("~/Login.aspx");
            }
            user = (UserModel)Session["CURRENT_USER"];
            rptCarts.DataSource = DAO.Cart.GetCarts(user.Id);
            rptCarts.DataBind();
        }
    }
}