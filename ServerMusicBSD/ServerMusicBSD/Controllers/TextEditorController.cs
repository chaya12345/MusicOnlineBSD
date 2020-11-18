using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class Content {
        public string PageContent { get; set; }
        public string PageContentTitle { get; set; }
    }
    public class Response
    {
        public string Status { get; set; }
        public string Message { get; set; }
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TextEditorController : ApiController
    {
        //public static System.IO.StreamWriter CreateText(string path);
        public void r(string title, string msg)
        {
            title = title.Replace(" ", "-");
            title = title.Replace(".", "-");
            title = title.Replace("&", "-");
            //string path = @"c:\bsd\" + title + ".txt";
            //string path = ".\\" + title + ".txt";
            //string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            //                  title + ".txt");
            string path = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server")-1) + "\\DAL\\src\\text\\for_articles\\" + title + ".txt";
            if (!File.Exists(path))
            {
                // Create a file to write to.
                using (StreamWriter sw = File.CreateText(path))
                {
                    sw.WriteLine(msg);
                }
            }
        }
        [HttpPost]
        public object saveconetnt(/*Content*/ArticlesTBL Con)
        {
            try
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                ArticlesTBL article = new ArticlesTBL();
                if (Con != null)
                {
                    //article.content = Con.PageContent;
                    //article.title = Con.PageContentTitle;
                    article.title = Con.title != null ? Con.title : "";
                    Con.title = Con.title.Replace(" ", "-");
                    Con.title = Con.title.Replace(".", "-");
                    Con.title = Con.title.Replace("&", "-");
                    article.content = "articles_content/" + Con.title;
                    article.date = DateTime.Now;
                    string path = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                        AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\text\\articles_content\\"
                        + Con.title + ".txt";
                    if (!File.Exists(path))
                    {
                        // Create a file to write to.
                        using (StreamWriter sw = File.CreateText(path))
                        {
                            sw.WriteLine(Con.content);
                        }
                    }
                    et.ArticlesTBL.Add(article);
                    et.SaveChanges();
                    return new Response
                    { Status = "Success", Message = "SuccessFully Saved." };
                }
            }
            catch { throw; }
            return new Response
            { Status = "Error", Message = "Invalid Data." };
        }
        [Route("Api/Contents/Getpagdata")]
        [HttpGet]
        public object Getpagecontent()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ArticlesTBL.ToList();
        }
        //[Route("Api/Login/")]  
        [HttpGet]
        public object GetpagecontentById(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            var obj = et.ArticlesTBL.Where(x => x.id == id).ToList().FirstOrDefault();
            return obj;
        }
    }
}