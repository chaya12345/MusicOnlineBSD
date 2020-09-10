import { Injectable } from '@angular/core';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ResponsesToArticlesService {

  constructor(private httpClient: HttpClient) { }
  
  getResponses(): Observable<ResponsesToArticles[]> {
    return this.httpClient.get<ResponsesToArticles[]>("https://localhost:44368/api/Responses/GetLastResponses");
  }

}
