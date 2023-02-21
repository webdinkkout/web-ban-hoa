using System.Data;
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