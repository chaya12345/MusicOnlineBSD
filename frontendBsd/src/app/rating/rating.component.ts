import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ArticleService } from '../services/article.service';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'rating',
  templateUrl: './rating.component.html',
  styleUrls: ['./rating.component.css'],
  providers: [LikeService]
})
export class RatingComponent implements OnInit {

  @Input() likes?: number = 0;
  @Input() views?: number = 0;
  @Input() responses?: number = 0;
  navigate: string = "";
  currentId: string = this.activatedRoute.snapshot.paramMap.get("id");
  toggle: boolean = false;

  constructor(private activatedRoute: ActivatedRoute, private likeService: LikeService, 
    private songService: SongService, private articleService: ArticleService, ) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.routeConfig.path.includes("playlist")) {
      this.navigate = "playlist";
      var elements = document.getElementsByClassName("wrap-rating");
      for (let i = 0; i < elements.length; i++) {
        (elements[i] as HTMLElement).style.padding = "8px 17px";
      }
    }
    else if (this.activatedRoute.snapshot.routeConfig.path.includes("song")) {
      this.navigate = "song";
    }
    else if (this.activatedRoute.snapshot.routeConfig.path.includes("article")) {
      this.navigate = "playlist";
    }
  }

  sign(event): void {
    this.likeService.toggle_like(event);
    this.toggle == false ? this.addLike() : this.MissLike();
    this.toggle = !this.toggle;
  }

  marking(event): void {
    this.likeService.change_like_color(event, "black");
  }

  reset_marking(event): void {
    this.likeService.reset_like_color(event, "#F44336");
  }

  addLike(): void {
    if (this.navigate == "song") {
      this.songService.increaseLikeToSong(Number(this.currentId)).subscribe();
    }
    else if (this.navigate == "article") {
      this.articleService.increaseLikeToArticle(Number(this.currentId)).subscribe();
    }
  }

  MissLike(): void {
    if (this.navigate == "song") {
      this.songService.decreaseLikeToSong(Number(this.currentId)).subscribe();
    }
    else if (this.navigate == "article") {
      this.articleService.decreaseLikeToArticle(Number(this.currentId)).subscribe();
    }
  }

}
