import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlaylistsAdjacentComponent } from './playlists-adjacent.component';

describe('PlaylistsPreviousNextComponent', () => {
  let component: PlaylistsAdjacentComponent;
  let fixture: ComponentFixture<PlaylistsAdjacentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlaylistsAdjacentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PlaylistsAdjacentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
