import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { FollowUp } from '../classes/followUp';

@Injectable({
  providedIn: 'root'
})
export class FollowUpService {

  baseUrl: string = "https://localhost:44368/api/FollowUp/";

  constructor(private httpClient: HttpClient) { }

  addFollowUp(followUp: FollowUp): Observable<any> {
    return this.httpClient.post(this.baseUrl + 'PostFollowUp', followUp);
  }
  deleteFollowUp(followUpId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+'DeleteFollowUp?followUpId='+followUpId);
  }
  getSongsNameYouFollowUp(userId?:number,mail?:string):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetSongsNameYouFollowUp?userId='+userId+'&mail='+mail);
  }
  getArticlesNameYouFollowUp(userId?:number,mail?:string):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetArticlesNameYouFollowUp?userId='+userId+'&mail='+mail);
  }
  getMailsOfSongFollowUp(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetMailsOfSongFollowUp?songId='+songId);
  }
  getMailsOfArticleFollowUp(articleId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetMailsOfArticleFollowUp?articleId='+articleId);
  }


}
