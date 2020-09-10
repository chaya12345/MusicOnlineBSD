import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Article } from '../classes/article';

@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  constructor(private httpClient: HttpClient) { }
  
  public getArticles(): Observable<Article[]> {
    return this.httpClient.get<Article[]>("https://localhost:44368/api/Articles/GetArticles");
  }
  public getArticleById(articleId:number):Observable<Article>{
    return this.httpClient.get<Article>("https://localhost:44368/api/Articles/GetArticleById?articleid="+articleId);
  }
  public addArticle(newArticle:Article):void{
    this.httpClient.post("https://localhost:44368/api/Articles/PostArticle",newArticle);
  }
  public deleteArticle(articleId:number):void{
    this.httpClient.delete("https://localhost:44368/api/Articles/GetArticleById?articleid="+articleId);
  }
  public getArticlesByTag(tagName:string):Observable<Article[]>{
    return this.httpClient.get<Article[]>("https://localhost:44368/api/Articles/DeleteArticle?tagName="+tagName);
  }
  public getArticlesByTags(tags:string[]):Observable<Article[]>{
    var obj={"tags":tags};
    return this.httpClient.post<Article[]>("https://localhost:44368/api/Articles/PostArticlesByTags",obj);
  }
  public getArticlesByAllTags(tags:string[]):Observable<Article[]>{
    var obj={"tags":tags};
    return this.httpClient.post<Article[]>("https://localhost:44368/api/Articles/PostArticlesByAllTags",obj);
  }
}
