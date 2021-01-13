import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingATagComponent } from './adding-a-tag.component';

describe('AddingATagComponent', () => {
  let component: AddingATagComponent;
  let fixture: ComponentFixture<AddingATagComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingATagComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingATagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
