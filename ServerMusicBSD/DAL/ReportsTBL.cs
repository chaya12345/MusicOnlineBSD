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
    
    public partial class ReportsTBL
    {
        public int id { get; set; }
        public string name { get; set; }
        public string mail { get; set; }
        public string phone { get; set; }
        public Nullable<int> songId { get; set; }
        public string message { get; set; }
        public Nullable<int> status { get; set; }
    
        public virtual SongsTBL SongsTBL { get; set; }
    }
}
