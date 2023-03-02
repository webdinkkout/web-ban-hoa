using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Product.Create
{
    public partial class CreateProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
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


    }
}