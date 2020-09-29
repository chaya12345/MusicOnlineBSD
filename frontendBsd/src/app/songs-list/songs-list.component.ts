import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'songs-list',
  templateUrl: './songs-list.component.html',
  styleUrls: ['./songs-list.component.css']
})
export class SongsListComponent implements OnInit {

  @Input() songsList: Song[] = [];

  currentIndex = 12;
  items: Song[] = [];

  constructor(private crd: ChangeDetectorRef) { }

  ngOnInit() {
  }

  ngOnChanges() {
    this.loadData();
  }

  loadData(): void {
    for (let i = 0; i < this.currentIndex; i++) {
      this.items.push(this.songsList[i]);
    }
    this.crd.detectChanges();
    this.fixDisplaying();
  }

  LoadMore(event) {
    event.currentTarget.classList.add("loading");
    // var position = document.documentElement.scrollTop || document.body.scrollTop;
    console.log(event.currentTarget);
    const rangeLoading: number = 6;
    for (let i = this.currentIndex; i < this.currentIndex + rangeLoading; i++) {
      this.items.push(this.songsList[i]);
    }
    this.currentIndex += rangeLoading;
    this.crd.detectChanges();
    event.currentTarget.classList.remove("loading");
    this.fixDisplaying();
    // document.documentElement.scrollTop = position;
  }

  fixDisplaying(): void {
    var divs = document.getElementsByClassName("wrap-song");
    for (var i = 0; i < divs.length; i++) {
      if (divs[i].innerHTML == `<!--bindings={
  "ng-reflect-ng-if": "false"
}-->`) {
        divs[i].classList.add("empty");
      }
    }
    for (var i = 0; i < document.getElementsByClassName("empty").length; i++) {
      document.getElementsByClassName("empty")[i].remove();
    }
  }

}
