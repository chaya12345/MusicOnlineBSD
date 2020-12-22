import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CommitsToSongs } from '../classes/commitsToSongs';

@Injectable({
  providedIn: 'root'
})
export class CommitsToSongsService {

  baseUrl: string = "https://localhost:44368/api/CommitsToSongs/";
  constructor(private httpClient: HttpClient) { }
  
  public addCommit(commit: CommitsToSongs): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostCommit", commit);
  }
  public getSongCommits(songId: number): Observable<CommitsToSongs[]> {
    return this.httpClient.get<CommitsToSongs[]>(this.baseUrl + "GetSongCommits?songId=" + songId);
  }
  public getCountCommitsToSong(songId: number): Observable<number> {
    return this.httpClient.get<number>(this.baseUrl + "GetCountCommitsToSong?songId=" + songId);
  }
  public deleteCommit(commitId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteCommit?commitId=" + commitId);
  }
  public getLastCommits(): Observable<CommitsToSongs[]> {
    return this.httpClient.get<CommitsToSongs[]>(this.baseUrl + "GetLastCommits");
  }
  updateIsTested(commitId:number,isTested):Observable<boolean>{
    return this.httpClient.put<boolean>(this.baseUrl+"UpdateIsTested?commitId="+commitId+"&isTested="+isTested,isTested);
  }
}
