import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { Playlists } from '../classes/playlists';
import { PlaylistsService } from '../services/playlists.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'playlists',
  templateUrl: './playlists.component.html',
  styleUrls: ['./playlists.component.css']
})
export class PlaylistsComponent implements OnInit {

  playlists: Playlists[] = []
  navs: string[] = [];

  title: string = "";
  subtitle: string = "";
  img: string = "";
  icon: string = "";
  sectionName = "הפלייליסטים";
  websiteName = "מיוזיק online";

  constructor(private playlistsService: PlaylistsService, private cdr: ChangeDetectorRef,
    private topicsService: TopicsService) { 
    this.navs.push(this.sectionName);
    document.getElementById("tabTitle").innerText = this.sectionName + " | " + this.websiteName;
  }

  ngOnInit() {
    this.getTopic();
    this.getPlaylists();
  }

  getPlaylists() {
    try {
      this.playlistsService.getPlaylists()
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
