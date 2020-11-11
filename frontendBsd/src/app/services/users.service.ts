import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../classes/user';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  private managers: User[] = [
    new User(5412, "הודיה עזרן",
      "0504117455h@gmail.com", "LegGh5QwYGE77@!", true, true, false, true, true, null),
    new User(7521, "אודיה אושרי",
      "bsd.odaya@gmail.com", "7d7vM6@vTPFcsBt", true, true, false, true, true, null)
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
  public updateUser(userId: number, user: User): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUser?userId=" + userId, user);
  }
  public updateUserProfil(userId: number, user: User): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUserProfil?userId=" + userId, user);
  }
  public updateUserPassword(userId: number, password: string): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUserPassword?userId=" + userId + "&password=" + password, password);
  }
  public updateUserDefinition(userId: number, user: User): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutUserDefinition?userId=" + userId, user);
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
}
