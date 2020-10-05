import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SongsToPlaylists } from '../classes/songsToPlaylists';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SongsToPlaylistsService {

  baseUrl: string = "https://localhost:44368/api/SongsToPlaylists/";
  constructor(private httpClient: HttpClient) { }
  public addSongToPlaylists(songToPlaylist: SongsToPlaylists): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSongToPlaylists", songToPlaylist);
  }
  public moveSongToOtherPlaylist(songId: number, playlistId: number):Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutMoveSongToOtherPlaylist?songId=" + songId + "&playlistId=" + playlistId, playlistId);
  }
  public deleteSongFromPlaylist(songId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSongFromPlaylist?songId=" + songId);
  }
  public addLikedSong(songId: number,userId:number): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostLikedSong?songId="+songId+"&userId="+userId, songId);
  }
}
