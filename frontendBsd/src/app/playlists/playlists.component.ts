import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';
import { PlaylistsService } from '../services/playlists.service';

@Component({
  selector: 'playlists',
  templateUrl: './playlists.component.html',
  styleUrls: ['./playlists.component.css']
})
export class PlaylistsComponent implements OnInit {

  playlists: PlaylistSystem[] = []
  navs: string[] = [];

  constructor(private playlistsSystemService: PlaylistsSystemService, private cdr: ChangeDetectorRef) { 
    this.navs.push("הפלייליסטים");
  }

  ngOnInit() {
    this.getPlaylists();
  }

  getPlaylists() {
    try {
      this.playlistsSystemService.getPlaylists()
      .subscribe(playlists => { this.playlists = playlists; this.cdr.detectChanges(); }, err => console.log(err));
    } catch { console.log("get playlists failed"); }
  }

}
