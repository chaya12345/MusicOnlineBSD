import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
// import Swiper, { Navigation, Pagination } from 'swiper';
import { Swiper } from 'swiper/bundle';
import { Navigation, Pagination } from 'swiper';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'new-songs',
  templateUrl: './new-songs.component.html',
  styleUrls: ['./new-songs.component.css', './swiper-bundle.min.css']
})
export class NewSongsComponent implements OnInit {

  newSongsList: Song[] = [];

  constructor(private songService: SongService, private router: Router) {
    try {
      this.songService.getSongs().subscribe(song => { this.newSongsList = song; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }


  ngAfterViewInit() {
    var swiper = new Swiper('.swiper-container-header', {
      slidesPerView: 1.2,
      loop: true,
      spaceBetween: 0,
      centeredSlides: true,
      autoplay: {
        delay: 6500,
        disableOnInteraction: false,
      },
      speed: 900,
      pagination: {
        el: '.swiper-pagination-header',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next-header',
        prevEl: '.swiper-button-prev-header',
      }
    });
  }

  filter(): void {
    this.newSongsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.newSongsList = this.newSongsList.slice(0, 5);
  }

}
