using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;
using System.Web.Http.Cors;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace ServerMusicBSD.Controllers
{
    public class SongObj
    {
        public SongsTBL song;
        public string[] singers;
        public string[] tags;
        public ArtistWithJob[] artists;
    }
    public class MailDetails
    {
        [JsonProperty("username")]
        public string username { get; set; }
        [JsonProperty("password")]
        public string password { get; set; }
        [JsonProperty("mailFrom")]
        public string mailFrom { get; set; }
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsController : ApiController
    {
        public List<songsDetails> GetSongs()
        {
            return SongsBL.GetSongs();
        }
        public List<songsDetails> GetSongsIncludePerformances()
        {
            return SongsBL.GetSongsIncludePerformances();
        }
        public songsDetails GetSongById(int songId)
        {
            return SongsBL.GetSongById(songId);
        }
        public List<songsDetails> GetSongsBySinger(string singerName)
        {
            return SongsBL.GetSongsBySinger(singerName);
        }
        public List<songsDetails> GetSongsByAlbum(string albumName)
        {
            return SongsBL.GetSongsByAlbum(albumName);
        }
        public List<songsDetails> GetSongsByTag(string tagName)
        {
            return SongsBL.GetSongsByTag(tagName);
        }
        public List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            return SongsBL.GetSongsByTagOrArtist(name);
        }
        public List<songsDetails> GetSongsByTagId(int tagId)
        {
            return SongsBL.GetSongsByTagId(tagId);
        }
        public SingersDTO GetSingerOfSong(int songId)
        {
            return SongsBL.GetSingerOfSong(songId);
        }
        public List<songsDetails> PostSongsByTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByTags(tagsResponse.tags);
        }
        public List<songsDetails> PostSongsByAllTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByAllTags(tagsResponse.tags);
        }
        public bool PostSong([FromBody] SongObj songObj)
        {
            if (songObj.singers.Length > 0)
            {
                SongsBL.AddSong(songObj.song);
                SongsTBL song = SongsBL.getSongByName(songObj.song.name);
                bool flag = true;
                if (song != null)
                {
                    if(TagsToSongsBL.AddTagsToSong(songObj.tags, song.id)==false)
                        flag=false;
                    if(ArtistsToSongsBL.AddArtistsToSong(songObj.artists, song.id)==false)
                        flag=false;
                    if(SingersToSongsBL.AddSingersToSong(songObj.singers, song.id)==false)
                        flag=false;
                }
                return flag;
            }
            return false;
        }
        [HttpPost]
        public bool AddSong(string username, string password, string email)
        {
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 1 && httpRequest.Params.Count > 0)
            {
                SongObj songObj = Newtonsoft.Json.JsonConvert.DeserializeObject<SongObj>(httpRequest.Params["details"]);
                //SongObj songObj = Newtonsoft.Json.JsonConvert.DeserializeObject<SongObj>(httpRequest.Params[0]);
                //object _songObj = Newtonsoft.Json.JsonConvert.DeserializeObject(httpRequest.Files[0].ContentType);
                //SongObj songObj = _songObj as SongObj;
                if (songObj.singers.Length > 0)
                {
                    SongsBL.AddSong(songObj.song);
                    SongsTBL song = SongsBL.getSongByName(songObj.song.name);
                    if (song != null)
                    {
                        TagsToSongsBL.AddTagsToSong(songObj.tags, song.id);
                        ArtistsToSongsBL.AddArtistsToSong(songObj.artists, song.id);
                        SingersToSongsBL.AddSingersToSong(songObj.singers, song.id);

                        SavingFilesBL.SaveFileWithFormattedName(httpRequest.Files[0], "songs", songObj.singers[0]);
                        SavingFilesBL.SaveFileWithFormattedName(httpRequest.Files[1], "images\\for_songs", songObj.singers[0]);

                        //HttpPostedFile postedFile = httpRequest.Files[0];
                        //var filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                        //        AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        //            "songs\\" + formatFolderName(songObj.singers[0]) + "\\" + postedFile.FileName;
                        //postedFile.SaveAs(filePath);

                        //postedFile = httpRequest.Files[1];
                        //filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                        //        AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        //            "images\\for_songs\\" + formatFolderName(songObj.singers[0]) + "\\" + postedFile.FileName;
                        //postedFile.SaveAs(filePath);

                        if (song.name != null)
                        {
                            //MailDetails mailDetails = Newtonsoft.Json.JsonConvert.DeserializeObject<MailDetails>(httpRequest.Params[1]);
                            ////object _mailDetails = Newtonsoft.Json.JsonConvert.DeserializeObject(httpRequest.Files[3].ContentType);
                            ////mailDetails mailDetails = _mailDetails as mailDetails;
                            SongsBL.sendUpdatingEmailToUsers(username, password,email,
                                song.name, "for_songs\\" + formatFolderName(songObj.singers[0]), httpRequest.Files[1].FileName);
                        }
                        return true;
                    }
                }
            }
            return false;
        }
        private string formatFolderName(string name)
        {
            return name.Replace(" ", "-");
        }
        public void DeleteSong(int songId)
        {
            SongsBL.DeleteSong(songId);
        }
        public List<songsDetails> GetSimilarSongs(int songId)
        {
            return SongsBL.GetSimilarSongs(songId);
        }
        public void PutIncreaseLikeToSong(int songId)
        {
            SongsBL.IncreaseLike(songId);
        }
        public void PutDecreaseLikeToSong(int songId)
        {
            SongsBL.DecreaseLike(songId);
        }
        public List<songsDetails> GetSongsByArtist(string artistName)
        {
            return SongsBL.GetSongsByArtist(artistName);
        }
        public List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            return SongsBL.GetSongsByArtistsAndSingers(name);
        }
        public List<songsDetails> GetPerformances()
        {
            return SongsBL.GetPerformances();
        }
        public List<songsDetails> GetSongsPublishedThisYear()
        {
            return SongsBL.GetSongsPublishedThisYear();
        }
        public void PutViewToSong(int songId)
        {
            SongsBL.AddViewToSong(songId);
        }
        [HttpPut]
        public void UpdateSong([FromBody] SongObj songObj)
        {
            if (songObj != null && songObj.song != null && songObj.tags != null && songObj.singers != null)
            {
                SongsBL.UpdateSong(songObj.song, songObj.singers, songObj.tags, songObj.artists);
            }
        }
        [HttpPost]
        public bool sendEmail(string username, string password, bool isSwitch, string subject, string body)
        {

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                if (isSwitch == true) { password = password.Replace(' ', '+'); }

                mail.From = new MailAddress("bsd.odaya@gmail.com");
                //mail.To.Add("dasi1020@gmail.com");
                mail.CC.Add(new MailAddress("dasi1020@gmail.com"));
                mail.CC.Add(new MailAddress("‫ho.website.pm@gmail.com‬"));
                mail.Subject = subject;
                mail.Body = body;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(username, password);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPost]
        public bool sendMail(string username, string password, string FoldersPath, string imageName)
        {
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                MailMessage newMail = new MailMessage();
                //newMail.To.Add(new MailAddress("you@your.address"));
                newMail.From = new MailAddress("bsd.odaya@gmail.com");
                newMail.CC.Add(new MailAddress("dasi1020@gmail.com"));
                newMail.Subject = "Test Subject";
                newMail.IsBodyHtml = true;

                password = password.Replace(' ', '+');

                var inlineLogo = new LinkedResource(AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                                AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\"
                                + FoldersPath + "\\" + imageName, "image/png");
                inlineLogo.ContentId = Guid.NewGuid().ToString();

                string body = string.Format(@"
            <p>Lorum Ipsum Blah Blah</p>
            <img src=""cid:{0}"" />
            <p>Lorum Ipsum Blah Blah</p>
        ", inlineLogo.ContentId);

                body = string.Format(@"<p style=""text - align: center; ""><span style=""color:#e74c3c;""><strong>עדכון חם :)</strong></span></p><p style=""text-align: center;""><br></p><p style=""text-align: center;""><span style=""font-size:16px;"">חדש באתר - שיר ""נושא תפילה"" של הזמר <strong>איציק דדיה</strong><strong></strong></span><br></p><p style=""text-align: center;""><strong></strong><br></p><p style=""text-align: center;""><a data-cke-saved-href=""http://localhost:4200/song?songId=71"" href=""http://localhost:4200/song?songId=71""><img src=""cid:{0}"" style=""height: 200px;"" data-cke-saved-src=""http://localhost:4200/assets/images/for_songs/%D7%90%D7%99%D7%A6%D7%99%D7%A7-%D7%93%D7%93%D7%99%D7%94/%D7%A0%D7%95%D7%A9%D7%90-%D7%AA%D7%A4%D7%99%D7%9C%D7%94-1920-960x540.jpg""></a><br></p><p style=""text-align: center;""><br></p><p style=""text-align: center;"">עבור לשיר החדש בלחיצה עליו<br></p><p style=""text-align: center;""><br></p><p style=""text-align: center;""><a data-cke-saved-href=""http://localhost:4200"" href=""http://localhost:4200""><span style=""background-color:#f1c40f;"">כנס לאתר</span></a>​​​​​​​<br></p>", inlineLogo.ContentId);
                body = string.Format(@"" + body);
                var view = AlternateView.CreateAlternateViewFromString(body, null, "text/html");
                view.LinkedResources.Add(inlineLogo);
                newMail.AlternateViews.Add(view);

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(username, password);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(newMail);
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPost]
        public bool sendEmail1(string username, string password, bool isSwitch, string subject, string body)
        {
            MailAddress fromAddress = new MailAddress("bsd.odaya@gmail.com");
            MailAddress toAddress = new MailAddress("dasi1020@gmail.com");
            //MailAddress toAddress = new MailAddress("0504117455h@gmail.com");

            if (isSwitch == true) { password = password.Replace(' ', '+'); }

            MailMessage mail = new MailMessage(fromAddress.Address, toAddress.Address);
            mail.Subject = subject;
            mail.Body = body;

            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 20000;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential(username, password);

            try
            {
                client.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}