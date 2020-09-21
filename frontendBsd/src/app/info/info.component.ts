import { Component, Input, OnInit } from '@angular/core';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'info',
  templateUrl: './info.component.html',
  styleUrls: ['./info.component.css']
})
export class InfoComponent implements OnInit {

  @Input() songId: number;
  @Input() viewsCnt: number = 0;
  @Input() responsesCnt: number = 0;
  @Input() likesCnt: number = 0;
  num: number = 1;

  constructor(private likeService: LikeService, private songService: SongService) { }

  ngOnInit() {
  }

  sign(event): void {
    this.likeService.toggle_like(event);
    this.num++;
    this.num % 2 == 0 ? this.addLike() : this.MissLike();
  }

  marking(event, color: string): void {
    this.likeService.change_like_color(event, color);
  }

  reset_marking(event, color: string): void {
    this.likeService.reset_like_color(event, color);
  }

  addLike(): void {
    this.likesCnt = this.likesCnt + 1;
    this.songService.increaseLikeToSong(this.songId).subscribe();
  }

  MissLike(): void {
    this.likesCnt = this.likesCnt - 1;
    this.songService.decreaseLikeToSong(this.songId).subscribe();
  }

}
