import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongsToParade } from '../classes/songsToParade';

@Injectable({
  providedIn: 'root'
})
export class SongsToParadeService {
  
  baseUrl: string = "https://localhost:44368/api/SongsToParade/";

  constructor(private httpClient: HttpClient) { }

  getSongsInParade(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsInParade");
  }
  getSongsToParade(): Observable<SongsToParade[]> {
    return this.httpClient.get<SongsToParade[]>(this.baseUrl + "GetSongsToParade");
  }
  addVotingToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutVotingToSong?songId=" + songId, songId);
  }
  addVotingToSongs(selectionSongs: Song[]): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutVotingToSongs", selectionSongs);
  }
  addSongToParade(parade: SongsToParade): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSongToParade", parade);
  }
  addSongsToParade(parades: SongsToParade[]): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSongsToParade", parades);
  }
  deleteSongFromParade(songId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSongFromSurvey?songId=" + songId);
  }
}
