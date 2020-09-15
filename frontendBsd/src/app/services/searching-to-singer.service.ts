import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SearchingToSinger } from '../classes/searchingToSinger';

@Injectable({
  providedIn: 'root'
})
export class SearchingToSingerService {

  baseUrl: string = "https://localhost:44368/api/SearchingToSinger/";
  constructor(private httpClient: HttpClient) { }
  public getAllSearching(): Observable<SearchingToSinger[]> {
    return this.httpClient.get<SearchingToSinger[]>(this.baseUrl + "GetAllSearching");
  }
  public GetCountOfSearchingToSinger(singerId: number): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetCountOfSearchingToSinger?singerId=" + singerId);
  }
  public addSearchingToSinger(singerId: number): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSearchingToSinger?singerId=" + singerId, singerId);
  }
  public updateSearchingToSinger(singerId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutSearchingToSinger?singerId=" + singerId, singerId);
  }
}
