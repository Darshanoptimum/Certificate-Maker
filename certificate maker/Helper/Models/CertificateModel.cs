using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace certificate_maker.Models
{
    public class CertificateModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string CourseName { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public string Date { get; set; }
    }

    public class CertRes
    {
        public string pdfData { get; set; }
        public string pdfName { get; set; }
        //public string Date { get; set; }
    }
}