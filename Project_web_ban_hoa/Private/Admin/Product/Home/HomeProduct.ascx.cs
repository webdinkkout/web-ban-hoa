using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa.Private.Admin.Product.Home
{
    public partial class HomeProduct : System.Web.UI.UserControl
    {
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        public string[] GetNamesFromDatabase()
        {
            List<string> productNames = new List<string>();
            DataTable productTable = DAO.Product.GetAllProdcts();

            foreach (DataRow category in productTable.Rows)
            {
                string productName = category["Name"].ToString();
                productNames.Add(productName);
            }

            return productNames.ToArray();
        }

        [Obsolete]
        public double[] GetViewCountsFromDatabase()
        {
            List<double> productViewCounts = new List<double>();
            DataTable prodcutTable = DAO.Product.GetAllProdcts();

            foreach (DataRow category in prodcutTable.Rows)
            {
                double productViewCount = Convert.ToDouble(category["View_Count"]);
                productViewCounts.Add(productViewCount);
            }

            return productViewCounts.ToArray();
        }


    }
}