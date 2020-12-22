import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchingAreaComponent } from './searching-area.component';

describe('SearchingAreaComponent', () => {
  let component: SearchingAreaComponent;
  let fixture: ComponentFixture<SearchingAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SearchingAreaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchingAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
