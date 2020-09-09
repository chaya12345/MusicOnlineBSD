import { Component, OnInit } from '@angular/core';
import Swiper, { Navigation, Pagination } from 'swiper';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'music-channels',
  templateUrl: './music-channels.component.html',
  styleUrls: ['./music-channels.component.css', './swiper-bundle.min.css']
})
export class MusicChannelsComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 4,
      loop: true,
      spaceBetween: -40,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    
      scrollbar: {
        el: '.swiper-scrollbar',
      },
    });
  }

}
