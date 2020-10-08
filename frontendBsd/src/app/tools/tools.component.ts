import { EventEmitter } from '@angular/core';
import { Component, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'tools',
  templateUrl: './tools.component.html',
  styleUrls: ['./tools.component.css']
})
export class ToolsComponent implements OnInit {

  @Output() onOrder: EventEmitter<string> = new EventEmitter<string>();
  @Input() searchBox?: boolean = false;
  @Input() followUp?: boolean = false;
  @Input() addToPlaylist?: boolean = false;
  @Input() orderBy?: boolean = false;
  @Input() sideText?: string = "";
  isChecked: boolean = false;

  followedUp: boolean = false;

  constructor(public router: Router) { }

  ngOnInit() {
    // לבדוק אם המשתמש מחובר - הפרטים שלו בסשן
    // אם כן - לבדוק בטבלת מעקבים אם הוא במעקב על מה שדלוק (בניתוב לבדוק אם זה מאמר/שיר ולבדוק לפי מזהה)
    // אם הוא עוקב אחריו
    // this.followed = true;
  }

  toggleFollowUp() {
    // לבדוק אם המשתמש מחובר - הפרטים שלו בסשן
    // אם הוא מחובר והוא לא עוקב - להוסיף מעקב אם הוא עוקב - להסיר מעקב
    // אם הוא לא מחובר - להציג לו הודעה - התחבר 
  }

  order(value: string): void {
    this.onOrder.emit(value);
  }

}
