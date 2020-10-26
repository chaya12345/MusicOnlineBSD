import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ItemsByParameter } from '../classes/itemsByParameter';
import { Song } from '../classes/song';
import { Topics } from '../classes/topics';
import { ArtistsAndSingersService } from '../services/artists-and-singers.service';
import { ItemsByParameterService } from '../services/items-by-parameter.service';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'songs',
  templateUrl: './songs.component.html',
  styleUrls: ['./songs.component.css']
})
export class SongsComponent implements OnInit {

  title: string = "";
  subtitle: string = "";
  img: string = "";
  icon: string = "";
  isMain: boolean = false;

  isFollowUp: boolean = false;
  isAddToPlaylist: boolean = false;
  isSideText: boolean = false;
  isSingular: boolean = false;
  isGeneric: boolean = false;
  orderBy: string = "";

  navs: string[] = [];
  songs: Song[] = [];
  items: ItemsByParameter[] = [];
  song: Song;
  topic: Topics;

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService,
    private cdr: ChangeDetectorRef, private itemsByParameterService: ItemsByParameterService) {
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

  getSong(songId: number) {
    try {
      this.songService.getSongById(songId).subscribe(song => { this.song = song;
      this.title = this.song.title; this.subtitle = this.song.subtitle;
      this.img = "../../assets/images/" + this.song.image_location; this.isMain = false;
      this.navs.push(this.song.title);
     }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.isSingular = true;
  }

  getItemsByFilter(filter: string) {
    try {
      this.itemsByParameterService.getItemsByParameter(filter).subscribe(items => { this.items = items;
        this.items.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.cdr.detectChanges(); }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = true;
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => { this.songs = songs;
        this.songs.sort((a, b) =>  Math.round(new Date(b.date).getTime() - new Date(a.date).getTime())); this.cdr.detectChanges(); },
        err => console.log(err));
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = false;
  }

  // updateTop() {
  //   let filter = this.activatedRoute.snapshot.paramMap.get("filter");
  //   let name = this.activatedRoute.snapshot.paramMap.get("value");
  //   if (filter == "by-artist") {
  //     try {
  //       this.artsAndSingsService.getArtistOrSingerByName(name)
  //         .subscribe(art => { this.updateDataToArtists(name, art.type); }, err => console.log(err));
  //     } catch (err) { console.log(err); }
  //   }
  //   if (filter == "by-singer" || filter == "") {
  //     this.getDetailsOfSinger(name);
  //     this.subtitle = "כל השירים, הקליפים, ההופעות והכתבות";
  //     this.isMain = true;
  //   }
  //   else {
  //     this.img = "../../assets/images/" + this.topic.img;
  //     this.title = this.topic.title;
  //     this.subtitle = this.topic.subtitle;
  //     this.isMain = false;
  //   }
  // }

}