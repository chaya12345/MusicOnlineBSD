import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AtristToSongs } from '../classes/artistsToSongs';

@Injectable({
  providedIn: 'root'
})
export class ArtistsToSongsService {

  baseUrl: string ="https://localhost:44368/api/ArtistsToSongs/";

  constructor(private httpClient:HttpClient) { }
  public getArtistsToSong(songId:number):Observable<AtristToSongs[]>{
    return this.httpClient.get<AtristToSongs[]>(this.baseUrl+"GetArtistsToSong?songId="+songId);
  }
  public getSongsToArtist(artistId:number):Observable<AtristToSongs[]>{
    return this.httpClient.get<AtristToSongs[]>(this.baseUrl+"getSongsToArtist?artistId="+artistId);
  }
  public addArtistToSong(artistsToSongs:AtristToSongs):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostArtistToSong",artistsToSongs);
  }
  public getArtistsNamesToSong(songId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + "GetArtistsNamesToSong?songId=" + songId);
  }
}
