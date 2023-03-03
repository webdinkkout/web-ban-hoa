using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Category.View
{

    public partial class ViewCategories : System.Web.UI.UserControl
    {

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable categoriesTable = Project_web_ban_hoa.Category.GetAllCategories();

            rptViewCategories.DataSource = categoriesTable;
            rptViewCategories.DataBind();

            // kiểm tra: xem có thông báo không nếu có thì thông báo
            if ((Session["showToastMessage"] != null && Session["showToastDuration"] != null && Session["showToastPosition"] != null) || Session["showToastBackColor"] != null)
            {
                string message = Session["showToastMessage"].ToString();
                int duration = int.Parse(Session["showToastDuration"].ToString());
                string position = Session["showToastPosition"].ToString();
                string backColor = Session["showToastBackColor"] != null ? Session["showToastBackColor"].ToString() : "green";
                string script = "showToast('" + message + "', " + duration + ", '" + position + "', '" + backColor + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                Session.Remove("showToastMessage");
                Session.Remove("showToastDuration");
                Session.Remove("showToastPosition");
                Session.Remove("showToastBackColor");
            }
        }

        [Obsolete]
        protected void rptViewCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Image imgThumbnail = e.Item.FindControl("imgThumbnail") as Image;
            string[] arrNameThumbnail = imgThumbnail.ImageUrl.Split('/');
            switch (e.CommandName)
            {
                case "delete":
                    {
                        string script;
                        int idCategory = Convert.ToInt32(e.CommandArgument);
                        int n = Project_web_ban_hoa.Category.DeleteCategory(idCategory);
                        if (n > 0)
                        {
                            Components.DeleteThumbnailOnSystem(arrNameThumbnail, Server);
                            ((IListSource)rptViewCategories.DataSource).GetList().RemoveAt(e.Item.ItemIndex);
                            rptViewCategories.DataBind();
                            script = "showToast('Xóa thành công', 3000, 'right', 'green')";
                        }
                        else
                        {
                            script = "showToast('Xóa không thành công vui lòng kiểm tra lại', 3000, 'right', 'red')";
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
                        break;
                    }
                case "update":
                    {
                        Response.Redirect($"Admin.aspx?modul=category&sub-modul=update-category&id-category={Convert.ToInt32(e.CommandArgument)}");
                        break;
                    }
                default:
                    break;
            }
        }


    }
}