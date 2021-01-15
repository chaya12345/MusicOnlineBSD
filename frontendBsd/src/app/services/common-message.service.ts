import { Injectable } from '@angular/core';

export class STATUS {
  SUCCESS: string;
  FAIL: string;
  ERROR?: string
}

export class STATE {
  ADD: STATUS;
  REMOVE: STATUS;
}

@Injectable({
  providedIn: 'root'
})
export class CommonMessageService {

  FOLLOW_UP: STATE = {
    ADD: {
      SUCCESS: "המעקב נוסף בהצלחה",
      FAIL: "קיים כבר מעקב לכתובת המייל שהוזנה",
      ERROR: "מצטערים, הוספת המעקב נכשלה. נסה שוב מאוחר יותר"
    },
    REMOVE: {
      SUCCESS: "המעקב הוסר בהצלחה",
      FAIL: "לא קיים מעקב לכתובת המייל שהוזנה",
      ERROR: "מצטערים, הסרת המעקב נכשלה. נסה שוב מאוחר יותר"
    }
  }

  SUBSCRIPTION: STATE = {
    ADD: {
      SUCCESS: "נרשמת בהצלחה",
      FAIL: "כתובת המייל שהוזנה כבר רשומה לזמר שנבחר",
      ERROR: "מצטערים, ההרשמה למנוי נכשלה. נסה שוב מאוחר יותר"
    },
    REMOVE: {
      SUCCESS: "המנוי הוסר בהצלחה",
      FAIL: "לא קיים מנוי לכתובת המייל שהוזנה",
      ERROR: "מצטערים, הסרת המנוי נכשלה. נסה שוב מאוחר יותר"
    }
  }

  PLAYLIST: STATE = {
    ADD: {
      SUCCESS: "הוספת הפלייליסט בוצעה בהצלחה",
      FAIL: "חסרים פרטים שסומנו כשדות חובה",
      ERROR: "מצטערים, הוספת הפלייליסט נכשלה. נסה שוב מאוחר יותר"
    },
    REMOVE: {
      SUCCESS: "מחיקת הפלייליסט בוצע בהצלחה",
      FAIL: "הפלייליסט המבוקש לא קיים",
      ERROR: "מצטערים, מחיקת הפלייליסט נכשלה. נסה שוב מאוחר יותר"
    }
  }

  GENERATE: STATE = {
    ADD: {
      SUCCESS: "הפריט נוסף בהצלחה",
      FAIL: "חסרים פרטים שסומנו כשדות חובה",
      ERROR: "הוספת הפריט נכשלה. נסה שוב מאוחר יותר"
    },
    REMOVE: {
      SUCCESS: "הפריט הוסר בהצלחה",
      FAIL: "חסרים פרטים שסומנו כשדות חובה",
      ERROR: "הסרת הפריט נכשלה. נסה שוב מאוחר יותר"
    }
  }

  MOVE_SONG: STATUS = {
    SUCCESS: "העברת השיר בוצעה בהצלחה",
    FAIL: "השיר שנבחר לא קיים בפלייליסט המבוקש",
    ERROR: "העברת השיר נכשלה. נסה שוב מאוחר יותר"
  }

  FINISHED_PARADE: STATUS = {
    SUCCESS: "המצעד הסתיים בהצלחה",
    FAIL:"אין מצעד פועל",
    ERROR: "סיום המצעד נכשל. נסה שוב מאוחר יותר"
  }
  RESTART_PARADE: STATUS = {
    SUCCESS: "המצעד הופעל מחדש בהצלחה",
    FAIL:"אין מצעד פועל",
    ERROR: "הפעלת המצעד מחדש נכשלה. נסה שוב מאוחר יותר"
  }
  ACTIVATION_PARADE: STATUS = {
    SUCCESS: "הפעלת המצעד בוצע בהצלחה",
    FAIL:"הפעלת המצעד נכשלה. נסה שוב מאוחר יותר",
    ERROR: "הפעלת המצעד נכשלה. נסה שוב מאוחר יותר"
  }

  UPDATE_ITEM: STATUS = {
    SUCCESS: "השינויים נשמרו בהצלחה",
    FAIL: "הפריט המבוקש לא קיים",
    ERROR: "שמירת השינויים נכשלה. נסה שוב מאוחר יותר"
  }
  CHANGE_STATUS: STATUS = {
    SUCCESS: "הסטטוס שונה בהצלחה",
    FAIL: "שינוי הסטטוס נכשל. נסה שוב מאוחר יותר",
    ERROR: "שינוי הסטטוס נכשל. נסה שוב מאוחר יותר"
  }

  DELETE_ITEM: STATUS = {
    SUCCESS: "הפריט נמחק בהצלחה",
    FAIL: "הפריט המבוקש לא קיים",
    ERROR: "מחיקת הפריט נכשלה. נסה שוב מאוחר יותר"
  }

  COMMIT_SIGNING: STATUS = {
    SUCCESS: "עודכן סטטוס תגובה",
    FAIL: "התגובה כבר בסטטוס שנבחר",
    ERROR: "שמירת השינויים נכשלה. נסה שוב מאוחר יותר"
  }

  RENAME_PLAYLIST: STATUS = {
    SUCCESS: "השם שונה בהצלחה",
    FAIL: "הפריט המבוקש לא קיים",
    ERROR: "שינוי שם נכשל. נסה שוב מאוחר יותר"
  }

  ERROR = "מצטערים, קרתה תקלה. נסה שוב מאוחר יותר";

  constructor() { }
}
