import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingersToSurvey } from '../classes/singersToSurvey';
import { Song } from '../classes/song';
import { SongsToSurvey } from '../classes/songsToSurvey';

@Injectable({
  providedIn: 'root'
})
export class SurveyService {

  baseUrl: string = "https://localhost:44368/api/Survey/";
  constructor(private httpClient: HttpClient) { }

  getSongsInSurvey(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsInSurvey");
  }
  addVotingToSong(songId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutVotingToSong?songId="+songId,songId);
  }
  addVotingToSongs(selectionSongs:Song[]):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutVotingToSongs",selectionSongs);
  }
  addSongToSurvey(survey:SongsToSurvey):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongToSurvey",survey);
  }
  addSongsToSurvey(surveys:SongsToSurvey[]):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongsToSurvey",surveys);
  }
  deleteSongFromSurvey(songId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+"DeleteSongFromSurvey?songId="+songId);
  }
  getSingersInSurvey(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl + "GetSingersInSurvey");
  }
  addVotingToSinger(singerId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutVotingToSinger?singerId="+singerId,singerId);
  }
  addVotingToSingers(selectionSingers:Singer[]):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PostVotingToSingers",selectionSingers);
  }
  addSingerToSurvey(survey:SingersToSurvey):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSingerToSurvey",survey);
  }
  addSingersToSurvey(surveys:SingersToSurvey[]):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSingersToSurvey",surveys);
  }
  deleteSingerFromSurvey(singerId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+"DeleteSingerFromSurvey?singerId="+singerId);
  }
}
