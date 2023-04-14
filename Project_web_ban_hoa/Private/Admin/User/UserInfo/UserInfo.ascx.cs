using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.User.UserInfo
{
    public partial class UserInfo : System.Web.UI.UserControl
    {

        protected UserModel user = new UserModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                user = (UserModel)Session["CURRENT_USER"];
                txtAddress.Text = user.Address;
                txtFirstName.Text = user.FirstName;
                txtLastName.Text = user.LastName;
                txtEmail.Text = user.Email;
                ddlRoles.DataSource = DAO.Role.GetAllRoles();
                ddlRoles.DataTextField = "Name";
                ddlRoles.DataValueField = "id";
                ddlRoles.DataBind();
                ddlRoles.SelectedValue = user.RoleId.ToString();
            }
        }

        protected string GetAvatar()
        {

            return user.Avatar;
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            user = (UserModel)Session["CURRENT_USER"];
            string thumbnail;
            string script;

            DataTable users = DAO.User.FindById(user.Id);
            if (fulAvatar.HasFile)
            {
                HttpPostedFile file = Request.Files[0];
                if (file.ContentType.ToLower().StartsWith("image/"))
                {
                    //Xóa avatar cũ
                    string oldThumbnail = users.Rows[0]["Avatar"].ToString();
                    string[] arrOldThumbnail = oldThumbnail.Split('/');
                    Components.DeleteThumbnailOnSystem("Users", arrOldThumbnail, Server);


                    //Add avatar mới
                    string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                    string saveFileName = Components.GetTimestamp() + "_" + Components.ConvertToUnSign(fileName);
                    string savePath = Server.MapPath("~/Publics/Uploads/Users/" + saveFileName);
                    thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Users/{saveFileName}";
                    file.SaveAs(savePath);
                }
                else
                {
                    script = "showToast('Hình không hợp lệ', 3000, 'right', 'red')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                    return;
                }
            }
            else
            {
                thumbnail = users.Rows[0]["Avatar"].ToString();
            }

            if (!string.IsNullOrEmpty(txtFirstName.Text))
                user.FirstName = txtFirstName.Text;
            if (!string.IsNullOrEmpty(txtLastName.Text))
                user.LastName = txtLastName.Text;
            if (!string.IsNullOrEmpty(txtEmail.Text))
                user.Email = txtEmail.Text;
            if (!string.IsNullOrEmpty(txtAddress.Text))
                user.Address = txtAddress.Text;
            user.RoleId = Convert.ToInt32(ddlRoles.SelectedValue);
            user.Avatar = thumbnail;
            int n = DAO.User.UpdateUserAdmin(user.Id, user.FirstName, user.LastName, user.Email, user.Address, user.RoleId, user.Avatar);
            if (n > 0)
            {
                script = "showToast('Cập nhật thành công', 3000, 'right', 'green')";
                Session.Remove("CURRENT_USER");
                Session["CURRENT_USER"] = user;
            }
            else
            {
                script = "showToast('Cập nhật thất bại', 3000, 'right', 'red')";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
        }
    }
}