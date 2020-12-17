import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { EditProfileComponent } from '../edit-profile/edit-profile.component';

@Component({
  selector: 'profile-obj',
  templateUrl: './profile-obj.component.html',
  styleUrls: ['./profile-obj.component.css']
})
export class ProfileObjComponent implements OnInit {

  @Input() name: string = "";
  @Input() mail: string = "";
  @Input() img: string = "";

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }
  openDialogToEditProfile(): void {
    try {
      const dialogRef = this.dialog.open(EditProfileComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }

  showEdit(){
    document.getElementsByTagName('button')[0].style.visibility="visible";
  }
  hideEdit(){
    document.getElementsByTagName('button')[0].style.visibility="hidden";
  }

}
