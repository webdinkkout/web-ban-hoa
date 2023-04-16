using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Order.View
{
    public partial class ViewOrder : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCarts.DataSource = DAO.Cart.GetCartsCheck();
                rptCarts.DataBind();
            }
        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire({";
            script += "icon: 'warning',";
            script += "title: 'Oops...',";
            script += "text: 'Chức năng đang được chúng tôi bảo trì !!!',";
            script += "})";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
        }
    }
}