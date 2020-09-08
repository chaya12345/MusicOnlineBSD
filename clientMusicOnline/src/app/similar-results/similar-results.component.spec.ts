import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SimilarResultsComponent } from './similar-results.component';

describe('SimilarResultsComponent', () => {
  let component: SimilarResultsComponent;
  let fixture: ComponentFixture<SimilarResultsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SimilarResultsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SimilarResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
