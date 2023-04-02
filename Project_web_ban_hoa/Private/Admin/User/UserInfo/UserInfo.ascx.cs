using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.User.UserInfo
{
    public partial class UserInfo : System.Web.UI.UserControl
    {
        string tag = "";
        string userId = "";
        protected UserModel user = new UserModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["t"] != null && Request.QueryString["id"] != null)
            {
                tag = Request.QueryString["t"];
                userId = Request.QueryString["id"];
            }
            if (!Page.IsPostBack)
            {
                user = ConvertSessionToUser("CURRENT_USER");
            }
        }

        private DataTable GetRoles()
        {
            return null;
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
                RoleId = Convert.ToInt32(row["Role_Id"].ToString()),
                CreatedAt = Convert.ToDateTime(row["Created_At"].ToString()),
                UpdatedAt = Convert.ToDateTime(row["Updated_At"].ToString())
            }).FirstOrDefault();

            return user;
        }
    }
}