import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MPlaylistsComponent } from './m-playlists.component';

describe('MPlaylistsComponent', () => {
  let component: MPlaylistsComponent;
  let fixture: ComponentFixture<MPlaylistsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MPlaylistsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MPlaylistsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
