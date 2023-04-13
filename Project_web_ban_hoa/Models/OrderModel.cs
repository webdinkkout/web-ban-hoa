using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_web_ban_hoa.Models
{
    public class OrderModel
    {
        public int ID { get; set; }
        public decimal VAT { get; set; }
        public int UserId { get; set; }
        public int PaymentMeThodId { get; set; }
        public bool Status { get; set; }
        public decimal ToTalPrice { get; set; }
    }
}