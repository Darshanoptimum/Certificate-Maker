using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.Ajax.Utilities;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Fillter.Log]       
    public class BookController : ApiController
    {
        public static List<book> books = new List<book>();

        
        [Route("api/getall")]
        [HttpGet]
        public List<book> GetAll()
        {
            return books;

        }


        [Route("api/createBook")]
        [HttpPost]
        public HttpResponseMessage createBook(int id,string title, string description)
        {
            book newbook3 = new book(id, title, description);
            books.Add(newbook3);
            return Request.CreateResponse(HttpStatusCode.OK,newbook3);
        }
    }
}
