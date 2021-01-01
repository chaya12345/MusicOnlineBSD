import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RestItemComponent } from './rest-item.component';

describe('RestItemComponent', () => {
  let component: RestItemComponent;
  let fixture: ComponentFixture<RestItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RestItemComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RestItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
