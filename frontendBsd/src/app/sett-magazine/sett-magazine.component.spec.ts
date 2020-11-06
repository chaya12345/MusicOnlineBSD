import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SettMagazineComponent } from './sett-magazine.component';

describe('SettMagazineComponent', () => {
  let component: SettMagazineComponent;
  let fixture: ComponentFixture<SettMagazineComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SettMagazineComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SettMagazineComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
