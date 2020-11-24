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

  songsToPage: number = 20;
  currentIndex: number = 20;
  items: Song[] = [];

  constructor(private cdr: ChangeDetectorRef, public activatedRoute: ActivatedRoute,
    private storageService: StorageService) { }

  ngOnInit() {
    // document.getElementsByTagName("span")[0].innerHTML = "טוען...";
    this.storageService.watchStorage().subscribe((data: string) => {
      switch (data) {
        case "order-type":
          this.orderByType();
          this.browsingPage(parseInt(sessionStorage.getItem("page")) || 1);
          break;
        case "reverse":
          this.orderByType();
          this.browsingPage(parseInt(sessionStorage.getItem("page")) || 1);
          break;
        case "page":
          this.browsingPage(parseInt(sessionStorage.getItem("page")) || 1);
          break;
      }
    });
  }

  ngOnChanges() {
    this.orderByType();
    this.loadData();
    this.cdr.detectChanges();
  }

  browsingPage(page: number): void {
    this.items = [];
    for (let i = this.songsToPage * (page - 1); i < this.songsToPage * page && i < this.songsList.length; i++) {
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
    }
  }

  orderByType(): void {
    let value = sessionStorage.getItem("order-type");
    let dir = parseInt(sessionStorage.getItem("reverse")) == 1 ? "asc" : "desc";
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
    this.songsList.sort((a, b) => Math.round(new Date((dir == "desc" ? b : a).date).getTime() - new Date((dir == "desc" ? a : b).date).getTime()));
  }

  orderBySongName(dir: string): void {
    this.songsList.sort((a, b) => (dir == "desc" ? b : a).name.localeCompare((dir == "desc" ? a : b).name));
  }

  orderByViews(dir: string): void {
    this.songsList.sort((a, b) => (dir == "desc" ? b : a).count_views - (dir == "desc" ? a : b).count_views);
  }

  orderByLikes(dir: string): void {
    this.songsList.sort((a, b) => (dir == "desc" ? b : a).count_like - (dir == "desc" ? a : b).count_like);
  }

}
