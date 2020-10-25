import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import Swiper, { Navigation, Pagination } from 'swiper';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
Swiper.use([Navigation, Pagination]);

@Component({
  selector: 'si-popular-songs',
  templateUrl: './si-popular-songs.component.html',
  styleUrls: ['./si-popular-songs.component.css', './swiper-bundle.min.css']
})
export class SiPopularSongsComponent implements OnInit {

  songs: Song[] = [];

  constructor(private songService: SongService, private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    this.getSongs();
  }

  ngAfterViewInit() {
    var swiper = new Swiper('.swiper-container-song', {
      slidesPerView: 1,
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

  getSongs(): void {
    try {
      this.songService.getSongs().subscribe(songs => { this.songs = songs; this.cdr.detectChanges();
      this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      this.songs = this.songs.slice(0, 5); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
