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

namespace ServerMusicBSD.Controllers
{
    public class SongObj
    {
        public SongsTBL song;
        public string[] singers;
        public string[] tags;
        public ArtistWithJob[] artists;
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
        public void PostSong([FromBody] SongObj songObj)
        {
            if (songObj.singers.Length > 0)
            {
                SongsBL.AddSong(songObj.song);
                SongsTBL song = SongsBL.getSongByName(songObj.song.name);
                if (song != null)
                {
                    TagsToSongsBL.AddTagsToSong(songObj.tags, song.id);
                    ArtistsToSongsBL.AddArtistsToSong(songObj.artists, song.id);
                    SingersToSongsBL.AddSingersToSong(songObj.singers, song.id);
                }
            }
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
        public void UpdateSong([FromBody]SongObj songObj)
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
            catch {
                return false;
            }
        }
        [HttpPost]
        public bool sendEmail1(string username, string password, bool isSwitch, string subject, string body)
        {
            MailAddress fromAddress = new MailAddress("bsd.odaya@gmail.com");
            MailAddress toAddress = new MailAddress("dasi1020@gmail.com");
            //MailAddress toAddress = new MailAddress("0504117455h@gmail.com");

            if (isSwitch == true) { password = password.Replace(' ','+'); }

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