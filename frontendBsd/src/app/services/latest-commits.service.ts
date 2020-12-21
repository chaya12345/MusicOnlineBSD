import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Commit } from '../classes/commit';

@Injectable({
  providedIn: 'root'
})
export class LatestCommitsService {

  baseUrl:string="https://localhost:44368/api/LatestCommits/";
  constructor(private httpClient:HttpClient) { }

  getLastCommitsToArticlesAndSongs(): Observable<Commit[]> {
    return this.httpClient.get<Commit[]>(this.baseUrl + "GetLastCommitsToArticlesAndSongs")
  }
}
