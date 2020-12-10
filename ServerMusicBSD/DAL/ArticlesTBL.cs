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
    
    public partial class ArticlesTBL
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ArticlesTBL()
        {
            this.FollowUpTBL = new HashSet<FollowUpTBL>();
            this.ResponsesToArticlesTBL = new HashSet<ResponsesToArticlesTBL>();
            this.SingersToArticlesTBL = new HashSet<SingersToArticlesTBL>();
            this.TagsToArticlesTBL = new HashSet<TagsToArticlesTBL>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public string dateHebrew { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string content { get; set; }
        public string image { get; set; }
        public string credit { get; set; }
        public Nullable<long> count_views { get; set; }
        public Nullable<long> count_like { get; set; }
        public Nullable<System.DateTime> lastViewingDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FollowUpTBL> FollowUpTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResponsesToArticlesTBL> ResponsesToArticlesTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SingersToArticlesTBL> SingersToArticlesTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TagsToArticlesTBL> TagsToArticlesTBL { get; set; }
    }
}
