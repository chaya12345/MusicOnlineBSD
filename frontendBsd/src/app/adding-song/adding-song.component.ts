import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { MailDetailsDialogComponent } from '../mail-details-dialog/mail-details-dialog.component';
import { SongService } from '../services/song.service';
import { MailDetails } from '../services/upload.service';
import { SongObjWithFiles } from '../song-form/song-form.component';

@Component({
  selector: 'adding-song',
  templateUrl: './adding-song.component.html',
  styleUrls: ['./adding-song.component.css']
})
export class AddingSongComponent implements OnInit {

  isPerformance: boolean = false;
   mailDetails: MailDetails = new MailDetails();
  constructor(public dialog: MatDialog,private songService:SongService,private _snackBar: MatSnackBar,) { }

  ngOnInit(): void {
  }
  sendingSong(song:SongObjWithFiles){
    try {
      this.songService.addFullSong(song.songObj, song.imageFile, song.songFile, this.mailDetails)
        .subscribe(result => {
          this.openSnackBar(result == true ? "העלאת השיר בוצעה בהצלחה" :
            "העלאת השיר נכשלה. נסה שוב מאוחר יותר");
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }
  openDialogToMailDetails(song:SongObjWithFiles): void {
    try {
      const dialogRef = this.dialog.open(MailDetailsDialogComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
        this.mailDetails = result.mailDetails;
        this.sendingSong(song);
      });
    }
    catch (err) { console.log(err); return null; }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
