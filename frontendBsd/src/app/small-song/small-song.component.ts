import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Song } from '../classes/song';

@Component({
  selector: 'small-song',
  templateUrl: './small-song.component.html',
  styleUrls: ['./small-song.component.css']
})
export class SmallSongComponent implements OnInit {

  @Input() song: Song;

  constructor(private router: Router) { }

  ngOnInit() {
  }

  openClip(): void {
    this.router.navigateByUrl('/song/' + this.song.id);
  }

}
