import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { User } from '../classes/user';
import { FavoriteSongsToUserService } from '../services/favorite-songs-to-user.service';

@Component({
  selector: 'user-favorite-songs',
  templateUrl: './user-favorite-songs.component.html',
  styleUrls: ['./user-favorite-songs.component.css', './../m-style.css']
})
export class UserFavoriteSongsComponent implements OnInit {

  @Input() user: User;
  songs: Song[] = [];

  constructor(private fsToUserService: FavoriteSongsToUserService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null)
      this.getFavoriteSongs();
  }

  getFavoriteSongs(): void {
    try {
      this.fsToUserService.getFavoriteSongsToUser(this.user.id)
      .subscribe(songs => this.songs = songs, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
