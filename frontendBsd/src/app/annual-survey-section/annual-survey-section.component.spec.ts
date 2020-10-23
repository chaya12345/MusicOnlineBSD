import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnnualSurveySectionComponent } from './annual-survey-section.component';

describe('AnnualSurveySectionComponent', () => {
  let component: AnnualSurveySectionComponent;
  let fixture: ComponentFixture<AnnualSurveySectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AnnualSurveySectionComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AnnualSurveySectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
