using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Object : System.Web.UI.Page
    {
        protected DataTable GetCategories(int categoryId, int level = 1)
        {
            return DAO.Category.GetCategoryByParentIdAndLevel(categoryId, level);
        }
        protected DataTable GetProduct(int categoryId)
        {
            return DAO.Product.GetProductWithCategoryId(categoryId);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCategory.DataSource = GetCategories(2);
                rptCategory.DataBind();
            }
        }
    }
}