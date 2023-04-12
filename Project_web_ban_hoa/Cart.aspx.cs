using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Cart : System.Web.UI.Page
    {
        UserModel user = new UserModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ISLOGIN"] == null)
            {
                Session.Add("CURRENT_URL", Request.Url);
                Response.Redirect("~/Login.aspx");
            }
            user = (UserModel)Session["CURRENT_USER"];
            if (!Page.IsPostBack)
            {
                rptCarts.DataSource = DAO.Cart.GetCarts(user.Id);
                rptCarts.DataBind();
            }
        }

        private ProductModel InsertValueToModel(int productId)
        {
            ProductModel mProduct = new ProductModel();
            DataTable dProducts = DAO.Product.GetOneProductById(productId);
            mProduct.Id = Convert.ToInt32(dProducts.Rows[0]["Id"].ToString());
            mProduct.Name = dProducts.Rows[0]["Name"].ToString();
            mProduct.SeoName = dProducts.Rows[0]["Seo_Name"].ToString();
            mProduct.Thumbnail = dProducts.Rows[0]["Thumbnail"].ToString();
            mProduct.OldPrice = dProducts.Rows[0]["Old_Price"] as decimal?;
            mProduct.CurrentPrice = Convert.ToDecimal(dProducts.Rows[0]["Current_Price"]);
            mProduct.Quantity = dProducts.Rows[0]["Quantity"] as int?;
            mProduct.Sold = dProducts.Rows[0]["Sold"] as int?;
            mProduct.CategoryId = dProducts.Rows[0]["Category_Id"] as int?;
            mProduct.ViewCount = dProducts.Rows[0]["View_Count"] as int?;
            mProduct.Desc = dProducts.Rows[0]["Description"].ToString();
            return mProduct;
        }

        protected void rptCarts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "increaseQuantity":
                    {
                        ProductModel product = InsertValueToModel(Convert.ToInt32(e.CommandArgument));

                        int n = DAO.Cart.AddCart(user.Id, product.Id, product.Name, product.CurrentPrice);
                        if (n > 0)
                        {
                            Response.Redirect("~/cart.aspx");
                        }
                        else
                        {

                        }
                        break;
                    }
                case "decreaseQuantity":
                    {
                        break;
                    }
                default:
                    break;
            }
        }
    }
}