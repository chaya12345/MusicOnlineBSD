import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SmallSlogenComponent } from './small-slogen.component';

describe('SmallSlogenComponent', () => {
  let component: SmallSlogenComponent;
  let fixture: ComponentFixture<SmallSlogenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SmallSlogenComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SmallSlogenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
