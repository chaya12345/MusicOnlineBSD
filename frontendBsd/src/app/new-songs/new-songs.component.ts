import { Component, OnInit } from '@angular/core';
import Swiper, { Navigation, Pagination } from 'swiper';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'new-songs',
  templateUrl: './new-songs.component.html',
  styleUrls: ['./new-songs.component.css', './swiper-bundle.min.css']
})
export class NewSongsComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      loop: true,
      spaceBetween: 10,
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
