import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoSongComponent } from './info-song.component';

describe('InfoSongComponent', () => {
  let component: InfoSongComponent;
  let fixture: ComponentFixture<InfoSongComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InfoSongComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InfoSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
