import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingASingerComponent } from './adding-a-singer.component';

describe('AddingASingerComponent', () => {
  let component: AddingASingerComponent;
  let fixture: ComponentFixture<AddingASingerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingASingerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingASingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
