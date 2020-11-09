import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongsToPlaylistsSystem } from '../classes/songsToPlaylistsSystem';

@Injectable({
  providedIn: 'root'
})
export class SongsToPlaylistsSystemService {

  baseUrl: string = "https://localhost:44368/api/SongsToPlaylistsSystem";
  constructor(private httpClient: HttpClient) { }

  getSongsToPlaylistSystem(plalistId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsToPlaylistSystem?playlistId=" + plalistId);
  }
  addSongToPlaylistSystem(stp:SongsToPlaylistsSystem):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongToPlaylistSystem",stp);
  }
  addSongsToPlaylistSystem(stp:SongsToPlaylistsSystem[]):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongToPlaylistSystem",stp);
  }
  deleteSongFromPlaylistSystem(playlistId:number,songId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+"DeleteSongFromPlaylistSystem?playlistId="+playlistId+"&songId="+songId);
  }
}
