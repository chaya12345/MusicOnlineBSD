﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ResponsesToSongsBL
    {
        public static void AddResponse(ResponsesToSongsTBL response)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.ResponsesToSongsTBL.Add(response);
            SongsTBL song = et.SongsTBL.Where(s => s.id == response.songId).FirstOrDefault();
            if (song.count_responses == null)
                song.count_responses = 1;
            else song.count_responses++;
            et.SaveChanges();
        }
        public static List<ResponsesToSongsDTO> GetSongResponses(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToResponsesToSongsDTO.GetResponses(et.ResponsesToSongsTBL.Where(r => r.songId == songId).ToList());
        }
        public static void DeleteResponse(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ResponsesToSongsTBL response = et.ResponsesToSongsTBL.Where(r => r.id == songId).FirstOrDefault();
            SongsTBL song = et.SongsTBL.Where(a => a.id == response.songId).FirstOrDefault();
            if (song.count_responses == null || song.count_responses <= 0)
                song.count_responses = 0;
            else song.count_responses--;
            et.ResponsesToSongsTBL.Remove(response);
            et.SaveChanges();
        }
        public static List<ResponsesToSongsDTO> GetLastResponses()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ResponsesToSongsTBL> list = et.ResponsesToSongsTBL.Where(r => r.date != null).OrderBy(r => r.date).Distinct().ToList();
            return Casts.ToResponsesToSongsDTO.GetResponses(list);
        }
    }
}
