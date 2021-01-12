import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingSingerComponent } from './deleting-singer.component';

describe('DeletingSingerComponent', () => {
  let component: DeletingSingerComponent;
  let fixture: ComponentFixture<DeletingSingerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingSingerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingSingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
