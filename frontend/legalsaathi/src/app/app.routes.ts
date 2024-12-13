import { Routes } from '@angular/router';
import { LoginPageComponent } from './features/components/login.page/login.page.component';
import { SignupPageComponent } from './features/components/signup.page/signup.page.component';
import { UserDashboardPageComponent } from './features/components/user.dashboard.page/user.dashboard.page.component';
import { LawyerDashboardPageComponent } from './features/components/lawyer.dashboard.page/lawyer.dashboard.page.component';
import { ForumPageComponent } from './features/components/forum-page/forum-page.component';
import { ProfilePageComponent } from './features/components/profile.page/profile.page.component';

export const routes: Routes = [
    {path: "login", component: LoginPageComponent},
    {path: "signup", component: SignupPageComponent},
    {path: "user-dashboard", component: UserDashboardPageComponent},
    {path: "lawyer-dashboard", component:LawyerDashboardPageComponent},
    {path: "forum-page", component:ForumPageComponent},
    {path: "profile-page", component:ProfilePageComponent},
    {path:"", redirectTo:"/login", pathMatch:"full"},
];
