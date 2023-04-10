using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.User.View
{
    public partial class ViewControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                grvUsers.DataSource = DAO.User.GetAllUsers();
                grvUsers.DataBind();


                ddlRoles.DataSource = DAO.Role.GetAllRoles();

                ddlRoles.DataTextField = "Name";
                ddlRoles.DataValueField = "Id";
                ddlRoles.DataBind();
                ddlRoles.Items.Insert(0, new ListItem("Tất cả", "0"));

            }
        }
    }
}