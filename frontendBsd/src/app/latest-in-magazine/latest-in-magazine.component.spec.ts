import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LatestInMagazineComponent } from './latest-in-magazine.component';

describe('LatestInMagazineComponent', () => {
  let component: LatestInMagazineComponent;
  let fixture: ComponentFixture<LatestInMagazineComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LatestInMagazineComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LatestInMagazineComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
