import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'info',
  templateUrl: './info.component.html',
  styleUrls: ['./info.component.css']
})
export class InfoComponent implements OnInit {

  @Input() viewsCnt: number = 0;
  @Input() responsesCnt: number = 0;
  @Input() likesCnt: number = 0;
  songId: number;
  toggle: boolean = false;

  constructor(private likeService: LikeService, private songService: SongService,
    private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.activatedRoute.snapshot.routeConfig.path.includes("song")
    this.songId = this.activatedRoute.snapshot.queryParams.songId;
  }

  sign(event): void {
    this.likeService.toggle_like(event);
    this.toggle == false ? this.addLike() : this.MissLike();
    this.toggle = !this.toggle;
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
