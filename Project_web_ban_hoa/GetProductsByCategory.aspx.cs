using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_web_ban_hoa
{
    public partial class GetProductsByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["categoryIds"] != null)
            {
                string categoryIds = Request.QueryString["categoryIds"];

                // Lấy danh sách sản phẩm mới dựa trên các checkbox đã chọn
                DataTable products = DAO.Product.GetAllProductByCategoryIds(categoryIds);

                // Thiết lập dữ liệu sản phẩm mới vào Repeater
                rptProducts.DataSource = products;
                rptProducts.DataBind();

                // Render HTML cho danh sách sản phẩm mới và gửi về máy khách
                StringWriter writer = new StringWriter();
                HtmlTextWriter htmlWriter = new HtmlTextWriter(writer);
                rptProducts.RenderControl(htmlWriter);
                Response.Write(writer.ToString());
                Response.End();

            }
        }

    }
}