import { Injectable } from '@angular/core';
import { Response } from '../classes/response';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ResponseService {

  constructor(private httpClient: HttpClient) { }
  
  getResponses(): Observable<Response[]> {
    return this.httpClient.get<Response[]>("https://localhost:44368/api/Responses/GetLastResponses");
  }

}
