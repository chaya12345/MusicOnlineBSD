import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css']
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;

  constructor() { }

  ngOnInit() {
  }

}
