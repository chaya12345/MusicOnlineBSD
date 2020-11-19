import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlaylistFolderComponent } from './playlist-folder.component';

describe('PlaylistFolderComponent', () => {
  let component: PlaylistFolderComponent;
  let fixture: ComponentFixture<PlaylistFolderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlaylistFolderComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PlaylistFolderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
