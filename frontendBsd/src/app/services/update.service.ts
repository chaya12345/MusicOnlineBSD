import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Update } from '../classes/update';

@Injectable({
  providedIn: 'root'
})
export class UpdateService {

  baseUrl: string = "https://localhost:44368/api/Updates/";
  constructor(private httpClient: HttpClient) { }

  getUpdates(): Observable<Update[]> {
    return this.httpClient.get<Update[]>(this.baseUrl + 'GetUpdates');
  }
  getUpdate(updateId:number):Observable<Update>{
    return this.httpClient.get<Update>(this.baseUrl+'GetUpdate?updateId='+updateId);
  }
  addUpdate(update:Update):Observable<any>{
    return this.httpClient.post(this.baseUrl+'PostUpdate',update);
  }
  deleteUpdate(updateId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+'DeleteUpdate?updateId='+updateId);
  }
  getInProcessUpdates(): Observable<Update[]> {
    return this.httpClient.get<Update[]>(this.baseUrl + 'GetInProcessUpdates');
  }

}
