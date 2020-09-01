import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'search-by',
  templateUrl: './search-by.component.html',
  styleUrls: ['./search-by.component.css']
})
export class SearchByComponent implements OnInit {

  singers = new FormControl();
  types = new FormControl();
  artists = new FormControl();
  singersList: string[] = ['אברהם פריד', 'איציק דדיה', 'יעקב שוואקי', 'פיני איינהורן', 'רולי דיקמן', 'ישי ריבו'];
  artistsList: string[] = ['אלי קליין', 'איצי ברי', 'איצי וולדנר', 'אלי לאופר', 'אלחנן אלחדד', 'יוסי גרין']
  typesList: string[] = ['מזרחי', 'שירי נשמה', 'סינגל', 'שבת', 'רמיקס', 'חתונה'];

  constructor() { }

  ngOnInit() {
  }

}
