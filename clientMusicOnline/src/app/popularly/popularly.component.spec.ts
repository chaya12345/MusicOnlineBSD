import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { popularlyComponent } from './popularly.component';

describe('popularlyComponent', () => {
  let component: popularlyComponent;
  let fixture: ComponentFixture<popularlyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ popularlyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(popularlyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
