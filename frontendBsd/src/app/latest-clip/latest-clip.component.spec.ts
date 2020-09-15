import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LatestClipComponent } from './latest-clip.component';

describe('LatestClipComponent', () => {
  let component: LatestClipComponent;
  let fixture: ComponentFixture<LatestClipComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LatestClipComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LatestClipComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
