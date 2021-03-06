import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { Singer } from '../classes/singer';
import { ArtistWithJob } from '../classes/artistWithJob';
import { MailDetails } from './upload.service';

export class SongObj {
  public song: Song;
  public singers: string[];
  public tags: string[];
  public artists: ArtistWithJob[];
}

@Injectable({
  providedIn: 'root'
})

export class SongService {

  baseUrl: string = "https://localhost:44368/api/Songs/";
  constructor(private httpClient: HttpClient) { }

  public getSongs(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongs");
  }
  public getSongsIncludePerformances(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsIncludePerformances");
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
  // public addSong(songObj: SongObj): Observable<any> {
  //   return this.httpClient.post(this.baseUrl + "PostSong", songObj);
  // }
  //----------------------------------------------------------------------//
  public addFullSong(songObj: SongObj, imageFile: File, songFile: File, mailDetails: MailDetails): Observable<boolean> {
    const formData: FormData = new FormData();
    formData.append("details", JSON.stringify(songObj));
    formData.append("song", songFile, songFile.name);
    formData.append("image", imageFile, imageFile.name);
    // formData.append("mailDetails", JSON.stringify(mailDetails));
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');
    return this.httpClient.post<boolean>(this.baseUrl + "AddSong?username=" + mailDetails.username +
      "&password=" + mailDetails.password + "&email=" + mailDetails.email, formData);
  }
  public addSong(songObj: SongObj, imageFile: File, songFile: File, mailDetails: MailDetails, content: string, isEdit: boolean = false): Observable<boolean> {
    const formData: FormData = new FormData();
    formData.append("details", JSON.stringify(songObj));
    if (!isEdit) {
      if (songFile != undefined && songFile != null) {
        formData.append("song", songFile, songFile.name);
      }
      if (imageFile != undefined && imageFile != null) {
        formData.append("image", imageFile, imageFile.name);
      }
    }
    formData.append("content", content);
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');
    return this.httpClient.post<boolean>(this.baseUrl + "AddSong?username=" + (!isEdit ? (mailDetails.username +
      "&password=" + mailDetails.password + "&email=" + mailDetails.email) : null + "&password=" + null + "&email=" + null)
      + "&isEdit=" + isEdit, formData);
  }
  public deleteSong(songId: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(this.baseUrl + "deleteSong?songId=" + songId);
  }
  public increaseLikeToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutIncreaseLikeToSong?songId=" + songId, songId);
  }
  public decreaseLikeToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutDecreaseLikeToSong?songId=" + songId, songId);
  }
  public getSongsByArtist(artistName: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByArtist?artistName=" + artistName);
  }
  public getSongsByArtistsAndSingers(name: string): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsByArtistsAndSingers?name=" + name);
  }
  public getSongsPublishedThisYear(): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetSongsPublishedThisYear");
  }
  public addViewToSong(songId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutViewToSong?songId=" + songId, songId);
  }
  public UpdateSong(songObj: SongObj): Observable<any> {
    return this.httpClient.put(this.baseUrl + "UpdateSong", songObj);
  }
  // יצירת קריאת סרבר עם הרשאות גישה
  //   const headers = { 'Authorization': 'Bearer my-token' }
  //   const body = { title: 'Angular POST Request Example' }
  //    this.http.post<any>('https://jsonplaceholder.typicode.com/posts', body, { headers });


}
