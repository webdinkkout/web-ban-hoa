using System;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class Cart
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
        /// Thêm giỏ hàng
        /// </summary>
        /// <param name="userId">Mã người dùng</param>
        /// <param name="productId">mã sản phẩm</param>
        /// <param name="productName">Tên sản phẩm</param>
        /// <param name="price">Giá bán</param>
        /// <param name="quantity">Số lượng</param>
        /// <returns></returns>
        public static int AddCart(int userId, int productId, decimal price, int quantity = 1)
        {
            SqlCommand cmd = CreateCMD("proc_add_cart");
            cmd.Parameters.AddWithValue("@user_id", userId);
            cmd.Parameters.AddWithValue("@product_id", productId);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        public static DataTable GetCarts(int userId)
        {
            SqlCommand cmd = CreateCMD("proc_get_cart_by_id_user");
            cmd.Parameters.AddWithValue("@user_id", userId);
            return SqlDatabase.GetData(cmd);
        }

        public static int RemoveCountProduct(int userId, int productId, int quantity = 1)
        {
            SqlCommand cmd = CreateCMD("proc_remove_count_product");
            cmd.Parameters.AddWithValue("@user_id", userId);
            cmd.Parameters.AddWithValue("@product_id", productId);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        public static int DeleteProductOnCart(int userId, int productId)
        {
            SqlCommand cmd = CreateCMD("proc_delete_product_on_cart");
            cmd.Parameters.AddWithValue("@user_id", userId);
            cmd.Parameters.AddWithValue("@product_id", productId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        public static int DeleteCarts(int userId)
        {
            SqlCommand cmd = CreateCMD("proc_delete_cart");
            cmd.Parameters.AddWithValue("@user_id", userId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        public static int CheckCart(int userId)
        {
            SqlCommand cmd = CreateCMD("proc_check_cart");
            cmd.Parameters.AddWithValue("@user_id", userId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }
    }
}