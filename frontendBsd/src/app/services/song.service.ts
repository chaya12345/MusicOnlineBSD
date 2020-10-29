import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { from, Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongsDetailsView } from '../classes/songsDetailsView';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  baseUrl: string = "https://localhost:44368/api/Songs/";
  constructor(private httpClient: HttpClient) { }

  public getSongs(): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongs");
  }
  public getSongById(songId: number): Observable<SongsDetailsView> {
    return this.httpClient.get<SongsDetailsView>(this.baseUrl + "GetSongById?songId=" + songId);
  }
  public getSongsBySinger(singerName: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsBySinger?singerName=" + singerName);
  }
  public getSongsByAlbum(albumName: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByAlbum?albumName=" + albumName);
  }
  public getSongsByTag(tagName: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByTag?tagName=" + tagName);
  }
  public getSongsByTagId(tagId: number): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByTagId?tagId=" + tagId);
  }
  public getSimilarSongs(songId: number): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSimilarSongs?songId=" + songId);
  }
  public getSongsByTags(tags: string[]): Observable<SongsDetailsView[]> {
    var obj = { "tags": tags }
    return this.httpClient.post<SongsDetailsView[]>(this.baseUrl + "PostSongsByTags", obj);
  }
  public getSongsByAllTags(tags: string[]): Observable<SongsDetailsView[]> {
    var obj = { "tags": tags }
    return this.httpClient.post<SongsDetailsView[]>(this.baseUrl + "PostSongsByAllTags", obj);
  }
  public getSongsByTagOrArtist(name: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByTagOrArtist?name=" + name);
  }
  public getPerformances(): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetPerformances");
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
  public getSongsByArtist(artistName: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByArtist?artistName=" + artistName);
  }
  public getSongsByArtistsAndSingers(name: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsByArtistsAndSingers?name=" + name);
  }
  public getSongsPublishedThisYear(year: string): Observable<SongsDetailsView[]> {
    return this.httpClient.get<SongsDetailsView[]>(this.baseUrl + "GetSongsPublishedThisYear?year=" + year);
  }
  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
