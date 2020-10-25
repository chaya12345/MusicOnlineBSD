import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import Swiper, { Navigation, Pagination } from 'swiper';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'si-hot-articles',
  templateUrl: './si-hot-articles.component.html',
  styleUrls: ['./si-hot-articles.component.css', './swiper-bundle.min.css']
})
export class SiHotArticlesComponent implements OnInit {

  articles: Article[] = [];

  constructor(private articleService: ArticleService, private cdr: ChangeDetectorRef) {
    this.getArticles();
  }

  ngOnInit(): void {
  }

  ngAfterViewInit() {
    var swiper = new Swiper('.swiper-container-article', {
      slidesPerView: 1.2,
      loop: true,
      spaceBetween: 14,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      speed: 800,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    });
  }

  getArticles(): void {
    try {
      this.articleService.getArticles().subscribe(articles => { this.articles = articles; this.cdr.detectChanges();
       this.articles.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));this.articles = this.articles.slice(0, 5); },
      err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
