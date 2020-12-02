import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FCommitsComponent } from './f-commits.component';

describe('FCommitsComponent', () => {
  let component: FCommitsComponent;
  let fixture: ComponentFixture<FCommitsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FCommitsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FCommitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
