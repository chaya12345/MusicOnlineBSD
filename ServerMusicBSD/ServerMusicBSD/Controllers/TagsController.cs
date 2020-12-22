using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using DAL;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TagsController : ApiController
    {

        public List<TagsForSongsDTO> GetTagsForSongs()
        {
            return TagsBL.GetTagsForSongs();
        }
        public void PostTagForSong([FromBody] TagsForSongsTBL tag)
        {
            TagsBL.AddTagForSong(tag);
        }
        public  string GetTagNameForSong(int id)
        {
            return TagsBL.GetTagNameForSong(id);
        }
        [HttpPut]
        public void UpdateTagForSong([FromBody]TagsForSongsTBL tag)
        {
            TagsBL.UpdateTagForSong(tag);
        }
        public void DeleteTagForSong(int tagForSongId)
        {
            TagsBL.DeleteTagForSong(tagForSongId);
        }
        //------------------------------------------------------------------------
        //------------------------------------------------------------------------
        //------------------------------------------------------------------------          
        public List<TagsForArticlesDTO> GetTagsForArticles()
        {
            return TagsBL.GetTagsForArticles();
        }
        public void PostTagForArticle([FromBody] TagsForArticlesTBL tag)
        {
            TagsBL.AddTagForArticle(tag);
        }
        public string GetTagNameForArticle(int id)
        {
            return TagsBL.GetTagNameForArticle(id);
        }
        [HttpPut]
        public void UpdateTagForArticle([FromBody]TagsForArticlesTBL tag)
        {
            TagsBL.UpdateTagForArticle(tag);
        }
        public void DeleteTagForArticle(int tagForArticleId)
        {
            TagsBL.DeleteTagForArticle(tagForArticleId);
        }
    }
}