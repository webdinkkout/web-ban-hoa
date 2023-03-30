using System;
using System.Data;
using System.Data.SqlClient;

namespace DAO
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
        public static DataTable GetAllProdcts(int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_pagination_product");
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy tất cả sản phẩm thuộc danh mục
        /// </summary>
        /// <param name="categoryId">Mã danh mục</param>
        /// <returns>tất cả sản phẩm thuộc mã danh mục</returns>
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
        public static DataTable GetOneProductById(int productId)
        {
            SqlCommand cmd = CreateCMD("proc_get_one_product_by_id");
            cmd.Parameters.AddWithValue("@id", productId);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy sản phẩm với seo name
        /// </summary>
        /// <param name="seoName">Seo name</param>
        /// <returns>Sản phẩm có seo name bằng với seo name được truyền vào</returns>
        public static DataTable GetOneProductBySeoName(string seoName)
        {
            SqlCommand cmd = CreateCMD("proc_get_one_product_by_seo_name");
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy sản phẩm với id (trang admin)
        /// </summary>
        /// <param name="productId"> Id của sản phẩm </param>
        /// <returns>trả về sản phẩm của id được truyền vào </returns>
        public static DataTable GetOneProductByIdAdmin(int productId)
        {
            SqlCommand cmd = CreateCMD("proc_get_one_product_by_id_admin");
            cmd.Parameters.AddWithValue("@id", productId);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Tạo sản phẩm
        /// </summary>
        /// <param name="name">Tên sản phẩm</param>
        /// <param name="seoName"> Tên rút gọn không dấu tiếng việt </param>
        /// <param name="desc">Mô tả sản phẩm</param>
        /// <param name="oldPrice">Giá tiền trước khi khuyến mãi - nếu không = 0 </param>
        /// <param name="currentPrice">Giá tiền sau khi khuyến mãi</param>
        /// <param name="quantity">Số lượng sản phẩm</param>
        /// <param name="thumbnail">Ảnh đại diện sản phẩm</param>
        /// <param name="categoryId">Id danh mục mà sản phẩm thuộc về </param>
        /// <returns></returns>
        public static int CreateProduct(string name, string seoName, string desc, double? oldPrice, double? currentPrice, int? quantity, string thumbnail, int? categoryId)
        {
            SqlCommand cmd = CreateCMD("proc_insert_product");
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seo_name", seoName);
            cmd.Parameters.AddWithValue("@desc", desc);
            cmd.Parameters.AddWithValue("@old_price", oldPrice);
            cmd.Parameters.AddWithValue("@current_price", currentPrice);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@thumbnail", thumbnail);
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        /// <summary>
        /// Chỉnh sửa sản phẩm
        /// </summary>
        /// <param name="productId">Id sản phẩm muốn sửa đổi</param>
        /// <param name="name"> Tên sản phẩm </param>
        /// <param name="seoName">Tên rút gọn của sản phẩm tiếng Việt không dấu VD: name-1</param>
        /// <param name="desc">Mô tả sản phẩm</param>
        /// <param name="viewCount">Số lượng người xem sản phẩm (mặc định bằng 0)</param>
        /// <param name="oldPrice">giá tiền khuyến mãi (mặc định bằng không)</param>
        /// <param name="currentPrice">Giá tiền hiện tại</param>
        /// <param name="quantity">Số lượng sản phẩm</param>
        /// <param name="sold">Số lượng sản phẩm đã bán</param>
        /// <param name="thumbnail">Ảnh đại diện sản phẩm</param>
        /// <param name="categoryId">Id danh mục mà sản phẩm thuộc về</param>
        /// <returns></returns>
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