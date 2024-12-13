import { Component } from '@angular/core';
import { TopbarWithLogoComponent } from '../../../shared/components/topbar-with-logo/topbar-with-logo.component';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatToolbarModule } from '@angular/material/toolbar';
import {MatMenuModule} from '@angular/material/menu';
import { TopbarWithLogoAndSearchBarComponent } from "../../../shared/components/topbar-with-logo-and-search-bar/topbar-with-logo-and-search-bar.component";

@Component({
  selector: 'app-user.dashboard.page',
  imports: [MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule, MatMenuModule, TopbarWithLogoAndSearchBarComponent],
  templateUrl: './user.dashboard.page.component.html',
  styleUrl: './user.dashboard.page.component.css'
})
export class UserDashboardPageComponent {

}
