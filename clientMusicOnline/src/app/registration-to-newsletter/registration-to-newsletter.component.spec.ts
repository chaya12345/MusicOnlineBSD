import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrationToNewsletterComponent } from './registration-to-newsletter.component';

describe('RegisterationToNewsletterComponent', () => {
  let component: RegistrationToNewsletterComponent;
  let fixture: ComponentFixture<RegistrationToNewsletterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistrationToNewsletterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrationToNewsletterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
