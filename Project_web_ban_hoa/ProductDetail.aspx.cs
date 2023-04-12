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
    public partial class ProductDetail : System.Web.UI.Page
    {
        int productId;

        ProductModel mProduct = new ProductModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["product-id"] != null)
            {
                productId = Convert.ToInt32(Request.QueryString["product-id"]);
                InsertValueToModel(productId);
                string a = GetCurrentPrice().ToString();
            }


        }


        protected string GetNameProduct()
        {
            return mProduct.Name;
        }
        protected string GetSeoNameProduct()
        {
            return mProduct.SeoName;
        }

        protected decimal? GetOldPrice()
        {
            return mProduct.OldPrice;
        }

        protected decimal? GetCurrentPrice()
        {
            return mProduct.CurrentPrice;
        }

        protected string GetDesc()
        {
            return mProduct.Desc;
        }

        protected string GetThumbnail()
        {
            return mProduct.Thumbnail;
        }

        private void InsertValueToModel(int productId)
        {
            DataTable dProducts = DAO.Product.GetOneProductById(productId);
            mProduct.Id = Convert.ToInt32(dProducts.Rows[0]["Id"].ToString());
            mProduct.Name = dProducts.Rows[0]["Name"].ToString();
            mProduct.SeoName = dProducts.Rows[0]["Seo_Name"].ToString();
            mProduct.Thumbnail = dProducts.Rows[0]["Thumbnail"].ToString();
            mProduct.OldPrice = dProducts.Rows[0]["Old_Price"] as decimal?;
            mProduct.CurrentPrice = dProducts.Rows[0]["Current_Price"] as decimal?;
            mProduct.Quantity = dProducts.Rows[0]["Quantity"] as int?;
            mProduct.Sold = dProducts.Rows[0]["Sold"] as int?;
            mProduct.CategoryId = dProducts.Rows[0]["Category_Id"] as int?;
            mProduct.ViewCount = dProducts.Rows[0]["View_Count"] as int?;
            mProduct.Desc = dProducts.Rows[0]["Description"].ToString();
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {

        }
    }
}