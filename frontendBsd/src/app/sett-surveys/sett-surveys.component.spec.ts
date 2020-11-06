import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SettSurveysComponent } from './sett-surveys.component';

describe('SettSurveysComponent', () => {
  let component: SettSurveysComponent;
  let fixture: ComponentFixture<SettSurveysComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SettSurveysComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SettSurveysComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
