using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Product1 : System.Web.UI.Page
    {
        protected DataTable GetProductID(int id)
        {
            return DAO.Product.GetProductWithCategoryId(id);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(9);
                rptCategories.DataBind();
            }
        }
    }
}