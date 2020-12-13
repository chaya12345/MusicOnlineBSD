import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { CommitsToSongsService } from '../services/commits-to-songs.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css']
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;
  countRes: number = 0;

  constructor(private resToSongsService: CommitsToSongsService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    this.getCountCommits();
  }

  getCountCommits(): void {
    try {
      this.resToSongsService.getCountCommitsToSong(this.song.id)
      .subscribe(count => { this.countRes = count; this.cdr.detectChanges(); }, err => { console.log(err); }); }
      catch (err) { console.log(err); }
  }

}
