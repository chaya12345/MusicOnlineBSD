import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SiSimilarResultsComponent } from './si-similar-results.component';

describe('SiSimilarResultsComponent', () => {
  let component: SiSimilarResultsComponent;
  let fixture: ComponentFixture<SiSimilarResultsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SiSimilarResultsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SiSimilarResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
