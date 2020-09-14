import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SongsToPlaylists } from '../classes/songsToPlaylists';

@Injectable({
  providedIn: 'root'
})
export class SongsToPlaylistsService {

  baseUrl:string="https://localhost:44368/api/SongsToPlaylists/";
  constructor(private httpClient:HttpClient) { }
  public addSongToPlaylists(songToPlaylist:SongsToPlaylists):void{
    this.httpClient.post(this.baseUrl+"PostSongToPlaylists",songToPlaylist);
  }
  public moveSongToOtherPlaylist(songId:number,playlistId:number){
    this.httpClient.put(this.baseUrl+"PutMoveSongToOtherPlaylist?songId="+songId+"&playlistId="+playlistId,playlistId);
  }
  public DeleteSongFromPlaylist(songId:number):void{
    this.httpClient.delete(this.baseUrl+"DeleteSongFromPlaylist?songId="+songId);
  }
}
