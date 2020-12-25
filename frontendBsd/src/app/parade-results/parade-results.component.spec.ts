import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeResultsComponent } from './parade-results.component';

describe('ParadeResultsComponent', () => {
  let component: ParadeResultsComponent;
  let fixture: ComponentFixture<ParadeResultsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeResultsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
