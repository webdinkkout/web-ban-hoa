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
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable categoriesTable = Project_web_ban_hoa.Product.GetAllProdcts();
            rptViewProduct.DataSource = categoriesTable;
            rptViewProduct.DataBind();
        }
    }
}