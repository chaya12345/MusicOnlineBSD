import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlayList } from '../classes/playlist';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';

export class PlaylistWithSong {
  playlist: PlayList;
  song: Song;
}

@Injectable({
  providedIn: 'root'
})
export class PlaylistsService {

  baseUrl: string = "https://localhost:44368/api/Playlists/";

  constructor(private httpClient: HttpClient) { }

  public addPlaylist(playlist: PlayList): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "PostPlaylist", playlist);
  }
  public addPlaylistWithSong(playlist: PlayList, song: Song): Observable<boolean> {
    let playlistWithSong: PlaylistWithSong = new PlaylistWithSong();
    playlistWithSong.playlist = playlist;
    playlistWithSong.song = song;
    return this.httpClient.post<boolean>(this.baseUrl + "PostPlaylistWithSong", playlistWithSong);
  }
  public deletePlaylist(playlistId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeletePlaylist?playlistId=" + playlistId);
  }
  public GetPlaylistsByUserId(userId: number): Observable<PlayList[]> {
    return this.httpClient.get<PlayList[]>(this.baseUrl + "GetPlaylistsByUserId?userId=" + userId);
  }
  
}
