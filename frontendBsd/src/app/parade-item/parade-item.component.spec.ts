import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeItemComponent } from './parade-item.component';

describe('ParadeItemComponent', () => {
  let component: ParadeItemComponent;
  let fixture: ComponentFixture<ParadeItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeItemComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
