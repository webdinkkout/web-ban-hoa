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
                plhCategoryControl.Controls.Add(LoadControl("View/ViewCategories.ascx"));
                HtmlControl parent = FindControl("hplViewCategories").Parent as HtmlControl;

                parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
            }

            switch (subModul)
            {


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

                        break;
                    }
                default:
                    break;
            }

        }
    }
}