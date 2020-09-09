import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PopularSingersComponent } from './popular-singers.component';

describe('PopularSingersComponent', () => {
  let component: PopularSingersComponent;
  let fixture: ComponentFixture<PopularSingersComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PopularSingersComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PopularSingersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
