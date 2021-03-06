import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Article } from '../classes/article';
import { Song } from '../classes/song';
import { CommitsToSongsService } from '../services/commits-to-songs.service';
import { CommitsToArticlesService } from '../services/commits-to-articles.service';
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
  commitsCnt: number = 0;
  navigate: string = "";
  loaded: boolean = false;

  date: Date = new Date();
  file: string = "";
  img: string = "";
  type: string = "";
  text: string = "";
  views: number = 0;
  likes: number = 0;
  websiteName = "מיוזיק online";

  constructor(private commitToSongsService: CommitsToSongsService,
    private tagsToSongsService: TagsToSongsService, private cdr: ChangeDetectorRef,
    private activatedRoute: ActivatedRoute, private tagsToArticlesService: TagsToArticlesService,
    private commitToArticlesService: CommitsToArticlesService) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song")) {
        this.navigate = "song";
        document.getElementById("tabTitle").innerText = this.song.title + " | " + this.websiteName;
      }
      else if (this.activatedRoute.snapshot.routeConfig.path.includes("article")) {
        this.navigate = "article";
        document.getElementById("tabTitle").innerText = this.article.title + " | " + this.websiteName;
      }
      this.getData();
      this.getTags();
      this.getCommitsCnt();
    } catch (err) { console.log(err); }
  }

  getData(): void {
    if (this.navigate == "song") {
      this.date = this.song.date;
      this.file = '../../assets/songs/' + this.song.file_location;
      this.img = '../../assets/images/' + this.song.image_location;
      this.type = this.song.type;
      this.text = '../../assets/text/' + this.song.content;
      this.views = this.song.count_views;
      this.likes = this.song.count_like;
      this.loaded = true;
    }
    else if (this.navigate == "article") {
      this.date = this.article.date;
      this.img = '../../assets/images/' + this.article.image;
      this.text = '../../assets/text/' + this.article.content;
      this.views = this.article.count_views;
      this.likes = this.article.count_like;
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

  getCommitsCnt(): void {
    if (this.navigate == "song") {
      this.commitToSongsService.getCountCommitsToSong(this.song.id)
        .subscribe(cnt => { this.commitsCnt = cnt; this.cdr.detectChanges() }, err => console.log(err));
    }
    else if (this.navigate == "article") {
      this.commitToArticlesService.getCountCommitsToArticle(this.article.id)
        .subscribe(cnt => { this.commitsCnt = cnt; this.cdr.detectChanges(); }, err => console.log(err));
    }
  }

}
