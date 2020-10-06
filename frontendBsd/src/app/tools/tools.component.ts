import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'tools',
  templateUrl: './tools.component.html',
  styleUrls: ['./tools.component.css']
})
export class ToolsComponent implements OnInit {

  @Input() searchBox?: boolean = false;
  @Input() followUp?: boolean = false;
  @Input() addToPlaylist?: boolean = false;
  @Input() orderBy?: boolean = false;
  @Input() sideText?: string = "";
  isChecked: boolean = false;

  constructor(public router: Router) { }

  ngOnInit() {
  }

  toggleFollowUp() {

  }

}