import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageSingerComponent } from './manage-singer.component';

describe('ManageSingerComponent', () => {
  let component: ManageSingerComponent;
  let fixture: ComponentFixture<ManageSingerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageSingerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageSingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
