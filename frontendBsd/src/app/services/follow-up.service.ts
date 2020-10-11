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
  deleteFollowUp(userId:number,id:number,type:string):Observable<any>{
    return this.httpClient.delete(this.baseUrl+'DeleteFollowUp?userId='+userId+'&id='+id+'&type='+type);
  }
  getSongsNameYouFollowUp(userId?:number,mail?:string):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetSongsNameYouFollowUp?userId='+userId+'&mail='+mail);
  }
  getArticlesNameYouFollowUp(userId?:number,mail?:string):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetArticlesNameYouFollowUp?userId='+userId+'&mail='+mail);
  }
  getMailsOfArticleFollowUp(articleId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetMailsOfArticleFollowUp?articleId='+articleId);
  }
  getMailsOfSongFollowUp(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetMailsOfSongFollowUp?songId='+songId);
  }
  IsUserFollowUpSong(userId:number,songId:number):Observable<boolean>{
    return this.httpClient.get<boolean>(this.baseUrl+'GetIsUserFollowUpSong?userId='+ userId+'&songId='+songId);
  }
  IsUserFollowUpArticle(userId:number,articleId:number):Observable<boolean>{
    return this.httpClient.get<boolean>(this.baseUrl+'GetIsUserFollowUpArticle?userId='+ userId+'&articleId='+articleId);
  }

}
