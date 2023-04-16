using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class AddProductToCard : System.Web.UI.Page
    {
        int userId = 0;
        int productId = 0;
        decimal currentPrice = 0;
        int n = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ui"] != null)
                userId = Convert.ToInt32(Request.QueryString["ui"]);
            if (Request.QueryString["pri"] != null)
                productId = Convert.ToInt32(Request.QueryString["pri"]);
            if (Request.QueryString["crp"] != null)
                currentPrice = Convert.ToDecimal(Request.QueryString["crp"]);

            n = DAO.Cart.AddCart(userId, productId, currentPrice);
        }



        public int GetCountCart()
        {
            return DAO.Cart.GetCarts(userId).Rows.Count;
        }
    }
}