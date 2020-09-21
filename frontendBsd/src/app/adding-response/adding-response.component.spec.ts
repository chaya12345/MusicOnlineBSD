import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingResponseComponent } from './adding-response.component';

describe('AddingResponseComponent', () => {
  let component: AddingResponseComponent;
  let fixture: ComponentFixture<AddingResponseComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddingResponseComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingResponseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
