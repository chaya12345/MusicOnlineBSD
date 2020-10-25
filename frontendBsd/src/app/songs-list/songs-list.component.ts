import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';

@Component({
  selector: 'songs-list',
  templateUrl: './songs-list.component.html',
  styleUrls: ['./songs-list.component.css']
})
export class SongsListComponent implements OnInit {

  @Input() songsList: Song[] = [];
  @Input() orderBy: string = "";

  currentIndex = 12;
  items: Song[] = [];

  constructor(private cdr: ChangeDetectorRef, public activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    // document.getElementsByTagName("span")[0].innerHTML = "טוען...";
  }

  ngOnChanges() {
  //  this.orderByDate();
   this.loadData();
    if (this.orderBy == "song") {
      this.songsList.sort((a, b) => Math.round(a.name.localeCompare(b.name)));
    }
    console.log("change");
    this.cdr.detectChanges();
    this.loadData();
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

  orderByDate(): void {
    if (this.activatedRoute.snapshot.paramMap.get("dir")) {
      let order = this.activatedRoute.snapshot.paramMap.get("dir");
      console.log(order);
      if (order == "order-by-song") {
        this.songsList.sort((a, b) => Math.round(b.name.localeCompare(a.name)));
      }
      else if (order == "order-by-likes") {
        this.songsList.sort((a, b) => Math.round(b.count_like - a.count_like));
      }
      else if (order == "order-by-views") {
        this.songsList.sort((a, b) => Math.round(b.count_views - a.count_views));
      }
      else if (order == "order-by-res") {
        this.songsList.sort((a, b) => Math.round(b.count_views - a.count_views));
      }
      else if (order == "order-by-date") {
        this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      }
      this.cdr.detectChanges();
      console.log(this.songsList);
    }
    else {
      this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    }
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
