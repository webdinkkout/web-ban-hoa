using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Layout
{
    public partial class Main : System.Web.UI.MasterPage
    {
        UserModel user = new UserModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCategoriesNav.DataSource = DAO.Category.GetAllCategories(0);

                rptCategoriesNav.DataBind();

                if (Session["ISLOGIN"] != null && Session["CURRENT_USER"] != null)
                {
                    user = (UserModel)Session["CURRENT_USER"];

                    imbAvatar.ImageUrl = IsAvatar() ? GetAvatar() : "../Publics/Images/Home/img-header/icon-user.png";
                    imbAvatar.AlternateText = GetFullName();
                    imbAvatar.CommandArgument = GetUserId().ToString();

                    btnCart.CommandArgument = GetUserId().ToString();

                }
            }
        }

        protected DataTable LayConThuocCha(int? parentId)
        {
            return DAO.Category.GetCategoryByParentIdAndLevel(parentId.Value);
        }

        protected DataTable GetCountChildProduct(int categoryId)
        {
            return DAO.Product.GetProductWithCategoryId(categoryId);
        }

        protected string GetFullName()
        {
            return user.FirstName + " " + user.LastName;
        }

        protected bool IsAvatar()
        {
            return user.Avatar.Length > 0;
        }
        protected string GetAvatar()
        {
            return user.Avatar;
        }

        protected int GetRoleId()
        {
            return user.RoleId;
        }

        protected int GetUserId()
        {
            return user.Id;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Add("CURRENT_URL", Request.Url);
            Response.Redirect("~/Login.aspx");
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("ISLOGIN");
            Session.Remove("CURRENT_USER");
            Response.Redirect("~/Home.aspx");
        }

        protected void imbAvatar_Click(object sender, ImageClickEventArgs e)
        {
            string userId = imbAvatar.CommandArgument;
            Response.Redirect($"~/UserInfo.aspx?iu={userId}");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (Session["ISLOGIN"] == null)
            {
                Session.Add("CURRENT_URL", Request.Url);
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                string userId = btnCart.CommandArgument;
                Response.Redirect($"~/Cart.aspx?iu={userId}");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string value = txtSearch.Text;

            if (!string.IsNullOrEmpty(value))
            {
                Response.Redirect($"~/Search.aspx?key={HttpUtility.UrlEncode(value)}");
            }
        }
    }
}