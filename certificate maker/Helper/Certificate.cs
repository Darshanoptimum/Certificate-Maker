using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Winnovative;

namespace Helper
{
    public class Certificate : Databasepath
    {
        public void createCertificate(int id)
        {
            try
            {
                // get certificate data from database
                string name = null, cName = null, sDate = null, eDate = null, gDate = null, uID = null, cID = null;
                
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "getCertificate";
                    cm.Parameters.Add("@id", id);
                    SqlDataReader reader = cm.ExecuteReader();
                    while (reader.Read())
                    {
                        
                        name = reader[0].ToString();
                        cName = reader[1].ToString();
                        sDate = reader[2].ToString().Substring(0, 10);
                        eDate = reader[3].ToString().Substring(0, 10);
                        gDate = reader[4].ToString().Substring(0, 10);
                        uID = reader[5].ToString();
                        cID= reader[6].ToString();
                    }
                }
                string imgpath = $"C:\\Users\\Priya Sutariya\\Desktop\\Darshan Vaghani\\Week 7\\certificate pdf\\sign.png";
                //HTML FORMAT OF CERTIFICATE
                string html = $"<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Document</title>\r\n    <style>\r\n        .outer-border {{\r\n            width: 800px;\r\n            height: 650px;\r\n            padding: 20px;\r\n            text-align: center;\r\n            border: 10px solid #673AB7;\r\n            margin-left: 9%;\r\n        }}\r\n\r\n        .inner-dotted-border {{\r\n            width: 750px;\r\n            height: 600px;\r\n            padding: 20px;\r\n            text-align: center;\r\n            border: 5px solid #673AB7;\r\n            border-style: dotted;\r\n        }}\r\n\r\n        .certification {{\r\n            font-size: 50px;\r\n            font-weight: bold;\r\n            color: #663ab7;\r\n        }}\r\n\r\n        .certify {{\r\n            font-size: 25px;\r\n        }}\r\n\r\n        .name {{\r\n            font-size: 30px;\r\n            color: green;\r\n        }}\r\n\r\n        .fs-30 {{\r\n            font-size: 30px;\r\n        }}\r\n\r\n        .fs-20 {{\r\n            font-size: 20px;\r\n\r\n        }}\r\n\r\n        .date-sign {{\r\n            display: flex;\r\n            align-items: center;\r\n        }}\r\n        .date{{\r\n            margin-right: 400px;\r\n        }}\r\n    </style>\r\n</head>\r\n\r\n\r\n<body>\r\n    <div class=\"outer-border\">\r\n        <div class=\"inner-dotted-border\">\r\n            <img src=\"https://ci3.googleusercontent.com/proxy/4L4agPLcW59Z89NaAxJP0f6sDk2ExfoxNpn794RxKqsqcgSyMtVoZuADATyKQz04SxK5X3HX4jyh4Dl8VAdrKcYDKC63jIV4yaKiYUFo4kGHxdYpNI5Il6QLScSLFYzmav6tX31lB-8D4Xu7Uk3pPuafVtyly6wT-q1zJKufZPulgSs4D5tFnihu1k6FdTeFE3TA3zADGwp3vK9Nzg=s0-d-e1-ft#https://docs.google.com/uc?export=downloadid=1lYco_WpNcouZ3m5vHHa72fgQkxuCc2SYrevid=0B0yb1AgWqMUVSVFlTnJBYlRHSWY1UHlQTVV4UHV6YTI1TndzPQ\"\r\n                alt=\"\"><br><br>\r\n\r\n            <span class=\"certification\">Certificate of Completion</span>\r\n            <br><br>\r\n            <span class=\"certify\"><i>This is to certify that</i></span>\r\n            <br><br>\r\n            " +
                    $"<span class=\"name\"><b>{name}</b></span><br /><br />\r\n            <span class=\"certify\"><i>has successfully completed the certification</i></span> <br /><br />\r\n            " +
                    $"<span class=\"fs-30\">{cName}</span> <br /><br />\r\n            <span class=\"fs-20\">with score of <b>A+</b></span> <br /><br />\r\n            " +
                    $"<span class=\"fs-20\">On <b>{sDate}</b> to " +
                    $"<b>{eDate}</b> <br />\r\n\r\n                <div class=\"date-sign\">\r\n                    <div class=\"date\">\r\n                        <span class=\"certify\"><i>dated</i></span><br>\r\n                        " +
                    $"<span class=\"fs-30\">{gDate}</span><br><br>\r\n                    </div>\r\n                    <div class=\"sign\">\r\n                        <span class=\"certify\"><i>signature</i></span><br>\r\n                        <img height=\"85px\"\r\n                            src=\"{imgpath}\"\r\n                            alt=\"\">\r\n                    </div>\r\n                </div>\r\n\r\n        </div>\r\n    </div>\r\n</body>\r\n\r\n</html>";

                string path = $@"C:\\Users\\Priya Sutariya\\Desktop\\Darshan Vaghani\\Week 7\\All certificate data\\{name}{uID}";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string finalpath = path + $"\\{cName}{cID}.pdf";
                HtmlToPdfConverter converter = new HtmlToPdfConverter();
                // convert the HTML string to a PDF file
                converter.ConvertHtmlToFile(html, null, finalpath);
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From createCertificate method.");
            }
        }
    }
}
