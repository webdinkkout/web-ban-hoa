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
        string slug;
        DataTable dataProduct;
        protected void Page_Load(object sender, EventArgs e)
        {
            slug = Request.Url.LocalPath;
            slug = slug.Split('/')[2];
            //   dataProduct = Project_web_ban_hoa.Product.GetOneProductBySeoName(Product)

        }
    }
}