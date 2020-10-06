import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { Topics } from '../classes/topics';
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
  
  navs: string[] = [];
  songs: Song[] = [];
  song: Song;
  topic: Topics;

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService,
    private cdr: ChangeDetectorRef, private topicsService: TopicsService) { 
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
          .subscribe(songs => { this.songs = songs; this.cdr.detectChanges(); 
            this.updateDataForList(); this.orderByDate(); }, err => console.log(err));
        } catch (err) { console.log(err); }
        this.isSingular = false;
      }
      else if (filter == "by-singer") {
        try {
          let value = this.activatedRoute.snapshot.paramMap.get("value");
          this.songService.getSongsBySinger(value)
          .subscribe(songs => { this.songs = songs; this.cdr.detectChanges(); 
            this.updateDataForList(); this.orderByDate(); }, err => console.log(err));
        } catch (err) { console.log(err); }
        this.isSingular = false;
      }
      else if (filter == "by-tag") {
        try {
          let value = this.activatedRoute.snapshot.paramMap.get("value");
          this.songService.getSongsByTag(value)
          .subscribe(songs => { this.songs = songs; this.cdr.detectChanges(); 
            this.updateDataForList(); this.orderByDate(); }, err => console.log(err));
        } catch (err) { console.log(err); }
        this.isSingular = false;
      }
      else if (filter == "by-artist") {
        try {
          let value = this.activatedRoute.snapshot.paramMap.get("value");
          this.songService.getSongsByArtistsAndSingers(value)
          .subscribe(songs => { this.songs = songs; this.cdr.detectChanges(); 
           this.updateDataForList(); this.orderByDate(); }, err => console.log(err));
        } catch (err) { console.log(err); }
        this.isSingular = false;
      }
      if (this.activatedRoute.snapshot.paramMap.get("order")) {
        let order = this.activatedRoute.snapshot.paramMap.get("order");
        if (order == "order-by-song") {
          this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
          this.cdr.detectChanges();
        }
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
    this.topicsService.getTopics().subscribe(topics => { this.topic = topics[0]; this.cdr.detectChanges(); this.updateTop(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  updateTop() {
    this.title = this.topic.title;
    this.subtitle = this.topic.subtitle;
    this.img = "../../assets/images/" + this.topic.img;
    this.isMain = false;
  }

  orderByDate(): void {
    this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
