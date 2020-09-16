import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LatestCommitsComponent } from './latest-commits.component';

describe('LatestCommitsComponent', () => {
  let component: LatestCommitsComponent;
  let fixture: ComponentFixture<LatestCommitsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LatestCommitsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LatestCommitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
