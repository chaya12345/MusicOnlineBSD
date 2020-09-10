import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';

@Injectable({
  providedIn: 'root'
})
export class SingerService {

  constructor(private httpClient: HttpClient) { }
  
  public getSingers(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>("https://localhost:44368/api/Singers/GetSingers");
  }
  public addSinger(singer:Singer):void{
    this.httpClient.post("https://localhost:44368/api/Singers/PostSinger",singer);
  }
}
