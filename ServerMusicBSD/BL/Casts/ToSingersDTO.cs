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
            if (singer == null)
                return null;
            SingersDTO newSinger = new SingersDTO();
            newSinger.id = singer.id;
            newSinger.name = singer.name;
            newSinger.image = singer.image;
            newSinger.searchings = singer.searchings;
            return newSinger;
        }
        public static List<SingersDTO> GetSingers(List<SingersTBL> singers)
        {
            if (singers == null)
                return null;
            List<SingersDTO> newSingers = new List<SingersDTO>();
            foreach (SingersTBL singer in singers)
            {
                SingersDTO singersDTO = GetSinger(singer);
                if (singersDTO != null)
                    newSingers.Add(singersDTO);
            }
            return newSingers;
        }
    }
}
