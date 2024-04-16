using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace certificate_maker.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public string User_name { get; set; }
        public string Email { get; set; }
        public string User_password { get; set; }
    }
}