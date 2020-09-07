import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrationToWebsiteComponent } from './registration-to-website.component';

describe('RegistrationToWebsiteComponent', () => {
  let component: RegistrationToWebsiteComponent;
  let fixture: ComponentFixture<RegistrationToWebsiteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistrationToWebsiteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrationToWebsiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
