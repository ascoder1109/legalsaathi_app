import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';

@Component({
  selector: 'app-topbar-with-logo',
  imports: [ CommonModule, MatToolbarModule],
  templateUrl: './topbar-with-logo.component.html',
  styleUrl: './topbar-with-logo.component.css'
})
export class TopbarWithLogoComponent {

}
