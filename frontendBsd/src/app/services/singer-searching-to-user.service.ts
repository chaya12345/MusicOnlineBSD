import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';

@Injectable({
  providedIn: 'root'
})
export class SingerSearchingToUserService {

  baseUrl: string = "https://localhost:44368/api/SingerSearchingToUser/"
  constructor(private httpClient:HttpClient) { }

  getSingerSearchingToUser(userId:number):Observable<Singer[]>{
    return this.httpClient.get<Singer[]>(this.baseUrl+"GetSingerSearchingToUser?userId="+userId);
  }
  addSingerSearchingToUser(userId:number,singerId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutSingerSearchingToUser?userId="+userId+"&singerId="+singerId,singerId);
  }

}
