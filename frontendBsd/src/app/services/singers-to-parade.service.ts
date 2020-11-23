import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingersToParade } from '../classes/singersToParade';

@Injectable({
  providedIn: 'root'
})
export class SingersToParadeService {
  
  baseUrl: string = "https://localhost:44368/api/SingersToParade/";

  constructor(private httpClient: HttpClient) { }

  getSingersInParade(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl + "GetSingersInParade");
  }
  addVotingToSinger(singerId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutVotingToSinger?singerId=" + singerId, singerId);
  }
  addSingerToParade(parade: SingersToParade): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSingerToParade", parade);
  }
  addSingersToParade(parades: SingersToParade[]): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostSingersToParade", parades);
  }
  deleteSingerFromParade(singerId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSingerFromParade?singerId=" + singerId);
  }

}
