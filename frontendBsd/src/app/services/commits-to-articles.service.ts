import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CommitsToArticles } from '../classes/commitsToArticles';

@Injectable({
  providedIn: 'root'
})
export class CommitsToArticlesService {

  baseUrl: string = "https://localhost:44368/api/CommitsToArticles/";
  constructor(private httpClient: HttpClient) { }
  public addCommit(commit: CommitsToArticles): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostCommit", commit);
  }
  public getArticleCommits(articleId: number): Observable<CommitsToArticles[]> {
    return this.httpClient.get<CommitsToArticles[]>(this.baseUrl + "GetArticleCommits?articleId=" + articleId);
  }
  public getCountCommitsToArticle(articleId: number): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetCountCommitsToArticle?articleId=" + articleId);
  }
  public deleteCommit(commitId: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(this.baseUrl + "DeleteCommit?commitId=" + commitId);
  }
  public getLastCommits(): Observable<CommitsToArticles[]> {
    return this.httpClient.get<CommitsToArticles[]>(this.baseUrl + "GetLastCommits");
  }
  updateIsTested(commitId:number,isTested):Observable<boolean>{
    return this.httpClient.put<boolean>(this.baseUrl+"UpdateIsTested?commitId="+commitId+"&isTested="+isTested,isTested);
  }
  
}
