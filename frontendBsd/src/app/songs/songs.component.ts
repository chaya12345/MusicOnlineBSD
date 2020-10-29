import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ItemsByParameter } from '../classes/itemsByParameter';
import { Song } from '../classes/song';
import { SongsDetailsView } from '../classes/songsDetailsView';
import { Topics } from '../classes/topics';
import { ItemsByParameterService } from '../services/items-by-parameter.service';
import { SongService } from '../services/song.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'songs',
  templateUrl: './songs.component.html',
  styleUrls: ['./songs.component.css']
})
export class SongsComponent implements OnInit {

  title: string = "";
  subtitle: string;
  date: Date;
  img: string = "";
  icon: string = "";

  isFollowUp: boolean = false;
  isAddToPlaylist: boolean = false;
  isSideText: boolean = false;
  isSingular: boolean = false;
  isGeneric: boolean = false;
  orderBy: string = "";

  navs: string[] = [];
  songs: SongsDetailsView[] = [];
  items: ItemsByParameter[] = [];
  song: SongsDetailsView;
  topic: Topics;

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService,
    private cdr: ChangeDetectorRef, private itemsByParameterService: ItemsByParameterService,
    private topicService: TopicsService, private router: Router) {
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
    if (this.activatedRoute.snapshot.queryParams.songId) {
      this.getSong(this.activatedRoute.snapshot.queryParams.songId);
    }
    else if (this.activatedRoute.snapshot.queryParams.filter) {
      this.getItemsByFilter(this.activatedRoute.snapshot.queryParams.filter);
    }
    else {
      this.getSongs();
    }
  }

  getSong(songId: number): void {
    try {
      this.songService.getSongById(songId).subscribe(song => {
        this.song = song;
        this.title = this.song.title; this.date = this.song.date;
        this.img = "../../assets/images/" + this.song.image_location;
        this.navs.push(this.title);
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = true;
  }

  getItemsByFilter(filter: string): void {
    try {
      this.itemsByParameterService.getItemsByParameter(filter).subscribe(items => {
        this.items = items;
        this.cdr.detectChanges();
        this.items.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.navs.push(filter);
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.itemsByParameterService.getItemByName(filter).subscribe(item => {
        this.title = item.name;
        this.subtitle = "כל השירים, הקליפים, ההופעות והכתבות";
        this.img = item.image ? "../../assets/images" + item.image : null;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = true;
  }

  getSongs(): void {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songs = songs;
        this.cdr.detectChanges();
        this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.topicService.getTopic("חדש במוזיקה").subscribe(topic => {
        this.title = topic.title;
        this.subtitle = topic.subtitle;
        this.img = "../../assets/images/" + topic.img;
        this.icon = topic.icon;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = false;
  }

}