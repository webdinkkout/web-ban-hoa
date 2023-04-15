using Project_web_ban_hoa.Models;
using Project_web_ban_hoa.Models.Component;
using System;
using System.Collections;
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

            if (!Page.IsPostBack)
            {
                int level = 0;
                ddlCategories.DataSource = DAO.Category.GetCategoriesByLevel(level, 1, 90);
                ddlCategories.DataTextField = "Name";
                ddlCategories.DataValueField = "Id";
                ddlCategories.DataBind();
                ddlCategories.Items.Insert(0, new ListItem("Tất cả", "0"));

                BindCategoriesList();

            }

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

        private void BindCategoriesList()
        {
            rptViewCategories.DataSource = DAO.Category.Search(txtSearch.Text, Convert.ToInt32(ddlCategories.SelectedValue), 1, 0, 1, 90);
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
                        string script;
                        int idCategory = Convert.ToInt32(e.CommandArgument);
                        int n = DAO.Category.DeleteCategory(idCategory);
                        if (n > 0)
                        {
                            Components.DeleteThumbnailOnSystem("Category", arrNameThumbnail, Server);
                            BindCategoriesList();
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

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            int categoryId = Convert.ToInt32(ddlCategories.SelectedValue);
            if (categoryId <= 0)
            {
                rptViewCategories.DataSource = DAO.Category.GetCategoriesByLevel(1, 1, 90);
                rptViewCategories.DataBind();
            }
            else
            {
                rptViewCategories.DataSource = DAO.Category.GetCategoryByParentIdAndLevel(categoryId, 1, 1, 90);
                rptViewCategories.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindCategoriesList();
        }
    }
}