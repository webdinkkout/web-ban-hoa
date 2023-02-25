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
                        Components.DeleteThumbnailOnSystem(arrNameThumbnail, Server);
                        int idCategory = Convert.ToInt32(e.CommandArgument);
                        Project_web_ban_hoa.Category.DeleteCategory(idCategory);
                        ((IListSource)rptViewCategories.DataSource).GetList().RemoveAt(e.Item.ItemIndex);
                        rptViewCategories.DataBind();
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