import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Playlists } from '../classes/playlists';
import { PlaylistWithSong } from './user-playlists.service';

export class playlistWithSongs {
  playlist: Playlists;
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
  public getPlaylistById(playlistId: number): Observable<Playlists> {
    return this.httpClient.get<Playlists>(this.baseUrl + "GetPlaylistById?playlistId=" + playlistId);
  }
  public GetPlaylistByName(playlistName: string): Observable<Playlists> {
    return this.httpClient.get<Playlists>(this.baseUrl + "GetPlaylistByName?playlistName=" + playlistName);
  }
  public addPlaylist(playlists: Playlists): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostPlaylist", playlists);
  }
  public addFullPlaylist(playlistWithSong: playlistWithSongs, imageFile: File, isEdit: boolean = false): Observable<Boolean> {
    const formData: FormData = new FormData();
    formData.append("playlist", JSON.stringify(playlistWithSong));
    formData.append("image", imageFile, imageFile.name);
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');
    return this.httpClient.post<boolean>(this.baseUrl + "AddPlaylist?isEdit=" + isEdit, formData);
  }
  public addPlaylistWithSongs(playlistsSystem: Playlists, songs: string[]): Observable<any> {
    let pws = new playlistWithSongs();
    pws.playlist = playlistsSystem;
    pws.songs = songs;
    return this.httpClient.post(this.baseUrl + "PostPlaylistWithSongs", pws);
  }
  public updatePlaylistWithSongs(pws: playlistWithSongs): Observable<boolean> {
    return this.httpClient.put<boolean>("https://localhost:44368/api/Playlists/UpdatePlaylistWithSongs", pws);
  }
  deletePlayList(playlistId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeletePlayList?playlistId=" + playlistId);
  }
}