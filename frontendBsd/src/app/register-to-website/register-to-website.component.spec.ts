import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegisterToWebsiteComponent } from './register-to-website.component';

describe('RegisterToWebsiteComponent', () => {
  let component: RegisterToWebsiteComponent;
  let fixture: ComponentFixture<RegisterToWebsiteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegisterToWebsiteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegisterToWebsiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
