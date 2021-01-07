import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../classes/user';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { Article } from '../classes/article';
import { Singer } from '../classes/singer';
import { PinnedItemsToUser } from '../classes/pinnedItemsToUser';

export enum eInfo { SUBSCRIPTION = 1, FOLLOW_UP_SONGS, FOLLOW_UP_ARTICLES }
export class Simple {
  id?: number;
  name?: string;
  image?: string;
}

export class UserInfo {
  name?: eInfo;
  list?: Simple;
}

export class UpdatingToUser {
  id: number;
  title?: string;
  image?: string;
  date?: Date;
  count_likes?: Number;
  count_views?: number;
  type?: string;
}

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  private managers: User[] = [
    new User(5412, "הודיה עזרן",
      "0504117455h@gmail.com", "LegGh5QwYGE77@!", true),
    new User(7521, "אודיה אושרי",
      "bsd.odaya@gmail.com", "7d7vM6@vTPFcsBt", true)
  ];

  public get Manager(): User[] {
    return this.managers;
  }

  baseUrl: string = "https://localhost:44368/api/Users/";
  res: any;
  constructor(private httpClient: HttpClient) { }
  public signUp(user: User): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "PostRegistrationToWebsite", user);
  }
  public RegistrationToNewsleter(mail: string): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl + "PostRegistrationToNewsletter?mail=" + mail, mail);
  }
  public removeFromNewsletter(userId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PostRegistrationToNewsleter?userId=" + userId, userId);
  }
  public updateUserProfil(userId: number, user: User): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUserProfil?userId=" + userId, user);
  }
  public updateUserPassword(userId: number, password: string): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUserPassword?userId=" + userId + "&password=" + password, password);
  }
  public logInManager(userName: string, password: string): User {
    for (let i = 0; i < this.managers.length; i++) {
      const manager = this.managers[i];
      if (manager.password == password && (manager.name == userName || manager.mail == userName)) {
        return manager;
      }
    }
    return null;
  }
  public getManager(id: number) {
    if (parseInt(sessionStorage.getItem("manager")) == id) {
      for (let i = 0; i < this.managers.length; i++) {
        const manager = this.managers[i];
        if (manager.id === id) {
          return manager;
        }
      }
    }
    return null;
  }
  public logIn(userName: string, password: string): Observable<User> {
    return this.httpClient.get<User>(this.baseUrl + "GetUser?userName=" + userName + "&password=" + password);
  }
  public getUsers(): Observable<User[]> {
    return this.httpClient.get<User[]>(this.baseUrl + "GetUsers");
  }
  public GetFollowUpSongs(userId: number): Observable<Song[]> {
    return this.httpClient.get<Song[]>(this.baseUrl + "GetFollowUpSongs?userId=" + userId);
  }
  public GetFollowUpArticles(userId: number): Observable<Article[]> {
    return this.httpClient.get<Article[]>(this.baseUrl + "GetFollowUpArticles?userId=" + userId);
  }
  public GetSubscriptionToSinger(userId: number): Observable<Singer[]> {
    return this.httpClient.get<Singer[]>(this.baseUrl + "GetSubscriptionToSinger?userId=" + userId);
  }
  public GetUserInfo(id: number): Observable<UserInfo[]> {
    return this.httpClient.get<UserInfo[]>(this.baseUrl + "GetUserInfo?id=" + id);
  }
  public getPinnedItemsToUser(userId:number):Observable<PinnedItemsToUser[]>{
    return this.httpClient.get<PinnedItemsToUser[]>(this.baseUrl+"GetPinnedItemsToUser?userId="+userId);
  }
  public addPinnedItemToUser(updatingsToUser:UpdatingToUser,userId:number):Observable<boolean>{
    return this.httpClient.post<boolean>(this.baseUrl+"AddPinnedItemToUser?userId="+userId,updatingsToUser)
  }
  public deletePinnedItemToUser(pinnedItemId:number,userId:number):Observable<boolean>{
    return this.httpClient.delete<boolean>(this.baseUrl+"DeletePinnedItemToUser?pinnedItemId="+pinnedItemId+"&userId="+userId);
  }
}
