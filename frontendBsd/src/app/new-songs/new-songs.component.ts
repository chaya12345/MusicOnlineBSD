import { Component, OnInit } from '@angular/core';
import Swiper, { Navigation, Pagination } from 'swiper';
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

  constructor(private songService: SongService) { 
    try {
    this.songService.getSongs().subscribe(song => { this.newSongsList = song; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('new-songs'); }
  }

  ngOnInit(): void {
  }

  
 ngAfterViewInit() {
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1.2,
      loop: true,
      spaceBetween: 0,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      speed: 800,
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

  filter(): void {
    this.newSongsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.newSongsList = this.newSongsList.slice(0, 5);
  }

}
