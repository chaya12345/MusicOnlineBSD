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
  deleteSubscription(userId: number, singerId: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(this.baseUrl + 'DeleteSubscription?userId=' + userId + "&singerId=" + singerId);
  }
  getMailsOfSingerSubscription(singerId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + 'GetMailsOfSingerSubscription?singerId=' + singerId);
  }
  getYourSingersNameSubscription(userId: number): Observable<string[]> {
    return this.httpClient.get<string[]>(this.baseUrl + 'GetYourSingersNameSubscription?userId=' + userId);
  }
}
