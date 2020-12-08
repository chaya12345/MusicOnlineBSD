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

  MOVE_SONG: STATUS = {
    SUCCESS: "העברת השיר בוצעה בהצלחה",
    FAIL: "השיר שנבחר לא קיים בפלייליסט המבוקש",
    ERROR: "העברת השיר נכשלה. נסה שוב מאוחר יותר"
  }

  ERROR = "מצטערים, קרתה תקלה. נסה שוב מאוחר יותר";

  constructor() { }
}
