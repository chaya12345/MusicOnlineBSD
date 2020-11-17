import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParadeLinkComponent } from './parade-link.component';

describe('ParadeLinkComponent', () => {
  let component: ParadeLinkComponent;
  let fixture: ComponentFixture<ParadeLinkComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParadeLinkComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParadeLinkComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
