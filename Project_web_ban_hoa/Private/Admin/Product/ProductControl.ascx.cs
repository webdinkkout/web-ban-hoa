using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Product
{
    public partial class ProductControl : System.Web.UI.UserControl
    {
        string subModul = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["sub-modul"] != null)
                subModul = Request.QueryString["sub-modul"];

            if (Request.QueryString["modul"] == "product" && subModul == "")
            {
                plhProductControl.Controls.Add(LoadControl("Home/HomeProduct.ascx"));
                HtmlControl parent = FindControl("hplHome").Parent as HtmlControl;
                parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
            }

            switch (subModul)
            {
                case "view-products":
                    {
                        plhProductControl.Controls.Add(LoadControl("View/ViewProduct.ascx"));
                        HtmlControl parent = FindControl("hplViewProduct").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                case "create-product":
                    {
                        plhProductControl.Controls.Add(LoadControl("Create/CreateProduct.ascx"));
                        HtmlControl parent = FindControl("hplCreateProduct").Parent as HtmlControl;

                        parent.Attributes.Add("class", "side-bar-ctr-list__item side-bar-ctr-list__item--active");
                        break;
                    }
                case "update-product":
                    {
                        plhProductControl.Controls.Add(LoadControl("Update/UpdateProduct.ascx"));
                        break;
                    }
                default:
                    break;
            }
        }
    }
}