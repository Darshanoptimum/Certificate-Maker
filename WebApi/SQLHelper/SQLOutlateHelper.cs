using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SQLHelper
{
    public class SQLOutlateHelper : Databasepath
    {
        public int addOutlate(string Name, string Address,long mobileNumber, string email)
        {
            try
            {
                using(SqlConnection conn = new SqlConnection(con)) {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "InsertOutlate";
                    cm.Parameters.Add("@oName", Name);
                    cm.Parameters.Add("@oAddress", Address);
                    cm.Parameters.Add("@oNumber", mobileNumber);
                    cm.Parameters.Add("@oEmail", email);
                    int y = cm.ExecuteNonQuery();
                    return y;
                }
                 
            }catch (Exception ex)
            {

            }
            return 0;
        }
        public DataTable getOutlate()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "GetOutlate";
                    SqlDataReader r = cm.ExecuteReader();
                    
                    dt.Load(r);
                    
                }

            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable getOutlateById(int Id)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "getOutlateById";
                    cm.Parameters.Add("@Id", Id);
                    SqlDataReader r = cm.ExecuteReader();
                    
                    dt.Load(r);

                }

            }
            catch (Exception ex)
            {
                
            }
            return dt;
        }
    }
}
