import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { FavoriteSongsToUser } from '../classes/favoriteSongsToUser';
import { Song } from '../classes/song';

@Injectable({
  providedIn: 'root'
})
export class FavoriteSongsToUserService {

  baseUrl: string = "https://localhost:44368/api/FavoriteSongsToUser/";
  constructor(private httpClient: HttpClient) { }

  getFavoriteSongsToUser(userId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetFavoriteSongsToUser?userId=" + userId);
  }
  addFavoriteSongToUser(favoriteSong:FavoriteSongsToUser):Observable<any>{
    return this.httpClient.post(this.baseUrl+"PostFavoriteSongToUser",favoriteSong);
  }
  deleteFavoriteSongFromUser(userId:number,songId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+"DeleteFavoriteSongFromUser?userId="+userId+"&songId="+songId);
  }
}
