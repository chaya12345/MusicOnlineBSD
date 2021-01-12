import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingArtistComponent } from './editing-artist.component';

describe('EditingArtistComponent', () => {
  let component: EditingArtistComponent;
  let fixture: ComponentFixture<EditingArtistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingArtistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingArtistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
