using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;
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
        int parentId;
        CategoryModel category = new CategoryModel();

        protected DataTable GetProductID(int id)
        {
            return DAO.Product.GetProductWithCategoryId(id, 1, 8);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["pi"] != null)
                    parentId = Convert.ToInt32(Request.QueryString["pi"]);

                rptCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId, 1, 1, 90); // Có phân trang
                rptCategories.DataBind();

                rptMenuSubCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId, 1, 1, 90);
                rptMenuSubCategories.DataBind();


            }

            DataTable categories = DAO.Category.GetOneCategory(parentId);
            if (categories != null)
            {
                category = Components.ConvertDataTableToCategory(categories);
            }
        }

        protected string GetNameCategory()
        {
            return category.Name;
        }

        protected bool IsEmpTy()
        {
            bool isEmty = false;

            if (DAO.Category.GetCountProductByParentIdCategory(parentId) <= 0)
            {
                isEmty = true;
            }

            return isEmty;
        }
    }
}