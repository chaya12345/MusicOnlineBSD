import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';

@Component({
  selector: 'playlist-section',
  templateUrl: './playlist-section.component.html',
  styleUrls: ['./playlist-section.component.css']
})
export class PlaylistSectionComponent implements OnInit {

  playlist: PlaylistSystem;
  navs: string[] = [];
  loaded: boolean = false;

  constructor(private activatedRoute: ActivatedRoute, private playlistSystemService: PlaylistsSystemService,
    private cdr: ChangeDetectorRef) {
    try {
      this.playlistSystemService.getPlaylistById(Number(this.activatedRoute.snapshot.paramMap.get("id")))
      .subscribe(playlist => { this.playlist = playlist; this.cdr.detectChanges(); this.loaded = true; this.navs.push(this.playlist.name); }, 
      err => console.log(err));
    } catch { console.log("get plalist failed"); }
    this.navs.push("הפלייליסטים");
  }

  ngOnInit() {
  }

}
