import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Tag } from '../classes/tag';

@Injectable({
  providedIn: 'root'
})
export class TagService {

  baseUrl:string="https://localhost:44368/api/Tags/";
  constructor(private httpClient: HttpClient) { }
  
  public getTags(): Observable<Tag[]> {
    return this.httpClient.get<Tag[]>(this.baseUrl+"GetTags");
  }
  public addTags(tag:Tag): void {
    this.httpClient.post(this.baseUrl+"PostTags",tag);
  }
}
