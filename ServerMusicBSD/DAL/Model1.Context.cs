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
        public virtual DbSet<ArticlesTBL> ArticlesTBL { get; set; }
        public virtual DbSet<ArtistsTBL> ArtistsTBL { get; set; }
        public virtual DbSet<ArtistsToSongsTBL> ArtistsToSongsTBL { get; set; }
        public virtual DbSet<CommitsToArticlesTBL> CommitsToArticlesTBL { get; set; }
        public virtual DbSet<CommitsToSongsTBL> CommitsToSongsTBL { get; set; }
        public virtual DbSet<FavoriteSongsToUserTBL> FavoriteSongsToUserTBL { get; set; }
        public virtual DbSet<FollowUpTBL> FollowUpTBL { get; set; }
        public virtual DbSet<JobTBL> JobTBL { get; set; }
        public virtual DbSet<ParadeTBL> ParadeTBL { get; set; }
        public virtual DbSet<PinnedItemsToUserTBL> PinnedItemsToUserTBL { get; set; }
        public virtual DbSet<PlaylistsTBL> PlaylistsTBL { get; set; }
        public virtual DbSet<ReportsTBL> ReportsTBL { get; set; }
        public virtual DbSet<SingerSearchingToUserTBL> SingerSearchingToUserTBL { get; set; }
        public virtual DbSet<SingersTBL> SingersTBL { get; set; }
        public virtual DbSet<SingersToArticlesTBL> SingersToArticlesTBL { get; set; }
        public virtual DbSet<SingersToParadeTBL> SingersToParadeTBL { get; set; }
        public virtual DbSet<SingersToSongsTBL> SingersToSongsTBL { get; set; }
        public virtual DbSet<SongsTBL> SongsTBL { get; set; }
        public virtual DbSet<SongsToParadeTBL> SongsToParadeTBL { get; set; }
        public virtual DbSet<SongsToPlaylistsTBL> SongsToPlaylistsTBL { get; set; }
        public virtual DbSet<SongsToUserPlaylistsTBL> SongsToUserPlaylistsTBL { get; set; }
        public virtual DbSet<SubscriptionTBL> SubscriptionTBL { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TagsForArticlesTBL> TagsForArticlesTBL { get; set; }
        public virtual DbSet<TagsForSongsTBL> TagsForSongsTBL { get; set; }
        public virtual DbSet<TagsToArticlesTBL> TagsToArticlesTBL { get; set; }
        public virtual DbSet<TagsToSongsTBL> TagsToSongsTBL { get; set; }
        public virtual DbSet<TopicsTBL> TopicsTBL { get; set; }
        public virtual DbSet<TypesOfTagsTBL> TypesOfTagsTBL { get; set; }
        public virtual DbSet<UpdatesTBL> UpdatesTBL { get; set; }
        public virtual DbSet<UserPlaylistsTBL> UserPlaylistsTBL { get; set; }
        public virtual DbSet<UsersTBL> UsersTBL { get; set; }
        public virtual DbSet<VotingsToParadeTBL> VotingsToParadeTBL { get; set; }
        public virtual DbSet<AllTags> AllTags { get; set; }
        public virtual DbSet<Commits> Commits { get; set; }
        public virtual DbSet<getFavoriteSongs> getFavoriteSongs { get; set; }
        public virtual DbSet<GetNewSong> GetNewSong { get; set; }
        public virtual DbSet<lastViews> lastViews { get; set; }
        public virtual DbSet<latestResponses> latestResponses { get; set; }
        public virtual DbSet<reportView> reportView { get; set; }
        public virtual DbSet<songsDetails> songsDetails { get; set; }
    
        [DbFunction("MusicOnlineEntities", "itemByName")]
        public virtual IQueryable<itemByName_Result> itemByName(string item)
        {
            var itemParameter = item != null ?
                new ObjectParameter("item", item) :
                new ObjectParameter("item", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<itemByName_Result>("[MusicOnlineEntities].[itemByName](@item)", itemParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "itemsByParameter")]
        public virtual IQueryable<itemsByParameter_Result> itemsByParameter(string parameter)
        {
            var parameterParameter = parameter != null ?
                new ObjectParameter("parameter", parameter) :
                new ObjectParameter("parameter", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<itemsByParameter_Result>("[MusicOnlineEntities].[itemsByParameter](@parameter)", parameterParameter);
        }
    
        [DbFunction("MusicOnlineEntities", "UpdatingsToUser")]
        public virtual IQueryable<UpdatingsToUser_Result> UpdatingsToUser(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<UpdatingsToUser_Result>("[MusicOnlineEntities].[UpdatingsToUser](@userId)", userIdParameter);
        }
    
        public virtual ObjectResult<ItemsToParade_Result> ItemsToParade(Nullable<int> paradeId)
        {
            var paradeIdParameter = paradeId.HasValue ?
                new ObjectParameter("paradeId", paradeId) :
                new ObjectParameter("paradeId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ItemsToParade_Result>("ItemsToParade", paradeIdParameter);
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
    }
}
