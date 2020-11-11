import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnnualSurveyComponent } from './annual-survey.component';

describe('AnnualSurveyComponent', () => {
  let component: AnnualSurveyComponent;
  let fixture: ComponentFixture<AnnualSurveyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AnnualSurveyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AnnualSurveyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
