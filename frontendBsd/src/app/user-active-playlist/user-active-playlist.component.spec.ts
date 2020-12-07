import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserActivePlaylistComponent } from './user-active-playlist.component';

describe('UserActivePlaylistComponent', () => {
  let component: UserActivePlaylistComponent;
  let fixture: ComponentFixture<UserActivePlaylistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserActivePlaylistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserActivePlaylistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
