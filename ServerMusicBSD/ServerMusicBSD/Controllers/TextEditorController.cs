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
            title = title.Trim();
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
                    string fileName = GetValidFileName(Con.title);
                    article.date = DateTime.Now;
                    string path = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                        AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\text\\articles_content\\"
                        + fileName + ".txt";
                    if (!File.Exists(path))
                    {
                        // Create a file to write to.
                        using (StreamWriter sw = File.CreateText(path))
                        {
                            sw.WriteLine(Con.content);
                        }
                    }
                    else {
                        int i = 0;
                        do
                        {
                            i++;
                            path = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                            AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\text\\articles_content\\"
                            + fileName + "-" + i + ".txt";
                        } while (File.Exists(path));
                        using (StreamWriter sw = File.CreateText(path))
                        {
                            sw.WriteLine(Con.content);
                        }
                        fileName = fileName + "-" + i;
                    }
                    article.content = "articles_content/" + fileName + ".txt";
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
        public string GetValidFileName(string value)
        {
            value = value.Trim();
            int j = 0;
            for (int i = j; i < value.Length; i++)
            {
                for (; j < value.Length && IsValid(value[j]); j++) ;
                if (j + 1 < value.Length)
                {
                    value = value[j] == ' ' ? value.Substring(0, j) + "-" + value.Substring(j + 1) :
                    value.Substring(0, j) + "" + value.Substring(j + 1);
                }
                else
                {
                    value = value.Substring(0, j);
                }
            }
            return value;
        }
        public bool IsValid(char c)
        {
            if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') ||
                (c >= '0' && c <= '9') || (c >= 'א' && c <= 'ת') ||
                c == '-' || c == '_')
                return true;
            return false;
        }
    }
}