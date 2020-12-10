import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Playlists } from '../classes/playlists';

export class playlistSystemWithSongs {
  playlistSystem: Playlists;
  songs: string[];
}

@Injectable({
  providedIn: 'root'
})
export class PlaylistsService {

  baseUrl: string = "https://localhost:44368/api/Playlists/";

  constructor(private httpClient: HttpClient) { }
  
  public getPlaylists(): Observable<Playlists[]> {
    return this.httpClient.get<Playlists[]>(this.baseUrl + "GetPlaylists");
  }
  public getPlaylistById(playlistId:number): Observable<Playlists> {
    return this.httpClient.get<Playlists>(this.baseUrl + "GetPlaylistById?playlistId="+playlistId);
  }
  public GetPlaylistByName(playlistName:string): Observable<Playlists> {
    return this.httpClient.get<Playlists>(this.baseUrl + "GetPlaylistByName?playlistName="+playlistName);
  }
  public addPlaylist(playlistsSystem:Playlists): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostPlaylist",playlistsSystem);
  }
  public addPlaylistWithSongs(playlistsSystem: Playlists, songs: string[]): Observable<any> {
    let pws = new playlistSystemWithSongs();
    pws.playlistSystem = playlistsSystem;
    pws.songs = songs;
    return this.httpClient.post(this.baseUrl + "PostPlaylistWithSongs", pws);
  }
}
