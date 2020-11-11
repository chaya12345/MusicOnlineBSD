import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnSrSongComponent } from './an-sr-song.component';

describe('AnSrSongComponent', () => {
  let component: AnSrSongComponent;
  let fixture: ComponentFixture<AnSrSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AnSrSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AnSrSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
