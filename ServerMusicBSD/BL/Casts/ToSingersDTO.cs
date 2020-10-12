using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSingersDTO
    {
        public static SingersDTO GetSinger(SingersTBL singer)
        {
            SingersDTO newSinger = new SingersDTO();
            newSinger.id = singer.id;
            newSinger.name = singer.name;
            newSinger.image = singer.image;
            newSinger.searchings = singer.searchings;
            return newSinger;
        }
        public static List<SingersDTO> GetSingers(List<SingersTBL> singers)
        {
            List<SingersDTO> newSingers = new List<SingersDTO>();
            foreach (SingersTBL singer in singers)
            {
                newSingers.Add(GetSinger(singer));
            }
            return newSingers;
        }
    }
}
