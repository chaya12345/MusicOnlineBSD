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
        public virtual DbSet<FollowUpTBL> FollowUpTBL { get; set; }
        public virtual DbSet<JobTBL> JobTBL { get; set; }
        public virtual DbSet<PlaylistsSystemTBL> PlaylistsSystemTBL { get; set; }
        public virtual DbSet<PlaylistsTBL> PlaylistsTBL { get; set; }
        public virtual DbSet<ReportsTBL> ReportsTBL { get; set; }
        public virtual DbSet<ResponsesToArticlesTBL> ResponsesToArticlesTBL { get; set; }
        public virtual DbSet<ResponsesToSongsTBL> ResponsesToSongsTBL { get; set; }
        public virtual DbSet<SingerSearchingToUserTBL> SingerSearchingToUserTBL { get; set; }
        public virtual DbSet<SingersTBL> SingersTBL { get; set; }
        public virtual DbSet<SongsTBL> SongsTBL { get; set; }
        public virtual DbSet<SongsToPlaylistsTBL> SongsToPlaylistsTBL { get; set; }
        public virtual DbSet<SubscriptionTBL> SubscriptionTBL { get; set; }
        public virtual DbSet<TagsTBL> TagsTBL { get; set; }
        public virtual DbSet<TagsToArticlesTBL> TagsToArticlesTBL { get; set; }
        public virtual DbSet<TagsToSongsTBL> TagsToSongsTBL { get; set; }
        public virtual DbSet<TagsTypesTBL> TagsTypesTBL { get; set; }
        public virtual DbSet<TopicsTBL> TopicsTBL { get; set; }
        public virtual DbSet<UsersTBL> UsersTBL { get; set; }
        public virtual DbSet<LastResponses> LastResponses { get; set; }
        public virtual DbSet<songsDetails> songsDetails { get; set; }
    }
}
