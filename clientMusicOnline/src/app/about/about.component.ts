import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  aboutContent;
  about: string = "" +
    " כוכבים נופלים, מתאר את השגרה הנוכחית של היוצרים והאומנים ובעצם של כולנו.  כי התקופה הזו לא פשוטה לאף אחד ובוודאי לנו האומנים שרגילים לשמח. כשהנסיבות סוגרות אותך בבית ולא מאפשרות לך להופיע כ\"כ הרבה זמן ואפשר רק לדמיין את הקושי, אבל אז קיבלתי את מילות השיר המחזקות, ואיתן אפשר לנצח את היום ואת המחר, את הקושי ואת הטעויות – שוברים גלים ומתגברים על מכשול…" +

    "השיר הוא עדות לתקופה בה אנו חיים \"מעולם לא העלינו על דעתנו לנהל שגרה, ולחיות עם מגבלה כאילו אנו חולים. המילים של כוכבים נופלים דוחפות אותנו קדימה אל מעבר למחלה. אשר לעיתוי – החלטתי להוציאו כעת, כי רבים חשבו שהדבר הנורא הזה מאחורינו. הרי חזרנו לבתי הכנסת, שיעורי התורה שבו להישמע ברבים, וגם מכשירי הטלפון, ב\"ה, החלו לצלצל ואיתם מתעניינים ומזמינים הופעות. אלא שפתאום מתברר שאנו במצב גרוע יותר ממה שהיינו בגל הראשון. אז נכון, כוכבים נופלים אבל אנחנו מתחזקים, החוזק הנפשי שלנו הוא בנשמתנו, וכשזה כך אז גם השמיים נפתחים לנו…" +

    "איציק, שהחלים מהנגיף, מנסה לחזור לשגרה.בימים אלה הוא שוב בארה\"ב, לשם טס לסדרת הופעות ואירועי שמחות, \"אכן חליתי בעבר בעת מסע הופעות באמריקה וב\"ה כעת אני בריא, השבח לבורא עולם.' הוא לא חשש לטוס שוב, כי 'זאת הפרנסה שלי ושל צוות שלם שעובד איתי' ומזכיר לכולנו שאפשר להידבק גם בארץ, לא צריך להרחיק עד לחו\"ל… ואולם, השתדלות חייבים לעשות וחובה לשמור על ההנחיות, אך מעבר לזה הכול בידי שמיים." +

    "דדיה על הבמות כבר מגיל צעיר, שלושת אלבומיו הראשונים ביטאו יצירה צעירה, שהתאימה לשעתה. את הקריירה המוזיקלית בשלבה הנוכחי, מתאר דדיה כהתבוננות עצמית, יצירה מתוך ניסיון רב והבנה מעמיקה." +

    "הלחן של אלחנן אלחדד, מלחין מוכשר בקיא ורגיל, אבל על העיבוד חתומים שני אחים, אייל ואיר שריקי יוצרים צעירים ומבטיחים שזהו להם הפרויקט הגדול הראשון. איציק שמח לפרגן: \"זכיתי לקבל הזדמנויות בהיותי צעיר ולא מוכר, ואני מעביר את זה הלאה. פגשתי צמד אחים חדים ומוכשרים ושמח על שניתנה לי הזכות להכיר ולעבוד איתם, אני בטוח שנשמע עליהם רבות." +

    "כוכבים נופלים | מילים ולחן: אלחנן אלחדד | עיבוד והפקה מוזיקלית: אייל ויאיר שריקי";

  constructor(http: HttpClient) {
    http.get('../../assets/text/about-site.utf-8.txt', {
      responseType: 'text', headers: {
        "Accept": "application/txt;charset=utf-8",
        "Accept-Charset": "charset=utf-8"
      }
    })
      .subscribe(data => { this.aboutContent = data; console.log(data); this.filter() });
    //   $.ajax({
    //     type:"GET",
    //     url:"../../assets/text/about-site.txt",
    //     headers: {
    //         "Accept": "application/txt;charset=utf-8",
    //         "Accept-Charset":"charset=utf-8"
    //     },
    //     dataType:"txt"
    //  });  
  }

  ngOnInit() {
    // var reader = new FileReader();

    // reader.onload = function (e) {
    //   var text = reader.result;
    //   console.log(text);
    // }
    // reader.readAsText('', encoding);
  }

  filter(): void {
    // var decoder = new TextDecoder('utf-8'), decodedMessage;
    // decodedMessage = decoder.decode(this.aboutContent.data);
    // this.aboutContent.append('Data', 'text/txt;charset=utf-8');
    // this.aboutContent.append("Accept-Charset", "charset=utf-8");
    // var words = encode_utf8('Marché')

    // Original
    // this.aboutContent = unescape(encodeURIComponent(this.aboutContent));
    // this.aboutContent = decodeURIComponent(escape(this.aboutContent));
    // this.aboutContent = escape(encodeURIComponent(this.aboutContent));
    // this.aboutContent = escape(encodeURI((this.aboutContent)));
  }

}
