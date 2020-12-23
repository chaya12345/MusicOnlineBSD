using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data.Entity.SqlServer;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Net.Mail;

namespace BL
{

    public class TagsResponse
    {
        public List<string> tags;
    }
    public class SimilarSongs
    {
        public int songId;
        public int numberOfMatchingTags;
    }
    enum eNecessityLevel { HARD, FLEXIBLE };
    struct Necessity
    {
        public eNecessityLevel level { get; set; }
        public string tag { get; set; }
        public Necessity(eNecessityLevel level, string tag)
        {
            this.level = level;
            this.tag = tag;
        }
    }
    public class SongsBL
    {
        static List<Necessity> necessity = new List<Necessity>() {
            new Necessity(eNecessityLevel.HARD, "ג'אנר"),
            new Necessity(eNecessityLevel.HARD, "מקצב"),
            new Necessity(eNecessityLevel.HARD, "ווקאלי"),
            new Necessity(eNecessityLevel.FLEXIBLE, "סגנון"),
            new Necessity(eNecessityLevel.FLEXIBLE, "נושא")
        };
        public static List<songsDetails> GetSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(s => s != null && s.isPerformance == false).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static SongsTBL getSongByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.SongsTBL.Where(s => s != null && s.name == name).FirstOrDefault();
        }
        public static List<songsDetails> GetSongsIncludePerformances()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(s => s != null).ToList();
            if (list != null)
            {
                return Casts.ToSongsDTO.GetSongs(list);
            }
            return null;
        }
        public static songsDetails GetSongById(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song1 = et.SongsTBL.Where(song => song.id == songId).FirstOrDefault();
            if (song1 != null)
                return Casts.ToSongsDTO.GetSongWithSingerName(song1);
            return null;
        }
        public static SingersDTO GetSingerOfSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToSongsTBL sts = et.SingersToSongsTBL.Where(s => s != null && s.songId == songId).FirstOrDefault();
            if (sts == null)
                return null;
            SingersTBL singer = et.SingersTBL.Where(si => si != null && si.id == sts.singerId).FirstOrDefault();
            return Casts.ToSingersDTO.GetSinger(singer);
        }
        public static List<songsDetails> GetSongsBySinger(string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singer = et.SingersTBL.Where(s => s != null && s.name == singerName).FirstOrDefault();
            if (singer == null)
                return null;
            List<SingersToSongsTBL> songsOfSinger = et.SingersToSongsTBL
                .Where(sts => sts != null && sts.singerId == singer.id).ToList();
            List<songsDetails> songs = new List<songsDetails>();
            foreach (SingersToSongsTBL sts in songsOfSinger)
            {
                songsDetails currentSong = et.songsDetails.Where(s => s != null && s.id == sts.songId).FirstOrDefault();
                if (currentSong != null)
                    songs.Add(currentSong);
            }
            return songs;
        }
        public static List<songsDetails> GetSongsByAlbum(string albumName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            long id = 0;
            AlbumsTBL currentAlbum = et.AlbumsTBL.Where(a => a != null && a.name == albumName).FirstOrDefault();
            if (currentAlbum != null)
            {
                id = currentAlbum.id;
            }
            List<SongsTBL> list = et.SongsTBL.Where(a => a != null && a.albumId == id).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTag(string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            var tag = et.TagsForSongsTBL.Where(t => t != null && t.name == tagName).FirstOrDefault();
            if (tag != null)
            {
                int tagId = tag.id;
                List<int?> songsId = et.TagsToSongsTBL.Where(tagToSong => tagToSong != null && tagToSong.tagId == tagId)
                    .Select(t => t.songId).ToList();
                List<SongsTBL> songsIncludeTag = new List<SongsTBL>();
                foreach (int? songId in songsId)
                {
                    SongsTBL s = et.SongsTBL.Where(song => song != null && song.id == songId && song.isPerformance == false).FirstOrDefault();
                    if (s != null)
                        songsIncludeTag.Add(s);
                }
                if (songsIncludeTag != null)
                    return Casts.ToSongsDTO.GetSongs(songsIncludeTag);
            }
            return null;
        }
        public static List<songsDetails> GetSongsByTag(List<songsDetails> songs, string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> suitableSongs = new List<songsDetails>();
            TagsForSongsDTO tag = Casts.ToTagsDTO.GetTagsForSong(et.TagsForSongsTBL.Where(t => t != null && t.name == tagName).FirstOrDefault());
            if (tag == null || songs == null)
                return null;
            foreach (songsDetails song in songs)
            {
                List<TagsForSongsDTO> tags = Casts.ToTagsDTO.GetTagsForSongs(TagsToSongsBL.GetTagsToSong(song.id).ToList());
                if (tags.Where(t => t != null && t.id == tag.id).FirstOrDefault() != null)
                    suitableSongs.Add(song);
            }
            if (suitableSongs != null)
                return suitableSongs;
            return null;
        }
        public static List<songsDetails> GetSongsByTagId(int tagId)
        {
            return GetSongsByTag(TagsBL.GetTagNameForSong(tagId));
        }
        public static List<songsDetails> GetSongsByTags(List<string> tags)
        {
            if (tags == null)
                return null;
            List<songsDetails> suitableSongs = new List<songsDetails>();
            foreach (string tag in tags)
            {

                List<songsDetails> list = GetSongsByTag(tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            if (suitableSongs != null)
                return suitableSongs;
            return null;
        }
        public static List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> songs = new List<songsDetails>();
            if (et.TagsForSongsTBL.Where(tag => tag.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsByTag(name);
                if (list != null)
                    songs.AddRange(list);
            }
            if (et.ArtistsTBL.Where(artist => artist.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsByArtist(name);
                if (list != null)
                    songs.AddRange(list);
            }
            if (et.SingersTBL.Where(singer => singer.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsBySinger(name);
                if (list != null)
                    songs.AddRange(list);
            }
            songs = clearDuplicate(songs);
            return songs;
        }
        public static List<songsDetails> OrderSongsByTags(List<songsDetails> songs, List<string> tags)
        {
            List<songsDetails> suitableSongs = new List<songsDetails>();
            List<songsDetails> nonSuitableSongs = new List<songsDetails>();
            if (tags == null || songs == null)
                return null;
            foreach (string tag in tags)
            {
                List<songsDetails> list = GetSongsByTag(songs, tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            foreach (songsDetails song in songs)
            {
                if (!suitableSongs.Contains(song) && song != null)
                    nonSuitableSongs.Add(song);
            }
            List<songsDetails> orderSongs = new List<songsDetails>();
            if (suitableSongs != null && nonSuitableSongs != null)
            {
                orderSongs.AddRange(suitableSongs);
                orderSongs.AddRange(nonSuitableSongs);
                orderSongs = clearDuplicate(orderSongs);
                return orderSongs;
            }
            return null;
        }
        public static List<songsDetails> clearDuplicate(List<songsDetails> songs)
        {
            List<songsDetails> clearList = new List<songsDetails>();
            if (songs == null)
                return null;
            foreach (songsDetails song in songs)
            {
                if (clearList.Where(s => s != null && song != null && s.id == song.id).FirstOrDefault() == null)
                {
                    clearList.Add(song);
                    bool b = clearList.Contains(song);
                }
            }
            if (clearList != null)
                return clearList;
            return null;
        }
        public static List<songsDetails> GetSongsByTags(List<songsDetails> songs, List<string> tags)
        {
            List<songsDetails> suitableSongs = new List<songsDetails>();
            if (songs == null || tags == null)
                return null;
            foreach (string tag in tags)
            {
                List<songsDetails> list = GetSongsByTag(songs, tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            suitableSongs = clearDuplicate(suitableSongs);
            return suitableSongs;
        }
        public static List<songsDetails> GetSongsByAllTags(List<string> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> songsIncludeAllTags = new List<SongsTBL>();
            if (tags != null)
            {
                List<SongsTBL> songsList = et.SongsTBL.Where(s => s != null && s.isPerformance == false).ToList();
                if (songsList == null)
                    return null;
                foreach (SongsTBL song in songsList)
                {
                    List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(song.id);
                    if (tagsToSong == null)
                        return null;
                    bool isContain = true;
                    foreach (var tagName in tags)
                    {
                        TagsForSongsTBL currntTag = et.TagsForSongsTBL.Where(t => t != null && t.name == tagName).FirstOrDefault();
                        int tagId = 0;
                        if (currntTag != null)
                        {
                            tagId = currntTag.id;
                        }
                        if (tagsToSong.Select(tag => tag.tagId).Contains(tagId) == false)
                        {
                            isContain = false;
                            break;
                        }
                    }
                    if (isContain)
                        songsIncludeAllTags.Add(song);
                }
            }
            return Casts.ToSongsDTO.GetSongs(songsIncludeAllTags);
        }
        public static List<songsDetails> GetSongsByAllTypes(List<TagsForSongsDTO>[] tags)
        {
            List<songsDetails> songs = new List<songsDetails>();
            songs.AddRange(GetSongsByTags(tags[0].Select(tag => tag.name).ToList()));
            for (int i = 1; tags[i] != null && tags[i].Count > 0; i++)
            {
                songs = GetSongsByTags(songs, tags[i].Select(tag => tag.name).ToList());
            }
            return songs;
        }
        public static List<songsDetails> GetPerformances()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(song => song != null && song.isPerformance == true).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static void AddSong(SongsTBL song)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (song == null)
                    return;
                if (song.isPerformance == null)
                    song.isPerformance = false;
                song.date = DateTime.Now;
                song.count_like = 0;
                song.count_views = 0;
                et.SongsTBL.Add(song);
                et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static void DeleteSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == songId).FirstOrDefault();
            if (song != null)
            {
                et.SongsTBL.Remove(song);
                et.SaveChanges();
            }
        }
        public static void IncreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null || song.count_like == 0)
                {
                    song.count_like = 1;
                    et.SaveChanges();
                }
                else
                {
                    song.count_like++;
                    et.SaveChanges();
                }
            }
        }
        public static void DecreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null || song.count_like == 0)
                {
                    song.count_like = 0;
                    et.SaveChanges();
                }
                else
                {
                    song.count_like--;
                    et.SaveChanges();
                }
            }
        }
        public static List<songsDetails> clearVocalSongs(List<songsDetails> songs)
        {
            List<songsDetails> nonVocalSongs = new List<songsDetails>();
            foreach (songsDetails song in songs)
            {
                if (song != null)
                {
                    List<string> tags = TagsToSongsBL.GetTagsNamesToSong(song.id);
                    if (tags != null && !tags.Contains("ווקאלי") && !tags.Contains("אקפלה"))
                    {
                        nonVocalSongs.Add(song);
                    }
                }
            }
            if (nonVocalSongs != null)
                return nonVocalSongs;
            return null;
        }
        public static List<songsDetails> GetSimilarSongs(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsForSongsDTO> tags = TagsBL.GetTagsForSongs(TagsToSongsBL.GetTagsToSong(songId));
            List<songsDetails> possibleSongs = new List<songsDetails>();
            List<songsDetails> songs = new List<songsDetails>();
            List<TagsForSongsDTO>[] hardTags = new List<TagsForSongsDTO>[necessity.Count];
            List<TagsForSongsDTO> flexibleTags = new List<TagsForSongsDTO>();
            int index = 0;
            foreach (Necessity nec in necessity)
            {
                TagsForSongsDTO tagType = new TagsForSongsDTO();
                List<TagsForSongsDTO> tagsType = new List<TagsForSongsDTO>();
                if (nec.level == eNecessityLevel.HARD)
                {
                    tagsType = TagsTypesBL.GetTagByType(tags, nec.tag);
                    if (tagType != null)
                    {
                        hardTags[index] = new List<TagsForSongsDTO>();
                        hardTags[index++].AddRange(tagsType);
                    }
                }
                else if (nec.level == eNecessityLevel.FLEXIBLE)
                {
                    tagType = TagsTypesBL.GetTagByType(tags, nec.tag).FirstOrDefault();
                    if (tagType != null) { flexibleTags.Add(tagType); }
                }
            }
            possibleSongs.AddRange(GetSongsByAllTypes(hardTags));
            if (tags.Where(tag => tag.name == "ווקאלי" || tag.name == "אקפלה").FirstOrDefault() == null)
            {
                possibleSongs = clearVocalSongs(possibleSongs);
            }
            songs.AddRange(OrderSongsByTags(possibleSongs, flexibleTags.Select(tag => tag.name).ToList()));
            bool isFound = songs.Remove(songs.Where(song => song.id == songId).FirstOrDefault());
            return songs;
        }
        public static List<songsDetails> GetSongsByArtist(string artistName)
        {

            MusicOnlineEntities et = new MusicOnlineEntities();
            int artistId = et.ArtistsTBL.Where(a => a != null && a.name == artistName).FirstOrDefault().id;
            List<ArtistsToSongsTBL> artistsToSongs = et.ArtistsToSongsTBL.Where(a => a != null && a.artistId == artistId).ToList();
            if (artistsToSongs != null)
            {
                List<SongsTBL> songs = new List<SongsTBL>();
                foreach (ArtistsToSongsTBL item in artistsToSongs)
                {
                    SongsTBL sta = et.SongsTBL.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                    if (sta != null)
                    {
                        songs.Add(sta);
                    }
                }
                if (songs != null)
                    return Casts.ToSongsDTO.GetSongs(songs);

            }
            return null;
        }
        public static List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> list = new List<songsDetails>();
            if (et.SingersTBL.Where(singer => singer != null && singer.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list1 = GetSongsBySinger(name);
                if (list1 != null)
                    list.AddRange(list1);
            }
            if (et.ArtistsTBL.Where(artist => artist != null && artist.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list1 = GetSongsByArtist(name);
                if (list1 != null)
                    list.AddRange(list1);
            }
            list = clearDuplicate(list);
            return list;
        }
        public static string ToJewishDateString(DateTime value, string format)
        {
            var ci = CultureInfo.CreateSpecificCulture("he-IL");
            ci.DateTimeFormat.Calendar = new HebrewCalendar();
            return value.ToString(format, ci);
        }
        public static List<songsDetails> GetSongsPublishedThisYear()
        {
            string year = ToJewishDateString(DateTime.Today, "D");
            if (year.Contains("תשרי") || year.Contains("חשון"))
            {
                year = ToJewishDateString(DateTime.Today.AddDays(-70), "D");
            }
            year = year.Substring(year.IndexOf('ת'));
            Console.WriteLine(year);
            List<songsDetails> songs = GetSongs();
            if (songs == null)
                return null;
            List<songsDetails> result = new List<songsDetails>();
            foreach (songsDetails item in songs)
            {
                if (item != null && item.date != null)
                {
                    if (ToJewishDateString(item.date.Value, "D").Contains(year))
                        result.Add(item);
                }
            }
            return result != null ? result : null;
        }
        public static void AddViewToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == songId).FirstOrDefault();
            if (song == null)
                return;
            if (song.count_views == null)
                song.count_views = 1;
            else
                song.count_views++;
            song.lastViewingDate = DateTime.Now;
            et.SaveChanges();
        }
        public static void UpdateSong(SongsTBL song, string[] singers, string[] tags, ArtistWithJob[] artists)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (song == null)
                return;
            SongsTBL songTBL = et.SongsTBL.Where(s => s.id == song.id).FirstOrDefault();
            songTBL.name = song.name;
            songTBL.title = song.title;
            songTBL.subtitle = song.subtitle;
            songTBL.image_location = song.image_location;
            songTBL.file_location = song.file_location;
            songTBL.content = song.content;
            songTBL.isPerformance = song.isPerformance;
            et.SaveChanges();

            List<SingersTBL> singersList = new List<SingersTBL>();
            foreach (string item in singers)
            {
                SingersTBL singerTBL = et.SingersTBL.Where(s => s.name == item).FirstOrDefault();
                if (singerTBL != null)
                    singersList.Add(singerTBL);
            }
            SingersToSongsBL.UpdateSingersToSong(songTBL.id, singersList);

            List<TagsForSongsTBL> tagsList = new List<TagsForSongsTBL>();
            foreach (string item in tags)
            {
                TagsForSongsTBL tagTBL = et.TagsForSongsTBL.Where(t => t.name == item).FirstOrDefault();
                if (tagTBL != null)
                    tagsList.Add(tagTBL);
            }
            TagsToSongsBL.UpdateTagsToSong(songTBL.id, tagsList);

            if (artists != null)
            {
                List<ArtistsToSongsTBL> artistsList = new List<ArtistsToSongsTBL>();
                foreach (ArtistWithJob item in artists)
                {
                    ArtistsTBL art = et.ArtistsTBL.Where(a => a.name == item.artistName).FirstOrDefault();
                    JobTBL job = et.JobTBL.Where(j => j.name == item.jobName).FirstOrDefault();
                    if (art != null && job != null)
                    {
                        ArtistsToSongsTBL artistWithJobTBL = et.ArtistsToSongsTBL.Where(
                            a => a.artistId == art.id && a.jobId == job.id).FirstOrDefault();
                        if (artistWithJobTBL != null)
                            artistsList.Add(artistWithJobTBL);
                    }
                }
                ArtistsToSongsBL.UpdateArtistsToSong(songTBL.id, artistsList);
            }

        }
        public static bool sendUpdatingEmailToUsers(string username, string password, string songName, string Folder, string image)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            songsDetails song = et.songsDetails.Where(s => s != null && s.name == songName).FirstOrDefault();
            if (song == null)
                return false;
            List<string> mails = SubscriptionBL.GetMailsOfSingerSubscriptionToSong(song.id);
            foreach (string mail in mails){
                sendUpdatingEmail(username, password, Folder, image, mail, song.name, song.singerName);
            }
            return true;
        }
        public static bool sendUpdatingEmail(string username, string password, string FoldersPath, 
            string imageName, string mailAddress, string songName, string singerName)
        {
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                MailMessage newMail = new MailMessage();
                newMail.From = new MailAddress("bsd.odaya@gmail.com");
                newMail.CC.Add(new MailAddress(mailAddress));
                newMail.Subject = "חדש במיוזיק אונליין »»»»";
                newMail.IsBodyHtml = true;

                password = password.Replace(' ', '+');

                var inlineLogo = new LinkedResource(AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                                AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\"
                                + FoldersPath + "\\" + imageName, "image/png");
                inlineLogo.ContentId = Guid.NewGuid().ToString();

                string body = string.Format(@"<p style=""text - align: center; ""><span style=""color:#e74c3c;""><strong style=""text-align: center;"">עדכון חם :)</strong></span></p><p style=""text-align: center;""><br></p><p style=""text-align: center;""><span style=""font-size:16px;"">חדש באתר - שיר '" + songName + "' של הזמר <strong>" + singerName + "</strong><strong></strong></span><br></p><p style=""text-align: center;""><strong></strong><br></p><p style=""text-align: center;""><a data-cke-saved-href=""http://localhost:4200/song?songId=71"" href=""http://localhost:4200/song?songId=71""><img src=""cid:{0}"" style=""height: 200px;"" data-cke-saved-src=""http://localhost:4200/assets/images/for_songs/%D7%90%D7%99%D7%A6%D7%99%D7%A7-%D7%93%D7%93%D7%99%D7%94/%D7%A0%D7%95%D7%A9%D7%90-%D7%AA%D7%A4%D7%99%D7%9C%D7%94-1920-960x540.jpg""></a><br></p><p style=""text-align: center;""><br></p><p style=""text-align: center;"">עבור לשיר החדש בלחיצה עליו<br></p><p style=""text-align: center;""><br></p><p style=""text-align: center;""><a data-cke-saved-href=""http://localhost:4200"" href=""http://localhost:4200""><span style=""background-color:#f1c40f;"">כנס לאתר</span></a>​​​​​​​<br></p>", inlineLogo.ContentId);
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
    }
}
