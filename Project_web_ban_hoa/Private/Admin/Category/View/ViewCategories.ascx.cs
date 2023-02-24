using Project_web_ban_hoa.Models;
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
        private string GetLastItem(string[] array)
        {
            return array[array.Length - 1];
        }

        private void DeleteThumbnailOnSystem(string[] array)
        {
            string filePath = Server.MapPath($"~/Publics/Uploads/Category/{GetLastItem(array)}");
            File.Delete(filePath);
        }

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
                        DeleteThumbnailOnSystem(arrNameThumbnail);
                        int idCategory = Convert.ToInt32(e.CommandArgument);
                        Project_web_ban_hoa.Category.DeleteCategory(idCategory);
                        ((IListSource)rptViewCategories.DataSource).GetList().RemoveAt(e.Item.ItemIndex);
                        rptViewCategories.DataBind();
                        break;
                    }
                case "update":
                    {

                        break;
                    }
                default:
                    break;
            }
        }


    }
}