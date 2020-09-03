import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artist } from '../classes/artist';

@Injectable({
  providedIn: 'root'
})
export class ArtistService {

  constructor(private httpClient: HttpClient) { }
  
  getArtists(): Observable<Artist[]> {
    return this.httpClient.get<Artist[]>("https://localhost:44368/api/Artists/GetArtists");
  }

}
