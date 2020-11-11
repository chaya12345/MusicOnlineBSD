import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnnualSurveyContentComponent } from './annual-survey-content.component';

describe('AnnualSurveyContentComponent', () => {
  let component: AnnualSurveyContentComponent;
  let fixture: ComponentFixture<AnnualSurveyContentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AnnualSurveyContentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AnnualSurveyContentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
