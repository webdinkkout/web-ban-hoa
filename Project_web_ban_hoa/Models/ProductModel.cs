using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_web_ban_hoa.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SeoName { get; set; }
        public string Desc { get; set; }
        public int? ViewCount { get; set; }
        public double? OldPrice { get; set; }
        public double? CurrentPrice { get; set; }
        public int? Quantity { get; set; }
        public int? Sold { get; set; }
        public string Thumbnail { get; set; }
        public int? CategoryId { get; set; }
    }
}