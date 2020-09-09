import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'top-footer',
  templateUrl: './top-footer.component.html',
  styleUrls: ['./top-footer.component.css']
})
export class TopFooterComponent implements OnInit {

  @Input() title: string;
  @Input() isFirst?: boolean = false;
  @Input() isLast?: boolean = false;

  constructor() { }

  ngOnInit() {
  }

}
