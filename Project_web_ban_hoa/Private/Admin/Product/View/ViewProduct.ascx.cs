﻿using Project_web_ban_hoa.Models.Component;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
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
            BindingProductList(DAO.Product.GetAllProdcts(), rptViewProduct);

            if (!Page.IsPostBack)
            {
                DataTable categoriesTable = DAO.Category.GetAllCategories();

                foreach (DataRow categoryRow in categoriesTable.Rows)
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = categoryRow["Name"].ToString();
                    listItem.Value = categoryRow["Id"].ToString();
                    ddlCategory.Items.Add(listItem);
                }
            }

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
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idCategory = Convert.ToInt32(ddlCategory.SelectedValue);
            if (idCategory <= 0)
            {
                BindingProductList(DAO.Product.GetAllProdcts(), rptViewProduct);
                lbl404.Text = "";
            }
            else
            {
                BindingProductList(DAO.Product.GetProductWithCategoryId(idCategory), rptViewProduct);
                IList dataSource = ((IListSource)rptViewProduct.DataSource)?.GetList();
                if (dataSource.Count <= 0)
                {
                    lbl404.Text = "Danh sách rỗng";
                }
                else
                {
                    lbl404.Text = "";
                }
            }
        }

        protected void rptViewProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Image imgThumbnail = e.Item.FindControl("imgThumbnail") as Image;
            string[] arrNameThumbnail = imgThumbnail.ImageUrl.Split('/');
            switch (e.CommandName)
            {
                case "delete":
                    {
                        string script;
                        int idProduct = Convert.ToInt32(e.CommandArgument);
                        int n = DAO.Product.DeleteProduct(idProduct);
                        if (n > 0)
                        {
                            Components.DeleteThumbnailOnSystem("Product", arrNameThumbnail, Server);
                            IList dataSource = ((IListSource)rptViewProduct.DataSource)?.GetList();
                            if (dataSource != null && e.Item.ItemIndex < dataSource.Count)
                            {
                                dataSource.RemoveAt(e.Item.ItemIndex);
                                rptViewProduct.DataBind();
                            }
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
                        break;
                    }
                default:
                    break;
            }
        }
    }
}