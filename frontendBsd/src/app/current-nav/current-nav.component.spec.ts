import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CurrentNavComponent } from './current-nav.component';

describe('CurrentNavComponent', () => {
  let component: CurrentNavComponent;
  let fixture: ComponentFixture<CurrentNavComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CurrentNavComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CurrentNavComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
