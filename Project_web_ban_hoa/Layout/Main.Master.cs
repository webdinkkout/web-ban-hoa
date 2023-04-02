using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Layout
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCategoriesNav.DataSource = DAO.Category.GetAllCategories(1, 9, 0);

                rptCategoriesNav.DataBind();

            }


        }

        protected DataTable LayConThuocCha(int parentId)
        {
            return DAO.Category.GetCategoryByParentIdAndLevel(parentId);
        }
    }
}