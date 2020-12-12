using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToTagsDTO
    {
        public static TagsForArticlesDTO GetTagsForArticle(TagsForArticlesTBL tagsForArticle)
        {
            if (tagsForArticle == null)
                return null;
            TagsForArticlesDTO newTag = new TagsForArticlesDTO();
            newTag.id = tagsForArticle.id;
            newTag.name = tagsForArticle.name;
            return newTag;
        }
        public static List<TagsForArticlesDTO> GetTagsForArticles(List<TagsForArticlesTBL> tagsForArticles)
        {
            if (tagsForArticles == null)
                return null;
            List<TagsForArticlesDTO> list = new List<TagsForArticlesDTO>();
            TagsForArticlesDTO newTag = new TagsForArticlesDTO();
            foreach (TagsForArticlesTBL item in tagsForArticles)
            {
                newTag = GetTagsForArticle(item);
                if (newTag != null)
                    list.Add(newTag);
            }
            return list;
        }
        public static TagsForSongsDTO GetTagsForSong(TagsForSongsTBL tagsForSong)
        {
            if (tagsForSong == null)
                return null;
            TagsForSongsDTO newTag = new TagsForSongsDTO();
            newTag.id = tagsForSong.id;
            newTag.name = tagsForSong.name;
            newTag.typeId = tagsForSong.typeId;
            return newTag;
        }
        public static List<TagsForSongsDTO> GetTagsForSongs(List<TagsForSongsTBL> tagsForSongs)
        {
            if (tagsForSongs == null)
                return null;
            List<TagsForSongsDTO> list = new List<TagsForSongsDTO>();
            TagsForSongsDTO newTag = new TagsForSongsDTO();
            foreach (TagsForSongsTBL item in tagsForSongs)
            {
                newTag = GetTagsForSong(item);
                if (newTag != null)
                    list.Add(newTag);
            }
            return list;
        }
        public static TagsForSongsDTO GetTagsForSong(TagsToSongsDTO tagsToSong)
        {
            if (tagsToSong == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsForSongsTBL tag = et.TagsForSongsTBL.Where(t => t != null && t.id == tagsToSong.tagId).FirstOrDefault();
            return GetTagsForSong(tag);
        }
        public static List<TagsForSongsDTO> GetTagsForSongs(List<TagsToSongsDTO> tagsToSongs)
        {
            if (tagsToSongs == null)
                return null;
            List<TagsForSongsDTO> list = new List<TagsForSongsDTO>();
            
            foreach (TagsToSongsDTO item in tagsToSongs)
            {
                TagsForSongsDTO tag = GetTagsForSong(item);
                if (tag != null)
                    list.Add(tag);
            }
            return list;
        }
        public static TagsForArticlesDTO GetTagsForArticle(TagsToAtriclesDTO tagsToAtricle)
        {
            if (tagsToAtricle == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsForArticlesTBL tag = et.TagsForArticlesTBL.Where(t => t != null && t.id == tagsToAtricle.tagId).FirstOrDefault();
            return GetTagsForArticle(tag);
        }
        public static List<TagsForArticlesDTO> GetTagsForArticles(List<TagsToAtriclesDTO> tagsToAtricles)
        {
            if (tagsToAtricles == null)
                return null;
            List<TagsForArticlesDTO> list = new List<TagsForArticlesDTO>();

            foreach (TagsToAtriclesDTO item in tagsToAtricles)
            {
                TagsForArticlesDTO tag = GetTagsForArticle(item);
                if (tag != null)
                    list.Add(tag);
            }
            return list;
        }
    }
}
