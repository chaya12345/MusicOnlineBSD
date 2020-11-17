import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeBodyComponent } from './parade-body.component';

describe('ParadeBodyComponent', () => {
  let component: ParadeBodyComponent;
  let fixture: ComponentFixture<ParadeBodyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeBodyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeBodyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
