import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MMagazineComponent } from './m-magazine.component';

describe('MMagazineComponent', () => {
  let component: MMagazineComponent;
  let fixture: ComponentFixture<MMagazineComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MMagazineComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MMagazineComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
