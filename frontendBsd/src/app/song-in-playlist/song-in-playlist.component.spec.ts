import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SongInPlaylistComponent } from './song-in-playlist.component';

describe('SongInPlaylistComponent', () => {
  let component: SongInPlaylistComponent;
  let fixture: ComponentFixture<SongInPlaylistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SongInPlaylistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SongInPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
