import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SearchingToSinger } from '../classes/searchingToSinger';

@Injectable({
  providedIn: 'root'
})
export class SearchingToSingerService {

  constructor(private httpClient:HttpClient) { }
  public getAllSearching():Observable<SearchingToSinger[]>{
    return this.httpClient.get<SearchingToSinger[]>("https://localhost:44368/api/SearchingToSinger/GetAllSearching");
  }
  public GetCountOfSearchingToSinger(singerId:number):Observable<number>{
    return this.httpClient.get<number>("https://localhost:44368/api/SearchingToSinger/GetCountOfSearchingToSinger?singerId="+singerId);
  }
  public addSearchingToSinger(singerId:number):void{
    this.httpClient.post("https://localhost:44368/api/SearchingToSinger/PostSearchingToSinger?singerId="+singerId,singerId);
  }
  public updateSearchingToSinger(singerId:number):void{
    this.httpClient.put("https://localhost:44368/api/SearchingToSinger/PutSearchingToSinger?singerId="+singerId,singerId);
  }
}
