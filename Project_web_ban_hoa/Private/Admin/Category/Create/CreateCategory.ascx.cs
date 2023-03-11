﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Project_web_ban_hoa.Models.Component;

namespace Project_web_ban_hoa.Private.Admin.Category.Create
{
    public partial class CreateCategory : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void btnCreateCategory_Click(object sender, EventArgs e)
        {

            if (Request.Files.Count > 0 && !string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                HttpPostedFile file = Request.Files[0];
                if (file.ContentType.ToLower().StartsWith("image/"))
                {
                    string name = txtName.Text;
                    string seoName = Components.ConvertToUnSign(name).Replace(" ", "-");

                    string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                    string saveFileName = Guid.NewGuid().ToString() + "-" + Components.ConvertToUnSign(fileName);
                    string savePath = Server.MapPath("~/Publics/Uploads/Category/" + saveFileName);
                    string thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Category/{saveFileName}";

                    int n = Project_web_ban_hoa.Category.InsertCategory(name, seoName, thumbnail);
                    if (n > 0)
                    {
                        file.SaveAs(savePath);
                        Session["showToastMessage"] = "Tạo sản phẩm thành công";
                        Session["showToastDuration"] = 3000;
                        Session["showToastPosition"] = "right";
                        Response.Redirect("~/Admin.aspx");
                    }
                }
                else
                {
                    Response.Write("Vui lòng nhập đúng dữ liệu");
                }

            }
            else
            {
                Response.Write(txtName.Text);
                Response.Write(Request.Files.Count);
                Response.Write("Phải nhập đầu dủ thông tin");
            }
        }
    }
}