import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'article',
  templateUrl: './article.component.html',
  styleUrls: ['./article.component.css']
})
export class ArticleComponent implements OnInit {

  @Input() article: Article;
  countRes: number;

  constructor(private resToArticlesService: ResponsesToArticlesService, private cdr: ChangeDetectorRef) {
  }

  ngOnInit() {
    this.getCountResponses();
    window.addEventListener('scroll', this.scroll, true);
    this.addAnimation();
  }

  getCountResponses(): void {
    try {
      this.resToArticlesService.getCountResponsesToArticle(this.article.id)
      .subscribe(cnt => { this.countRes = cnt; this.cdr.detectChanges(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnDestroy() {
      window.removeEventListener('scroll', this.scroll, true);
  }

  scroll = (event): void => {
    this.addAnimation();
  };
  
  elementInViewport(el) {
    var top = el.offsetTop;
    var left = el.offsetLeft;
    var width = el.offsetWidth;
    var height = el.offsetHeight;
  
    while(el.offsetParent) {
      el = el.offsetParent;
      top += el.offsetTop;
      left += el.offsetLeft;
    }
  
    return (
      top < (window.pageYOffset + window.innerHeight) &&
      left < (window.pageXOffset + window.innerWidth) &&
      (top + height) > window.pageYOffset &&
      (left + width) > window.pageXOffset
    );
  }

  addAnimation(): void {
    var wrappers = document.getElementsByClassName("wrap-article");
    for (var i = 0; i < wrappers.length; i++) {
      if (this.elementInViewport(wrappers[i]) == true) {
      (wrappers[i] as HTMLElement).style.animationName = "bigger";
      }
    }
  }

}
