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
        int pageNumber = 1;
        int pageSizes = 16;
        CategoryModel category = new CategoryModel();

        protected DataTable GetProductID(int id)
        {
            return DAO.Product.GetProductWithCategoryId(id, pageNumber, pageSizes);
        }

        protected DataTable GetAllProductID(int id)
        {
            return DAO.Product.GetProductWithCategoryId(id, 1, 999);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pi"] != null)
                parentId = Convert.ToInt32(Request.QueryString["pi"]);


            if (!Page.IsPostBack)
            {
                rptCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId, 1, 1, 90);
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


        protected int GetPageSize()
        {
            return pageSizes;
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