using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApi.Models
{
    public class OutlateMaster
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public long mobileNumber { get; set; }
        public string email { get; set; }
        
    }
}