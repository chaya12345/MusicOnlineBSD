using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SingersToSurveyDTO
    {
        public int id { get; set; }
        public Nullable<int> singerId { get; set; }
        public Nullable<int> count { get; set; }
    }
}
