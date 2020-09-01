import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  constructor(private httpClient: HttpClient) { }

  getSongsList():Observable<Song[]>
  {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongs");
  }

}
