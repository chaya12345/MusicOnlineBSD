import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'popular-singers',
  templateUrl: './popular-singers.component.html',
  styleUrls: ['./popular-singers.component.css']
})
export class PopularSingersComponent implements OnInit {

  popularSingers = ["איציק דדיה", "אברהם פריד", "יעקב שוואקי", "מרדכי בן דוד", "אוהד מושקוביץ", "ישי ריבו",
    "אהרן רזאל", "חיים ישראל", "גד אלבז", "מוטי שטיינמץ", "בני פרידמן"];

  constructor() { }

  ngOnInit() {
  }

}
