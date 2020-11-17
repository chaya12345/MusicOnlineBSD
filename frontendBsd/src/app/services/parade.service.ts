import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingersToParade } from '../classes/singersToParade';
import { Song } from '../classes/song';
import { SongsToParade } from '../classes/songsToParade';

@Injectable({
  providedIn: 'root'
})
export class ParadeService {

  baseUrl: string = "https://localhost:44368/api/Parade/";
  constructor(private httpClient: HttpClient) { }

  getSongsInParade(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsInParade");
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
  getSingersInParade(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl + "GetSingersInParade");
  }
  addVotingToSinger(singerId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutVotingToSinger?singerId=" + singerId, singerId);
  }
  addVotingToSingers(selectionSingers: Singer[]): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PostVotingToSingers", selectionSingers);
  }
  addSingerToParade(parade: SingersToParade): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSingerToParade", parade);
  }
  addSingersToParade(parades: SingersToParade[]): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSingersToParade", parades);
  }
  deleteSingerFromParade(singerId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSingerFromParade?singerId=" + singerId);
  }
}
