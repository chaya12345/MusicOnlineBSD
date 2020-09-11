import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Song } from '../classes/song';
import { ShareDataService } from '../services/share-data.service';
// import { EventEmitter } from 'protractor';

@Component({
  selector: 'song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.css']
})
export class SongComponent implements OnInit {

  @Input() song: Song;
  @Output() onShowFullSong = new EventEmitter<Song>();
  isHover:boolean = false;

  constructor(private shareDataService: ShareDataService) { 
    shareDataService.currentSong = this.song;
  }

  ngOnInit() {
  }

  toggle_hover(event) :void {
    this.isHover = !this.isHover;
  }

  fullSong() {
    // console.log('click');
    // this.onShowFullSong.emit(this.song);
    // console.log('emit');
    this.shareDataService.emitChildEvent(this.song);
  }


}
