import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';

@Injectable({
  providedIn: 'root'
})
export class SingerService {

  baseUrl:string="https://localhost:44368/api/Singers/";
  constructor(private httpClient: HttpClient) { }
  
  public getSingers(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl+"GetSingers");
  }
  public GetSingerByName(name: string): Observable<Singer> {
    return this.httpClient.get<Singer>(this.baseUrl + "GetSingerByName?name=" + name);
  }
  public addSinger(singer:Singer):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostSinger",singer);
  }
  addSearchingToSinger(singerName:string):Observable<any>{
    return this.httpClient.put(this.baseUrl+'PutSearchingToSinger?singerName='+singerName,singerName);
  }
}
