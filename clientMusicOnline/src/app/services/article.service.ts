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
  
}
