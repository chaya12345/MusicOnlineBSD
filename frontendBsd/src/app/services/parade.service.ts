import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Parade } from '../classes/parade';

@Injectable({
  providedIn: 'root'
})
export class ParadeService {

  baseUrl: string = "https://localhost:44368/api/Parade/";

  constructor(private httpClient: HttpClient) { }

  getActiveParade(): Observable<Parade> {
    return this.httpClient.get<Parade>(this.baseUrl + "GetActiveParade");
  }

  getParadeByYear(year: string): Observable<Parade> {
    return this.httpClient.get<Parade>(this.baseUrl + "GetParadeByYear?year=" + year);
  }

  addParade(parade: Parade): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "PostParade", parade);
  }

  finishedParade():Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutFinishedParade",1);
  }

}
