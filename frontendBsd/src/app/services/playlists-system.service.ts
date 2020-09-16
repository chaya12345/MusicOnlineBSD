import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PlaylistSystem } from '../classes/playlistSystem';

@Injectable({
  providedIn: 'root'
})
export class PlaylistsSystemService {

  baseUrl: string = "https://localhost:44368/api/PlaylistsSystem/";

  constructor(private httpClient: HttpClient) { }
  
  public getPlaylists(): Observable<PlaylistSystem[]> {
    return this.httpClient.get<PlaylistSystem[]>(this.baseUrl + "GetPlaylists");
  }

}