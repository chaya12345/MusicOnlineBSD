import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FilteredSongsComponent } from './filtered-songs.component';

describe('FilteredSongsComponent', () => {
  let component: FilteredSongsComponent;
  let fixture: ComponentFixture<FilteredSongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FilteredSongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FilteredSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
