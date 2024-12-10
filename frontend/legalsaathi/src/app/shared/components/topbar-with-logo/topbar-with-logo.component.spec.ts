import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TopbarWithLogoComponent } from './topbar-with-logo.component';

describe('TopbarWithLogoComponent', () => {
  let component: TopbarWithLogoComponent;
  let fixture: ComponentFixture<TopbarWithLogoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TopbarWithLogoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TopbarWithLogoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
