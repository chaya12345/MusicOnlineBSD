import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrivPlaylistsComponent } from './priv-playlists.component';

describe('PrivPlaylistsComponent', () => {
  let component: PrivPlaylistsComponent;
  let fixture: ComponentFixture<PrivPlaylistsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrivPlaylistsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrivPlaylistsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
