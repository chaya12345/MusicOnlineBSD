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

  baseUrl:string="https://localhost:44368/api/ResponsesToArticles/";
  constructor(private httpClient:HttpClient) { }
  public addResponse(response:ResponsesToArticles):void{
    this.httpClient.post(this.baseUrl+"PostResponse",response);
  }
  public getArticleResponses(articleId:number):Observable<ResponsesToArticles[]>{
    return this.httpClient.get<ResponsesToArticles[]>(this.baseUrl+"GetArticleResponses?articleId="+articleId);
  }
  public deleteResponse(responseId:number):void{
    this.httpClient.delete(this.baseUrl+"DeleteResponse?responseId?="+responseId);
  }
  public getLastResponses():Observable<ResponsesToArticles[]>{
    return this.httpClient.get<ResponsesToArticles[]>(this.baseUrl+"GetLastResponses");
  }
  public getLast5Responses():Observable<LastResponsView[]>{
    return this.httpClient.get<LastResponsView[]>(this.baseUrl+"GetLast5Responses")
  }
}
