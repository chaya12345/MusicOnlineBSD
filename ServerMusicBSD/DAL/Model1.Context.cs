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
    
        public virtual DbSet<AlbumsTBL> AlbumsTBLs { get; set; }
        public virtual DbSet<ArticlesTBL> ArticlesTBLs { get; set; }
        public virtual DbSet<ArtistsTBL> ArtistsTBLs { get; set; }
        public virtual DbSet<ArtistsToSongsTBL> ArtistsToSongsTBLs { get; set; }
        public virtual DbSet<JobTBL> JobTBLs { get; set; }
        public virtual DbSet<PlaylistsTBL> PlaylistsTBLs { get; set; }
        public virtual DbSet<ReportsTBL> ReportsTBLs { get; set; }
        public virtual DbSet<ResponsesToArticlesTBL> ResponsesToArticlesTBLs { get; set; }
        public virtual DbSet<ResponsesToSongsTBL> ResponsesToSongsTBLs { get; set; }
        public virtual DbSet<SearchingToSingerTBL> SearchingToSingerTBLs { get; set; }
        public virtual DbSet<SingerSearchingToUserTBL> SingerSearchingToUserTBLs { get; set; }
        public virtual DbSet<SingersTBL> SingersTBLs { get; set; }
        public virtual DbSet<SongsTBL> SongsTBLs { get; set; }
        public virtual DbSet<SongsToPlaylistsTBL> SongsToPlaylistsTBLs { get; set; }
        public virtual DbSet<TagsTBL> TagsTBLs { get; set; }
        public virtual DbSet<TagsToArticlesTBL> TagsToArticlesTBLs { get; set; }
        public virtual DbSet<TagsToSongsTBL> TagsToSongsTBLs { get; set; }
        public virtual DbSet<UsersTBL> UsersTBLs { get; set; }
        public virtual DbSet<LastRespons> LastResponses { get; set; }
    }
}
