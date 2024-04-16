using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SQLHelper;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class OutlateController : ApiController
    {
        // POST: api/Outlate
        [Route("api/OutlateCreate")]
        [HttpPost]
        public string OutlateCreate([FromBody]OutlateMaster outlateMaster)
        {
            SQLOutlateHelper sQLOutlateHelper = new SQLOutlateHelper();
            sQLOutlateHelper.addOutlate(outlateMaster.Name, outlateMaster.Address, outlateMaster.mobileNumber, outlateMaster.email);
            return "added successfuly";
        }
        
        [Route("api/GetAllOutlate")]
        [HttpGet]
        public object GetAll()
        {
            SQLOutlateHelper sQLOutlateHelper = new SQLOutlateHelper();
            DataTable dt = sQLOutlateHelper.getOutlate();
            return dt;
        }

        [Route("api/GetOutlate")]
        [HttpGet]
        public object GetOutlate(int id)
        {
            SQLOutlateHelper sQLOutlateHelper = new SQLOutlateHelper();
            DataTable dt = sQLOutlateHelper.getOutlate();
            return dt;
        }
        
    }
}
