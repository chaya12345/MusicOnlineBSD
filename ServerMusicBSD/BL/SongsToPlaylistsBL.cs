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
    public class SongsToPlaylistsBL
    {
        public static void AddSongToPlaylist(SongsToPlaylistsTBL songToPlaylist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                et.SongsToPlaylistsTBL.Add(songToPlaylist);
                et.SaveChanges();
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
        public static void MoveSongToOtherPlaylist(int id, int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToPlaylistsTBL songsTo = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            if (songsTo != null)
            {
                songsTo.playlistId = playlistId;
                et.SaveChanges();
            }
        }
        public static void DeleteSong(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToPlaylistsTBL song = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            et.SongsToPlaylistsTBL.Remove(song);
            et.SaveChanges();
        }
        public static List<SongsToPlaylistsDTO> GetSongsToPlaylists(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsToPlaylistsDTO.GetSongsToPlaylists(et.SongsToPlaylistsTBL
                .Where(s => s.playlistId == playlistId).ToList());
        }
        public static void AddLikedSong(int songId, int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL playlist = et.PlaylistsTBL.Where(p => p.userId == userId && p.name == "שירים שאהבתי").FirstOrDefault();
            if (playlist == null)
            {
                PlaylistBL.AddPlaylist(new PlaylistsTBL() { name = "שירים שאהבתי", userId = userId });
                playlist = et.PlaylistsTBL.Where(p => p.userId == userId && p.name == "שירים שאהבתי").FirstOrDefault();
            }
            if (playlist != null)
            {
                SongsToPlaylistsTBL songsToPlaylist = new SongsToPlaylistsTBL();
                songsToPlaylist.playlistId = playlist.id;
                songsToPlaylist.songId = songId;
                AddSongToPlaylist(songsToPlaylist);
            }

        }
    }
}
