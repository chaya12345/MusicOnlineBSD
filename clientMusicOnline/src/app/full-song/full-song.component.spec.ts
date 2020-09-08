import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FullSongComponent } from './full-song.component';

describe('FullSongComponent', () => {
  let component: FullSongComponent;
  let fixture: ComponentFixture<FullSongComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FullSongComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FullSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
