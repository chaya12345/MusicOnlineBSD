﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SongsDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public string file_location { get; set; }
        public string type { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<long> singerId { get; set; }
        public Nullable<long> count_like { get; set; }
        public Nullable<long> count_views { get; set; }
        public Nullable<int> albumId { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public string image_location { get; set; }
        public string content { get; set; }
    }
}
