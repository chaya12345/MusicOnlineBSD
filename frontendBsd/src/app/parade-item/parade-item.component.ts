import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Singer } from '../classes/singer';
import { SingerSelection } from '../classes/singerSelection';
import { Song } from '../classes/song';
import { SongSelection } from '../classes/songSelection';

@Component({
  selector: 'parade-item',
  templateUrl: './parade-item.component.html',
  styleUrls: ['./parade-item.component.css']
})
export class ParadeItemComponent implements OnInit {

  @Input() song?: Song;
  @Input() singer?: Singer;

  img: string = "";
  title: string = "";
  subtitle: string = "";

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges() {
    let baseUrl = "../../assets/images/";
    this.img = this.song != null ? baseUrl + this.song.image_location : (this.singer != null ? baseUrl + this.singer.image : "");
    this.title = this.song != null ? this.song.name : (this.singer != null ? this.singer.name : "");
    this.subtitle = this.song != null ? this.song.singerName : "";
  }

}
