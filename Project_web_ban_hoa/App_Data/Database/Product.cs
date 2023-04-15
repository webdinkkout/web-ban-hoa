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
        public static DataTable GetProductWithCategoryId(int categoryId, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_get_products_with_category_id");
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
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
        public static int UpdateProduct(int productId, string name, string seoName, string desc, int? viewCount, decimal? oldPrice, decimal? currentPrice, int? quantity, int? sold, string thumbnail, int? categoryId)
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


        /// <summary>
        /// Phương thức tìm kiếm sản phẩm theo tên
        /// </summary>
        /// <param name="result">Chuổi tìm kiếm</param>
        /// <param name="numSort">Sử dụng số để dịnh dạng kiểu sắp xếp: 0 : "Sắp xếp theo giá tiềm giảm dần", 1: "Sắp xếp theo giá tiền tăng dần", 2:"Sắp xếp theo tên giảm dần", 3:"Sắp xếp theo tên tăng dần"</param>
        /// <returns>Danh sách các sản phẩm tương ứng với kết quả tìm kiếm</returns>
        public static DataTable SearchProducts(string result, int numSort = 0)
        {
            SqlCommand cmd = CreateCMD("proc_search");
            cmd.Parameters.AddWithValue("@table_name", "Products");
            cmd.Parameters.AddWithValue("@result", result);
            cmd.Parameters.AddWithValue("@num_sort", numSort);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy tất cả sản phẩm theo 1 mãng mã danh mục được truyền vào
        /// </summary>
        /// <param name="categoryIds">chuổi mãng mã</param>
        /// <returns>Danh sách sản phẩm tương ứng</returns>
        public static DataTable GetAllProductByCategoryIds(string categoryIds)
        {
            SqlCommand cmd = CreateCMD("proc_get_products_by_array_category_id");
            cmd.Parameters.AddWithValue("@category_ids", categoryIds);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy tất cả sản phẩm thuộc danh mục có sắp xếp
        /// </summary>
        /// <param name="categoryIds">Danh sách mã sản phẩm</param>
        /// <param name="numSort">Sử dụng số để dịnh dạng kiểu sắp xếp: 0 : "Sắp xếp theo giá tiềm giảm dần", 1: "Sắp xếp theo giá tiền tăng dần", 2:"Sắp xếp theo tên giảm dần", 3:"Sắp xếp theo tên tăng dần"</param>
        /// <returns>Danh sách đã được sắp xếp</returns>
        public static DataTable SortProductsByCategoryId(string categoryIds, int numSort, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_sort_by_category_id");
            cmd.Parameters.AddWithValue("@table_name", "products");
            cmd.Parameters.AddWithValue("@category_ids", categoryIds);
            cmd.Parameters.AddWithValue("@num_sort", numSort);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy các sản phẩm liên quan dựa trên mã danh mục
        /// </summary>
        /// <param name="categoryId">Mã danh mục</param>
        /// <param name="id">Mã sản phẩm(Để loại trừ)</param>
        /// <returns>Danh sách các sản phẩm tương ứng trừ sản phẩm đang hiện hành</returns>
        public static DataTable GetProductReletionShips(int categoryId, int id)
        {
            SqlCommand cmd = CreateCMD("proc_get_reletionship_pruduct");
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            cmd.Parameters.AddWithValue("@id", id);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Lấy các sản phẩm dựng trên giá được truyền vào
        /// </summary>
        /// <param name="min">Giá thấp nhất</param>
        /// <param name="max">Giá cao nhất</param>
        /// <returns>Danh sách các sản phẩm tương ứng</returns>
        public static DataTable SearchByMinMaxPrice(int min, int max, string categoryIds, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_search_product_by_min_max_price");
            cmd.Parameters.AddWithValue("@min", min);
            cmd.Parameters.AddWithValue("@max", max);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@category_ids", categoryIds);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// Tìm kiếm sản phẩn bằng tên dựa theo categoryid
        /// </summary>
        /// <param name="result"> từ khóa tìm kiếm </param>
        /// <param name="categoryId">mã danh mục</param>
        /// <param name="sortNumber">Số sắp xếp</param>
        /// <param name="pageNumber">số trang</param>
        /// <param name="pageSize">số sản phẩm hiển thị trong trang</param>
        /// <returns>danh sách sản phẩm tương ứng</returns>
        public static DataTable SearchByCategoryId(string result, int categoryId = 0, int sortNumber = 999, int pageNumber = 1, int pageSize = 10)
        {
            SqlCommand cmd = CreateCMD("proc_search_products_by_category_id");
            cmd.Parameters.AddWithValue("@result", result);
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            cmd.Parameters.AddWithValue("@num_sort", sortNumber);
            cmd.Parameters.AddWithValue("@page_number", pageNumber);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            return SqlDatabase.GetData(cmd);
        }
    }
}