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
  public addArticle(newArticle:Article):void{
    this.httpClient.post(this.baseUrl+"PostArticle",newArticle);
  }
  public deleteArticle(articleId:number):void{
    this.httpClient.delete(this.baseUrl+ "GetArticleById?articleid="+articleId);
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
}
