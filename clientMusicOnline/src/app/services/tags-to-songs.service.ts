import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TagsToSong } from '../classes/tagsToSong';

@Injectable({
  providedIn: 'root'
})
export class TagsToSongsService {

  constructor(private httpClient: HttpClient) { }

  // GetTagsNamesToSong(songId: number): Observable<TagsToSong> {
  //   return this.httpClient.post<TagsToSong>("https://localhost:44368/api/TagsToSongs/GetTagsNamesToSong?songId=", songId);
  // }

}
