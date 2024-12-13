import { Component } from '@angular/core';
import { TopbarWithLogoAndSearchBarComponent } from "../../../shared/components/topbar-with-logo-and-search-bar/topbar-with-logo-and-search-bar.component";
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatToolbarModule } from '@angular/material/toolbar';

@Component({
  selector: 'app-lawyer.dashboard.page',
  imports: [TopbarWithLogoAndSearchBarComponent,MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule, MatMenuModule, TopbarWithLogoAndSearchBarComponent],
  templateUrl: './lawyer.dashboard.page.component.html',
  styleUrl: './lawyer.dashboard.page.component.css'
})
export class LawyerDashboardPageComponent {

}
