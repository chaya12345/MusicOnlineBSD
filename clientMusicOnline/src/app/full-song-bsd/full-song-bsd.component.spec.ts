import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FullSongBsdComponent } from './full-song-bsd.component';

describe('FullSongBsdComponent', () => {
  let component: FullSongBsdComponent;
  let fixture: ComponentFixture<FullSongBsdComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FullSongBsdComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FullSongBsdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
