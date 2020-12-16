import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Article } from '../classes/article';

@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  baseUrl: string = "https://localhost:44368/api/Articles/";
  constructor(private httpClient: HttpClient) { }
  
  public getArticles(): Observable<Article[]> {
    return this.httpClient.get<Article[]>(this.baseUrl+"GetArticles");
  }
  public getArticleById(articleId:number):Observable<Article>{
    return this.httpClient.get<Article>(this.baseUrl+"GetArticleById?articleid="+articleId);
  }
  public addArticle(obj:object):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostArticle",obj);
  }
  public deleteArticle(articleId:number):Observable<any>{
   return this.httpClient.delete(this.baseUrl+ "GetArticleById?articleid="+articleId);
  }
  public getArticlesByTag(tagName:string):Observable<Article[]>{
    return this.httpClient.get<Article[]>(this.baseUrl+"DeleteArticle?tagName="+tagName);
  }
  public getArticlesByTags(tags:string[]):Observable<Article[]>{
    var obj={"tags":tags};
    return this.httpClient.post<Article[]>(this.baseUrl+"PostArticlesByTags",obj);
  }
  public getArticlesByAllTags(tags:string[]):Observable<Article[]>{
    var obj={"tags":tags};
    return this.httpClient.post<Article[]>(this.baseUrl+"PostArticlesByAllTags",obj);
  }
  public increaseLikeToArticle(articleId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutIncreaseLikeToArticle?articleId=" + articleId, articleId);
  }
  public decreaseLikeToArticle(articleId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutDecreaseLikeToSongArticle?articleId=" + articleId,articleId);
  }
  public addViewToArticle(articleId):Observable<any>{
    return this.httpClient.put(this.baseUrl+"PutViewToArticle?articleId="+articleId,articleId);
  }
}
