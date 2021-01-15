import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingParadeComponent } from './adding-parade.component';

describe('AddingParadeComponent', () => {
  let component: AddingParadeComponent;
  let fixture: ComponentFixture<AddingParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
