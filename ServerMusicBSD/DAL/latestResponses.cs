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
    
    public partial class latestResponses
    {
        public int id { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string topic { get; set; }
        public int topicId { get; set; }
        public string title_res { get; set; }
        public string content_res { get; set; }
    }
}
