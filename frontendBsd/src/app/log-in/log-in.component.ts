import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { User } from '../classes/user';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';
import { DialogDataToWebsite } from '../register/register.component';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'app-log-in',
  templateUrl: './log-in.component.html',
  styleUrls: ['./log-in.component.css']
})
export class LogInComponent implements OnInit {

  hide = true;
  formLogIn: FormGroup;
  name: string;
  password: string;
  user:User;

  constructor(public dialogRef: MatDialogRef<LogInComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite,private usersService: UsersService,
    public dialog: MatDialog) {
    this.formLogIn = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)]),
      password: new FormControl("", [Validators.required, Validators.minLength(2)])
    })
  }

  ngOnInit(): void {
 
  }
  onSubmit() {
    if (this.formLogIn.valid) {
      this.name = this.formLogIn.controls.name.value;
      this.password = this.formLogIn.controls.password.value;
      this.usersService.logIn(this.name,this.password).subscribe(res=>{this.user=res;
         console.log(this.user);localStorage.setItem('userId',this.user.id+'')});
      this.onNoClick();
    }
  }
  
  onNoClick(): void {
    this.dialogRef.close();
    this.formLogIn.reset({ value: "" });
  }
  openRegisterDialog(){
    try {
      this.onNoClick();
      const dialogRef = this.dialog.open(RegisterToWebsiteComponent, {
        width: '400px',
        data: {  }
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }
  
}
