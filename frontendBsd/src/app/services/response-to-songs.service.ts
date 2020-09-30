import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ResponseToSongsService {

  baseUrl: string = "https://localhost:44368/api/ResponsesToSongs/";
  constructor(private httpClient: HttpClient) { }
  
  public addResponse(response: ResponsesToSongs): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostResponse", response);
  }
  public getSongResponses(songId: number): Observable<ResponsesToSongs[]> {
    return this.httpClient.get<ResponsesToSongs[]>(this.baseUrl + "getSongResponses?songId=" + songId);
  }
  public getCountResponsesToSong(songId: number): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetCountResponsesToSong?songId=" + songId);
  }
  public deleteResponse(responseId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteResponse?responseId?=" + responseId);
  }
  public getLastResponses(): Observable<ResponsesToSongs[]> {
    return this.httpClient.get<ResponsesToSongs[]>(this.baseUrl + "GetLastResponses");
  }
}
