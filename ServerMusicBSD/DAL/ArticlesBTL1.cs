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
    
    public partial class ArticlesBTL1
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ArticlesBTL1()
        {
            this.ResponsesTBLs = new HashSet<ResponsesTBL1>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public string files { get; set; }
        public string content { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> tagsId { get; set; }
    
        public virtual TagsTBL1 TagsTBL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResponsesTBL1> ResponsesTBLs { get; set; }
    }
}
