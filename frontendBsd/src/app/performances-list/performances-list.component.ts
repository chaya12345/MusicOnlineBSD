import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'performances-list',
  templateUrl: './performances-list.component.html',
  styleUrls: ['./performances-list.component.css']
})
export class PerformancesListComponent implements OnInit {

  @Input() performances: Song[] = [];

  songsToPage: number = 8;
  currentIndex: number = 8;
  items: Song[] = [];

  constructor(private cdr: ChangeDetectorRef, private storageService: StorageService) { }

  ngOnInit(): void {
    this.loadData();
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

  loadData(): void {
    if (this.performances != null && this.performances.length != 0) {
      for (let i = 0; i < this.currentIndex; i++) {
        this.items.push(this.performances[i]);
      }
      this.cdr.detectChanges();
    }
  }

  browsingPage(page: number): void {
    this.items = [];
    for (let i = this.songsToPage * (page - 1); i < this.songsToPage * page && i < this.performances.length; i++) {
      this.items.push(this.performances[i]);
    }
    this.cdr.detectChanges();
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
    this.performances.sort((a, b) => Math.round(new Date((dir == "desc" ? b : a).date).getTime() - new Date((dir == "desc" ? a : b).date).getTime()));
  }

  orderBySongName(dir: string): void {
    this.performances.sort((a, b) => (dir == "desc" ? b : a).title.localeCompare((dir == "desc" ? a : b).title));
  }

  orderByViews(dir: string): void {
    this.performances.sort((a, b) => (dir == "desc" ? b : a).count_views - (dir == "desc" ? a : b).count_views);
  }

  orderByLikes(dir: string): void {
    this.performances.sort((a, b) => (dir == "desc" ? b : a).count_like - (dir == "desc" ? a : b).count_like);
  }

}
