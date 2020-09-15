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
  public addSinger(singer:Singer):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostSinger",singer);
  }
}
