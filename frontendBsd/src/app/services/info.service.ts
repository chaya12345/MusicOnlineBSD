import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class InfoService {

  baseUrl: string = "https://localhost:44368/api/Info/";

  constructor(private httpClient: HttpClient) { }
  GetSongsCount(): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetSongsCount");
  }
  GetArticlesCount(): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetArticlesCount");
  }
  GetPlaylistsCount(): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetPlaylistsCount");
  }
  GetUsersCount(): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetUsersCount");
  }
  GetSubsToNewsletterCount(): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetSubsToNewsletterCount");
  }
}
