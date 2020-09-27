import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResponseAddingComponent } from './response-adding.component';

describe('ResponseAddingComponent', () => {
  let component: ResponseAddingComponent;
  let fixture: ComponentFixture<ResponseAddingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResponseAddingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResponseAddingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
