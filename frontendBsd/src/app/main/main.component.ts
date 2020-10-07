import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Article } from '../classes/article';
import { Song } from '../classes/song';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';
import { TagsToArticlesService } from '../services/tags-to-articles.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';

@Component({
  selector: 'main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  @Input() song?: Song;
  @Input() article?: Article;
  tags: string[] = [];
  responsesCnt: number = 0;
  navigate: string = "";
  loaded: boolean = false;

  date: Date = new Date();
  file: string = "";
  img: string = "";
  type: string = "";
  text: string = "";
  views: number = 0;
  likes: number = 0;

  constructor(private responseToSongsService: ResponseToSongsService,
    private tagsToSongsService: TagsToSongsService, private cdr: ChangeDetectorRef,
    private activatedRoute: ActivatedRoute, private tagsToArticlesService: TagsToArticlesService,
    private responseToArticlesService: ResponsesToArticlesService) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song")) {
        this.navigate = "song";
      }
      else if (this.activatedRoute.snapshot.routeConfig.path.includes("article")) {
        this.navigate = "article";
      }
      this.getData();
      this.getTags();
      this.getResponsesCnt();
    } catch (err) { console.log(err); }
  }

  getData(): void {
    if (this.navigate == "song") {
      this.date = this.song.date;
      this.file = '../../assets/songs/' + this.song.file_location;
      this.img = '../../assets/images/' + this.song.image_location;
      this.type = this.song.type;
      this.text = '../../assets/text/' + this.song.content;
      console.log("text:");
      console.log(this.text);
      this.views = this.song.count_views;
      this.likes = this.song.count_like;
      this.loaded = true;
    }
    else if (this.navigate == "article") {
      this.date = this.article.date;
      this.img = '../../assets/images/' + this.article.main_image;
      this.text = '../../assets/text/' + this.article.content;
      this.views = this.article.count_views;
      this.likes = this.article.count_like;
      if (this.article.video != null) {
        this.file = '../../assets/songs/' + this.article.video;
        this.type = "video";
      }
      if (this.article.audio1 != null) {
        this.file = this.article.audio1;
        this.type = "audio";
      }
      this.loaded = true;
    }
  }

  getTags(): void {
    if (this.navigate == "song") {
      this.tagsToSongsService.GetTagsIncludeArtistsToSong(this.song.id)
        .subscribe(tag => { this.tags = tag; this.cdr.detectChanges(); }, err => console.log(err));
    }
    else if (this.navigate == "article") {
      this.tagsToArticlesService.getTagsNamesToArticle(this.article.id, true)
        .subscribe(tag => { this.tags = tag; this.cdr.detectChanges(); }, err => console.log(err));
    }
  }

  getResponsesCnt(): void {
    if (this.navigate == "song") {
      this.responseToSongsService.getCountResponsesToSong(this.song.id)
        .subscribe(cnt => { this.responsesCnt = cnt; this.cdr.detectChanges() }, err => console.log(err));
    }
    else if (this.navigate == "article") {
      this.responseToArticlesService.getCountResponsesToArticle(this.article.id)
        .subscribe(cnt => { this.responsesCnt = cnt; this.cdr.detectChanges(); }, err => console.log(err));
    }
  }

}
