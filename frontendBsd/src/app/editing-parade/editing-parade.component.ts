import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { ParadeService } from '../services/parade.service';

@Component({
  selector: 'editing-parade',
  templateUrl: './editing-parade.component.html',
  styleUrls: ['./editing-parade.component.css']
})
export class EditingParadeComponent implements OnInit {

  isTowDays: boolean = false;
  activatedParade:boolean;
  constructor(private paradeService:ParadeService,private _snackBar:MatSnackBar,private commonMessage:CommonMessageService,
    public dialog: MatDialog) { 
    this.getParade();
  }

  ngOnInit(): void {
  }

  getParade(): void {
    try {
      this.paradeService.getLastParade().subscribe(parade => {
        if (parade.isActive == true)
          this.activatedParade = true;
        else {
          this.activatedParade = false;
          let date = new Date(parade.dateEnd);
          date.setHours(0, 0, 0, 0);
          if (this.calculateDiff(date) <= 2)
            this.isTowDays = true;
        }
      })
    } catch (err) { console.log(err); }
  }

  calculateDiff(dateSent) {
    let currentDate = new Date();
    dateSent = new Date(dateSent);

    return Math.floor((Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())
      - Date.UTC(dateSent.getFullYear(), dateSent.getMonth(), dateSent.getDate())) / (1000 * 60 * 60 * 24));
  }

  finishedParade() {
    try {
      this.paradeService.finishedParade().subscribe(
        suc => {
          this.openSnackBar(this.commonMessage.FINISHED_PARADE.SUCCESS);
          this.activatedParade = false;
          this.isTowDays = true;
        }, err => this.commonMessage.FINISHED_PARADE.ERROR);
    } catch { this.commonMessage.FINISHED_PARADE.ERROR }

  }

  openMessageDialog(text: string, active: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true) {
          if (active == "finishParade")
            this.finishedParade();
          else if (active == "restartParade")
            this.restartParade();
        }

      });
    } catch (err) { console.log(err); }
  }
  restartParade(): void {
    try {
      this.paradeService.restartParade().subscribe(suc => {
        this.openSnackBar(this.commonMessage.RESTART_PARADE.SUCCESS);
        this.isTowDays = false;
        this.activatedParade = true;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  openSnackBar(message:string){
    this._snackBar.open(message,'',{
      duration:2000
    });
  }

}
