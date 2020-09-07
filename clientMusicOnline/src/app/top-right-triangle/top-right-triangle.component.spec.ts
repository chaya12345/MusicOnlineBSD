import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopRightTriangleComponent } from './top-right-triangle.component';

describe('TopRightTriangleComponent', () => {
  let component: TopRightTriangleComponent;
  let fixture: ComponentFixture<TopRightTriangleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopRightTriangleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopRightTriangleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
