import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { Survey } from '../classes/survey';

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
  addSongToSurvey(survey:Survey):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongToSurvey",survey);
  }
  addSongsToSurvey(surveys:Survey[]):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostSongsToSurvey",surveys);
  }
}
