﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LastestCommitsDTO
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
