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
        CategoryModel categoryModel = new CategoryModel();

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["id-category"]))
            {
                idCategory = Convert.ToInt32(Request.QueryString["id-category"]);
                DataTable category = DAO.Category.GetOneCategory(idCategory);

                categoryModel = Components.ConvertDataTableToCategory(category);

                txtName.Text = categoryModel.Name;
                imgPreview1.ImageUrl = GetThumbnail();

            }

            if (!Page.IsPostBack)
            {
                ddlCategories.DataSource = DAO.Category.GetCategoriesByLevel(0);
                ddlCategories.DataTextField = "Name";
                ddlCategories.DataValueField = "Id";
                ddlCategories.DataBind();

                ddlCategories.SelectedValue = categoryModel.ParentID.ToString();
            }


        }


        protected string GetThumbnail()
        {
            return categoryModel.Thumbnail;
        }


        protected void btnUpdateCategory_Click(object sender, EventArgs e)
        {
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
                //DataTable category = DAO.Category.GetOneCategory(idCategory);
                string oldThumbnail = categoryModel.Thumbnail;
                string[] arrOldThumbnail = oldThumbnail.Split('/');
                Components.DeleteThumbnailOnSystem("Category", arrOldThumbnail, Server);

                // Lưu ảnh mới
                string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                string saveFileName = Components.GetTimestamp() + "_" + Components.ConvertToUnSign(fileName);
                string savePath = Server.MapPath($"~/Publics/Uploads/Category/{saveFileName}");
                categoryModel.Thumbnail = $"{ConfigurationManager.AppSettings["UrlEnv"]}/Publics/Uploads/Category/{saveFileName}";
                file.SaveAs(savePath);
            }

            int n = DAO.Category.UpdateCategory(categoryModel.Id, categoryModel.Name, categoryModel.SeoName, categoryModel.Thumbnail, Convert.ToInt32(ddlCategories.SelectedValue));


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