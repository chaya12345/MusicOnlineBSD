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
  tagsName:string[]=["דואט","שקט"];


  constructor(private songService: SongService) {
    
    //לא עובד- יש שגיאה אי אפשר לעשות פוסט
    this.songService.getSongsByTags(this.tagsName).subscribe(
      songs=>{this.songOfTags=songs; console.log("the function getSongsByTags works!"); } , err=>console.log(err));
  }

  ngOnInit() {
  }

}
