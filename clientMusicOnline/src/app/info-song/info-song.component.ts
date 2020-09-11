import { Component, OnInit, Input } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'info-song',
  templateUrl: './info-song.component.html',
  styleUrls: ['./info-song.component.css']
})
export class InfoSongComponent implements OnInit {

  @Input() song: Song;
  @Input() responsesCount: number;
  likeFunctionality;

  constructor(private likeService: LikeService, private songService: SongService) { }

  ngOnInit() {
    this.likeFunctionality = this.likeService;
  }

  sign(event): void {
    this.likeFunctionality.toggle_like(event);
    this.addLike(); // לשנות להסר לייק בהתאמה..
  }

  marking(event): void {
    this.likeFunctionality.change_like_color(event);
  }

  reset_marking(event, color: string): void {
    this.likeFunctionality.reset_like_color(event, color);
  }

  addLike(): void {
    // this.songService.increaseLikeToSong(this.song.id);
    // לבדוק למה לא עובד..
  }

}
