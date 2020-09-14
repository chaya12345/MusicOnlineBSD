import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ResponseToSongsService {

  baseUrl:string="https://localhost:44368/api/ResponsesToSongs/";
  constructor(private httpClient:HttpClient) { }
  public addResponse(response:ResponsesToSongs):void{
    this.httpClient.post(this.baseUrl+"PostResponse",response);
  }
  public getSongResponses(songId:number):Observable<ResponsesToSongs[]>{
    return this.httpClient.get<ResponsesToSongs[]>(this.baseUrl+"getSongResponses?songId="+songId);
  }
  public deleteResponse(responseId:number):void{
    this.httpClient.delete(this.baseUrl+"DeleteResponse?responseId?="+responseId);
  }
  public getLastResponses():Observable<ResponsesToSongs[]>{
    return this.httpClient.get<ResponsesToSongs[]>(this.baseUrl+"GetLastResponses");
  }
}
