import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Song } from '../classes/song';

@Component({
  selector: 'latest-clip',
  templateUrl: './latest-clip.component.html',
  styleUrls: ['./latest-clip.component.css']
})
export class LatestClipComponent implements OnInit {

  @Input() clip: Song;

  constructor(private router: Router) { }

  ngOnInit() {
  }

  openClip(): void {
    this.router.navigateByUrl('/song/' + this.clip.id);
  }

}
