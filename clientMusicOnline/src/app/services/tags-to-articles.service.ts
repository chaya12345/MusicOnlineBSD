import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TagsToArticle } from '../classes/tagsToArticle';

@Injectable({
  providedIn: 'root'
})
export class TagsToArticlesService {

  baseUrl:string="https://localhost:44368/api/TagsToArticles/";
  constructor(private httpClient:HttpClient) { }
  public getTagsToArticle(articleId:number):Observable<TagsToArticle[]>{
    return this.httpClient.get<TagsToArticle[]>(this.baseUrl+"GetTagsToArticle?articleId="+articleId);
  }
  public getTagsNamesToArticle(articleId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+"GetTagsNamesToArticle?articleId="+articleId);
  }
  public addTagToArticle(tagToArticle:TagsToArticle):void{
    this.httpClient.post(this.baseUrl+"PostTagToArticle",tagToArticle);
  }
}
