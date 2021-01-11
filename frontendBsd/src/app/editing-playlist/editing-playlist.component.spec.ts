import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingPlaylistComponent } from './editing-playlist.component';

describe('EditingPlaylistComponent', () => {
  let component: EditingPlaylistComponent;
  let fixture: ComponentFixture<EditingPlaylistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingPlaylistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
