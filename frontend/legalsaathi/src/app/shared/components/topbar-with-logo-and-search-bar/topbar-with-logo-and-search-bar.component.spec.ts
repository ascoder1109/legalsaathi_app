import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TopbarWithLogoAndSearchBarComponent } from './topbar-with-logo-and-search-bar.component';

describe('TopbarWithLogoAndSearchBarComponent', () => {
  let component: TopbarWithLogoAndSearchBarComponent;
  let fixture: ComponentFixture<TopbarWithLogoAndSearchBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TopbarWithLogoAndSearchBarComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TopbarWithLogoAndSearchBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
