﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToItemByNameDTO
    {
        public static ItemByNameDTO GetItemByName(itemByName_Result item)
        {
            ItemByNameDTO newItem = new ItemByNameDTO();
            newItem.id = item.id;
            newItem.name = item.name;
            newItem.image = item.image;
            return newItem;
        }
        public static List<ItemByNameDTO> GetItemsByName(List<itemByName_Result> items)
        {
            List<ItemByNameDTO> list = new List<ItemByNameDTO>();
            foreach (itemByName_Result item in items)
            {
                list.Add(GetItemByName(item));
            }
            return list;
        }
    }
}