import { Component } from '@angular/core';
import { TopbarWithLogoComponent } from "../../../shared/components/topbar-with-logo/topbar-with-logo.component";
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatToolbarModule } from '@angular/material/toolbar';

@Component({
  selector: 'app-signup.page',
  imports: [TopbarWithLogoComponent,MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule],
  templateUrl: './signup.page.component.html',
  styleUrl: './signup.page.component.css'
})
export class SignupPageComponent {

}
