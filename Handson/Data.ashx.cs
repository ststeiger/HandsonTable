using System;
using System.Collections.Generic;
using System.Web;

namespace Handson
{
    /// <summary>
    /// Summary description for Data
    /// </summary>
    public class Data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            // string str = Newtonsoft.Json.JsonConvert.SerializeObject(obj);

            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}