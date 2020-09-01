import { Component, OnInit, Input } from '@angular/core';
import { LikeService } from '../services/like.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css'],
  providers: [LikeService]
})
export class FooterSongComponent implements OnInit {

  @Input() likes_amount: any;
  @Input() like_responses: any;
  @Input() is_parent_hovered: boolean;
  song_functionality;
  
  constructor(private song_service: LikeService) { 
  }

  ngOnInit() {
    this.song_functionality = this.song_service;
  }

  sign(event): void {
    this.song_functionality.toggle_like(event);
  }

  marking(event): void {
    this.song_functionality.change_like_color(event);
  }

  reset_marking(event): void {
    this.song_functionality.reset_like_color(event);
  }

}
