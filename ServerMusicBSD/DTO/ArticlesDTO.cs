﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ArticlesDTO
    {
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
    }
}
