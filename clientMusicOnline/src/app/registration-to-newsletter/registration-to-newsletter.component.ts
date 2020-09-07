import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { DialogDataToNewsletter } from '../registration/registration.component';

@Component({
  selector: 'registration-to-newsletter',
  templateUrl: './registration-to-newsletter.component.html',
  styleUrls: ['./registration-to-newsletter.component.css']
})
export class RegistrationToNewsletterComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<RegistrationToNewsletterComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToNewsletter) { }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  toggle(event) {
    if (event.target.querySelector('input').getAttribute('aria-checked'))
      document.getElementById('smart-update').classList.add('smart-update-wanted');
  }

}
