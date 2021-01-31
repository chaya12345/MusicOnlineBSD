﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToSongsBL
    {
        public static List<string> GetSingersToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> list = et.SingersToSongsTBL.Where(s => s.songId == songId).ToList();
            if (list == null)
                return null;
            List<string> result = new List<string>();
            foreach (SingersToSongsTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer.name);
            }
            return result;
        }
        public static bool AddSingerToSong(SingersToSongsTBL singersToSongs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (singersToSongs != null)
                {
                    et.SingersToSongsTBL.Add(singersToSongs);
                    et.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            return false;
        }
        public static bool AddSingersToSong(string[] singers, int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            bool flag = true;
            foreach (string singer in singers)
            {
                SingersTBL singerTBL = et.SingersTBL.Where(s => s != null && singer != null && s.name == singer).FirstOrDefault();
                if (singer != null)
                {
                    if(AddSingerToSong(new SingersToSongsTBL { singerId = singerTBL.id, songId = songId })==false)
                        flag=false;
                }
            }
            return flag;
        }
        public static void UpdateSingersToSong(int songId, List<SingersTBL> singers)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> existSingers = et.SingersToSongsTBL
                .Where(sts => sts != null && sts.songId == songId).ToList();
            List<SingersTBL> existAndSelected = new List<SingersTBL>();
            if (existSingers != null)
            {
                foreach (SingersToSongsTBL item in existSingers)
                {
                    SingersTBL singer = singers.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                    if (singer == null)
                    {
                        DeleteSingerFromSong(songId, item.singerId);
                    }
                    else
                    {
                        existAndSelected.Add(singer);
                    }
                }
            }
            foreach (SingersTBL singer in singers)
            {
                if (singer != null && existAndSelected.Where(s => s.id == singer.id).FirstOrDefault() == null)
                {
                    AddSingerToSong(new SingersToSongsTBL() { singerId = singer.id, songId = songId });
                }
            }
        }
        public static void DeleteSingerFromSong(int? songId, int? singerId)
        {
            if (singerId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                SingersToSongsTBL result = et.SingersToSongsTBL
                    .Where(sts => sts.songId == songId && sts.singerId == singerId).FirstOrDefault();
                if (result != null)
                {
                    et.SingersToSongsTBL.Remove(result);
                    et.SaveChanges();
                }
            }
        }
        public static void DeleteSingerFromSongs(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> singerToSongs =et.SingersToSongsTBL.Where(sts => sts.singerId == singerId).ToList();
            if (singerToSongs == null)
                return;
            foreach (SingersToSongsTBL item in singerToSongs)
            {
                if (item != null)
                    DeleteSingerFromSong(item.songId, singerId);
            }
        }
        public static void DeleteSingersOfSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> singers = et.SingersToSongsTBL
                .Where(sts => sts != null && sts.songId == songId).ToList();
            if (singers != null)
            {
                et.SingersToSongsTBL.RemoveRange(singers);
                et.SaveChanges();
            }
        }
    }
}
