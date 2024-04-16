using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public static class ErrorLog
    {
        public static void errorLog(string message)
        {
            using (SqlConnection con = new SqlConnection("data source=DESKTOP-R5CTQN3\\SQLEXPRESS; database=Certificate; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "insertError";
                cmd.Parameters.Add("@error_text", message);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
