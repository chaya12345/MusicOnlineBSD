import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AtristToSongs } from '../classes/artistsToSongs';

@Injectable({
  providedIn: 'root'
})
export class ArtistsToSongsService {

  constructor(private httpClient:HttpClient) { }
  public getArtistsToSong(songId:number):Observable<AtristToSongs[]>{
    return this.httpClient.get<AtristToSongs[]>("https://localhost:44368/api/ArtistsToSongs/GetArtistsToSong?songId="+songId);
  }
  public getSongsToArtist(artistId:number):Observable<AtristToSongs[]>{
    return this.httpClient.get<AtristToSongs[]>("https://localhost:44368/api/ArtistsToSongs/getSongsToArtist?artistId="+artistId);
  }
  public addArtistToSong(artistsToSongs:AtristToSongs):void{
    this.httpClient.post("https://localhost:44368/api/ArtistsToSongs/PostArtistToSong",artistsToSongs);
  }
}
