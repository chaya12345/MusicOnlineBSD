import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LatestClipsComponent } from './latest-clips.component';

describe('LatestClipsComponent', () => {
  let component: LatestClipsComponent;
  let fixture: ComponentFixture<LatestClipsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LatestClipsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LatestClipsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
