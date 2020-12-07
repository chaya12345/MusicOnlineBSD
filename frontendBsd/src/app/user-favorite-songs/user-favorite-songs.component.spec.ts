import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserFavoriteSongsComponent } from './user-favorite-songs.component';

describe('UserFavoriteSongsComponent', () => {
  let component: UserFavoriteSongsComponent;
  let fixture: ComponentFixture<UserFavoriteSongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserFavoriteSongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserFavoriteSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
