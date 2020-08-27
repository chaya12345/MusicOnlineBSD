import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MiniSearchingComponent } from './mini-searching.component';

describe('MiniSearchingComponent', () => {
  let component: MiniSearchingComponent;
  let fixture: ComponentFixture<MiniSearchingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MiniSearchingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MiniSearchingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
