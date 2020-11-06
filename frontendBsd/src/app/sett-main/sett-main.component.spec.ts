import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SettMainComponent } from './sett-main.component';

describe('SettMainComponent', () => {
  let component: SettMainComponent;
  let fixture: ComponentFixture<SettMainComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SettMainComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SettMainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
