import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingAArtistComponent } from './adding-a-artist.component';

describe('AddingAArtistComponent', () => {
  let component: AddingAArtistComponent;
  let fixture: ComponentFixture<AddingAArtistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingAArtistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingAArtistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
