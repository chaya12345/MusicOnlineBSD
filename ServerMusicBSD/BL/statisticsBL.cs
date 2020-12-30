using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class JanerStatistic
    {
        public string janer { get; set; }
        public double percent { get; set; }
    }
    public class SingersSearchingStatistic
    {
        public string singerName { get; set; }
        public long count { get; set; }
    }
    public class Statistics‏BL
    {
        public static string GetSongJaner(SongsTBL song)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToSongsTBL> list = et.TagsToSongsTBL.Where(t => t != null && t.songId == song.id).ToList();
            foreach (TagsToSongsTBL tag in list)
            {
                TagsForSongsTBL tagsForSongsTBL = et.TagsForSongsTBL.Where(t => t != null && t.id == tag.tagId && t.typeId == 1).FirstOrDefault();
                if (tagsForSongsTBL != null)
                    return tagsForSongsTBL.name;
            }
            return null;
        }
        public static List<JanerStatistic> GeneralAmountOfViews()
        {
            long? allViews = 0;
            long? israeli‏ = 0;
            long? hasidic‏ = 0;
            long? oriental‏ = 0;
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.ToList();
            if (list == null)
                return null;
            foreach (SongsTBL song in list)
            {
                if (song != null && song.count_views > 0)
                {
                    allViews += song.count_views;
                    string janer = GetSongJaner(song);
                    switch (janer)
                    {
                        case null: break;
                        case "מזרחי":
                            oriental‏ += song.count_views;
                            break;
                        case "חסידי":
                            hasidic += song.count_views;
                            break;
                        case "ישראלי":
                            israeli += song.count_views;
                            break;
                        default: break;
                    }
                }

            }
            List<JanerStatistic> janerStatistic = new List<JanerStatistic>();
            janerStatistic.Add(new JanerStatistic() { janer = "oriental", percent =Convert.ToDouble(oriental * 100 / allViews)});
            janerStatistic.Add(new JanerStatistic() { janer = "hasidic", percent = Convert.ToDouble(hasidic * 100 / allViews) });
            janerStatistic.Add(new JanerStatistic() { janer = "israeli", percent = Convert.ToDouble(israeli * 100 / allViews) });
            janerStatistic.Add(new JanerStatistic() { janer = "other", percent = Convert.ToDouble(100-(oriental * 100 / allViews- hasidic * 100 / allViews- israeli * 100 / allViews)) });
            return janerStatistic;
        }
        public static List<SingersSearchingStatistic> SeveralSearchesForSinger()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersTBL> list = et.SingersTBL.OrderByDescending(s => s.searchings).ToList();
            List<SingersSearchingStatistic> statistic = new List<SingersSearchingStatistic>();
            foreach (SingersTBL singer in list)
            {
                if (singer != null && singer.searchings > 0)
                {
                    statistic.Add(new SingersSearchingStatistic()
                    {
                        singerName = singer.name,
                        count = Convert.ToInt64(singer.searchings)
                    });
                }
            }
            return statistic;
        }
    }
}
    
