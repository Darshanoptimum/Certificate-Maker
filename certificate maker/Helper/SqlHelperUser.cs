using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using certificate_maker.Models;

namespace Helper
{
    public class SqlHelperUser : Databasepath
    {
        public int insertUser(UserModel user)
        {
            try
            {
                string Name = user.User_name;
                string email = user.Email;
                string password = user.User_password;
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "insertUser";
                    cm.Parameters.Add("@userName", Name);
                    cm.Parameters.Add("@userEmail", email);
                    cm.Parameters.Add("@userPassword", password);
                    int y = cm.ExecuteNonQuery();
                    return y;
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertUser method.");
            }
            return 0;
        }
        public int findUser(UserModel user)
        {
            try
            {
                string Name = user.User_name;
                string email = user.Email;
                string password = user.User_password;
                using (SqlConnection conn = new SqlConnection(con))
                {
                    conn.Open();
                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn;
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.CommandText = "findUser";
                    cm.Parameters.Add("@userName", Name);
                    cm.Parameters.Add("@userEmail", email);
                    cm.Parameters.Add("@userPassword", password);
                    SqlDataReader sr = cm.ExecuteReader();
                    while (sr.Read())
                    {
                        if (sr[0].ToString().Equals("NULL"))
                        {
                            return 0;
                        }
                        else
                        {
                            return int.Parse(sr[0].ToString());
                        }
                    }
                    return 0;
                }
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From findUser method.");
            }
            return 0;
        }
    }
}
