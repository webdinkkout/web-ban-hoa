using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Category
{
    public partial class CategoryControl : System.Web.UI.UserControl
    {
        string subModul = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["sub-modul"] != null)
                subModul = Request.QueryString["sub-modul"];

            if (Request.QueryString["modul"] == "category" && subModul == "")
            {
                HtmlControl parent = FindControl("hplHomeCategory").Parent as HtmlControl;
                parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                plhCategoryControl.Controls.Add(LoadControl("Home/HomeCategory.ascx"));
            }

            switch (subModul)
            {
                case "view-count-category":
                    {
                        plhCategoryControl.Controls.Add(LoadControl("ViewCount/ViewCountCategories.ascx"));
                        HtmlControl parent = FindControl("hplViewCount").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");

                        break;
                    }
                case "view-categories":
                    {
                        plhCategoryControl.Controls.Add(LoadControl("View/ViewCategories.ascx"));
                        HtmlControl parent = FindControl("hplViewCategories").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                case "create-category":
                    {
                        plhCategoryControl.Controls.Add(LoadControl("Create/CreateCategory.ascx"));
                        HtmlControl parent = FindControl("hplCreateCategory").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                case "update-category":
                    {
                        plhCategoryControl.Controls.Add(LoadControl("Update/UpdateCategory.ascx"));
                        HtmlControl parent = FindControl("hplUpdateCategory").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                case "delete-category":
                    {
                        plhCategoryControl.Controls.Add(LoadControl("Delete/DeleteCategory.ascx"));
                        HtmlControl parent = FindControl("hplDeleteCategory").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                default:
                    break;
            }

        }
    }
}