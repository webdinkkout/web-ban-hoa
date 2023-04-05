using Project_web_ban_hoa.Models;
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
            return DAO.Product.GetProductWithCategoryId(id);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["pi"] != null)
                    parentId = Convert.ToInt32(Request.QueryString["pi"]);

                rptCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId);
                rptCategories.DataBind();

                rptMenuSubCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId);
                rptMenuSubCategories.DataBind();

                DataTable categories = DAO.Category.GetOneCategory(parentId);
                if (categories != null)
                {
                    DataRow rCategry = categories.Rows[0];

                    category.Id = Convert.ToInt32(rCategry["Id"].ToString());
                    category.Name = rCategry["Name"].ToString();
                    category.SeoName = rCategry["Seo_Name"].ToString();
                    category.ParentID = rCategry["Parent_Id"] as int?;
                    category.Thumbnail = rCategry["Thumbnail"].ToString();
                    category.Level = Convert.ToInt32(rCategry["Level"].ToString());
                }
            }
        }

        protected string GetNameCategory()
        {
            return category.Name;
        }
    }
}