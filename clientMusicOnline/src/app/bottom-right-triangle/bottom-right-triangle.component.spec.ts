import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BottomRightTriangleComponent } from './bottom-right-triangle.component';

describe('BottomRightTriangleComponent', () => {
  let component: BottomRightTriangleComponent;
  let fixture: ComponentFixture<BottomRightTriangleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BottomRightTriangleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BottomRightTriangleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
