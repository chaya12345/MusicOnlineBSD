import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'app-for-try',
  templateUrl: './for-try.component.html',
  styleUrls: ['./for-try.component.css']
})
export class ForTryComponent implements OnInit {
  songOfsinger: Song[] = [];
  singerName: string = "אברהם פריד";

  songOfAlbum: Song[] = [];
  albumName: string = "קולות";

  songOfTag:Song[]=[];
  tagName:string="סינגל";
  
  songOfTags:Song[]=[];
  tagsName:object={"tags":["דואט","שקט"]};

  newSong:Song={id:null,name:"בידיים טובות",content:"שיר מרגש"};

  constructor(private songService: SongService) {
    // this.songService.GetSongsBySinger(this.singerName).subscribe(
    //   songs => { this.songOfsinger = songs; console.log(this.songOfsinger) }, err => console.log(err));

    // this.songService.GetSongsByAlbum(this.albumName).subscribe(
    //   songs => { this.songOfAlbum = songs; console.log(this.songOfAlbum); }, err => console.log(err));

    // this.songService.GetSongsByTag(this.tagName).subscribe(
    //   songs=>{this.songOfTag=songs;console.log(this.songOfTag);}, err=>console.log(err));
    
    //לא עובד- יש שגיאה אי אפשר לעשות פוסט
    this.songService.GetSongsByTags(this.tagsName).subscribe(
      songs=>{this.songOfTags=songs; console.log(this.songOfTags); } , err=>console.log(err));



      

  }

  ngOnInit() {
  }

}
