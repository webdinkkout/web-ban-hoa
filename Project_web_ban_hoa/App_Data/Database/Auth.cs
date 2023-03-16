﻿using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class Auth
    {
        public static DataTable Login(string gmail, string password)
        {
            SqlCommand cmd = new SqlCommand("proc_login");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@gmail", gmail);
            cmd.Parameters.AddWithValue("@password", password);
            return SqlDatabase.GetData(cmd);
        }
    }
}