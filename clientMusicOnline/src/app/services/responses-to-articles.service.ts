import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Observable } from 'rxjs';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { LastResponsView } from '../classes/lastResponsView';

@Injectable({
  providedIn: 'root'
})
export class ResponsesToArticlesService {

  constructor(private httpClient:HttpClient) { }
  public addResponse(response:ResponsesToArticles):void{
    this.httpClient.post("https://localhost:44368/api/ResponsesToArticles/PostResponse",response);
  }
  public getArticleResponses(articleId:number):Observable<ResponsesToArticles[]>{
    return this.httpClient.get<ResponsesToArticles[]>("https://localhost:44368/api/ResponsesToArticles/GetArticleResponses?articleId="+articleId);
  }
  public deleteResponse(responseId:number):void{
    this.httpClient.delete("https://localhost:44368/api/ResponsesToArticles/DeleteResponse?responseId?="+responseId);
  }
  public getLastResponses():Observable<ResponsesToArticles[]>{
    return this.httpClient.get<ResponsesToArticles[]>("https://localhost:44368/api/ResponsesToArticles/GetLastResponses");
  }
  public getLast5Responses():Observable<LastResponsView[]>{
    return this.httpClient.get<LastResponsView[]>("https://localhost:44368/api/ResponsesToArticles/GetLast5Responses")
  }
}
