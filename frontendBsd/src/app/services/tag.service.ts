import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TagsForArticles, TagsForSongs } from '../classes/tag';

@Injectable({
  providedIn: 'root'
})
export class TagService {

  baseUrl:string="https://localhost:44368/api/Tags/";
  constructor(private httpClient: HttpClient) { }
  
  public getTagsForSongs(): Observable<TagsForSongs[]> {
    return this.httpClient.get<TagsForSongs[]>(this.baseUrl+"GetTagsForSongs");
  }
  public PostTagForSong(tag:TagsForSongs): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostTagForSong", tag);
  }
  getTagsForArticles():Observable<TagsForArticles[]>{
    return this.httpClient.get<TagsForArticles[]>(this.baseUrl+"GetTagsForArticles");
  }
  public addTagForArticle(tag:TagsForArticles): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostTagForArticle", tag);
  }
}
