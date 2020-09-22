import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Song } from '../classes/song';

@Component({
  selector: 'song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.css']
})
export class SongComponent implements OnInit {

  @Input() clip: Song;

  constructor(private router: Router) { }

  ngOnInit() {
  }

  openClip(): void {
    this.router.navigateByUrl('/song/' + this.clip.id);
  }

}
