using System.Data;
using System.Data.SqlClient;

namespace Project_web_ban_hoa
{
    public class Product
    {
        [System.Obsolete]
        public static DataTable GetAllProdcts()
        {
            SqlCommand cmd = new SqlCommand("proc_get_all_products");
            cmd.CommandType = CommandType.StoredProcedure;
            return SqlDatabase.GetData(cmd);
        }

        [System.Obsolete]
        public static DataTable GetProductWithCategoryId(int categoryId)
        {
            SqlCommand cmd = new SqlCommand("proc_get_products_with_category_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@category_id", categoryId);
            return SqlDatabase.GetData(cmd);
        }
    }
}