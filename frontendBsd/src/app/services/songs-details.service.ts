import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { SongsDetailsView } from '../classes/songsDetailsView';

@Injectable({
  providedIn: 'root'
})
export class SongsDetailsService {

  baseUrl: string = "https://localhost:44368/api/SongsDetails/";
  constructor(private httpClient:HttpClient) { }

  GetSongs():Observable<SongsDetailsView[]>{
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl+'GetSongs');
  }
}
