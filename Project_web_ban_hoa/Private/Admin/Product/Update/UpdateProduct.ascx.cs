using DAO;
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

namespace Project_web_ban_hoa.Private.Admin.Product.Update
{
    public partial class UpdateProduct : System.Web.UI.UserControl
    {
        int productId = 0;
        int categoryId = 0;

        protected ProductModel productModel = new ProductModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pi"] != null)
                productId = Convert.ToInt32(Request.QueryString["pi"]);
            if (Request.QueryString["ci"] != null)
                categoryId = Convert.ToInt32(Request.QueryString["ci"]);

            if (!Page.IsPostBack)
            {

                productModel = Components.ConvertDataTableToProduct(DAO.Product.GetOneProductById(productId));
                txtName.Text = productModel.Name;
                txtSold.Text = productModel.Sold.ToString();
                txtDesc.Text = productModel.Desc;
                txtOldPrice.Text = productModel.OldPrice.ToString().Replace(",00", "");
                txtCurrentPrice.Text = productModel.CurrentPrice.ToString().Replace(",00", "");
                txtQuantity.Text = productModel.Quantity.ToString().Replace(",00", "");


                ddlCategories.DataSource = DAO.Category.GetAllCategories();
                ddlCategories.DataTextField = "Name";
                ddlCategories.DataValueField = "Id";
                ddlCategories.DataBind();
                ddlCategories.SelectedValue = categoryId.ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin.aspx?modul=product&sub-modul=view-products");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string thumbnail;
            string script;
            DataTable product = DAO.Product.GetOneProductById(productId);

            if (fulThumbnail.HasFile)
            {
                HttpPostedFile file = Request.Files[0];
                if (file.ContentType.ToLower().StartsWith("image/"))
                {
                    //Xóa avatar cũ
                    string oldThumbnail = product.Rows[0]["Thumbnail"].ToString();
                    string[] arrOldThumbnail = oldThumbnail.Split('/');
                    Components.DeleteThumbnailOnSystem("Product", arrOldThumbnail, Server);


                    //Add avatar mới
                    string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                    string saveFileName = Components.ConvertToUnSign(fileName);
                    string savePath = Server.MapPath("~/Publics/Uploads/Product/" + saveFileName);
                    thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Product/{saveFileName}";
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
                thumbnail = product.Rows[0]["Thumbnail"].ToString();
            }


            if (!string.IsNullOrEmpty(txtName.Text))
                productModel.Name = txtName.Text;
            productModel.SeoName = Components.ConvertToUnSign(txtName.Text).Replace(" ", "-");
            if (!string.IsNullOrEmpty(txtSold.Text))
                productModel.Sold = Convert.ToInt32(txtSold.Text);
            if (!string.IsNullOrEmpty(txtDesc.Text))
                productModel.Desc = txtDesc.Text;
            if (!string.IsNullOrEmpty(txtOldPrice.Text))
                productModel.OldPrice = Convert.ToDecimal(txtOldPrice.Text);
            if (!string.IsNullOrEmpty(txtCurrentPrice.Text))
                productModel.CurrentPrice = Convert.ToDecimal(txtCurrentPrice.Text);
            if (!string.IsNullOrEmpty(txtQuantity.Text))
                productModel.Quantity = Convert.ToInt32(txtQuantity.Text);
            productModel.CategoryId = Convert.ToInt32(ddlCategories.SelectedValue);
            productModel.Thumbnail = thumbnail;

            int n = DAO.Product.UpdateProduct(productId, productModel.Name, productModel.SeoName, productModel.Desc, productModel.ViewCount, productModel.OldPrice, productModel.CurrentPrice, productModel.Quantity, productModel.Sold, productModel.Thumbnail, productModel.CategoryId);
            if (n > 0)
            {
                script = "showToast('Cập nhật thành công', 3000, 'right', 'green')";
            }
            else
            {
                script = "showToast('Cập nhật thất bại', 3000, 'right', 'red')";
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowToast", script, true);

        }
    }
}