import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LatestPerformanceComponent } from './latest-performance.component';

describe('LatestPerformanceComponent', () => {
  let component: LatestPerformanceComponent;
  let fixture: ComponentFixture<LatestPerformanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LatestPerformanceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LatestPerformanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
