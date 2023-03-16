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
                    ListItem listItem = new ListItem();
                    listItem.Text = categoryRow["Name"].ToString();
                    listItem.Value = categoryRow["Id"].ToString();
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
            HttpPostedFile file = Request.Files[0];
            if (file.ContentType.ToLower().StartsWith("image/"))
            {
                string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                string saveFileName = Guid.NewGuid().ToString() + "-" + Components.ConvertToUnSign(fileName);
                string savePath = Server.MapPath("~/Publics/Uploads/Category/" + saveFileName);
                string thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Category/{saveFileName}";
                int n = DAO.Product.CreateProduct(nameProduct, seoName, descProduct, oldPrice, currentPrice, quantity, thumbnail, categoryId);
                if (n > 0)
                {
                    file.SaveAs(savePath);
                    Session["showToastMessage"] = "Tạo sản phẩm thành công";
                    Session["showToastDuration"] = 3000;
                    Session["showToastPosition"] = "right";
                    Response.Redirect("~/Admin.aspx?modul=product&sub-modul=view-products");
                }
            }
            else
            {

            }




        }
    }
}