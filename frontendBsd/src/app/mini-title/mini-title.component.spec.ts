import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MiniTitleComponent } from './mini-title.component';

describe('MiniTitleComponent', () => {
  let component: MiniTitleComponent;
  let fixture: ComponentFixture<MiniTitleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MiniTitleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MiniTitleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
