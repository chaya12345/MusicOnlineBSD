import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';
import Swiper, { Navigation, Pagination } from 'swiper';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'for-try',
  templateUrl: './for-try.component.html',
  styleUrls: ['./for-try.component.css', './swiper-bundle.min.css']
})
export class ForTryComponent implements OnInit {
  songOfTags:Song[]=[];
  tagsName:string[]=["דואט","שקט"];


  constructor(private songService: SongService) {
    
    //לא עובד- יש שגיאה אי אפשר לעשות פוסט
    this.songService.getSongsByTags(this.tagsName).subscribe(
      songs=>{this.songOfTags=songs; console.log("the function getSongsByTags works!"); } , err=>console.log(err));
  }

  ngOnInit() {
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
