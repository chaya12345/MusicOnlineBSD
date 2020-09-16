import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PopularPlaylistComponent } from './popular-playlist.component';

describe('PopularPlaylistComponent', () => {
  let component: PopularPlaylistComponent;
  let fixture: ComponentFixture<PopularPlaylistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PopularPlaylistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PopularPlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
