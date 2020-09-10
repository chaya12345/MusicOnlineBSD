import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ResponsesToArticlesService {

  constructor(private httpClient: HttpClient) { }
  GetArticleResponses(articleId): Observable<ResponsesToArticles[]> {
    return this.httpClient.get<ResponsesToArticles[]>("https://localhost:44368/api/ResponsesToArticles/GetArticleResponses?articleId=" + articleId);
  }
  
}
