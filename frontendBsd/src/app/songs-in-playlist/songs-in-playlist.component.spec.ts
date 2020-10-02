import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SongsInPlaylistComponent } from './songs-in-playlist.component';

describe('SongsInPlaylistComponent', () => {
  let component: SongsInPlaylistComponent;
  let fixture: ComponentFixture<SongsInPlaylistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SongsInPlaylistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SongsInPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
