import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SettSongsComponent } from './sett-songs.component';

describe('SettSongsComponent', () => {
  let component: SettSongsComponent;
  let fixture: ComponentFixture<SettSongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SettSongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SettSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
