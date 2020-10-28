import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BrowsePagesComponent } from './browse-pages.component';

describe('BrowsePagesComponent', () => {
  let component: BrowsePagesComponent;
  let fixture: ComponentFixture<BrowsePagesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BrowsePagesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BrowsePagesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
