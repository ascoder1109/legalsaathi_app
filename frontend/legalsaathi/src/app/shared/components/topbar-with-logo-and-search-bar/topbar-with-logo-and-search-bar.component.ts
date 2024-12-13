import { Component } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-topbar-with-logo-and-search-bar',
  standalone: true,
  imports: [MatToolbarModule, MatMenuModule, MatButtonModule, MatIconModule],
  templateUrl: './topbar-with-logo-and-search-bar.component.html',
  styleUrls: ['./topbar-with-logo-and-search-bar.component.css'],
})
export class TopbarWithLogoAndSearchBarComponent {}
