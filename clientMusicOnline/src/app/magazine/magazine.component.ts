import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';

@Component({
  selector: 'magazine',
  templateUrl: './magazine.component.html',
  styleUrls: ['./magazine.component.css'],
  providers: [SongService]
})
export class MagazineComponent implements OnInit {

  articlesList = [{
    title: "צפו: גדולי הזמר על במה אחת בסוכות",
    subtitle: " כ\"ח תשרי התשע\"ט | 07.10.18 10:14",
    imgSrc: "../../assets/images/for-deleting/162576_tumb_750Xauto.jpg",
    content: "גדולי הזמר אלי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה"
  },{
    title: "אחים ושרים: ראיון משולש עם חיים ישראל, איציק ואבישי אשל",
    subtitle: "ב' כסלו התשע\"ה | 24.11.14 08:29",
    imgSrc: "../../assets/images/for-deleting/46849_tumb_750Xauto.jpg",
    content: "שלושה יוצרים נושאים את המוזיקה המזרחית חסידית על הגב שלהם, כל הדרך מתימן לפולין ובחזרה. התוצאה: תחייה רוחנית לז'אנר שחשב ללכת לאיבוד. חיים ישראל, איציק אשל, אבישי אשל - אחים ממשפחה טובה." +
      "הם דיברו ושרו וניגנו. 'בקהילה' לחצו על 'פליי' ומביאים את סיפורם "
  },{
    title: "הרגע ששבר את פיני איינהורן בתהלוכת המרפסות בירושלים • צפו והאזינו",
    subtitle: "16:30 כ״ז באדר תש״פ 23.03.2020",
    imgSrc: "../../assets/images/for-deleting/‏‏פיני-איינהורן-במשאית-השמחה-בירושלים.PNG",
    content: " ביוזמתו של ראש עיריית ירושלים משה ליאון יצאה היום 'משאית השמחה' שתטייל בשכונות ובהמשך" + 
      "גם בכל הארץ, היום היא היתה בבית וגן והיו עליה הזמר פיני איינהורן לצד אמן הקלידים איציק ויינגרטן ששימחו את התושבים, ב'זמן אוויר' סיפר פיני על הרגע הכי מרגש במהלך ההופעה הניידת"
  }];
  like_functionality;

  constructor(private song_service: SongService) { 
    this.like_functionality = song_service;
  }

  ngOnInit() {
  }

  sign(event): void {
    this.like_functionality.toggle_like(event);
  }

  marking(event): void {
    this.like_functionality.change_like_color(event);
  }

  reset_marking(event, color: string): void {
    this.like_functionality.reset_like_color(event, color);
  }

}
