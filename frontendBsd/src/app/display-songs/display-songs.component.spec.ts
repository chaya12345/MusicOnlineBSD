import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DisplaySongsComponent } from './display-songs.component';

describe('DisplaySongsComponent', () => {
  let component: DisplaySongsComponent;
  let fixture: ComponentFixture<DisplaySongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DisplaySongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DisplaySongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
