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
        protected string GetColor(int seed)
        {
            Random random = new Random(seed);
            int randomNumber = random.Next(1, 4);
            string colorClass = "";
            switch (randomNumber)
            {
                case 1:
                    colorClass = "green";
                    break;
                case 2:
                    colorClass = "pink";
                    break;
                case 3:
                    colorClass = "orage";
                    break;
            }
            return colorClass;
        }
        protected DataTable GetAllProdutsbyCategoryId(int categoryId)
        {
            return DAO.Product.GetProductWithCategoryId(categoryId);
        }


    }
}

