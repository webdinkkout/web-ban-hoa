using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Project_web_ban_hoa
{
    public class Global : System.Web.HttpApplication
    {
        [Obsolete]
        protected void Application_Start(object sender, EventArgs e)
        {
            SqlDatabase.ConnectString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
    }
}