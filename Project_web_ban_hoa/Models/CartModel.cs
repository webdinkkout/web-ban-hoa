using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_web_ban_hoa.Models
{
    public class CartModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
    }
}