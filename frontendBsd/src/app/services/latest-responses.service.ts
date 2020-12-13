import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LastesResponsView } from '../classes/lastesResponsView';

@Injectable({
  providedIn: 'root'
})
export class LatestResponsesService {

  baseUrl:string="https://localhost:44368/api/LatestCommits/";
  constructor(private httpClient:HttpClient) { }

  getLastResponsesToArticlesAndSongs(): Observable<LastesResponsView[]> {
    return this.httpClient.get<LastesResponsView[]>(this.baseUrl + "GetLastCommitsToArticlesAndSongs")
  }
}
