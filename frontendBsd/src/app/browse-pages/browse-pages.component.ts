import { Component, Input, OnInit } from '@angular/core';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'browse-pages',
  templateUrl: './browse-pages.component.html',
  styleUrls: ['./browse-pages.component.css']
})
export class BrowsePagesComponent implements OnInit {

  @Input() itemsCount: number = 0;
  @Input() itemsToPage: number = 0;

  indexs: number[] = [];
  currentIndex: number = 1;
  indexDisplay: number[] = [];

  constructor(private storageService: StorageService) { }

  ngOnInit(): void {
    this.storageService.watchStorage().subscribe((data: string) => {
      if (data == "page") {
        this.currentIndex = parseInt(sessionStorage.getItem("page"));
      }
    });
  }

  ngOnChanges(): void {
    this.indexs = Array(Math.ceil(this.itemsCount / this.itemsToPage))
      .fill(0).map((x, i) => i + 1);
    // this.indexs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    this.calcIndex();
  }

  calcIndex() {
    this.storageService.setItem("page", this.currentIndex);
    if (this.currentIndex - 2 > 0 && this.currentIndex + 2 <= this.indexs.length) {
      this.updateDisplaying(this.currentIndex - 2);
      return;
    }
    else if (this.currentIndex - 2 > 0) {
      let missing = 5 - (this.indexs.length - (this.currentIndex - 2));
      for (let i = this.currentIndex - 2 - missing + 1; i <= this.currentIndex - 2; i++) {
        if (i > 0) {
          this.updateDisplaying(i);
          return;
        }
      }
    }
    else if (this.currentIndex + 2 <= this.indexs.length) {
      let missing = 5 - (this.currentIndex + 2/* - 1*/);
      for (let i = this.currentIndex + 2 + missing - 1; i > this.currentIndex + 2; i--) {
        if (i <= this.indexs.length) {
          this.updateDisplaying(1);
          return;
        }
      }
    }
    this.updateDisplaying(1);
    return;
  }

  updateDisplaying(val: number) {
    this.indexDisplay = Array(this.indexs.length < 5 ? this.indexs.length : 5).fill(0).map((x, i) => i + val);
    if (this.indexDisplay[this.indexDisplay.length - 1] == this.indexs.length - 1) {
      this.indexDisplay.push(this.indexs.length);
    }
    else if (this.indexDisplay[0] == 2) {
      this.indexDisplay.reverse();
      this.indexDisplay.push(1);
      this.indexDisplay.reverse();
    }
  }

}
