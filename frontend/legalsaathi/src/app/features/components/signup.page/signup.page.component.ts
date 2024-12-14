import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatToolbarModule } from '@angular/material/toolbar';
import { AuthService } from '../../../core/services/auth/service/auth.service';
import { TopbarWithLogoComponent } from '../../../shared/components/topbar-with-logo/topbar-with-logo.component';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-signup.page',
  imports: [FormsModule,TopbarWithLogoComponent, MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule],
  templateUrl: './signup.page.component.html',
  styleUrls: ['./signup.page.component.css']
})
export class SignupPageComponent {
  

  constructor(
    private authService: AuthService, 
    private router: Router,
    private snackBar: MatSnackBar
  ) {}

  onSubmit(form: any) {
    const { name, email, phoneNumber, password } = form.value;

    this.authService.registerUser({ name, email, phoneNumber, password }).subscribe({
      next: (response) => {
        
        if (response.status === 'success') {
        
          this.snackBar.open('Registration Successful', 'Close', {
            duration: 3000, 
          });

          this.router.navigate(['/login']);
        }
      },
      error: (err) => {
        console.error(err);
        this.snackBar.open('Registration Failed', 'Close', {
          duration: 3000,
        });
      }
    });
  }
  goToLogin() {
    this.router.navigate(['/login']);
  }
}
