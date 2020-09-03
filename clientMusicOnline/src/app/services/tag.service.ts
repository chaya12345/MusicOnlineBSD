import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Tag } from '../classes/tag';

@Injectable({
  providedIn: 'root'
})
export class TagService {

  constructor(private httpClient: HttpClient) { }
  
  getTags(): Observable<Tag[]> {
    return this.httpClient.get<Tag[]>("https://localhost:44368/api/TagName/GetTagNames");
  }

}
