using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using certificate_maker.Models;
using Winnovative;

namespace Helper
{
    public class sendMail : Databasepath
    {
        
        public void sendmail(CertificateModel cerificate)
        {
            int Cid = 0, Uid = 0;
        string Uname = null, Cname = null;
            try
            {
                // method for send email to user
                string fromMail = "darshantester05@gmail.com";
                string fromPassword = "toztwgfeiajklint";

                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromMail);
                message.Subject = "Certificate";
                message.To.Add(new MailAddress("darshanvaghani0@gmail.com"));
                message.Body = "<html><body>Hello,<br>Kindly find attached Certificate.</body></html>";
                message.IsBodyHtml = true;

                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "getCertificate";
                    cm.Parameters.Add("@id", cerificate.Id);
                    SqlDataReader reader = cm.ExecuteReader();
                    while (reader.Read())
                    {
                        Cid = int.Parse(reader[6].ToString());
                        Uid = int.Parse(reader[5].ToString());
                        Uname = reader[0].ToString();
                        Cname = reader[1].ToString();
                    }
                }

                string path = $@"C:\\Users\\Priya Sutariya\\Desktop\\Darshan Vaghani\\Week 7\\All certificate data\\{Uname}{Uid}\\{Cname}{Cid}.pdf";
                if (File.Exists(path))
                {
                    using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com"))
                    {
                        Attachment attachment = new Attachment(path);
                        message.Attachments.Add(attachment);
                        smtpClient.Port = 587;
                        smtpClient.Credentials = new NetworkCredential(fromMail, fromPassword);
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(message);
                        attachment.Dispose();

                    };
                }
                else
                {
                    return;
                }


                
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From sendmail method.");
            }
            // File.Delete("C:\\Users\\Priya Sutariya\\Desktop\\Darshan Vaghani\\Week 6\\Mountly Expenses\\Report\\FullReport.pdf");

        }
    }
}
