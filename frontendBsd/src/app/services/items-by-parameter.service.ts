import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ItemsByParameter } from '../classes/itemsByParameter';

@Injectable({
  providedIn: 'root'
})
export class ItemsByParameterService {

  baseUrl: string = "https://localhost:44368/api/ItemsByParameter/";

  constructor(private httpClient: HttpClient) { }

  getItemsByParameter(parameter: string): Observable<ItemsByParameter[]> {
    return this.httpClient.get<ItemsByParameter[]>(this.baseUrl + 'GetItemsByParameter?parameter=' + parameter);
  }

}
