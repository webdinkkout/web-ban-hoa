using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Layout
{
    public partial class Main : System.Web.UI.MasterPage
    {
        UserModel user = new UserModel();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ISLOGIN"] != null && Session["CURRENT_USER"] != null)
            {
                user = ConvertSessionToUser("CURRENT_USER");

                imbAvatar.ImageUrl = IsAvatar() ? GetAvatar() : "../Publics/Images/Home/img-header/icon-user.png";
                imbAvatar.AlternateText = GetFullName();

            }

        }

        protected string GetFullName()
        {
            return user.FirstName + " " + user.LastName;
        }

        protected bool IsAvatar()
        {
            return user.Avatar.Length > 0;
        }
        protected string GetAvatar()
        {
            return user.Avatar;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Add("CURRENT_URL", Request.Url);
            Response.Redirect("~/Login.aspx");
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("ISLOGIN");
            Session.Remove("CURRENT_USER");
            Response.Redirect("~/Home.aspx");
        }

        private UserModel ConvertSessionToUser(string sessionStr)
        {
            UserModel user = ((DataTable)Session[sessionStr]).AsEnumerable().Select(row => new UserModel
            {
                Id = Convert.ToInt32(row["Id"].ToString()),
                FirstName = row["First_Name"].ToString(),
                LastName = row["Last_Name"].ToString(),
                Email = row["Email"].ToString(),
                Password = row["Password"].ToString(),
                Avatar = row["Avatar"].ToString(),
                RoleId = Convert.ToInt32(row["Role_Id"].ToString()),
                CreatedAt = Convert.ToDateTime(row["Created_At"].ToString()),
                UpdatedAt = Convert.ToDateTime(row["Updated_At"].ToString())
            }).FirstOrDefault();

            return user;
        }
    }
}