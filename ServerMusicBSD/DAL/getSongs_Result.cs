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
    
    public partial class getSongs_Result
    {
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
    }
}
