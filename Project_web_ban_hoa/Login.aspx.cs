using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;
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
            if (Request.QueryString["url"] != null)
            {
                Session["CURRENT_URL"] = Request.QueryString["url"];
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
                    Session["CURRENT_USER"] = Components.ConvertDataTableToUser(user);


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
    }
}