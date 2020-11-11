import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';
import { PlaylistsService } from '../services/playlists.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'playlists',
  templateUrl: './playlists.component.html',
  styleUrls: ['./playlists.component.css']
})
export class PlaylistsComponent implements OnInit {

  playlists: PlaylistSystem[] = []
  navs: string[] = [];

  title: string = "";
  subtitle: string = "";
  img: string = "";
  icon: string = "";

  constructor(private playlistsSystemService: PlaylistsSystemService, private cdr: ChangeDetectorRef,
    private topicsService: TopicsService) { 
    this.navs.push("הפלייליסטים");
  }

  ngOnInit() {
    this.getTopic();
    this.getPlaylists();
  }

  getPlaylists() {
    try {
      this.playlistsSystemService.getPlaylists()
      .subscribe(playlists => { this.playlists = playlists; this.cdr.detectChanges(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTopic(): void {
    try {
      this.topicsService.getTopic("פלייליסטים").subscribe(topic => {
        this.title = topic.title; this.subtitle = topic.subtitle;
        /*this.img = topic.img; */this.icon = topic.icon;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
