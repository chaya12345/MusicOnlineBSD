import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingPlaylistComponent } from './adding-playlist.component';

describe('AddingPlaylistComponent', () => {
  let component: AddingPlaylistComponent;
  let fixture: ComponentFixture<AddingPlaylistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingPlaylistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
