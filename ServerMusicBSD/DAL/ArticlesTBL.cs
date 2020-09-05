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
            this.ResponsesTBL = new HashSet<ResponsesTBL>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public string dateHebrew { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<long> tagsId { get; set; }
        public string content { get; set; }
        public string main_image { get; set; }
        public string image1 { get; set; }
        public string image2 { get; set; }
        public string image3 { get; set; }
        public string audio1 { get; set; }
        public string audio2 { get; set; }
        public string video { get; set; }
        public string credit { get; set; }
        public Nullable<long> count_views { get; set; }
        public Nullable<long> count_like { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResponsesTBL> ResponsesTBL { get; set; }
    }
}
