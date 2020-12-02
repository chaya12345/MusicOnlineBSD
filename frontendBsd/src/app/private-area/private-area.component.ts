import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AudioPlaying } from '../classes/audioPlaying';
import { Song } from '../classes/song';
import { User } from '../classes/user';
import { FavoriteSongsToUserService } from '../services/favorite-songs-to-user.service';
import { ShareDataService } from '../services/share-data.service';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'private-area',
  templateUrl: './private-area.component.html',
  styleUrls: ['./private-area.component.css']
})
export class PrivateAreaComponent implements OnInit {

  user: User;
  songs: Song[] = [];
  songsList: Song[] = [];
  playingObj: AudioPlaying = new AudioPlaying();

  constructor(private activatedRoute: ActivatedRoute, private shareDataService: ShareDataService,
    private usersService: UsersService, private favoriteSongsToUserService: FavoriteSongsToUserService) {
    if (this.activatedRoute.snapshot.queryParams.userId) {
      console.log("Yes");
      if (this.shareDataService.userConnectedEventListner()) {
        console.log("this.shareDataService.userConnectedEventListner()>>>>>>>");
        this.shareDataService.userConnectedEventListner().subscribe(user => console.log(user));
        console.log();
      }
    }
    else {
      console.log("No");
    }
    try {
      this.usersService.getUsers().subscribe(
        users =>
          users.forEach(element => {
            if (element.id == 10)
              this.user = element;
          }), err => console.log(err))
    } catch (err) { console.log(err) }
    this.getSongs();
  }

  ngOnInit(): void {
  }
  onSendPlaylist(songs: Song[]) {
    this.songsList = songs;
    this.playingObj = new AudioPlaying();
    this.playingObj.index = 0;
    this.playingObj.play = false;
  }

  getSongs(): void {
    try {
      this.favoriteSongsToUserService.getFavoriteSongsToUser(10).subscribe(songs => {
        this.songs = songs;
        this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.songs = this.songs.slice(0, 5);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }
  updateIndex(obj: AudioPlaying): void {
    this.playingObj = obj;
  }
  check(): boolean {
    if (this.songsList.length > 0)
      return true;
    return false;
  }
}
