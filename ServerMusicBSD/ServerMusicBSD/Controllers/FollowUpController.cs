using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using DTO;
using BL;
using System.Net.Mail;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FollowUpController : ApiController
    {
        public void PostFollowUp([FromBody]FollowUpTBL followUp)
        {
            FollowUpBL.AddFollowUp(followUp);
        }
        public void DeleteFollowUp(int followUpId)
        {
            FollowUpBL.DeleteFollowUp(followUpId);
        }
        public List<string> GetSongsNameYouFollowUp(int? userId,string mail)
        {
            return FollowUpBL.GetSongsNameYouFollowUp(userId, mail);
        }
        public List<string> GetArticlesNameYouFollowUp(int? userId, string mail)
        {
            return FollowUpBL.GetArticlesNameYouFollowUp(userId, mail);
        }
        public List<string> GetMailsOfSongFollowUp(int songId)
        {
            return FollowUpBL.GetMailsOfSongFollowUp(songId);
        }
        public List<string> GetMailsOfArticleFollowUp(int articleId)
        {
            return FollowUpBL.GetMailsOfArticleFollowUp(articleId);
        }
        public void sendEmails()
        {
            //SmtpClient smtpClient = new SmtpClient("mail.localhost:4200.com", 25);

            //smtpClient.Credentials = new System.Net.NetworkCredential("info@localhost:4200.com", "myIDPassword");
            //// smtpClient.UseDefaultCredentials = true; // uncomment if you don't want to use the network credentials
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpClient.EnableSsl = true;
            //MailMessage mail = new MailMessage();

            ////Setting From , To and CC
            //mail.From = new MailAddress("info@localhost:4200", "MyWeb Site");
            //mail.To.Add(new MailAddress("info@MyWebsiteDomainName"));
            //mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));

            //smtpClient.Send(mail);
            //MailMessage mailMessage = new MailMessage(new SmtpClient(), , "יעבוד בס''ד!", "it will success only bsd! :)");
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 44368);
            smtpClient.UseDefaultCredentials = true;
            smtpClient.Send("bsd.odaya@gmail.com", "dasi1020@gmail.com", "work only bsd!!", "baruch-hashem:)");
            //smtpClient.Send(mailMessage);
        }
    }
}