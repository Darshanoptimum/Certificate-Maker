using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using certificate_maker.Models;

namespace Helper
{
    public class SqlHelperCertificate : Databasepath
    {
        public int insertCertificate(CertificateModel cerificate)
        {
            try
            {
                int UserId = cerificate.UserId;
                string CourseName = cerificate.CourseName;
                string startDate = cerificate.startDate;
                string endDate= cerificate.endDate;
                // INSERT CERTIFICATE INTO DATABASE
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "insertCertificate";
                    cm.Parameters.Add("@UserId", UserId);
                    cm.Parameters.Add("@CName", CourseName);
                    cm.Parameters.Add("@StartDate", startDate);
                    cm.Parameters.Add("@EndDate", endDate);
                    SqlParameter r = cm.Parameters.AddWithValue("@cId",SqlDbType.Int);
                    r.Direction = System.Data.ParameterDirection.Output;
                    cm.ExecuteNonQuery();
                    int y = (int)r.Value;
                    return y;
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertCertificate method.");
            }
            return 0;
        }

        public void insertCertificatepdf(int r1,string pdfstring)
        {
            try
            {
                // INSERT CERTIFICATE PDF INTO DATABASE
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "insertCertificatepdf";
                    cm.Parameters.Add("@id", r1);
                    cm.Parameters.Add("@string", pdfstring);
                    cm.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertCertificate method.");
            }
        }
        public List<CertificateModel> getCertificate(CertificateModel cerificate)
        {
            List<CertificateModel> list = new List<CertificateModel>();
            try
            {
                // INSERT CERTIFICATE PDF INTO DATABASE
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "getAllCertificate";
                    cm.Parameters.Add("@id", cerificate.UserId);
                    SqlDataReader reader = cm.ExecuteReader();
                    while (reader.Read())
                    {
                        CertificateModel certificateModel = new CertificateModel();
                        certificateModel.Id = int.Parse(reader[0].ToString());
                        certificateModel.CourseName = reader[1].ToString();
                        certificateModel.startDate= reader[2].ToString().Substring(0, 10);
                        certificateModel.endDate = reader[3].ToString().Substring(0, 10);
                        certificateModel.Date = reader[4].ToString().Substring(0, 10);
                        list.Add(certificateModel);
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertCertificate method.");
            }
            return list;
        }
        public string pdfofcertificate(CertificateModel cerificate)
        {
            string pdfstring = null;
            int Cid=0, Uid=0;
            string Uname = null, Cname = null;
            try
            {
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
                        Cid= int.Parse(reader[6].ToString());
                        Uid = int.Parse(reader[5].ToString());
                        Uname = reader[0].ToString();
                        Cname = reader[1].ToString();
                    }
                }

                string path = $@"C:\\Users\\Priya Sutariya\\Desktop\\Darshan Vaghani\\Week 7\\All certificate data\\{Uname}{Uid}\\{Cname}{Cid}.pdf";
                if (File.Exists(path))
                {
                    byte[] pdfData = File.ReadAllBytes(path);
                    pdfstring = Convert.ToBase64String(pdfData);
                }
                else
                {
                    pdfstring = "Not found";
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From pdfcertificate method.");
            }
            return pdfstring;
        }

    }
}
