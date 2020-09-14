import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TagsToSong } from '../classes/tagsToSong';

@Injectable({
  providedIn: 'root'
})
export class TagsToSongsService {

  constructor(private httpClient: HttpClient) { }
  public getTagsToSong(songId:number):Observable<TagsToSong[]>{
    return this.httpClient.get<TagsToSong[]>("https://localhost:44368/api/TagsToSongs/GetTagsToSong?songId="+songId);
  }
  public getTagsNamesToSong(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>("https://localhost:44368/api/TagsToSongs/GetTagsNamesToSong?songId="+songId);
  }
  public GetTagsIncludeArtistsToSong(songId:number):Observable<string[]>{
    return this.httpClient.get<string[]>("https://localhost:44368/api/TagsToSongs/GetTagsIncludeArtistsToSong?songId="+songId);
  }
  public addTagToSong(tagToSong:TagsToSong):void{
    this.httpClient.post("https://localhost:44368/api/TagsToSongs/PostTagToSong",tagToSong);
  }

}
