import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { JanerStatistic, SingersSearchingStatistic } from '../classes/statistics';

@Injectable({
  providedIn: 'root'
})
export class StatisticsService {

  baseUrl: string = "https://localhost:44368/api/Statistics/";

  constructor(private httpClient: HttpClient) { }

  generalAmountOfViews(): Observable<JanerStatistic[]> {
    return this.httpClient.get<JanerStatistic[]>(this.baseUrl + "GeneralAmountOfViews");
  }
  severalSearchesForSinger():Observable<SingersSearchingStatistic[]>{
    return this.httpClient.get<SingersSearchingStatistic[]>(this.baseUrl+"SeveralSearchesForSinger");
  }
  
}
