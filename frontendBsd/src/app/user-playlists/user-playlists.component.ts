import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { PlayList } from '../classes/playlist';
import { User } from '../classes/user';
import { PlaylistsService } from '../services/playlists.service';
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';

@Component({
  selector: 'user-playlists',
  templateUrl: './user-playlists.component.html',
  styleUrls: ['./user-playlists.component.css', './../m-style.css']
})
export class UserPlaylistsComponent implements OnInit {

  @ViewChild('playlistSection') playlistSection: ElementRef;
  @Input() user: User;
  playlists: PlayList[] = [];

  activePlaylist: PlayList;

  constructor(private playlistsService: PlaylistsService,
    private stpService: SongsToPlaylistsService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null) {
      this.getPlaylistsOfUser();
      this.activePlaylist = this.playlists[0];
    }
  }

  getPlaylistsOfUser(): void {
    try {
      this.playlistsService.GetPlaylistsByUserId(this.user.id)
      .subscribe(plylsts => this.playlists = plylsts, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  scrollToSection(): void {
    this.playlistSection.nativeElement.scrollIntoView({ behavior: 'smooth' });
  }

}
