import { Component, OnInit, Input } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';

@Component({
  selector: 'info-song',
  templateUrl: './info-song.component.html',
  styleUrls: ['./info-song.component.css']
})
export class InfoSongComponent implements OnInit {

  @Input() song: Song;
  likeFunctionality;

  constructor(private likeService: LikeService) { }

  ngOnInit() {
    this.likeFunctionality = this.likeService;
  }

  sign(event): void {
    this.likeFunctionality.toggle_like(event);
  }

  marking(event): void {
    this.likeFunctionality.change_like_color(event);
  }

  reset_marking(event, color: string): void {
    this.likeFunctionality.reset_like_color(event, color);
  }

}
