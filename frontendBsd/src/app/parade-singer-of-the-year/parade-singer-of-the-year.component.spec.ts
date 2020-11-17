import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeSingerOfTheYearComponent } from './parade-singer-of-the-year.component';

describe('ParadeSingerOfTheYearComponent', () => {
  let component: ParadeSingerOfTheYearComponent;
  let fixture: ComponentFixture<ParadeSingerOfTheYearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeSingerOfTheYearComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeSingerOfTheYearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
