import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingPlaylistComponent } from './deleting-playlist.component';

describe('DeletingPlaylistComponent', () => {
  let component: DeletingPlaylistComponent;
  let fixture: ComponentFixture<DeletingPlaylistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingPlaylistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
