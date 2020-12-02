using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class LastViewsController : ApiController
    {
        public  List<lastViews> GetLastViews()
        {
            return LastViewsBL.GetLastViews();
        }
    }
}