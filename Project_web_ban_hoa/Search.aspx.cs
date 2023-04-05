using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Search : System.Web.UI.Page
    {
        string value;
        int numSort = 999;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["key"] != null)
            {
                Session.Remove("VALUE_SEARCH");
                value = Request.QueryString["key"];
                Session.Add("VALUE_SEARCH", Request.QueryString["key"]);
            }
            if (Request.QueryString["ns"] != null)
                numSort = Convert.ToInt32(Request.QueryString["ns"]);
            rptSearchProducts.DataSource = DAO.Product.SearchProducts(value, numSort);
            rptSearchProducts.DataBind();

            lblCountResult.Text = DAO.Product.SearchProducts(value).Rows.Count + " Kết quả tìm kiếm cho \"" + value + "\"";
        }

    }
}