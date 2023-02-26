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
    }

}