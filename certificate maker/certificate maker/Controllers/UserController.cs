using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using certificate_maker.Models;
using Helper;

namespace certificate_maker.Controllers
{
    public class UserController : ApiController
    {
        [Route("api/addUser")]
        [HttpPost]
        public int addUser([FromBody] UserModel user)
        {
            int r = 0;
            try
            {
                SqlHelperUser sqlHelperUser = new SqlHelperUser();
                r = sqlHelperUser.insertUser(user);
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From addUser api.");
            }
            return r;
        }
        [Route("api/findUser")]
        [HttpPost]
        public int findUser([FromBody] UserModel user)
        {
            int r = 0;
            try
            {
                SqlHelperUser sqlHelperUser = new SqlHelperUser();
                r = sqlHelperUser.findUser(user);
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From findUser api.");
            }
            return r;
        }
    }
}
