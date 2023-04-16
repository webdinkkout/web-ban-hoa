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


                        int n = DAO.Cart.AddCart(user.Id, product.Id, product.CurrentPrice);
                        if (n > 0)
                        {
                            Response.Redirect("~/cart.aspx");
                        }
                        break;
                    }
                case "decreaseQuantity":
                    {
                        ProductModel product = InsertValueToModel(Convert.ToInt32(e.CommandArgument));
                        int n = DAO.Cart.RemoveCountProduct(user.Id, product.Id);
                        if (n > 0)
                        {
                            Response.Redirect("~/cart.aspx");
                        }
                        break;
                    }
                case "deleteProduct":
                    {
                        ProductModel product = InsertValueToModel(Convert.ToInt32(e.CommandArgument));
                        int n = DAO.Cart.DeleteProductOnCart(user.Id, product.Id);
                        if (n > 0)
                        {
                            Response.Redirect("~/cart.aspx");
                        }
                        break;
                    }
                default:
                    break;
            }



        }

        protected double GetToTalPrice()
        {
            DataTable t = DAO.Cart.GetCarts(user.Id);
            double totalPrice = 0;
            for (int i = 0; i < t.Rows.Count; i++)
            {
                totalPrice += Convert.ToDouble(t.Rows[i]["Total_Price"]);
            }

            return totalPrice;
        }

        protected double GetVAT()
        {
            return GetToTalPrice() * 0.1;
        }

        protected double GetUtilPrice()
        {
            return GetToTalPrice() + GetVAT();
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            string script;
            int n = DAO.Cart.CheckCart(user.Id);
            if (n > 0)
            {
                script = $"showToast('Thanh toán thành công hàng sẽ gửi đến địa chỉ \"{user.Address}\" trong 3 ngày', 5000, 'right', 'green')";
            }
            else
            {
                script = "showToast('Thanh toán thất bại', 5000, 'right', 'red')";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
            rptCarts.DataSource = DAO.Cart.GetCarts(user.Id);
            rptCarts.DataBind();
        }
    }
}