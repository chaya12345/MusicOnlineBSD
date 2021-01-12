import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingArtistComponent } from './deleting-artist.component';

describe('DeletingArtistComponent', () => {
  let component: DeletingArtistComponent;
  let fixture: ComponentFixture<DeletingArtistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingArtistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingArtistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
