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
            string slug = Request.QueryString["slug"];

            if (Session["ISLOGIN"] != null)
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

            DataTable user = Auth.Login(gmail, password);

            if (user.Rows.Count > 0)
            {
                Session["ISLOGIN"] = "isLoagined";
                Session["showToastDuration"] = 3000;
                Session["showToastPosition"] = "right";
                Session["showToastMessage"] = "Đăng nhập thành công";
                Session["showToastBackColor"] = "green";
                Response.Redirect("~/admin.aspx");
            }
            else
            {
                string script = "showToast('Sai tên đăng nhập hoặc mật khẩu',3000 , 'right' , 'red')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
            }

        }
    }
}