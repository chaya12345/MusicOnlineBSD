import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchSpesificSongComponent } from './search-spesific-song.component';

describe('SearchSpesificSongComponent', () => {
  let component: SearchSpesificSongComponent;
  let fixture: ComponentFixture<SearchSpesificSongComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SearchSpesificSongComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchSpesificSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
