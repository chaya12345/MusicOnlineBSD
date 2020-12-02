import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LastViews } from '../classes/lastViews';

@Injectable({
  providedIn: 'root'
})
export class LastViewsService {

  baseUrl: string = "https://localhost:44368/api/LastViews/";

  constructor(private httpClient: HttpClient) { }
  getLastViews(): Observable<LastViews[]> {
    return this.httpClient.get<LastViews[]>(this.baseUrl + "GetLastViews");
  }
}
