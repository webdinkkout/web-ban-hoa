using System;
using System.Data;
using System.Data.SqlClient;

namespace Project_web_ban_hoa
{
    public class Product
    {
        private static SqlCommand CreateCMD(string query)
        {
            SqlCommand cmd = new SqlCommand(query);
            if (query.Split('_')[0].ToLower() == "proc")
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                cmd.CommandType = CommandType.Text;
            }
            return cmd;
        }

        /// <summary>
        /// Lấy tất cả sản phẩm trong danh sách sản phẩm
        /// </summary>
        /// <param name="pageNumber">Trang</param>
        /// <param name="pageSize">Số lượng sản phẩm muốn hiển thị trên 1 trang</param>
        /// <returns> Tất cả sản phẩm </returns>
        [System.Obsolete]
        public static DataTable GetAllProdcts(int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_pagination");
            cmd.Parameters.AddWithValue("@table_name", "Products");
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy tất cả sản phẩm thuộc danh mục
        /// </summary>
        /// <param name="categoryId">Mã danh mục</param>
        /// <returns>tất cả sản phẩm thuộc mã danh mục</returns>
        [System.Obsolete]
        public static DataTable GetProductWithCategoryId(int categoryId)
        {
            SqlCommand cmd = CreateCMD("proc_get_products_with_category_id");
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Hàm xóa sản phẩm theo mã sản phẩm
        /// </summary>
        /// <param name="productId">Mã sản phẩm</param>
        /// <returns>Số lượng xóa được</returns>
        [System.Obsolete]
        public static int DeleteProduct(int productId)
        {
            SqlCommand cmd = CreateCMD("proc_delete_product");
            cmd.Parameters.AddWithValue("@id", productId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        /// <summary>
        /// Hàm lấy sản phẩm theo mã sản phẩm
        /// </summary>
        /// <param name="productId">Mã sản phẩm</param>
        /// <returns>Sản phẩm</returns>
        [System.Obsolete]
        public static DataTable GetOneProduct(int productId)
        {
            SqlCommand cmd = CreateCMD("proc_get_one_product");
            cmd.Parameters.AddWithValue("@id", productId);
            return SqlDatabase.GetData(cmd);
        }

        [System.Obsolete]
        public static int UpdateProduct(int productId, string name, string seoName, string desc, int? viewCount, double? oldPrice, double? currentPrice, int? quantity, int? sold, string thumbnail, int? categoryId)
        {
            SqlCommand cmd = CreateCMD("proc_update_produt");
            cmd.Parameters.AddWithValue("@id", productId);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            cmd.Parameters.AddWithValue("@desc", desc);
            cmd.Parameters.AddWithValue("@view_count", viewCount);
            cmd.Parameters.AddWithValue("@old_price", oldPrice);
            cmd.Parameters.AddWithValue("@current_price", currentPrice);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@sold", sold);
            cmd.Parameters.AddWithValue("@thumbnail", thumbnail);
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

    }
}