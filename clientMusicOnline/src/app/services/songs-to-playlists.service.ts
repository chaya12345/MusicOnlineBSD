import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SongsToPlaylists } from '../classes/songsToPlaylists';

@Injectable({
  providedIn: 'root'
})
export class SongsToPlaylistsService {

  constructor(private httpClient:HttpClient) { }
  public addSongToPlaylists(songToPlaylist:SongsToPlaylists):void{
    this.httpClient.post("https://localhost:44368/api/SongsToPlaylists/PostSongToPlaylists",songToPlaylist);
  }
  public moveSongToOtherPlaylist(songId:number,playlistId:number){
    this.httpClient.put("https://localhost:44368/api/SongsToPlaylists/PutMoveSongToOtherPlaylist?songId="+songId+"&playlistId="+playlistId,playlistId);
  }
  public DeleteSongFromPlaylist(songId:number):void{
    this.httpClient.delete("https://localhost:44368/api/SongsToPlaylists/DeleteSongFromPlaylist?songId="+songId);
  }
}
