// import { Injectable } from '@angular/core';
import { Song } from '../classes/song';
import { BehaviorSubject } from 'rxjs';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ShareDataService {

  currentSong: Song;
  private childClickedEvent = new BehaviorSubject<Song>(null);

  emitChildEvent(song: Song){
     this.childClickedEvent.next(song);
  }
  
  childEventListner(){
     return this.childClickedEvent.asObservable();
   } 
  constructor() { }
}
