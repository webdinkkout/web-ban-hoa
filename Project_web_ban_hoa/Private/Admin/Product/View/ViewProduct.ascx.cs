using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Product.View
{
    public partial class ViewProduct : System.Web.UI.UserControl
    {
        private static void BindingProductList(DataTable Source, Repeater control)
        {
            control.DataSource = Source;
            control.DataBind();
        }

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindingProductList(Project_web_ban_hoa.Product.GetAllProdcts(), rptViewProduct);

                DataTable categoriesTable = Project_web_ban_hoa.Category.GetAllCategories();

                foreach (DataRow categoryRow in categoriesTable.Rows)
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = categoryRow["Name"].ToString();
                    listItem.Value = categoryRow["Id"].ToString();
                    ddlCategory.Items.Add(listItem);
                }
            }
        }

        [Obsolete]
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idCategory = Convert.ToInt32(ddlCategory.SelectedValue);
            if (idCategory <= 0)
            {
                BindingProductList(Project_web_ban_hoa.Product.GetAllProdcts(), rptViewProduct);
            }
            else
            {
                BindingProductList(Project_web_ban_hoa.Product.GetProductWithCategoryId(idCategory), rptViewProduct);
            }
        }
    }
}