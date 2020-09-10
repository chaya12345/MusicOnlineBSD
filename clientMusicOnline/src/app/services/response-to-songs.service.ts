import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ResponseToSongsService {

  constructor(private httpClient:HttpClient) { }
  public addResponse(response:ResponsesToSongs):void{
    this.httpClient.post("https://localhost:44368/api/ResponsesToSongs/PostResponse",response);
  }
  public getSongResponses(songId:number):Observable<ResponsesToSongs[]>{
    return this.httpClient.get<ResponsesToSongs[]>("https://localhost:44368/api/ResponsesToSongs/getSongResponses?songId="+songId);
  }
  public deleteResponse(responseId:number):void{
    this.httpClient.delete("https://localhost:44368/api/ResponsesToSongs/DeleteResponse?responseId?="+responseId);
  }
  public getLastResponses():Observable<ResponsesToSongs[]>{
    return this.httpClient.get<ResponsesToSongs[]>("https://localhost:44368/api/ResponsesToSongs/GetLastResponses");
  }
}
