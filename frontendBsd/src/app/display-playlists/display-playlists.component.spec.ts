import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DisplayPlaylistsComponent } from './display-playlists.component';

describe('DisplayPlaylistsComponent', () => {
  let component: DisplayPlaylistsComponent;
  let fixture: ComponentFixture<DisplayPlaylistsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DisplayPlaylistsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DisplayPlaylistsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
