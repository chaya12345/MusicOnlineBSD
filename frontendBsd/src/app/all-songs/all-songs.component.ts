import { ChangeDetectorRef } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'all-songs',
  templateUrl: './all-songs.component.html',
  styleUrls: ['./all-songs.component.css']
})
export class AllSongsComponent implements OnInit {

  songsList: Song[] = [];
  navs: string[] = [];

  currentIndex = 12;
  items: Song[] = [];

  constructor(private songService: SongService, private crd: ChangeDetectorRef) {
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.orderByDate(); this.loadData(); }, err => console.log(err));
    }
    catch { console.log("all songs in songs-page") }
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
  }

  loadData(): void {
    for (let i = 0; i < this.currentIndex; i++) {
      this.items.push(this.songsList[i]);
    }
  }

  orderByDate(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

  LoadMore(event) {
    event.currentTarget.classList.add("loading");
    console.log(event.currentTarget);
    const rangeLoading: number = 3;
    for (let i = this.currentIndex; i < this.currentIndex + rangeLoading; i++) {
      this.items.push(this.songsList[i]);
    }
    this.currentIndex += rangeLoading;
    this.crd.detectChanges();
    event.currentTarget.classList.remove("loading");
    this.fixDisplaying();
  }

  fixDisplaying(): void {
    for (var i = 0; i < document.getElementsByClassName("wrap-song").length; i++) {
      if (document.getElementsByClassName("wrap-song")[i].innerHTML == `<!--bindings={
  "ng-reflect-ng-if": "false"
}-->`)
        document.getElementsByClassName("wrap-song")[i].classList.add("empty");
    }
  }

}
