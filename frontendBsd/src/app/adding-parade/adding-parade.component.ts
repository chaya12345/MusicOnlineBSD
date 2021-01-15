import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Parade } from '../classes/parade';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { CommonMessageService } from '../services/common-message.service';
import { ParadeObj, ParadeService } from '../services/parade.service';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'adding-parade',
  templateUrl: './adding-parade.component.html',
  styleUrls: ['./adding-parade.component.css']
})
export class AddingParadeComponent implements OnInit {

  selectSongs: FormGroup;
  songsList: Song[] = [];

  selectSingers: FormGroup;
  singersList: Singer[] = [];

  uploadingImage:FormGroup;
  imageFile:File;

  constructor(private songService: SongService, private singerService: SingerService,
    private paradeService:ParadeService, private _snackBar:MatSnackBar,private cmService:CommonMessageService) {
    this.selectSongs = new FormGroup({
      songs: new FormControl("", Validators.required)
    });
    this.selectSingers = new FormGroup({
      singers: new FormControl("", Validators.required)
    });
    this.uploadingImage=new FormGroup({
      image:new FormControl("",Validators.required)
    })
    this.getSongs();
    this.getSingers();
  }

  ngOnInit(): void {
  }

  getSongs() {
    this.songService.getSongsPublishedThisYear().subscribe(songs => this.songsList = songs, err => console.log(err));
  }

  getSingers() {
    this.singerService.getSingers().subscribe(singers => this.singersList = singers, err => console.log(err));
  }

  getSongsErrorMessage() {
    let message: string = this.getError(this.selectSongs.controls.songs);
    return message;
  }

  getSingersErrorMessage(){
    let message:string=this.getError(this.selectSingers.controls.singers);
    return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    return "";
  }

  selectImage(fileToUpload: File): void {
    //console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadingImage.controls.image.setValue(fileToUpload.name);
    //console.log(this.imageFormGroup.controls.image.value);
  }

  confirm(){
    let parade:Parade=new Parade;
    parade.image=this.uploadingImage.controls.image.value;
    let paradeObj:ParadeObj=new ParadeObj;
    paradeObj.parade=parade;
    paradeObj.singers=this.selectSingers.controls.singers.value;
    paradeObj.songs=this.selectSongs.controls.songs.value;
    this.paradeService.addParade(paradeObj).subscribe(
      res=>this.openSnackBar(res==true?this.cmService.ACTIVATION_PARADE.SUCCESS:this.cmService.ACTIVATION_PARADE.FAIL),
      err=>this.openSnackBar(this.cmService.ACTIVATION_PARADE.ERROR));
  }

  openSnackBar(message:string){
    this._snackBar.open(message,'',{
      duration:2000
    });
  }

}
