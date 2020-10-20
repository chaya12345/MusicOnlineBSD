import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GenericAreaComponent } from './generic-area.component';

describe('GenericAreaComponent', () => {
  let component: GenericAreaComponent;
  let fixture: ComponentFixture<GenericAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GenericAreaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GenericAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
