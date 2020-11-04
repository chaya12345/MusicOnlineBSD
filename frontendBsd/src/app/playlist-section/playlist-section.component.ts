import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';
import { PlaylistsSystemService } from '../services/playlists-system.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'playlist-section',
  templateUrl: './playlist-section.component.html',
  styleUrls: ['./playlist-section.component.css']
})
export class PlaylistSectionComponent implements OnInit {

  playlist: PlaylistSystem;
  navs: string[] = [];
  loaded: boolean = false;
  song: Song;

  constructor(private activatedRoute: ActivatedRoute, private playlistSystemService: PlaylistsSystemService,
    private cdr: ChangeDetectorRef, private songService: SongService) {
    try {
      this.playlistSystemService.getPlaylistById(Number(this.activatedRoute.snapshot.queryParams.playlistId))
      .subscribe(playlist => { this.playlist = playlist; this.cdr.detectChanges(); this.loaded = true; this.navs.push(this.playlist.name); }, 
      err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("הפלייליסטים");
    try {
      songService.getSongById(71).subscribe(song => this.song = song, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

}
