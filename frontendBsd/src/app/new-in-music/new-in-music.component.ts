import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'new-in-music',
  templateUrl: './new-in-music.component.html',
  styleUrls: ['./new-in-music.component.css']
})
export class NewInMusicComponent implements OnInit {

  songs: Song[] = [];
  title: string;
  subtitle: string;
  icon: string;

  navs: string[] = [];
  sectionName = "חדש במוזיקה";
  websiteName = "מיוזיק online";

  constructor(private songService: SongService, private cdr: ChangeDetectorRef,
    private topicService: TopicsService) {
    this.getSongs();
    this.navs.push(this.sectionName);
    document.getElementById("tabTitle").innerText = this.sectionName + " | " + this.websiteName;
  }

  ngOnInit(): void {
  }

  getSongs(): void {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songs = songs;
        this.cdr.detectChanges();
        this.songs.sort((a, b) =>
          Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.topicService.getTopic("חדש במוזיקה").subscribe(topic => {
        this.title = topic.title;
        this.subtitle = topic.subtitle;
        this.icon = topic.icon;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }

}
