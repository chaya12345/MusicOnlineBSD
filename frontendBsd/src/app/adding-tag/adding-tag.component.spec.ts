import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingTagComponent } from './adding-tag.component';

describe('AddingTagComponent', () => {
  let component: AddingTagComponent;
  let fixture: ComponentFixture<AddingTagComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingTagComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingTagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
