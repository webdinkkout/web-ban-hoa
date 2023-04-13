using System;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class Order
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

        public static int InsertOrder(decimal VAT, int userId, int productId, bool status, decimal totalPrice)
        {
            SqlCommand cmd = CreateCMD("proc_add_order");
            cmd.Parameters.AddWithValue("@user_id", userId);
            cmd.Parameters.AddWithValue("@product_id", productId);
            cmd.Parameters.AddWithValue("@VAT", VAT);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@total_price", totalPrice);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }
    }
}