import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ReportView } from '../classes/report';
import { User } from '../classes/user';

@Injectable({
  providedIn: 'root'
})
export class ShareDataService {

  private childClickedEvent = new BehaviorSubject<boolean>(true);
  private connectedUser = new BehaviorSubject<User>(new User());
  private changedStatus = new BehaviorSubject<ReportView>(new ReportView());

  emitChildEvent(isNavOpened: boolean) {
    this.childClickedEvent.next(isNavOpened);
  }

  childEventListner() {
    return this.childClickedEvent.asObservable();
  }

  emitUserConnect(currentUser: User) {
    this.connectedUser.next(currentUser);
  }

  userConnectedEventListner() {
    return this.connectedUser.asObservable();
  }

  emitStatusChanged(report: ReportView) {
    this.changedStatus.next(report);
  }

  statusChangedEventListner() {
    return this.changedStatus.asObservable();
  }

  constructor() { }
}
