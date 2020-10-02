import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'songs-in-playlist',
  templateUrl: './songs-in-playlist.component.html',
  styleUrls: ['./songs-in-playlist.component.css']
})
export class SongsInPlaylistComponent implements OnInit {

  @Input() playlist: PlaylistSystem;
  songsList: Song[] = [];

  constructor(private songService: SongService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    if (this.playlist != null) {
      this.getSongs();
    }
  }

  getSongs(): void {
    try {
      this.songService.getSongsByTagId(this.playlist.tagId)
      .subscribe(songs => { this.songsList = songs; this.cdr.detectChanges(); }, err => console.log(err));
    } catch { console.log("get songs failed"); }
  }

}
