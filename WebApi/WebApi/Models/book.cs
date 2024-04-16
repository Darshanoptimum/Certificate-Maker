using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApi.Models
{
    public class book
    {
        [Required]
        public int id   { get ; set; }
        
        public string title { get; set; }
        public string description { get; set; }
        public book(int id, string title, string description)
        {
            this.id = id;
            this.title = title;
            this.description = description;
        }
    }
}