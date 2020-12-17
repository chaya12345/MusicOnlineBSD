import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SingersToSongService {

  baseUrl = "https://localhost:44368/api/SingersToSongs/"

  constructor(private httpClient: HttpClient) { }

  public getSingersToSong(songId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + "GetSingersToSong?songId=" + songId);
  }

}
