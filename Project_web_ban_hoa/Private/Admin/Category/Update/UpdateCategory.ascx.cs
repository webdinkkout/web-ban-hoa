using Project_web_ban_hoa.Models;
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
                DataTable category = DAO.Category.GetOneCategory(idCategory);
                rptUpdateCategory.DataSource = category;
                rptUpdateCategory.DataBind();
            }
        }

        [Obsolete]
        protected void rptUpdateCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            CategoryModel categoryModel = new CategoryModel();
            if (e.CommandName != "btnUpdate") return;
            if (!(e.Item.FindControl("txtName") is TextBox txtName)) return;
            if (idCategory <= 0) return;

            HttpPostedFile file = Request.Files[0];
            if (!string.IsNullOrEmpty(txtName.Text))
            {
                categoryModel.Name = txtName.Text;
                categoryModel.SeoName = Components.ConvertToUnSign(txtName.Text).Replace(" ", "-");
            }

            if (file.ContentType.ToLower().StartsWith("image/"))
            {
                // Xóa ảnh cũ
                DataTable category = DAO.Category.GetOneCategory(idCategory);
                string oldThumbnail = category.Rows[0]["Thumbnail"].ToString();
                string[] arrOldThumbnail = oldThumbnail.Split('/');
                Components.DeleteThumbnailOnSystem("Category", arrOldThumbnail, Server);

                // Lưu ảnh mới
                string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                string saveFileName = Components.GetTimestamp() + "_" + Components.ConvertToUnSign(fileName);
                string savePath = Server.MapPath($"~/Publics/Uploads/Category/{saveFileName}");
                categoryModel.Thumbnail = $"{ConfigurationManager.AppSettings["UrlEnv"]}/Publics/Uploads/Category/{saveFileName}";
                file.SaveAs(savePath);
            }

            int n = DAO.Category.UpdateCategory(idCategory, categoryModel.Name, categoryModel.SeoName, categoryModel.Thumbnail);

            Session["showToastDuration"] = 3000;
            Session["showToastPosition"] = "right";

            if (n <= 0)
            {
                Session["showToastMessage"] = "Chỉnh sửa danh mục thất bại";
                Session["showToastBackColor"] = "red";
            }
            else
            {
                Session["showToastMessage"] = "Chỉnh sửa danh mục thành công";
            }

            Response.Redirect("/admin.aspx");
        }
    }
}