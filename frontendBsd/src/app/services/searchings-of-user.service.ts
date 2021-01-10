import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ItemsWithPinnedToUser } from '../classes/itemsWithPinnedToUser';

export class SearchingOfUser {
  id: number;
  userId: number;
  itemId: number;
  type: string;
  count: number;
  lastDate: Date;
}

@Injectable({
  providedIn: 'root'
})
export class SearchingsOfUserService {

  baseUrl: string = "https://localhost:44368/api/SearchingsOfUser/";

  constructor(private httpClient: HttpClient) { }

  public getSingers(userId: number): Observable<SearchingOfUser[]> {
    return this.httpClient.get<SearchingOfUser[]>(this.baseUrl + "GetSearchingsOfUser?userId=" + userId);
  }
  
  public addSearchingsToUser(userId: number, itemName: string): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "AddSearchingsToUser?userId=" + userId + "&itemName=" + itemName, userId);
  }

  public getUpdatingsToUser(userId: number): Observable<ItemsWithPinnedToUser[]> {
    return this.httpClient.get<ItemsWithPinnedToUser[]>(this.baseUrl + "GetUpdatingsToUser?userId=" + userId)
  }
  // public getUpdatingsToUser‏(userId: number): Observable<ItemsWithPinnedToUser[]> {
  //   return this.httpClient.get<ItemsWithPinnedToUser[]>(this.baseUrl + "GetUpdatingsToUser‏?userId=" + userId);
  // }
}
