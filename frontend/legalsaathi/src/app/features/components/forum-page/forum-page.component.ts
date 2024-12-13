import { Component } from '@angular/core';
import { TopbarWithLogoAndSearchBarComponent } from "../../../shared/components/topbar-with-logo-and-search-bar/topbar-with-logo-and-search-bar.component";
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-forum-page',
  imports: [TopbarWithLogoAndSearchBarComponent,MatCardModule],
  templateUrl: './forum-page.component.html',
  styleUrl: './forum-page.component.css'
})
export class ForumPageComponent {

}
