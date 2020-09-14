import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  baseUrl: string = "https://localhost:44368/api/Songs/";

  constructor(private httpClient: HttpClient) { }

  public getSongs(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongs");
  }
  public getSongById(songId: number): Observable<Song> {
    return this.httpClient.get<Song>(this.baseUrl + "GetSongById?songId=" + songId);
  }
  public getSongsBySinger(singerName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsBySinger?singerName=" + singerName);
  }
  public getSongsByAlbum(albumName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByAlbum?albumName=" + albumName);
  }
  public getSongsByTag(tagName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByTag?tagName=" + tagName);
  }
  public getSimilarSongs(songId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSimilarSongs?songId=" + songId);
  }
  public getSongsByTags(tags: string[]): Observable<Song[]> {
    var obj = { "tags": tags }
    return this.httpClient.post<Song[]>(this.baseUrl + "PostSongsByTags", obj);
  }
  public getSongsByAllTags(tags: string[]): Observable<Song[]> {
    var obj = { "tags": tags }
    return this.httpClient.post<Song[]>(this.baseUrl + "PostSongsByAllTags", obj);
  }
  public addSong(song: Song): void {
    this.httpClient.post(this.baseUrl + "PostSong", song);
  }
  public deleteSong(songId: number): void {
    this.httpClient.delete(this.baseUrl + "deleteSong?songId=" + songId);
  }
  public increaseLikeToSong(songId: number): void {
    this.httpClient.put(this.baseUrl + "PutIncreaseLikeToSong?songId=", songId);
  }
  public decreaseLikeToSong(songId: number): void {
    this.httpClient.delete(this.baseUrl + "PutDecreaseLikeToSong?songId=" + songId);
  }
  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
