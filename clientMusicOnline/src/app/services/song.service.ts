import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  constructor(private httpClient: HttpClient) { }

  getSongs(): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongs");
  }
  GetSongsBySinger(singerName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsBySinger?singerName=" + singerName);
  }
  GetSongsByAlbum(albumName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsByAlbum?albumName=" + albumName);
  }
  GetSongsByTag(tagName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsByTag?tagName=" + tagName);
  }
  GetSimilarSongs(songId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSimilarSongs?songId=" + songId);
  }
  GetSongsByTags(tags: object): Observable<Song[]> {
    return this.httpClient.post<Song[]>("https://localhost:44368/api/Songs/PostSongsByTags", tags);
  }
  // PostSong(song:Song):void{
  //   this.httpClient.post("https://localhost:44368/api/Songs/PostSong",song);
  // }

  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
