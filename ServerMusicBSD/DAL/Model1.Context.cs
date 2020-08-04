﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MusicOnlineEntities : DbContext
    {
        public MusicOnlineEntities()
            : base("name=MusicOnlineEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AlbumsTBL> AlbumsTBL { get; set; }
        public virtual DbSet<ArticlesBTL> ArticlesBTL { get; set; }
        public virtual DbSet<PlaylistsTBL> PlaylistsTBL { get; set; }
        public virtual DbSet<ReportsTBL> ReportsTBL { get; set; }
        public virtual DbSet<ResponsesTBL> ResponsesTBL { get; set; }
        public virtual DbSet<SingersTBL> SingersTBL { get; set; }
        public virtual DbSet<SongsTBL> SongsTBL { get; set; }
        public virtual DbSet<SongsToPlaylistsTBL> SongsToPlaylistsTBL { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TagsTBL> TagsTBL { get; set; }
        public virtual DbSet<UsersTBL> UsersTBL { get; set; }
    
        [DbFunction("MusicOnlineEntities", "getByTag")]
        public virtual IQueryable<getByTag_Result> getByTag(string tag)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("tag", tag) :
                new ObjectParameter("tag", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<getByTag_Result>("[MusicOnlineEntities].[getByTag](@tag)", tagParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "getPlaylists")]
        public virtual IQueryable<getPlaylists_Result> getPlaylists(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<getPlaylists_Result>("[MusicOnlineEntities].[getPlaylists](@userId)", userIdParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "getSongs")]
        public virtual IQueryable<getSongs_Result> getSongs()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<getSongs_Result>("[MusicOnlineEntities].[getSongs]()");
        }
    
        [DbFunction("MusicOnlineEntities", "searchByAlbum")]
        public virtual IQueryable<searchByAlbum_Result> searchByAlbum(string albumName)
        {
            var albumNameParameter = albumName != null ?
                new ObjectParameter("albumName", albumName) :
                new ObjectParameter("albumName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<searchByAlbum_Result>("[MusicOnlineEntities].[searchByAlbum](@albumName)", albumNameParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "searchBySinger")]
        public virtual IQueryable<searchBySinger_Result> searchBySinger(string singerName)
        {
            var singerNameParameter = singerName != null ?
                new ObjectParameter("singerName", singerName) :
                new ObjectParameter("singerName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<searchBySinger_Result>("[MusicOnlineEntities].[searchBySinger](@singerName)", singerNameParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        [DbFunction("MusicOnlineEntities", "getTagsOfSong")]
        public virtual IQueryable<getTagsOfSong_Result> getTagsOfSong(Nullable<int> songId)
        {
            var songIdParameter = songId.HasValue ?
                new ObjectParameter("songId", songId) :
                new ObjectParameter("songId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<getTagsOfSong_Result>("[MusicOnlineEntities].[getTagsOfSong](@songId)", songIdParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "getSingers")]
        public virtual IQueryable<string> getSingers()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<string>("[MusicOnlineEntities].[getSingers]()");
        }
    }
}
