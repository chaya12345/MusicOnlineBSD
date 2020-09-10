import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'app-for-try',
  templateUrl: './for-try.component.html',
  styleUrls: ['./for-try.component.css']
})
export class ForTryComponent implements OnInit {
  songOfTags:Song[]=[];
  tagsName:object={"tags":["דואט","שקט"]};


  constructor(private songService: SongService) {
    
    //לא עובד- יש שגיאה אי אפשר לעשות פוסט
    this.songService.GetSongsByTags(this.tagsName).subscribe(
      songs=>{this.songOfTags=songs; console.log(this.songOfTags); } , err=>console.log(err));
  }

  ngOnInit() {
  }

}
