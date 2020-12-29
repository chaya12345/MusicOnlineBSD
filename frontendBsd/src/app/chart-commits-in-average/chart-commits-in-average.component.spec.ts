import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChartCommitsInAverageComponent } from './chart-commits-in-average.component';

describe('ChartCommitsInAverageComponent', () => {
  let component: ChartCommitsInAverageComponent;
  let fixture: ComponentFixture<ChartCommitsInAverageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChartCommitsInAverageComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ChartCommitsInAverageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
