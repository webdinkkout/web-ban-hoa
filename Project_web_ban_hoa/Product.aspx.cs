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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptRenderCategories.DataSource = DAO.Category.GetAllCategories();
                rptRenderCategories.DataBind();
            }
        }
        protected DataTable Data(int categoryID)
        {
            return DAO.Product.GetProductWithCategoryId(categoryID);
        }
    }
}