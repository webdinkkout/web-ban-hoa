using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;


namespace Project_web_ban_hoa.Models.Component
{
    public class Components
    {
        /// <summary>
        /// Chuyển đổi chuỗi tiếng Việt có dấu thành tiếng Việt không dấu
        /// </summary>
        /// <param name="str">Chuỗi chữ có dấu</param>
        /// <returns>Chuỗi chữ không dấu</returns>
        public static string ConvertToUnSign(string str)
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

        private static string GetLastItem(string[] array)
        {
            return array[array.Length - 1];
        }

        /// <summary>
        /// Xóa file ảnh trong server giải phóng bộ nhớ
        /// </summary>
        /// <param name="array">Đưa 1 mãng ký tự lấy về từ database vd: "https://exemp/image.png"</param>
        /// <param name="server">Đưa server nào cần xóa vào</param>
        public static void DeleteThumbnailOnSystem(string path, string[] array, HttpServerUtility server)
        {
            if (array.Length >= 3)
            {
                string filePath = server.MapPath($"~/Publics/Uploads/{path}/{GetLastItem(array)}");
                File.Delete(filePath);
            }
        }



    }
}