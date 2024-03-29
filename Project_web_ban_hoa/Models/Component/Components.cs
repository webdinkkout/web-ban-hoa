﻿using System;
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

        public static UserModel ConvertDataTableToUser(DataTable objUser)
        {
            UserModel user = objUser.AsEnumerable().Select(row => new UserModel
            {
                Id = Convert.ToInt32(row["Id"].ToString()),
                FirstName = row["First_Name"].ToString(),
                LastName = row["Last_Name"].ToString(),
                Email = row["Email"].ToString(),
                Password = row["Password"].ToString(),
                RoleId = Convert.ToInt32(row["Role_Id"].ToString()),
                Avatar = row["Avatar"].ToString(),
                Address = row["Address"].ToString(),
                CreatedAt = Convert.ToDateTime(row["Created_At"].ToString()),
                UpdatedAt = Convert.ToDateTime(row["Updated_At"].ToString())
            }).FirstOrDefault();

            return user;
        }

        public static CategoryModel ConvertDataTableToCategory(DataTable objCategory)
        {
            CategoryModel category = objCategory.AsEnumerable().Select(row => new CategoryModel
            {
                Id = Convert.ToInt32(row["Id"]),
                Name = row["Name"].ToString(),
                SeoName = row["Name"].ToString(),
                Thumbnail = row["Thumbnail"].ToString(),
                ParentID = row["Parent_Id"] as int?,
                Level = Convert.ToInt32(row["Level"].ToString())

            }).FirstOrDefault();

            return category;
        }

        public static ProductModel ConvertDataTableToProduct(DataTable objProduct)
        {
            ProductModel product = objProduct.AsEnumerable().Select(row => new ProductModel
            {
                Id = Convert.ToInt32(row["Id"].ToString()),
                Name = row["Name"].ToString(),
                SeoName = row["Seo_Name"].ToString(),
                Desc = row["Description"].ToString(),
                ViewCount = row["View_Count"] as int?,
                OldPrice = row["Old_Price"] as decimal?,
                CurrentPrice = Convert.ToDecimal(row["Current_Price"]),
                Quantity = row["Quantity"] as int?,
                Sold = row["Sold"] as int?,
                Thumbnail = row["Thumbnail"].ToString(),
                CategoryId = Convert.ToInt32(row["Category_Id"]),
            }).FirstOrDefault();

            return product;
        }

        public static string GetTimestamp()
        {
            DateTime currentTime = DateTime.UtcNow;
            DateTime unixEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            TimeSpan elapsedTime = currentTime.Subtract(unixEpoch);
            long timestamp = (long)elapsedTime.TotalSeconds;
            return timestamp.ToString().Replace(",", ""); // loại bỏ dấu phẩy
        }
    }
}