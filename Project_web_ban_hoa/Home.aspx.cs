using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                rptCaterogies.DataSource = DAO.Category.GetAllCategories();
                rptCaterogies.DataBind();
                rptTitles.DataSource = DAO.Category.GetAllCategories();
                rptTitles.DataBind();
            }

        }

        protected DataTable GetAllProdutsbyCategoryId(int categoryId)
        {
            return DAO.Product.GetProductWithCategoryId(categoryId);
        }


    }
}

