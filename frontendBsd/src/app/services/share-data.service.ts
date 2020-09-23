import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ShareDataService {

  private childClickedEvent = new BehaviorSubject<boolean>(true);


  emitChildEvent(isNavOpened: boolean) {
    this.childClickedEvent.next(isNavOpened);
  }

  childEventListner() {
    return this.childClickedEvent.asObservable();
  }

  constructor() { }
}
