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
        /// <returns>Tất cả các danh mục</returns>
        [System.Obsolete]
        public static DataTable GetAllCategories(int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = new SqlCommand("proc_pagination");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table_name", "Categories");
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);

        }

        /// <summary>
        /// Xóa 1 Danh mục
        /// </summary>
        /// <param name="idCategory">Truyền id muốn xóa vào</param>
        /// <returns>Số lượng xóa</returns>
        [System.Obsolete]
        public static int DeleteCategory(int idCategory)
        {
            SqlCommand cmd = new SqlCommand("proc_delete_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", idCategory);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        /// <summary>
        /// Lấy category theo id
        /// </summary>
        /// <param name="idCategory">id category</param>
        /// <returns>Category lấy đc</returns>
        [System.Obsolete]
        public static DataTable GetOneCategory(int idCategory)
        {
            SqlCommand cmd = new SqlCommand("proc_get_one_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", idCategory);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Cập nhật danh mục
        /// </summary>
        /// <param name="idCateory">Mã danh mục</param>
        /// <param name="name">Tên danh mục</param>
        /// <param name="seoName">Tên thu gọn của danh mục</param>
        /// <param name="thumbnail">Ảnh danh mục</param>
        /// <returns>Số dòng được cập nhật thành công</returns>
        [System.Obsolete]
        public static int UpdateCategory(int idCateory, string name, string seoName, string thumbnail)
        {
            SqlCommand cmd = new SqlCommand("proc_update_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", idCateory);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            cmd.Parameters.AddWithValue("@thumbnail", thumbnail);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        /// <summary>
        /// Phương thức tìm kiếm danh mục
        /// </summary>
        /// <param name="result"> Từ tìm kiếm </param>
        /// <returns> Kết quả tìm kiếm </returns>
        [System.Obsolete]
        public static DataTable SearchCategory(string result)
        {
            SqlCommand cmd = new SqlCommand("proc_search");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table_name", "Categories");
            cmd.Parameters.AddWithValue("@result", result);
            return SqlDatabase.GetData(cmd);
        }
    }
}