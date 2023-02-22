﻿using System.Data;
using System.Data.SqlClient;

public class SQLCategory
{
    private static string _connectString = string.Empty;

    [System.Obsolete]
    public static string ConnectString
    {
        get
        {
            if (_connectString.Equals(""))
            {
                _connectString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
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
    public static void ExecuteNoneQuery(SqlCommand cmd)
    {
        if (cmd.Connection != null)
        {
            cmd.ExecuteNonQuery();
        }
        else
        {
            SqlConnection connect = new SqlConnection();
            cmd.Connection = connect;
            cmd.ExecuteNonQuery();
        }
    }

    [System.Obsolete]
    /// <summary>
    /// Phương thức lấy dữ liệu 1 bản và trả về kiểu DataTable
    /// </summary>
    /// <param name="cmd">Câu truy vấn SQL</param>
    /// <returns>DataTable</returns>
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


    [System.Obsolete]
    /// <summary>
    /// Lấy dữ liệu nhiều bảng và trả về kiểu DataSet
    /// </summary>
    /// <param name="cmd">Câu truy vấn SQL</param>
    /// <returns>DataSet</returns>
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