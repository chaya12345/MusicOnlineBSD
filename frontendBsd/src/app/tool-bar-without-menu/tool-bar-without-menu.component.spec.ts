import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToolBarWithoutMenuComponent } from './tool-bar-without-menu.component';

describe('ToolBarWithoutMenuComponent', () => {
  let component: ToolBarWithoutMenuComponent;
  let fixture: ComponentFixture<ToolBarWithoutMenuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToolBarWithoutMenuComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ToolBarWithoutMenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
