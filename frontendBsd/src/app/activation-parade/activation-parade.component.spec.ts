import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActivationParadeComponent } from './activation-parade.component';

describe('ActivationParadeComponent', () => {
  let component: ActivationParadeComponent;
  let fixture: ComponentFixture<ActivationParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ActivationParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ActivationParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
