import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FooterSongComponent } from './footer-song.component';

describe('FooterSongComponent', () => {
  let component: FooterSongComponent;
  let fixture: ComponentFixture<FooterSongComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FooterSongComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FooterSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
