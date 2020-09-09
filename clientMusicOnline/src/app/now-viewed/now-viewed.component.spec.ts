import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NowViewedComponent } from './now-viewed.component';

describe('NowViewedComponent', () => {
  let component: NowViewedComponent;
  let fixture: ComponentFixture<NowViewedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NowViewedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NowViewedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
