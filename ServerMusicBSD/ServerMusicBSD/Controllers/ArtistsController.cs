using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;
using System.Web.Http.Cors;
using System.Web.Mail;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ArtistsController : ApiController
    {
        [Obsolete]
        public bool sendMail()
        {
            MailMessage msg = new MailMessage();

            msg.To = "bsd.odaya@gmail.com";
            msg.From = "no-reply@gmail.com";
            msg.From = "dasi1020@gmail.com";
            msg.Subject = "test";
            //msg.BodyFormat = MailFormat.Html
            msg.BodyFormat = MailFormat.Text;
            msg.Body = "hi";

            SmtpMail.SmtpServer = "localhost";
            try
            {
                SmtpMail.Send(msg);
                return true;
            }
            catch {
                return false;
            }
            msg = null;
        }
        public void PostArtist([FromBody] ArtistsTBL artistsName)
       {
            ArtistsBL.AddArtistName(artistsName);
       }
       public List<ArtistsDTO> GetArtists()
       {
            return ArtistsBL.GetArtistsNames();
       }


    }
}