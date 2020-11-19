import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Subscription } from '../classes/subscription';


@Injectable({
  providedIn: 'root'
})
export class SubscriptionService {

  baseUrl: string = "https://localhost:44368/api/Subscription/";
  constructor(private httpClient: HttpClient) { }

  addSubscription(subscription: Subscription): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + 'PostSubscription', subscription);
  }
  deleteSubscription(subscriptionId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + 'DeleteSubscription?subscriptionId=' + subscriptionId);
  }
  getMailsOfSingerSubscription(singerId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + 'GetMailsOfSingerSubscription?singerId=' + singerId);
  }
  getYourSingersNameSubscription(userId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + 'GetYourSingersNameSubscription?userId=' + userId);
  }
}
