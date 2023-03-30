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

namespace Project_web_ban_hoa.Private.Admin.Product.Create
{
    public partial class CreateProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable categoriesTable = DAO.Category.GetAllCategories();
                foreach (DataRow categoryRow in categoriesTable.Rows)
                {
                    ListItem listItem = new ListItem
                    {
                        Text = categoryRow["Name"].ToString(),
                        Value = categoryRow["Id"].ToString()
                    };
                    ddlCategory.Items.Add(listItem);
                }
            }
        }

        protected void btnCreateProduct_Click(object sender, EventArgs e)
        {
            string nameProduct = txtName.Text;
            string seoName = Components.ConvertToUnSign(nameProduct).Replace(" ", "-");
            string descProduct = txtDesc.Text;
            double oldPrice = string.IsNullOrEmpty(txtOldPrice.Text) ? 0 : Convert.ToDouble(txtOldPrice.Text);
            double currentPrice = Convert.ToDouble(txtCurrentPrice.Text);
            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            int quantity = Convert.ToInt32(txtQuantiry.Text);
            string thumbnail;

            if (fulThumbnail.HasFile)
            {
                if (fulThumbnail.PostedFile.ContentType.StartsWith("image/"))
                {
                    string fileName = Path.GetFileName(fulThumbnail.FileName).Replace(" ", "-");
                    string saveFileName = Components.ConvertToUnSign(fileName);
                    string savePath = Server.MapPath("~/Publics/Uploads/Product/" + saveFileName);
                    fulThumbnail.SaveAs(savePath);
                    thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Product/{saveFileName}";// https://localhost:113/Publics/Uploads/Product/a-1.jpg
                }
                else
                {
                    string message = "Hình ảnh không hợp lệ";
                    int duration = 3000;
                    string position = "right";
                    string backColor = "red";
                    string script = "showToast('" + message + "', " + duration + ", '" + position + "', '" + backColor + "')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                    return;
                }
            }
            else
            {
                thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Images/DefaultImg/no-image.jpg";
            }

            int n = DAO.Product.CreateProduct(nameProduct, seoName, descProduct, oldPrice, currentPrice, quantity, thumbnail, categoryId);
            if (n > 0)
            {
                Session["showToastMessage"] = "Tạo sản phẩm thành công";
                Session["showToastDuration"] = 3000;
                Session["showToastPosition"] = "right";
                Response.Redirect("~/Admin.aspx?modul=product&sub-modul=view-products");
            }

        }
    }
}