import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SongsToPlaylists } from '../classes/songsToPlaylists';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { UserPlaylists } from "../classes/UserPlaylists";

@Injectable({
  providedIn: 'root'
})
export class SongsToPlaylistsService {

  baseUrl: string = "https://localhost:44368/api/SongsToUserPlaylists/";
  constructor(private httpClient: HttpClient) { }
  public addSongToPlaylists(songToPlaylist: SongsToPlaylists): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSongToUserPlaylists", songToPlaylist);
  }
  public moveSongToOtherPlaylist(songId: number, prevPlaylistId: number, currentPlaylistId): Observable<boolean> {
    return this.httpClient.put<boolean>(this.baseUrl + "PutMoveSongToOtherUserPlaylist?songId=" + songId + "&prevPlaylistId=" + prevPlaylistId +
      "&currentPlaylistId=" + currentPlaylistId, songId);
  }
  public deleteSongFromPlaylist(songId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSongFromUserPlaylist?songId=" + songId);
  }
  public addLikedSong(songId: number, userId: number): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostLikedSong?songId=" + songId + "&userId=" + userId, songId);
  }
  public getSongsToPlaylists(userPlaylistId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsToUserPlaylists?userPlaylistId=" + userPlaylistId);
  }
}
