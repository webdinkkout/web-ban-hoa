using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class CategoriesDetail : System.Web.UI.Page
    {
        int categoryId;
        int parentId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ci"] != null)
            {
                categoryId = Convert.ToInt32(Request.QueryString["ci"]);
                DataTable products = DAO.Product.GetProductWithCategoryId(categoryId);
            }
            if (Request.QueryString["pi"] != null)
            {
                parentId = Convert.ToInt32(Request.QueryString["pi"]);
                rptCheckedCategory.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId);
                rptCheckedCategory.DataBind();
            }
        }


    }
}