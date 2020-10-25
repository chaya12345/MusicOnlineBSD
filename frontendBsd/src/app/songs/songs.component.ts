import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { GenericType } from '../classes/genericType';
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
    private cdr: ChangeDetectorRef, private topicsService: TopicsService, private singerService: SingerService,
    private artsAndSingsService: ArtistsAndSingersService, private itemsByParameterService: ItemsByParameterService) {
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
    if (this.activatedRoute.snapshot.paramMap.get("id")) {
      try {
        let id: number = Number(this.activatedRoute.snapshot.paramMap.get("id"));
        this.songService.getSongById(id).subscribe(song => { this.song = song; this.cdr.detectChanges(); this.updateDataForSingular(); }, err => console.log(err));
      } catch (err) { console.log(err); }
      this.isSingular = true;
    }
    else if (this.activatedRoute.snapshot.paramMap.get("filter")) {
      let filter = this.activatedRoute.snapshot.paramMap.get("filter");
      if (filter == "all") {
        try {
          this.songService.getSongs()
            .subscribe(songs => {
              this.songs = songs; 
               this.order("order-by-date"); this.cdr.detectChanges();this.updateDataForList(); 
            }, err => console.log(err));
        } catch (err) { console.log(err); }
        this.isSingular = false;
      }
      else if (filter == "by-singer" || filter == "by-tag" || filter == "by-artist" || filter == "by-all") {
        try {
          let value = this.activatedRoute.snapshot.paramMap.get("value");
          this.itemsByParameterService.getItemsByParameter(value)
            .subscribe(items => {
              this.items = items; this.items.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
              this.cdr.detectChanges();
            }, err => console.log(err));
          this.navs.push(value);
        } catch (err) { console.log(err); }
        this.isSingular = false;
        this.isGeneric = true;
      }
    }
  }

  updateDataForSingular(): void {
    this.title = this.song.title;
    this.subtitle = this.song.subtitle;
    this.img = "../../assets/images/" + this.song.image_location;
    this.isMain = false;
    this.navs.push(this.song.title);
  }

  updateDataForList(): void {
    try {
      this.topicsService.getTopics().subscribe(topics => { 
        this.topic = topics[0]; this.cdr.detectChanges(); this.updateTop(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  updateTop() {
    let filter = this.activatedRoute.snapshot.paramMap.get("filter");
    let name = this.activatedRoute.snapshot.paramMap.get("value");
    if (filter == "by-artist") {
      try {
        this.artsAndSingsService.getArtistOrSingerByName(name)
          .subscribe(art => { this.updateDataToArtists(name, art.type); }, err => console.log(err));
      } catch (err) { console.log(err); }
    }
    if (filter == "by-singer" || filter == "") {
      this.getDetailsOfSinger(name);
      this.subtitle = "כל השירים, הקליפים, ההופעות והכתבות";
      this.isMain = true;
    }
    else {
      this.img = "../../assets/images/" + this.topic.img;
      this.title = this.topic.title;
      this.subtitle = this.topic.subtitle;
      this.isMain = false;
    }
  }

  updateDataToArtists(name: string, type: string) {
    if (type == "singer") {
      this.getDetailsOfSinger(name);
    }
  }

  getDetailsOfSinger(name: string) {
    try {
      this.singerService.GetSingerByName(name)
        .subscribe(singer => { this.img = "../../assets/images/" + singer.image; this.title = singer.name; }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  orderByDate(): void {
    this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }
  orderByName(): void {
    this.songs=this.songs.sort((a, b) => a.name > b.name ? 1 : -1);
    console.log(this.songs);
  }
  orderByView(): void {
    this.songs.sort((a, b) => a.count_views - b.count_views);
  }
  orderByLike(): void {
    this.songs.sort((a, b) => a.count_like - b.count_like);
  }

  order(type: string): void {
    console.log(type);
    if (type == 'order-by-song')
      this.orderByName();
    else if (type == 'order-by-date')
      this.orderByDate();
    else if (type == 'order-by-views')
      this.orderByView();
    else if (type == 'order-by-likes')
      this.orderByLike();
    this.orderBy = type;
    // if (type == "song") {
    //   this.songs.sort((a, b) => Math.round(a.name.localeCompare(b.name)));
    //   this.cdr.detectChanges();
    // }
    // 
  }

  // convertItem(song: Song): GenericType {
  //   let item: GenericType = new GenericType();
  //   item.title = song.title;
  //   item.subtitle = song.subtitle;
  //   item.image = song.image_location;
  //   item.date = song.date;
  //   return item;
  // }

}