using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace Project_web_ban_hoa.Private.Admin.Category.Create
{
    public partial class CreateCategory : System.Web.UI.UserControl
    {
        /// <summary>
        /// Method dịch chữ tiếng việt sang chữ tiếng việt không dấu
        /// </summary>
        /// <param name="str">Truyền vào một chuỗi bất kì</param>
        /// <returns>một chuỗi tiếng việt không dấu</returns>
        private string ConvertToUnSign(string str)
        {
            string s = str.Normalize(NormalizationForm.FormKD);
            StringBuilder builder = new StringBuilder();

            for (int i = 0; i < s.Length; i++)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(s[i]) != UnicodeCategory.NonSpacingMark)
                {
                    builder.Append(s[i]);
                }
            }

            return builder.ToString().ToLower();
        }

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
                    string seoName = ConvertToUnSign(name).Replace(" ", "-");
                    string thumbnail;

                    string fileName = Path.GetFileName(file.FileName).Replace(" ", "-");
                    string saveFileName = Guid.NewGuid().ToString() + "-" + ConvertToUnSign(fileName);
                    string savePath = Server.MapPath("~/Publics/Uploads/Category/" + saveFileName);
                    thumbnail = ConfigurationManager.AppSettings["UrlEnv"] + $"/Publics/Uploads/Category/{saveFileName}";
                    file.SaveAs(savePath);

                    int n = Project_web_ban_hoa.Category.InsertCategory(name, seoName, thumbnail);
                    if (n > 0)
                    {
                        Response.Write($"Thành công|{saveFileName}");

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