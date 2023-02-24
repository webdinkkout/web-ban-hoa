using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project_web_ban_hoa
{
    public class SqlDatabase
    {
        private static string _connectString = string.Empty;

        [System.Obsolete]
        public static string ConnectString
        {
            get
            {
                if (_connectString.Equals(""))
                {
                    _connectString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                }
                return _connectString;
            }
            set
            {
                _connectString = value;
            }
        }

        [System.Obsolete]
        public static SqlConnection GetConnection()
        {
            SqlConnection connect = new SqlConnection();
            connect.ConnectionString = ConnectString;
            connect.Open();
            return connect;
        }

        /// <summary>
        /// Thực hiện truy vấn không trả về dữ liệu
        /// </summary>
        /// <param name="cmd">Câu query SQL</param>
        [System.Obsolete]
        public static int ExecuteNoneQuery(SqlCommand cmd)
        {
            int n = 0;
            if (cmd.Connection != null)
            {
                n = cmd.ExecuteNonQuery();
            }
            else
            {
                SqlConnection connect = GetConnection();
                cmd.Connection = connect;
                n = cmd.ExecuteNonQuery();
            }
            return n;
        }


        /// <summary>
        /// Phương thức lấy dữ liệu 1 bản và trả về kiểu DataTable
        /// </summary>
        /// <param name="cmd">Câu truy vấn SQL</param>
        /// <returns>DataTable</returns>
        [System.Obsolete]
        public static DataTable GetData(SqlCommand cmd)
        {
            if (cmd.Connection != null)
            {
                using (DataSet ds = new DataSet())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
            else
            {
                using (SqlConnection connect = GetConnection())
                {
                    cmd.Connection = connect;
                    using (DataSet ds = new DataSet())
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                    }
                }
            }
        }


        /// <summary>
        /// Lấy dữ liệu nhiều bảng và trả về kiểu DataSet
        /// </summary>
        /// <param name="cmd">Câu truy vấn SQL</param>
        /// <returns>DataSet</returns>
        [System.Obsolete]
        public static DataSet GetDatas(SqlCommand cmd)
        {
            if (cmd.Connection != null)
            {
                using (DataSet ds = new DataSet())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                        return ds;
                    }
                }
            }
            else
            {
                using (SqlConnection connect = GetConnection())
                {
                    cmd.Connection = connect;
                    using (DataSet ds = new DataSet())
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(ds);
                            return ds;
                        }
                    }
                }
            }
        }

    }
}