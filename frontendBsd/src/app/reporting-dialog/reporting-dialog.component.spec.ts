import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportingDialogComponent } from './reporting-dialog.component';

describe('ReportingDialogComponent', () => {
  let component: ReportingDialogComponent;
  let fixture: ComponentFixture<ReportingDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReportingDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportingDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
