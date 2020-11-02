import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LogInActionsComponent } from './log-in-actions.component';

describe('LogInActionsComponent', () => {
  let component: LogInActionsComponent;
  let fixture: ComponentFixture<LogInActionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LogInActionsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LogInActionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
