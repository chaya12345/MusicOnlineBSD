import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artist } from '../classes/artist';

@Injectable({
  providedIn: 'root'
})
export class ArtistService {
  baseUrl: string ="https://localhost:44368/api/Artists/"
  constructor(private httpClient: HttpClient) { }
  
  public getArtists(): Observable<Artist[]> {
    return this.httpClient.get<Artist[]>(this.baseUrl+"GetArtists");
  }
  public addArtist(artist:Artist):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostArtist",artist);
  }
  public updateArtist(artist:Artist):Observable<any>{
    return this.httpClient.put(this.baseUrl+"UpdateArtist",artist);
  }

}
