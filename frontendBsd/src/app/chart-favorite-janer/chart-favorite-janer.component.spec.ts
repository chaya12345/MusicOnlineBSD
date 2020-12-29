import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChartFavoriteJanerComponent } from './chart-favorite-janer.component';

describe('ChartFavoriteJanerComponent', () => {
  let component: ChartFavoriteJanerComponent;
  let fixture: ComponentFixture<ChartFavoriteJanerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChartFavoriteJanerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ChartFavoriteJanerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
