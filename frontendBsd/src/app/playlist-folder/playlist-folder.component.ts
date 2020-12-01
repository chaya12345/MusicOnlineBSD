import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Song } from '../classes/song';
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';

@Component({
  selector: 'playlist-folder',
  templateUrl: './playlist-folder.component.html',
  styleUrls: ['./playlist-folder.component.css']
})
export class PlaylistFolderComponent implements OnInit {

  @Input() name: string = "";
  @Input() date: Date;
  @Input() id:number;
  @Output() playlist:EventEmitter<Song[]>=new EventEmitter();

  constructor(private songsToPlaylistsService:SongsToPlaylistsService) { }

  ngOnInit(): void {
  }
  toSendPlalist(){
    try{
      this.songsToPlaylistsService.getSongsToPlaylists(this.id).subscribe(
        songs=>this.playlist.emit(songs),err=>console.log(err));
    }catch(err){console.log(err);}
  }

}
