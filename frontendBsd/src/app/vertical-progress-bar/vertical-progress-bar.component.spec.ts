import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VerticalProgressBarComponent } from './vertical-progress-bar.component';

describe('VerticalProgressBarComponent', () => {
  let component: VerticalProgressBarComponent;
  let fixture: ComponentFixture<VerticalProgressBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VerticalProgressBarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(VerticalProgressBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
