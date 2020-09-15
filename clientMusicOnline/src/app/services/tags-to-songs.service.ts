import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TagsToSong } from '../classes/tagsToSong';

@Injectable({
  providedIn: 'root'
})
export class TagsToSongsService {

  baseUrl:string="https://localhost:44368/api/TagsToSongs/";
  constructor(private httpClient: HttpClient) { }
  public getTagsToSong(songId:number):Observable<TagsToSong[]>{
    return this.httpClient.get<TagsToSong[]>(this.baseUrl+"GetTagsToSong?songId="+songId);
  }
  public getTagsNamesToSong(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+"GetTagsNamesToSong?songId="+songId);
  }
  public GetTagsIncludeArtistsToSong(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>(this.baseUrl+"GetTagsIncludeArtistsToSong?songId="+songId);
  }
  public addTagToSong(tagToSong:TagsToSong):Observable<any>{
    return this.httpClient.post(this.baseUrl + "PostTagToSong", tagToSong);
  }

}
