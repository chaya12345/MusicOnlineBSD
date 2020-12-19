import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { UserPlaylists } from "../classes/UserPlaylists";

export class PlaylistWithSong {
  playlist: UserPlaylists;
  song: Song;
}

@Injectable({
  providedIn: 'root'
})
export class UserPlaylistsService {

  baseUrl: string = "https://localhost:44368/api/UserPlaylists/";

  constructor(private httpClient: HttpClient) { }

  public addUserPlaylist(playlist: UserPlaylists): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "PostUserPlaylist", playlist);
  }
  public addPlaylistWithSong(playlist: UserPlaylists, song: Song): Observable<boolean> {
    let playlistWithSong: PlaylistWithSong = new PlaylistWithSong();
    playlistWithSong.playlist = playlist;
    playlistWithSong.song = song;
    return this.httpClient.post<boolean>(this.baseUrl + "PostPlaylistWithSong", playlistWithSong);
  }
  public deleteUserPlaylist(playlistId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteUserPlaylist?userPlaylistId=" + playlistId);
  }
  public GetPlaylistsByUserId(userId: number): Observable<UserPlaylists[]> {
    return this.httpClient.get<UserPlaylists[]>(this.baseUrl + "GetPlaylistsByUserId?userId=" + userId);
  }
  playlistRename(playlistName:string,playlistId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutPlaylistRename?playlistName="+playlistName+"&playlistId="+playlistId,playlistId);
  }
  
}
