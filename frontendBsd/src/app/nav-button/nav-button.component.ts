import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'nav-button',
  templateUrl: './nav-button.component.html',
  styleUrls: ['./nav-button.component.css']
})
export class NavButtonComponent implements OnInit {

  @Input() navigate: string;
  @Input() text: string;
  @Input() dark?: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
