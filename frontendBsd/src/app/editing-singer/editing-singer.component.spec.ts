import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingSingerComponent } from './editing-singer.component';

describe('EditingSingerComponent', () => {
  let component: EditingSingerComponent;
  let fixture: ComponentFixture<EditingSingerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingSingerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingSingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
