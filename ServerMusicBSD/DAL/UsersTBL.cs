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
    
    public partial class UsersTBL
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UsersTBL()
        {
            this.FavoriteSongsToUserTBL = new HashSet<FavoriteSongsToUserTBL>();
            this.FollowUpTBL = new HashSet<FollowUpTBL>();
            this.PinnedItemsToUserTBL = new HashSet<PinnedItemsToUserTBL>();
            this.SearchingsOfUsersTBL = new HashSet<SearchingsOfUsersTBL>();
            this.SingerSearchingToUserTBL = new HashSet<SingerSearchingToUserTBL>();
            this.SubscriptionTBL = new HashSet<SubscriptionTBL>();
            this.UserPlaylistsTBL = new HashSet<UserPlaylistsTBL>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string mail { get; set; }
        public string password { get; set; }
        public Nullable<bool> newsletter { get; set; }
        public string image { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FavoriteSongsToUserTBL> FavoriteSongsToUserTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FollowUpTBL> FollowUpTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PinnedItemsToUserTBL> PinnedItemsToUserTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SearchingsOfUsersTBL> SearchingsOfUsersTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SingerSearchingToUserTBL> SingerSearchingToUserTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubscriptionTBL> SubscriptionTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserPlaylistsTBL> UserPlaylistsTBL { get; set; }
    }
}
