﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToLastResponsDTO
    {
        public static LastResponsDTO GetLastRespons(LastResponses lastRespons)
        {
            LastResponsDTO newRespons = new LastResponsDTO();
            newRespons.responsId = lastRespons.responsId;
            newRespons.name = lastRespons.name;
            newRespons.date = lastRespons.date;
            newRespons.articleId = lastRespons.articleId;
            newRespons.title = lastRespons.title;
            return newRespons;
        }
        public static List<LastResponsDTO> GetLastResponses(List<LastResponses> lastResponses)
        {
            List<LastResponsDTO> list = new List<LastResponsDTO>();
            foreach (LastResponses item in lastResponses)
            {
                list.Add(GetLastRespons(item));
            }
            return list;
        }
    }
}
