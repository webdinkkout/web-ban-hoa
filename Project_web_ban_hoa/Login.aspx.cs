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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ISLOGIN"] != null && Session["CURRENT_USER"] != null)
            {
                Session["showToastDuration"] = 3000;
                Session["showToastPosition"] = "right";
                Session["showToastMessage"] = "Bạn đã đăng nhập rồi";
                Session["showToastBackColor"] = "green";

                Response.Redirect("~/admin.aspx");
            }

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string gmail = txtGmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            DataTable user = DAO.Auth.GetUserbyEmail(gmail);
            if (user.Rows.Count > 0)
            {
                string passwordHashed = user.Rows[0]["Password"].ToString();
                bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(password, passwordHashed);
                if (isPasswordCorrect)
                {
                    Session["ISLOGIN"] = "isLoagined";
                    Session["CURRENT_USER"] = user;
                    Session["CURRENT_USER"] = ConvertSessionToUser("CURRENT_USER");


                    Session["showToastDuration"] = 3000;
                    Session["showToastPosition"] = "right";
                    Session["showToastMessage"] = "Đăng nhập thành công";
                    Session["showToastBackColor"] = "green";
                    Response.Redirect("~/admin.aspx");
                }
                else
                {
                    string script = "showToast('Sai mật khẩu',3000 , 'right' , 'red')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                    txtPassword.Focus();
                }
            }
            else
            {
                string script = "showToast('Sai tên đăng nhập',3000 , 'right' , 'red')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                txtGmail.Focus();
            }
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
                Avatar = row["Avatar"].ToString(),
                Address = row["Address"].ToString(),
                CreatedAt = Convert.ToDateTime(row["Created_At"].ToString()),
                UpdatedAt = Convert.ToDateTime(row["Updated_At"].ToString())
            }).FirstOrDefault();

            return user;
        }
    }
}