using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_web_ban_hoa.Models
{
    public class CategoryModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SeoName { get; set; }
        public string Thumbnail { get; set; }
        public int? ParentID { get; set; }
        public int Level { get; set; }
    }
}