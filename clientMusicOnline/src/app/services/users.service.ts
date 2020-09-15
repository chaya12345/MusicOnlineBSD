import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../classes/user';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  baseUrl:string="https://localhost:44368/api/Users/";
  constructor(private httpClient:HttpClient) { }
  public registrationToWebsite(user:User):Observable<any>{
    return this.httpClient.post(this.baseUrl + "PostRegistrationToWebsite", user);
  }
  public RegistrationToNewsleter(user:User):Observable<any>{
    return this.httpClient.post(this.baseUrl + "PostRegistrationToNewsleter", user);
  }
  public removeFromNewsletter(userId:number):Observable<any>{
    return this.httpClient.put(this.baseUrl + "PostRegistrationToNewsleter?userId=" + userId, userId);
  }
  public updateUser(userId:number,user:User):Observable<any>{
    return this.httpClient.put(this.baseUrl + "PutUser?userId=" + userId, user);
  }
  public updateUserProfil(userId:number,user:User):Observable<any>{
    return this.httpClient.put(this.baseUrl + "PutUserProfil?userId=" + userId, user);
  }
  public updateUserPassword(userId:number,password:string):Observable<any>{
    return this.httpClient.put(this.baseUrl + "PutUserPassword?userId=" + userId + "&password=" + password, password);
  }
  public updateUserDefinition(userId:number,user:User):Observable<any>{
    return this.httpClient.put(this.baseUrl + "PutUserDefinition?userId=" + userId, user);
  }
  public getUser(userName:number,password:string):Observable<User>{
    return this.httpClient.get<User>(this.baseUrl+"GetUser?userName="+userName+"&password="+password);
  }
  public getUsers():Observable<User[]>{
    return this.httpClient.get<User[]>(this.baseUrl+"GetUsers");
  }
}
