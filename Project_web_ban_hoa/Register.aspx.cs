using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;
using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;

namespace Project_web_ban_hoa
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtGmail.Text;
            string password = txtPassword.Text;
            string address = txtAddress.Text;

            string salt = BCrypt.Net.BCrypt.GenerateSalt();
            string hashedPasswrod = BCrypt.Net.BCrypt.HashPassword(password, salt);

            int n = DAO.Auth.Register(firstName, lastName, address, email, hashedPasswrod);
            if (n > 0)
            {
                DataTable user = DAO.Auth.GetUserbyEmail(email);
                Session["ISLOGIN"] = "isLoagined";
                Session["CURRENT_USER"] = Components.ConvertDataTableToUser(user);
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}