using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using certificate_maker.Models;
using Helper;

namespace certificate_maker.Controllers
{
    public class CertificateController : ApiController
    {
        CertRes obj = new CertRes();
        // GET: api/Certificate
        [Route("api/insertCertificate")]
        [HttpPost]
        public string insertCertificate([FromBody] CertificateModel cerificate)
        {
            try
            {
                SqlHelperCertificate sqlHelperCertificate = new SqlHelperCertificate();
                int r = sqlHelperCertificate.insertCertificate(cerificate);
                Certificate certificate = new Certificate();
                certificate.createCertificate(r);
              
                return null;
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertCertificate api.");
            }
            return null;
        }
        [Route("api/getAllCertificate")]
        [HttpPost]
        public List<CertificateModel> getAllCertificate([FromBody] CertificateModel cerificate)
        {
            try
            {
                SqlHelperCertificate sqlHelperCertificate = new SqlHelperCertificate();
                List<CertificateModel> r = sqlHelperCertificate.getCertificate(cerificate);
                return r;
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From insertCertificate api.");
            }
            return null;
        }
        [Route("api/downloadCertificate")]
        [HttpPost]
        public string downloadCertificate([FromBody] CertificateModel cerificate)
        {
            try
            {
                SqlHelperCertificate sqlHelperCertificate = new SqlHelperCertificate();
                string r = sqlHelperCertificate.pdfofcertificate(cerificate);
                return r;
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From downloadCertificate api.");
            }
            return null;
        }
        [Route("api/sendMail")]
        [HttpPost]
        public void sendMail1([FromBody] CertificateModel cerificate)
        {
            try
            {
                sendMail mail = new sendMail();
                mail.sendmail(cerificate);
            }
            catch (Exception ex)
            {
                ErrorLog.errorLog(ex.Message + " Error From sendMail1 api.");
            }
           
        }
    }
}
