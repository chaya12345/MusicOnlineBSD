import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Article } from '../classes/article';

export class ArticleObj {
  article: Article;
  singers: string[];
  tags: string[];
}

@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  baseUrl: string = "https://localhost:44368/api/Articles/";
  constructor(private httpClient: HttpClient) { }

  public getArticles(): Observable<Article[]> {
    return this.httpClient.get<Article[]>(this.baseUrl + "GetArticles");
  }
  public getArticleById(articleId: number): Observable<Article> {
    return this.httpClient.get<Article>(this.baseUrl + "GetArticleById?articleid=" + articleId);
  }
  // public addArticle(obj:object):Observable<boolean>{
  //  return this.httpClient.post<boolean>(this.baseUrl+"PostArticle",obj);
  // }
  public addArticle(articleObj: ArticleObj, imageFile: File, content: string, isEdit: boolean = false): Observable<boolean> {
    const formData: FormData = new FormData();
    formData.append("details", JSON.stringify(articleObj));
    formData.append("image", imageFile, imageFile.name);
    formData.append("content", content);
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');
    return this.httpClient.post<boolean>(this.baseUrl + "AddArticle?isEdit=" + isEdit, formData);
  }
  public deleteArticle(articleId: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(this.baseUrl + "DeleteArticle?articleId=" + articleId);
  }
  public getArticlesByTag(tagName: string): Observable<Article[]> {
    return this.httpClient.get<Article[]>(this.baseUrl + "DeleteArticle?tagName=" + tagName);
  }
  public getArticlesByTags(tags: string[]): Observable<Article[]> {
    var obj = { "tags": tags };
    return this.httpClient.post<Article[]>(this.baseUrl + "PostArticlesByTags", obj);
  }
  public getArticlesByAllTags(tags: string[]): Observable<Article[]> {
    var obj = { "tags": tags };
    return this.httpClient.post<Article[]>(this.baseUrl + "PostArticlesByAllTags", obj);
  }
  public increaseLikeToArticle(articleId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutIncreaseLikeToArticle?articleId=" + articleId, articleId);
  }
  public decreaseLikeToArticle(articleId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutDecreaseLikeToSongArticle?articleId=" + articleId, articleId);
  }
  public addViewToArticle(articleId): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutViewToArticle?articleId=" + articleId, articleId);
  }
}
