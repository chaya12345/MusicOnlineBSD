import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';

@Component({
  selector: 'article-details',
  templateUrl: './article-details.component.html',
  styleUrls: ['./article-details.component.css']
})
export class ArticleDetailsComponent implements OnInit {

  @Input() article: Article;
  videoSrc: string;
  video: HTMLVideoElement;
  msbapAudioUrl: string;
  msbapTitle: string;
  msbapDisplayTitle: boolean;
  msbapDisplayVolumeControls: boolean;
  msbapDisablePositionSlider: boolean;

  constructor() { }

  ngOnInit(): void {
    this.videoSrc = '../../assets/songs/' + this.article.video;
    this.video = document.querySelector('video');
    this.video.load();

    this.msbapAudioUrl = '../../assets/songs/' + this.article.audio1;
    this.msbapTitle = this.article.title;
    this.msbapDisplayTitle = false;
    this.msbapDisplayVolumeControls = true;
    this.msbapDisablePositionSlider = true;
  }

}
