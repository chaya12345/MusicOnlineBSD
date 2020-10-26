//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class SongsTBL
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SongsTBL()
        {
            this.ArtistsToSongsTBL = new HashSet<ArtistsToSongsTBL>();
            this.FollowUpTBL = new HashSet<FollowUpTBL>();
            this.ReportsTBL = new HashSet<ReportsTBL>();
            this.ResponsesToSongsTBL = new HashSet<ResponsesToSongsTBL>();
            this.SongsToPlaylistsTBL = new HashSet<SongsToPlaylistsTBL>();
            this.TagsToSongsTBL = new HashSet<TagsToSongsTBL>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string file_location { get; set; }
        public string type { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> singerId { get; set; }
        public Nullable<long> count_like { get; set; }
        public Nullable<long> count_views { get; set; }
        public Nullable<int> albumId { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public string image_location { get; set; }
        public string content { get; set; }
        public Nullable<bool> isPerformance { get; set; }
    
        public virtual AlbumsTBL AlbumsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ArtistsToSongsTBL> ArtistsToSongsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FollowUpTBL> FollowUpTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportsTBL> ReportsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResponsesToSongsTBL> ResponsesToSongsTBL { get; set; }
        public virtual SingersTBL SingersTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongsToPlaylistsTBL> SongsToPlaylistsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TagsToSongsTBL> TagsToSongsTBL { get; set; }
    }
}
