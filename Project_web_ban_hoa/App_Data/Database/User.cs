using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public static class User
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
        /// Cập nhật thông tin người dùng (admin)
        /// </summary>
        /// <param name="id">Mã người dùng</param>
        /// <param name="firstName">Họ và tên lót</param>
        /// <param name="lastName">Tên</param>
        /// <param name="email">Tài khoản gmail</param>
        /// <param name="address">Địa chỉ</param>
        /// <param name="roleId">Mã Chức vụ</param>
        /// <param name="avatar">Ảnh đại diện</param>
        /// <returns>Số lượng người dùng được cập nhật</returns>
        public static int UpdateUserAdmin(int id, string firstName, string lastName, string email, string address, int roleId, string avatar)
        {
            SqlCommand cmd = CreateCMD("proc_update_user_admin");
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@first_name", firstName);
            cmd.Parameters.AddWithValue("@last_name", lastName);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@role_id", roleId);
            cmd.Parameters.AddWithValue("@avatar", avatar);
            cmd.Parameters.AddWithValue("@address", address);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        /// <summary>
        /// Tìm người dùng theo mã người dùng
        /// </summary>
        /// <param name="id">Mã người dùng</param>
        /// <returns>Trả về người dùng tương ứng</returns>
        public static DataTable FindById(int id)
        {
            SqlCommand cmd = CreateCMD("proc_get_one_user_by_id");
            cmd.Parameters.AddWithValue("@id", id);
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        ///Lấy tất cả người dùng
        /// </summary>
        /// <returns>Trả về danh sách người dùng</returns>
        public static DataTable GetAllUsers()
        {
            SqlCommand cmd = CreateCMD("proc_get_all_users");
            return SqlDatabase.GetData(cmd);
        }

        /// <summary>
        /// Lấy các người dùng thuộc chức vụ
        /// </summary>
        /// <param name="roleId">Mã chức vụ</param>
        /// <returns>Trả về danh sách người dùng tương ứng</returns>
        public static DataTable GetUsersByRoleId(int roleId)
        {
            SqlCommand cmd = CreateCMD("proc_get_users_by_role_id");
            cmd.Parameters.AddWithValue("@role_id", roleId);
            return SqlDatabase.GetData(cmd);
        }


        /// <summary>
        /// xóa người dùng
        /// </summary>
        /// <param name="id"> mã người dùng</param>
        /// <returns> số người dùng bị xóa</returns>
        public static int DeleteUser(int id)
        {
            SqlCommand cmd = CreateCMD("proc_delete_user_admin");
            cmd.Parameters.AddWithValue("@id", id);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }

        /// <summary>
        /// Chỉnh sửa người dùng (ADMIN)
        /// </summary>
        /// <param name="id">Mã người dùng</param>
        /// <param name="roleId">Chức vụ</param>
        /// <returns>số lượng người dùng được sửa đổi</returns>
        public static int UpdateRoleUserAdmin(int id, int roleId)
        {
            SqlCommand cmd = CreateCMD("proc_update_user_admin");
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@role_id", roleId);
            return SqlDatabase.ExecuteNoneQuery(cmd);
        }


        /// <summary>
        /// Tìm kiếm người dùng
        /// </summary>
        /// <param name="result"> từ khóa tìm kiếm</param>
        /// <param name="roleId">mã chức vụ</param>
        /// <returns>Trả về người dùng tương ứng</returns>
        public static DataTable Search(string result, int roleId = 0)
        {
            SqlCommand cmd = CreateCMD("proc_search_users");
            cmd.Parameters.AddWithValue("@result", result);
            cmd.Parameters.AddWithValue("@role_id", roleId);
            return SqlDatabase.GetData(cmd);
        }
    }
}