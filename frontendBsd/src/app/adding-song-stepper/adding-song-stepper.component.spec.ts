import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingSongStepperComponent } from './adding-song-stepper.component';

describe('AddingSongStepperComponent', () => {
  let component: AddingSongStepperComponent;
  let fixture: ComponentFixture<AddingSongStepperComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingSongStepperComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingSongStepperComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
