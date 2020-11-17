import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeHeaderComponent } from './parade-header.component';

describe('ParadeHeaderComponent', () => {
  let component: ParadeHeaderComponent;
  let fixture: ComponentFixture<ParadeHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeHeaderComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
