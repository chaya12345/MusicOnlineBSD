import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Topics } from '../classes/topics';

@Injectable({
  providedIn: 'root'
})
export class TopicsService {

  baseUrl: string = "https://localhost:44368/api/Topics/";
  constructor(private httpClient: HttpClient) { }
  getTopics(): Observable<Topics[]> {
    return this.httpClient.get<Topics[]>(this.baseUrl + 'GetTopics');
  }
  updateTopic(topicId:number,updateTopic:Topics):Observable<any>{
    return this.httpClient.put(this.baseUrl+'PutTopic?topicId='+topicId,updateTopic);
  }
}
