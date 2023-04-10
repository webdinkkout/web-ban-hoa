
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public static class Role
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
        /// Lấy tất cả chức vụ
        /// </summary>
        /// <returns></returns>
        public static DataTable GetAllRoles()
        {
            SqlCommand cmd = CreateCMD("proc_get_all_roles");
            return SqlDatabase.GetData(cmd);
        }
    }

}