import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { ReportingDialogComponent } from '../reporting-dialog/reporting-dialog.component';
import { SongService } from '../services/song.service';

export interface DialogData {
  name: string;
  mail: string;
  phone: string;
  messange: string;
  songId: string;
}

@Component({
  selector: 'reporting',
  templateUrl: './reporting.component.html',
  styleUrls: ['./reporting.component.css']
})
export class ReportingComponent implements OnInit {

  name: string;
  mail: string;
  phone: string;
  messange: string;
  songId: number;
  result: string;

  _songId: number = null;
  song: Song;

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService, 
    public dialog: MatDialog) {  }

  ngOnInit() {
    if (this.activatedRoute.snapshot.paramMap.get('id') != null)
      this._songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
    else this._songId = null;
    this.songId = this._songId;
    this.getSongById();
  }

  getSongById(): void {
    try {
    this.songService.getSongById(this._songId).subscribe(song => { this.song = song; }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(ReportingDialogComponent, {
      width: '500px',
      data: {mail: this.mail, phone: this.phone, messange: this.messange}
    });
    dialogRef.componentInstance.data.songId = this._songId + "";

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.result = result;
    });
  }

}
