import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';

@Injectable({
  providedIn: 'root'
})
export class SingerService {

  baseUrl: string = "https://localhost:44368/api/Singers/";
  constructor(private httpClient: HttpClient) { }

  public getSingers(): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl + "GetSingers");
  }
  public GetSingerByName(name: string): Observable<Singer> {
    return this.httpClient.get<Singer>(this.baseUrl + "GetSingerByName?name=" + name);
  }
  public addSinger(singer:Singer):Observable<boolean>{
   return this.httpClient.post<boolean>(this.baseUrl+"PostSinger",singer);
  }
  public addSingerWithSavingImg(singer: Singer, imageFile: File): Observable<any> {
    const formData: FormData = new FormData();
    formData.append("image", imageFile);
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');
    return this.httpClient.post(this.baseUrl + "AddSinger?name=" + singer.name + "&image=" + singer.image, formData);
  }
  addSearchingToSinger(singerName: string): Observable<any> {
    return this.httpClient.put(this.baseUrl + 'PutSearchingToSinger?singerName=' + singerName, singerName);
  }
  public updateSinger(singer: Singer): Observable<boolean> {
    return this.httpClient.put<boolean>(this.baseUrl + "UpdateSinger", singer);
  }
  deleteSinger(singerId: number): Observable<any> {
    return this.httpClient.delete(this.baseUrl + "DeleteSinger?singerId=" + singerId);
  }
}
