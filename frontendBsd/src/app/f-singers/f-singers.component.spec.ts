import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FSingersComponent } from './f-singers.component';

describe('FSingersComponent', () => {
  let component: FSingersComponent;
  let fixture: ComponentFixture<FSingersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FSingersComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FSingersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
