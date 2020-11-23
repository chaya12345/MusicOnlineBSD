import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Job } from '../classes/job';
import { JobService } from '../services/job.service';

@Component({
  selector: 'select-job',
  templateUrl: './select-job.component.html',
  styleUrls: ['./select-job.component.css']
})
export class SelectJobComponent implements OnInit {

  job: FormControl;
  jobs: Job[] = [];

  constructor(public dialogRef: MatDialogRef<SelectJobComponent>,
    @Inject(MAT_DIALOG_DATA) public data: SelectJobComponent, private jobService: JobService) {
    this.job = new FormControl("", Validators.required);
    this.getJobs();
  }

  ngOnInit(): void {
  }

  getJobs(): void {
    try {
      this.jobService.getJobs().subscribe(jobs => {
        this.jobs = jobs;
        this.jobs.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  close() {
    if (this.job.valid) {
      this.dialogRef.close(this.job.value);
    }
  }

  onNoClick(): void {
    this.dialogRef.close(false);
  }

}
