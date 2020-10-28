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
    public class PlaylistBL
    {
        public static void AddPlaylist(PlaylistsTBL playlist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (playlist != null)
                {
                    et.PlaylistsTBL.Add(playlist);
                    et.SaveChanges();
                }
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
        }
        public static void DeletePlaylist(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL playlist = et.PlaylistsTBL.Where(p =>p!=null&& p.id == id).FirstOrDefault();
            if (playlist != null)
            {
                et.PlaylistsTBL.Remove(playlist);
                et.SaveChanges();
                List<SongsToPlaylistsTBL> songsToDelet = et.SongsToPlaylistsTBL.Where(s => s!=null&&s.playlistId == id).ToList();
                if (songsToDelet == null)
                    return;
                foreach (SongsToPlaylistsTBL song in songsToDelet)
                {
                    if (song != null)
                        SongsToPlaylistsBL.DeleteSong(song.id);
                }
            }
        }
        public static List<PlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<PlaylistsTBL> list = et.PlaylistsTBL.Where(p =>p!=null&& p.userId == userId).ToList();
            if (list != null)
                return Casts.ToPlaylistsDTO.GetPlaylists(list);
            return null;
        }
    }
}
