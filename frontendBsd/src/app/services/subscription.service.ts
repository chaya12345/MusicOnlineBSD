import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subscription } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SubscriptionService {

  baseUrl: string = "https://localhost:44368/api/Subscription/";
  constructor(private httpClient:HttpClient) { }

  addSubscription(subscription:Subscription):Observable<any>{
    return this.httpClient.post(this.baseUrl+'PostSubscription',subscription);
  }
  deleteSubscription(subscriptionId:number):Observable<any>{
    return this.httpClient.delete(this.baseUrl+'DeleteSubscription?subscriptionId='+subscriptionId);
  }
  getMailsOfSingerSubscription(singerId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetMailsOfSingerSubscription?singerId='+singerId);
  }
  getYourSingersNameSubscription(userId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+'GetYourSingersNameSubscription?userId='+userId);
  }
}
