import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ArtistsAndSingers } from '../classes/artistsAndSingers';

@Injectable({
  providedIn: 'root'
})
export class ArtistsAndSingersService {

  baseUrl: string ="https://localhost:44368/api/ArtistsAndSingers/";
  
  constructor(private httpClient: HttpClient) { }
  getArtistsAndSingers(): Observable<ArtistsAndSingers[]> {
    return this.httpClient.get<ArtistsAndSingers[]>(this.baseUrl + 'GetArtistsAndSingers');
  }
  getArtistOrSingerByName(name: string): Observable<ArtistsAndSingers> {
    return this.httpClient.get<ArtistsAndSingers>(this.baseUrl + "GetArtistOrSingerByName?name=" + name);
  }
}
