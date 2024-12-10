import { Routes } from '@angular/router';
import { LoginPageComponent } from './features/components/login.page/login.page.component';
import { SignupPageComponent } from './features/components/signup.page/signup.page.component';
import { UserDashboardPageComponent } from './features/components/user.dashboard.page/user.dashboard.page.component';
import { LawyerDashboardPageComponent } from './features/components/lawyer.dashboard.page/lawyer.dashboard.page.component';

export const routes: Routes = [
    {path: "login", component: LoginPageComponent},
    {path: "signup", component: SignupPageComponent},
    {path: "user-dashboard", component: UserDashboardPageComponent},
    {path: "lawyer-dashboard", component:LawyerDashboardPageComponent},
    {path:"", redirectTo:"/user-dashboard", pathMatch:"full"},
];
