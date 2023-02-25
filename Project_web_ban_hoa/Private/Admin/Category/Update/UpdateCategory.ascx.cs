using Project_web_ban_hoa.Models.Component;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Category.Update
{
    public partial class UpdateCategory : System.Web.UI.UserControl
    {
        int idCategory = 0;

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id-category"]))
            {
                idCategory = Convert.ToInt32(Request.QueryString["id-category"]);
                DataTable category = Project_web_ban_hoa.Category.GetOneCategory(idCategory);
                rptUpdateCategory.DataSource = category;
                rptUpdateCategory.DataBind();
            }
        }

        [Obsolete]
        protected void rptUpdateCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "btnUpdate") return;

            if (!(e.Item.FindControl("txtName") is TextBox txtName)) return;

            string name = null;
            string seoName = null;
            string thumbnail = null;
            if (idCategory <= 0) return;

            HttpPostedFile file = Request.Files[0];
            if (!file.ContentType.ToLower().StartsWith("image/")) return;

            // Xóa ảnh cũ
            DataTable category = Project_web_ban_hoa.Category.GetOneCategory(idCategory);
            string oldThumbnail = category.Rows[0]["Thumbnail"].ToString();
            string[] arrOldThumbnail = oldThumbnail.Split('/');
            Components.DeleteThumbnailOnSystem(arrOldThumbnail, Server);

            // Lưu ảnh mới
            string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
            string saveFileName = $"{Guid.NewGuid()}-{Components.ConvertToUnSign(fileName)}";
            string savePath = Server.MapPath($"~/Publics/Uploads/Category/{saveFileName}");
            thumbnail = $"{ConfigurationManager.AppSettings["UrlEnv"]}/Publics/Uploads/Category/{saveFileName}";
            file.SaveAs(savePath);

            // Cập nhật danh mục
            name = txtName.Text;
            seoName = Components.ConvertToUnSign(txtName.Text).Replace(" ", "-");
            int n = Project_web_ban_hoa.Category.UpdateCategory(idCategory, name, seoName, thumbnail);
            if (n <= 0) return;

            Response.Redirect("/admin.aspx?modul=category&sub-modul=view-categories");
        }
    }
}