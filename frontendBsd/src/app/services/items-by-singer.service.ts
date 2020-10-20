import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ItemsBySinger } from '../classes/itemsBySinger';

@Injectable({
  providedIn: 'root'
})
export class ItemsBySingerService {

  baseUrl: string = "https://localhost:44368/api/ItemsBySinger/";
  constructor(private httpClient: HttpClient) { }
  getItemsBySinger(singerName: string): Observable<ItemsBySinger[]> {
    return this.httpClient.get<ItemsBySinger[]>(this.baseUrl + 'GetItemsBySinger?singerName=' + singerName);
  }
}
