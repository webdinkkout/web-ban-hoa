using System;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class Category
    {
        /// <summary>
        /// Phương thức thêm danh mục sản phẩm
        /// </summary>
        /// <param name="NameCategory">Tên của danh mục</param>
        /// <param name="pathThumnail">Link tới ảnh của danh mục trong server</param>
        [System.Obsolete]
        public static int InsertCategory(string nameCategory, string seoName, string pathThumnail, int parentId)
        {
            SqlCommand cmd = new SqlCommand("proc_insert_category_level_1");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", nameCategory);
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            cmd.Parameters.AddWithValue("@thumbnail", pathThumnail);
            cmd.Parameters.AddWithValue("@parent_id", parentId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        /// <summary>
        /// Phương thức lấy tất cả dữ liệu categories
        /// </summary>
        /// <returns>Tất cả các danh mục</returns>
        public static DataTable GetAllCategories(int level = 1, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = new SqlCommand("proc_pagination_category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@level", level);
            return SqlDatabase.GetData(cmd);

        }

        /// <summary>
        /// Xóa 1 Danh mục
        /// </summary>
        /// <param name="idCategory">Truyền id muốn xóa vào</param>
        /// <returns>Số lượng xóa</returns>
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
        public static DataTable SearchCategory(string result)
        {
            SqlCommand cmd = new SqlCommand("proc_search");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table_name", "Categories");
            cmd.Parameters.AddWithValue("@result", result);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy tất cả danh mục theo level
        /// </summary>
        /// <param name="level">Level của danh mục</param>
        /// <returns>Danh sách các danh mục có level tương ứng</returns>
        public static DataTable GetCategoriesByLevel(int level = 1, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = new SqlCommand("proc_get_categories_by_level");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@level", level);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy tất cả danh mục có mã danh mục cha và level
        /// </summary>
        /// <param name="parrentId">Mã danh mục cha</param>
        /// <param name="level">Level</param>
        /// <returns>Danh sách các danh mục có mã danh mục cha và level tương ứng</returns>
        public static DataTable GetCategoryByParentIdAndLevel(int parrentId, int level = 1, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = new SqlCommand("proc_get_category_by_parent_id_and_level");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@parent_id", parrentId);
            cmd.Parameters.AddWithValue("@level", level);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy số lượng sản phẩm trong của category gốc
        /// </summary>
        /// <param name="parentId">Mã danh mục gốc</param>
        /// <returns>Số lượng sản phẩm tương ứng</returns>
        public static int GetCountProductByParentIdCategory(int parentId)
        {
            SqlCommand cmd = new SqlCommand("proc_count_product_by_category_parent_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@parent_id", parentId);
            DataTable dt = SqlDatabase.GetData(cmd);

            return Convert.ToInt32(dt.Rows[0][0]);
        }

        /// <summary>
        /// Tìm kiếm danh mục theo tên
        /// </summary>
        /// <param name="result"> Từ khóa tìm kiếm </param>
        /// <param name="parrentId"> mã danh mục cha </param>
        /// <param name="level"> cấp độ danh mục </param>
        /// <param name="sortNumber"> sắp xếp theo thời gian tạo </param>
        /// <param name="pageNumber">Só trang</param>
        /// <param name="pageSize">số lượng danh mục trong trang</param>
        /// <returns></returns>
        public static DataTable Search(string result, int parrentId, int level = 1, int sortNumber = 0, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = new SqlCommand("proc_search_categories_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@result", result);
            cmd.Parameters.AddWithValue("@parent_id", parrentId);
            cmd.Parameters.AddWithValue("@level", level);
            cmd.Parameters.AddWithValue("@num_sort", sortNumber);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }
    }
}