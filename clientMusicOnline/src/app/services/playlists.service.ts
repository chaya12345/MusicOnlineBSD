import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlayList } from '../classes/playlist';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PlaylistsService {

  constructor(private httpClient:HttpClient) { }
  public addPlaylist(playlist:PlayList):void{
    this.httpClient.post("https://localhost:44368/api/Playlists/PostPlaylist",playlist);
  }
  public deletePlaylist(playlistId:number):void{
    this.httpClient.delete("https://localhost:44368/api/Playlists/DeletePlaylist?playlistId="+playlistId);
  }
  public GetPlaylistsByUserId(userId:number):Observable<PlayList[]>{
   return this.httpClient.get<PlayList[]>("https://localhost:44368/api/Playlists/GetPlaylistsByUserId?userId="+userId);
  }
}
