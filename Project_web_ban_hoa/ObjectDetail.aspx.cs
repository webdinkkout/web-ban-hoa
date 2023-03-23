using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_web_ban_hoa.Models;


namespace Project_web_ban_hoa
{
    public partial class ObjectDetail : System.Web.UI.Page
    {
        private string seoName;

        protected ProductModel productModel = new ProductModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["sn"]))
                seoName = Request.QueryString["sn"];

            DataTable products = DAO.Product.GetOneProductBySeoName(seoName);


            foreach (DataRow product in products.Rows)
            {
                productModel.Thumbnail = product["Thumbnail"].ToString();
                productModel.Name = product["Name"].ToString();
                productModel.Desc = product["Description"].ToString();
                productModel.OldPrice = Convert.ToDouble(product["Old_Price"]);
                productModel.CurrentPrice = Convert.ToDouble(product["Current_Price"]);
            }
        }
    }
}