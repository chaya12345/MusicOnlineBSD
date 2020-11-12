import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'all-articles',
  templateUrl: './all-articles.component.html',
  styleUrls: ['./all-articles.component.css']
})
export class AllArticlesComponent implements OnInit {

  articlesList: Article[] = [];

  songsToPage: number = 8;
  currentIndex: number = 8;
  items: Article[] = [];

  constructor(private articleService: ArticleService, private cdr: ChangeDetectorRef,
    private storageService: StorageService) {
    this.getArticles();
  }

  ngOnInit() {
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

  getArticles(): void {
    try {
      this.articleService.getArticles().subscribe(articles => {
        this.articlesList = articles;
        this.orderByType();
        this.loadData();
      }, err => console.log(err));
    }
    catch (err) { console.log(err); }
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
    this.articlesList.sort((a, b) => Math.round(new Date((dir == "desc" ? b : a).date).getTime() - new Date((dir == "desc" ? a : b).date).getTime()));
  }

  orderBySongName(dir: string): void {
    this.articlesList.sort((a, b) => (dir == "desc" ? b : a).title.localeCompare((dir == "desc" ? a : b).title));
  }

  orderByViews(dir: string): void {
    this.articlesList.sort((a, b) => (dir == "desc" ? b : a).count_views - (dir == "desc" ? a : b).count_views);
  }

  orderByLikes(dir: string): void {
    this.articlesList.sort((a, b) => (dir == "desc" ? b : a).count_like - (dir == "desc" ? a : b).count_like);
  }

  browsingPage(page: number): void {
    this.items = [];
    for (let i = this.songsToPage * (page - 1); i < this.songsToPage * page && i < this.articlesList.length; i++) {
      this.items.push(this.articlesList[i]);
    }
    this.cdr.detectChanges();
  }

  loadData(): void {
    if (this.articlesList != null && this.articlesList.length != 0) {
      for (let i = 0; i < this.currentIndex; i++) {
        this.items.push(this.articlesList[i]);
      }
      this.cdr.detectChanges();
    }
  }

}
