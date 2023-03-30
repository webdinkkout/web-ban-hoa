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
        int categoryId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ci"] != null)
                    categoryId = Convert.ToInt32(Request.QueryString["ci"]);

                rptCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(categoryId);
                rptCategories.DataBind();

                rptCategoriesSideBar.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(categoryId);
                rptCategoriesSideBar.DataBind();

                rptCategoriesSideBarHeading.DataSource = DAO.Category.GetOneCategory(categoryId);
                rptCategoriesSideBarHeading.DataBind();
            }
        }

        protected DataTable GetProductsByCategoryId(int categoryId)
        {
            return DAO.Product.GetProductWithCategoryId(categoryId);
        }
    }
}