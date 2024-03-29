﻿using Newtonsoft.Json;
using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
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
            }
            if (Request.QueryString["pi"] != null)
            {
                parentId = Convert.ToInt32(Request.QueryString["pi"]);
                rptCheckedCategory.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(parentId);
                rptCheckedCategory.DataBind();
            }
        }

        [WebMethod]
        public static string SearchByPrice(int minPrice, int maxPrice, string categoryIds)
        {
            DataTable product = DAO.Product.SearchByMinMaxPrice(minPrice, maxPrice, categoryIds, 1, 90);
            string json = JsonConvert.SerializeObject(product, Formatting.None);
            return json;
        }

    }
}