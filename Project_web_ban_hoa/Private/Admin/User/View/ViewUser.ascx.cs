using Project_web_ban_hoa.Models;
using System;
using System.Collections.Generic;
using System.Data;
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
                BindDataUser();

                ddlRoles.DataSource = DAO.Role.GetAllRoles();

                ddlRoles.DataTextField = "Name";
                ddlRoles.DataValueField = "Id";
                ddlRoles.DataBind();
                ddlRoles.Items.Insert(0, new ListItem("Tất cả", "0"));

            }
        }

        private void BindDataUser()
        {
            grvUsers.DataSource = DAO.User.GetAllUsers();
            grvUsers.DataBind();

        }

        protected void grvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string script;
            int id = Convert.ToInt32(grvUsers.DataKeys[e.RowIndex].Value);
            int n = DAO.User.DeleteUser(id);
            if (n > 0)
            {
                script = "showToast('Xóa thành công', 3000, 'right', 'green')";
                BindDataUser();
            }
            else
            {
                script = "showToast('Xóa không thành công vui lòng kiểm tra lại', 3000, 'right', 'red')";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
        }

        protected void grvUsers_DataBound(object sender, EventArgs e)
        {

        }

        protected void grvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    //tim dieu khien DropDownList ddlKhoa tren dòng hiện hành
                    DropDownList ddlRole = (DropDownList)e.Row.FindControl("ddlRole");
                    //khoi tao du lieu nguon cho ddlKhoa
                    ddlRole.DataSource = DAO.Role.GetAllRoles();
                    ddlRole.DataValueField = "id";
                    ddlRole.DataTextField = "Name";
                    ddlRole.DataBind();
                    //gan giá trị mặc định được chọn = giá trị mã khoa của sinh viên
                    int roleId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Role_id"));

                    ddlRole.SelectedValue = roleId.ToString();
                }
                else
                {
                    // Lấy mã chức vụ từ cột chức vụ trong GridView
                    int roleId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Role_id"));

                    // Truy vấn cơ sở dữ liệu để lấy tên chức vụ
                    DataTable role = DAO.Role.GetRoleById(roleId);
                    string roleName = role.Rows[0]["Name"].ToString();

                    // Gán tên chức vụ vào cột chức vụ của GridView
                    e.Row.Cells[4].Text = roleName;
                }


            }
        }

        protected void grvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvUsers.EditIndex = e.NewEditIndex;
            BindDataUser();

        }

        protected void grvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvUsers.EditIndex = -1;
            BindDataUser();
        }

        protected void grvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string script;
            int roleId = Convert.ToInt32(((DropDownList)grvUsers.Rows[e.RowIndex].FindControl("ddlRole")).SelectedValue);
            int n = DAO.User.UpdateRoleUserAdmin(Convert.ToInt32(grvUsers.DataKeys[e.RowIndex].Value.ToString()), roleId);
            if (n > 0)
            {
                script = "showToast('Xóa thành công', 3000, 'right', 'green')";
            }
            else
            {
                script = "showToast('Xóa không thành công vui lòng kiểm tra lại', 3000, 'right', 'red')";
            }
            grvUsers.EditIndex = -1;
            BindDataUser();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowToast", script, true);
        }
    }
}