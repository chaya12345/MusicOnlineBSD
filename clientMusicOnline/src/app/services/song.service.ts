import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  constructor(private httpClient: HttpClient) { }

  public getSongs(): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongs");
  }
  public getSongsBySinger(singerName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsBySinger?singerName=" + singerName);
  }
  public getSongsByAlbum(albumName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsByAlbum?albumName=" + albumName);
  }
  public getSongsByTag(tagName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSongsByTag?tagName=" + tagName);
  }
  public getSimilarSongs(songId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>("https://localhost:44368/api/Songs/GetSimilarSongs?songId=" + songId);
  }
  public getSongsByTags(tags: string[]): Observable<Song[]> {
    var obj={"tags":tags}
    return this.httpClient.post<Song[]>("https://localhost:44368/api/Songs/PostSongsByTags", obj);
  }
  public getSongsByAllTags(tags: string[]): Observable<Song[]> {
    var obj={"tags":tags}
    return this.httpClient.post<Song[]>("https://localhost:44368/api/Songs/PostSongsByAllTags", obj);
  }
  public addSong(song:Song):void{
    this.httpClient.post("https://localhost:44368/api/Songs/PostSong",song);
  }
  public deleteSong(songId:number):void{
    this.httpClient.delete("https://localhost:44368/api/Songs/deleteSong?songId="+songId);
  }
  public inreaseLikeToSong(songId:number):void{
    this.httpClient.delete("https://localhost:44368/api/Songs/PutInreaseLikeToSong?songId="+songId);
  }
  public decreaseLikeToSong(songId:number):void{
    this.httpClient.delete("https://localhost:44368/api/Songs/PutDecreaseLikeToSong?songId="+songId);
  }
  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
