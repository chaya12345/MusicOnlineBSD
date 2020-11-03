import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Song } from '../classes/song';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'songs-list',
  templateUrl: './songs-list.component.html',
  styleUrls: ['./songs-list.component.css']
})
export class SongsListComponent implements OnInit {

  @Input() songsList: Song[] = [];
  @Input() orderBy: string = "";

  songsToPage: number = 24;
  currentIndex: number = 24;
  items: Song[] = [];

  constructor(private cdr: ChangeDetectorRef, public activatedRoute: ActivatedRoute,
    private storageService: StorageService) { }

  ngOnInit() {
    // document.getElementsByTagName("span")[0].innerHTML = "טוען...";
    this.storageService.watchStorage().subscribe((data: string) => {
      switch (data) {
        case "order-type":
          this.orderByType();
          this.browsingPage(parseInt(sessionStorage.getItem("page"))||1);
          break;
        case "reverse":
          this.orderByType();
          this.browsingPage(parseInt(sessionStorage.getItem("page"))||1);
          break;
        case "page":
          this.browsingPage(parseInt(sessionStorage.getItem("page"))||1);
          break;
      }
    });
  }

  ngOnChanges() {
    this.orderByType();
    this.loadData();
    if (this.orderBy == "song") {
      this.songsList.sort((a, b) => Math.round(a.name.localeCompare(b.name)));
    }
    this.cdr.detectChanges();
  }

  browsingPage(page: number): void {
    this.items = [];
    for (let i = this.songsToPage*(page-1); i < this.songsToPage*page&&i<this.songsList.length; i++) {
      this.items.push(this.songsList[i]);
    }
    this.cdr.detectChanges();
  }

  loadData(): void {
    if (this.songsList != null && this.songsList.length != 0) {
      for (let i = 0; i < this.currentIndex; i++) {
        this.items.push(this.songsList[i]);
      }
      this.cdr.detectChanges();
      this.fixDisplaying();
    }
  }

  orderByType(): void {
    let value = sessionStorage.getItem("order-type");
    let dir = parseInt(sessionStorage.getItem("reverse"))==0?"desc":"asc"
    if (value) {
      switch (value) {
        case "song":
          this.orderBySongName(dir);
          break;
        case "views":
          this.orderByViews(dir);
          break;
        case "likes":
          this.orderByLikes(dir);
          break;
        default:
          this.orderByDate(dir);
          break;
      }
    }
    else {
      this.orderByDate(dir);
    }
  }

  orderByDate(dir: string): void {
    this.songsList.sort((a, b) => Math.round(new Date((dir=="desc"?b:a).date).getTime() - new Date((dir=="desc"?a:b).date).getTime()));
  }

  orderBySongName(dir: string): void {
    this.songsList.sort((a, b) => (dir=="desc"?b:a).name.localeCompare((dir=="desc"?a:b).name));
  }

  orderByViews(dir: string): void {
    this.songsList.sort((a, b) => (dir=="desc"?b:a).count_views - (dir=="desc"?a:b).count_views);
  }

  orderByLikes(dir: string): void {
    this.songsList.sort((a, b) => (dir=="desc"?b:a).count_like - (dir=="desc"?a:b).count_like);
  }

  // reverseOrder(): void {
  //   this.songsList.reverse();
  // }

  LoadMore(event) {
    event.currentTarget.classList.add("loading");
    // var position = document.documentElement.scrollTop || document.body.scrollTop;
    console.log(event.currentTarget);
    const rangeLoading: number = 6;
    for (let i = this.currentIndex; i < this.currentIndex + rangeLoading; i++) {
      this.items.push(this.songsList[i]);
    }
    this.currentIndex += rangeLoading;
    this.cdr.detectChanges();
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
