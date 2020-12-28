import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Commit } from '../classes/commit';

@Injectable({
  providedIn: 'root'
})
export class CommitService {

  baseUrl = "https://localhost:44368/api/Commits/";

  constructor(private httpClient: HttpClient) { }

  public getCommits(): Observable<Commit[]> {
    return this.httpClient.get<Commit[]>(this.baseUrl + "GetCommits");
  }
  getCommitById(commitId:number,type:string):Observable<Commit>{
    return this.httpClient.get<Commit>(this.baseUrl+"GetCommitById?commitId="+commitId+"&type="+type);
  }

}
