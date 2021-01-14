import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingAPlaylistComponent } from './adding-a-playlist.component';

describe('AddingAPlaylistComponent', () => {
  let component: AddingAPlaylistComponent;
  let fixture: ComponentFixture<AddingAPlaylistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingAPlaylistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingAPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
