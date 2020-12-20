import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingSingerComponent } from './adding-singer.component';

describe('AddingSingerComponent', () => {
  let component: AddingSingerComponent;
  let fixture: ComponentFixture<AddingSingerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingSingerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingSingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
