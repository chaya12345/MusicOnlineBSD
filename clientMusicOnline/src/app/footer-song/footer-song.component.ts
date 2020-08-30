import { Component, OnInit, Input } from '@angular/core';
import { SongService } from '../services/song.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css'],
  providers: [SongService]
})
export class FooterSongComponent implements OnInit {

  @Input() likes_amount: any;
  @Input() like_responses: any;
  @Input() is_parent_hovered: boolean;
  song_functionality;
  
  constructor(private song_service: SongService) { 
    this.song_functionality = song_service;
  }

  ngOnInit() {
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
