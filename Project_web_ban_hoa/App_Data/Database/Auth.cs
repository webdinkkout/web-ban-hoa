using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    /// <summary>
    /// Người dùng
    /// </summary>
    public class Auth
    {
        /// <summary>
        /// Phương thức đăng nhập
        /// </summary>
        /// <param name="gmail">Email</param>
        /// <param name="password">Mật khẩu</param>
        /// <returns>Người dùng</returns>
        public static DataTable Login(string gmail, string password)
        {
            SqlCommand cmd = new SqlCommand("proc_login");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@gmail", gmail);
            cmd.Parameters.AddWithValue("@password", password);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Phương thức đăng ký tài khoản
        /// </summary>
        /// <param name="firstName">Họ</param>
        /// <param name="lastName">Tên</param>
        /// <param name="address">Địa chỉ</param>
        /// <param name="email">Email</param>
        /// <param name="password">Mật Khẩu</param>
        /// <returns>Số lượng người dùng đăng ký thành công</returns>
        public static int Register(string firstName, string lastName, string address, string email, string password)
        {
            SqlCommand cmd = new SqlCommand("proc_register");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@first_name", firstName);
            cmd.Parameters.AddWithValue("@last_name", lastName);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }
    }
}