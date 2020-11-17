import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeSongOfTheYearComponent } from './parade-song-of-the-year.component';

describe('ParadeSongOfTheYearComponent', () => {
  let component: ParadeSongOfTheYearComponent;
  let fixture: ComponentFixture<ParadeSongOfTheYearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeSongOfTheYearComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeSongOfTheYearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
