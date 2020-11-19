import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {  Observable } from 'rxjs';
import { Song } from '../classes/song';
import { Singer } from '../classes/singer';

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
  public getSongsByTagId(tagId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByTagId?tagId=" + tagId);
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
  public getSongsByTagOrArtist(name: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByTagOrArtist?name=" + name);
  }
  public getPerformances(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetPerformances");
  }
  public getSingerOfSong(songId: number): Observable<Singer> {
    return this.httpClient.get<Singer>(this.baseUrl + "GetSingerOfSong?songId=" + songId);
  }
  public addSong(song: Song): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSong", song);
  }
  public deleteSong(songId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "deleteSong?songId=" + songId);
  }
  public increaseLikeToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutIncreaseLikeToSong?songId=" + songId, songId);
  }
  public decreaseLikeToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutDecreaseLikeToSong?songId=" + songId,songId);
  }
  public getSongsByArtist(artistName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByArtist?artistName=" + artistName);
  }
  public getSongsByArtistsAndSingers(name: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByArtistsAndSingers?name=" + name);
  }
  public getSongsPublishedThisYear(year: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsPublishedThisYear?year=" + year);
  }
  public addViewToSong(songId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutViewToSong?songId="+songId,songId);
  }
  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
