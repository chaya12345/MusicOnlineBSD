import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MParadeComponent } from './m-parade.component';

describe('MParadeComponent', () => {
  let component: MParadeComponent;
  let fixture: ComponentFixture<MParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
