import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewInMusicComponent } from './new-in-music.component';

describe('NewInMusicComponent', () => {
  let component: NewInMusicComponent;
  let fixture: ComponentFixture<NewInMusicComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewInMusicComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewInMusicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
