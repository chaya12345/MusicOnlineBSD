import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SingersToArticleService {

  baseUrl = "https://localhost:44368/api/SingersToArticles/"

  constructor(private httpClient: HttpClient) { }

  public getSingersToArticle(articleId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + "GetSingersToArticle?articleId=" + articleId);
  }
  
}
