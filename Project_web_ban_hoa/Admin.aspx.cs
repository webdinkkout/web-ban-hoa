using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Admin : System.Web.UI.Page
    {
        protected UserModel user;
        protected string fullName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ISLOGIN"] == null && Session["CURRENT_USER"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                user = (UserModel)Session["CURRENT_USER"];

                fullName = user.FirstName + " " + user.LastName;

                if (user.RoleId != 1)
                {
                    if (Session["CURRENT_URL"] != null)
                    {
                        string url = Session["CURRENT_URL"].ToString();
                        Session.Remove("CURRENT_URL");
                        Response.Redirect(url);
                    }
                }
                else if (user.RoleId == 1)
                {
                    if (string.IsNullOrEmpty(Request.QueryString["modul"]))
                    {
                        Response.Redirect("~/Admin.aspx?modul=category");
                    }
                }
            }

            if (string.IsNullOrEmpty(Request.QueryString["modul"]))
            {
                Response.Redirect("~/Admin.aspx?modul=category");
            }
        }

        protected string GetAvatar()
        {
            return user.Avatar.Length > 0 ? user.Avatar : "Publics/Images/Admin/user-icon.png";
        }


        protected void hplLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("ISLOGIN");
            Session.Remove("CURRENT_USER");
            Response.Redirect("~/Home.aspx");
        }


    }
}