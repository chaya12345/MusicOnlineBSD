import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../classes/user';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  constructor(private httpClient:HttpClient) { }
  public registrationToWebsite(user:User):void{
    this.httpClient.post("https://localhost:44368/api/PostRegistrationToWebsite",user);
  }
  public RegistrationToNewsleter(user:User):void{
    this.httpClient.post("https://localhost:44368/api/PostRegistrationToNewsleter",user);
  }
  public removeFromNewsletter(userId:number):void{
    this.httpClient.put("https://localhost:44368/api/PostRegistrationToNewsleter?userId="+userId,userId);
  }
  public updateUser(userId:number,user:User):void{
    this.httpClient.put("https://localhost:44368/api/PutUser?userId="+userId,user);
  }
  public updateUserProfil(userId:number,user:User):void{
    this.httpClient.put("https://localhost:44368/api/PutUserProfil?userId="+userId,user);
  }
  public updateUserPassword(userId:number,password:string):void{
    this.httpClient.put("https://localhost:44368/api/PutUserPassword?userId="+userId+"&password="+password,password);
  }
  public updateUserDefinition(userId:number,user:User):void{
    this.httpClient.put("https://localhost:44368/api/PutUserDefinition?userId="+userId,user);
  }
  public getUser(userName:number,password:string):Observable<User>{
    return this.httpClient.get<User>("https://localhost:44368/api/GetUser?userName="+userName+"&password="+password);
  }
  public getUsers():Observable<User[]>{
    return this.httpClient.get<User[]>("https://localhost:44368/api/GetUsers");
  }
}
