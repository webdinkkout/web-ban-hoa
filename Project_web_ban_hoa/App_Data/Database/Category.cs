using System.Data;
using System.Data.SqlClient;

namespace Project_web_ban_hoa
{
    public class Category
    {
        /// <summary>
        /// Phương thức thêm danh mục sản phẩm
        /// </summary>
        /// <param name="NameCategory">Tên của danh mục</param>
        /// <param name="pathThumnail">Link tới ảnh của danh mục trong server</param>
        [System.Obsolete]
        public static int InsertCategory(string nameCategory, string seoName, string pathThumnail)
        {
            SqlCommand cmd = new SqlCommand("proc_insert_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", nameCategory);
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            cmd.Parameters.AddWithValue("@thumbnail", pathThumnail);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        /// <summary>
        /// Phương thức lấy tất cả dữ liệu categories
        /// </summary>
        /// <returns>DataTable</returns>
        [System.Obsolete]
        public static DataTable GetAllCategories()
        {
            SqlCommand cmd = new SqlCommand("proc_get_all_categories");
            cmd.CommandType = CommandType.StoredProcedure;
            return SqlDatabase.GetData(cmd);

        }

        [System.Obsolete]
        public static int DeleteCategory(int idCategory)
        {
            SqlCommand cmd = new SqlCommand("proc_delete_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", idCategory);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }
    }
}