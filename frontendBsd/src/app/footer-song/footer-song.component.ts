import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css']
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;
  countRes: number = 0;

  constructor(private resToSongsService: ResponseToSongsService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    this.getCountResponses();
    let el = document.getElementsByClassName("transform-title");
    for (let i = 0; i < el.length; i++) {
      console.log(i);
      console.log(el[i]);
      // el[i].style.position = "absolute";
      // el[i].style.left = el[i].offsetWidth + "px !important";
      (el[i] as HTMLElement).style.left = (((el[i] as HTMLElement).offsetWidth*-1)+350-20)+"px !important";
      // ------------------------------------------------------------------------------
      // (el[i] as HTMLElement).style.transform = "translateX("+(((el[i] as HTMLElement).offsetWidth*-1)+350-20)+"px)";
      // console.log("------------ " + (el[i] as HTMLElement).style.transform);
      // (el[i] as HTMLElement).style.transition = "5.5s";
      // ------------------------------------------------------------------------------
      // console.log("============ " + el[i].offsetWidth + "px !important");
      // console.log("------------ " + (el[i] as HTMLElement).style.left);
    }
  }

  getCountResponses(): void {
    try {
      this.resToSongsService.getCountResponsesToSong(this.song.id)
      .subscribe(count => { this.countRes = count; this.cdr.detectChanges(); }, err => { console.log(err); }); }
      catch (err) { console.log(err); }
  }

}
