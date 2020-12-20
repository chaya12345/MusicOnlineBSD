import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingArtistComponent } from './adding-artist.component';

describe('AddingArtistComponent', () => {
  let component: AddingArtistComponent;
  let fixture: ComponentFixture<AddingArtistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingArtistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingArtistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
