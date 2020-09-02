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
            this.ReportsTBL = new HashSet<ReportsTBL>();
            this.SongsToPlaylistsTBL = new HashSet<SongsToPlaylistsTBL>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string file_location { get; set; }
        public string type { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<long> count { get; set; }
        public Nullable<long> singerId { get; set; }
        public Nullable<long> count_like { get; set; }
        public Nullable<long> count_views { get; set; }
        public Nullable<long> tagsId { get; set; }
        public Nullable<long> albumId { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public string image_location { get; set; }
        public string content { get; set; }
    
        public virtual AlbumsTBL AlbumsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ArtistsToSongsTBL> ArtistsToSongsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportsTBL> ReportsTBL { get; set; }
        public virtual SingersTBL SingersTBL { get; set; }
        public virtual TagsTBL TagsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongsToPlaylistsTBL> SongsToPlaylistsTBL { get; set; }
    }
}
