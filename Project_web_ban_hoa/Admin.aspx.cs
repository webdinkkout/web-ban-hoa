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
                user = ((DataTable)Session["CURRENT_USER"]).AsEnumerable().Select(row => new UserModel
                {
                    Id = Convert.ToInt32(row["Id"].ToString()),
                    FirstName = row["First_Name"].ToString(),
                    LastName = row["Last_Name"].ToString(),
                    Email = row["Email"].ToString(),
                    Password = row["Password"].ToString(),
                    RoleId = Convert.ToInt32(row["Role_Id"].ToString()),
                    CreatedAt = Convert.ToDateTime(row["Created_At"].ToString()),
                    UpdatedAt = Convert.ToDateTime(row["Updated_At"].ToString())
                }).FirstOrDefault();

                fullName = user.FirstName + " " + user.LastName;

                if (user.RoleId != 1)
                {
                    if (Session["CURRENT_URL"] != null)
                    {
                        Response.Redirect(Session["CURRENT_URL"].ToString());
                    }
                    Response.Redirect("~/Home.aspx");
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



        protected void hplLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("ISLOGIN");
            Session.Remove("CURRENT_USER");
            Response.Redirect("~/Home.aspx");
        }
    }
}