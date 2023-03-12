using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class Topic : System.Web.UI.Page
    {
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable productsTable = Project_web_ban_hoa.Product.GetAllProdcts();
                rptRenderCard.DataSource = productsTable;
                rptRenderCard.DataBind();
            }

        }
    }
}