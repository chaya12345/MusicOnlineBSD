import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeComponent } from './parade.component';

describe('ParadeComponent', () => {
  let component: ParadeComponent;
  let fixture: ComponentFixture<ParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
