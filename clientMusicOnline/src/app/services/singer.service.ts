import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';

@Injectable({
  providedIn: 'root'
})
export class SingerService {

  constructor(private httpClient: HttpClient) { }
  
  getSingers(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>("https://localhost:44368/api/Singers/GetSingers");
  }

}
