import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlayList } from '../classes/playlist';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PlaylistsService {
baseUrl:string="https://localhost:44368/api/Playlists/";
  constructor(private httpClient:HttpClient) { }
  public addPlaylist(playlist:PlayList):void{
    this.httpClient.post(this.baseUrl+"PostPlaylist",playlist);
  }
  public deletePlaylist(playlistId:number):void{
    this.httpClient.delete(this.baseUrl+"DeletePlaylist?playlistId="+playlistId);
  }
  public GetPlaylistsByUserId(userId:number):Observable<PlayList[]>{
   return this.httpClient.get<PlayList[]>(this.baseUrl+"GetPlaylistsByUserId?userId="+userId);
  }
}
