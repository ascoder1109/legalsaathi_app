import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { TopbarWithLogoAndSearchBarComponent } from "../../../shared/components/topbar-with-logo-and-search-bar/topbar-with-logo-and-search-bar.component";

@Component({
  selector: 'app-profile-page',
  standalone: true,
  imports: [
    MatCardModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    TopbarWithLogoAndSearchBarComponent
  ],
  templateUrl: './profile.page.component.html',
  styleUrls: ['./profile.page.component.css'],
})
export class ProfilePageComponent {}
