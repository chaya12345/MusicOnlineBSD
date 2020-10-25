import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SiPopularSongsComponent } from './si-popular-songs.component';

describe('SiPopularSongsComponent', () => {
  let component: SiPopularSongsComponent;
  let fixture: ComponentFixture<SiPopularSongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SiPopularSongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SiPopularSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
