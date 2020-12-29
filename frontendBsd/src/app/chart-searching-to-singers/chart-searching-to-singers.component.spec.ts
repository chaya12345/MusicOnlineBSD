import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChartSearchingToSingersComponent } from './chart-searching-to-singers.component';

describe('ChartSearchingToSingersComponent', () => {
  let component: ChartSearchingToSingersComponent;
  let fixture: ComponentFixture<ChartSearchingToSingersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChartSearchingToSingersComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ChartSearchingToSingersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
