npm update -g npm
npm install -g @angular/cli
npm install          # This is basically the Angular 'init' commit. YOU NEED TO DO THIS TO BUILD!

ng new name-of-file
ng serve             # ng serve must be done one level below project, one above /src/
ng serve --open      # ng serve --opens the browser to http:#localhost:4200
ng generate component new-component 
ng g c compName      # shorthand
ng serve --port 2934 # change the port number from the default 4200
                     # whatever you want to name it. placed below app component. can only be 4 numbers?!?!?

ng build             # or ng b
# basically just a class .ts object placed under /app location
ng generate interface name-Of-Interface 
  /***********************/
 /* Location of Modules */
/***********************/
app.module.ts 
    # this is where components are declared, where the FormsModule is imported,
    # and where you can inject your components into the app for use.

<li *ngFor="let cow of heroes">
    # this will perform an foreach iteration. "hereos" is the object list, "cow" is the object
    # type of the list. In a nutshell, the C# iteration would look like this:
    #
    # List<Cow> HEROES = new List<Cow>{ ... };
    # foreach (Cow cowItem in HEROES){ ...*ngFor here!...}
    # APPARENTLY NOT CASE SENSITIVE!!!

Location of settings.json file
C:\Users\Xen\AppData\Roaming\Code\User

# json server for testing. located above /app/ folder but below /src/ folder
# /src/app/* -- no
# /src/*     -- yes
$ npm install -g json-server
$ json-server --watch db.json

! = the exclamation point is a forcible "cannot be null" operator when it's not used as a NOT operator.
?? = this is basically the proper comparison operator for an inline comparison. 
     instead of doing a !IsNullOrWhiteSpace().Equals() check (meaning we're not doing a OR "truthy/falsy" check), 
     you can just use this). The issue arises when you do something like this:

     let x = object.ObjectParam1 || 1;
     --Here, if object.ObjectParam1 is 0, even if that is a perfectly valid value, it will change it to 1. This is because the (&&; and) and (||; or) operators work on "truthiness" and not on !IsNullOrWhiteSpace().Equals() comparisons.
    
     let x = object.ObjectBoolAsFalse || true;
     --Another easy one, if object.ObjectBoolAsFalse is "false", it will change it to true, because based on a "truthiness" comparison, it selects the other option as the first one is false.
    
     In a nutshell, it's a "if the item is null/undefined, give me the default value"    


/**************/
/*Other Notes*/
/************/

# multiple components in one file
import {Component} from '@angular/core';

@Component({
  selector: 'app-user',
  template: `
    Username: {{ username }}
  `,
  standalone: true,
})
export class UserComponent {
  username = 'youngTech';
}

@Component({
  selector: 'app-root',
  template: ``,
  standalone: true,
  imports: [],
})
export class AppComponent {}

# @if @else 
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    @if (isServerRunning) {
    <span>Yes, the server is running</span>
    } @else {
    <span>No, the server is not running</span>
    }
  `,
  standalone: true,
})
export class AppComponent {
  isServerRunning = false;
}

# @for tag
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    @for(user of users; track user.id) {
    <p>{{ user.name }}</p>
    }
  `,
  standalone: true,
})
export class AppComponent {
  users = [
    { id: 0, name: 'Sarah' },
    { id: 1, name: 'Amy' },
    { id: 2, name: 'Rachel' },
    { id: 3, name: 'Jessica' },
    { id: 4, name: 'Poornima' },
  ];
}

# Property binding
import { Component } from '@angular/core';

# content editable html attribute. means you can type in there
@Component({
  selector: 'app-root',
  styleUrls: ['app.component.css'],
  template: `
    <div [contentEditable]="isEditable">asdf</div>
  `,
  standalone: true,
})
export class AppComponent {
  isEditable = true;
}


# event handling, basically event listener. "()" means it's an event listener
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <section (mouseover)="onMouseOver()">
      There's a secret message for you, hover to reveal:
      {{ message }}
    </section>
  `,
  standalone: true,
})
export class AppComponent {
  message = '';

  onMouseOver() {
    this.message = 'Way to go 🚀';
  }
}

# @Input property
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-user',
  template: `
    <p>The user's name is {{ name }}</p>
  `,
  standalone: true,
})
export class UserComponent {
  @Input() name = '';
}

@Component({
  selector: 'app-root',
  template: `
    <app-user name="Simran" />
  `,
  standalone: true,
  imports: [UserComponent],
})
export class AppComponent { }

# @Output property
import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-child',
  styles: `.btn { padding: 5px; }`,
  template: `
    <button class="btn" (click)="addItem()">Add Item</button>
  `,
  standalone: true,
})
export class ChildComponent {
  @Output() addItemEvent = new EventEmitter<string>();

  addItem() {
    # the "emit" function basically returns the item as an event. the "$event"
    # variable in the AppComponent "addItem" function basically awaits for 
    # whatever the event sends back. This comes from the Output library.
    this.addItemEvent.emit('ff');
  }
}

@Component({
  selector: 'app-root',
  # Note that the addItemEvent variable matches the EventEmitter in the 
  # ChildComponent
  template: `
    <app-child (addItemEvent)="addItem($event)" />
    <p>🐢 all the way down {{ items.length }}</p>
  `,
  standalone: true,
  imports: [ChildComponent],
})
export class AppComponent {
  items = new Array();

  addItem(item: string) {
    this.items.push(item);
  }
}

# Deferrable views
import { Component } from '@angular/core';
@Component({
  selector: 'comments',
  template: `
    <ul>
      <li>Building for the web is fantastic!</li>
      <li>The new template syntax is great</li>
      <li>I agree with the other comments!</li>
    </ul>
  `,
  standalone: true,
})
export class CommentsComponent { }

@Component({
  selector: 'app-root',
  # Deferrable views have a number of trigger options. Add a viewport trigger 
  # so the content will defer load once it enters the viewport.
  template: `
    <div>
      <h1>How I feel about Angular</h1>
      <article>
        <p>
          Basic article data. Do you think this is enough info to let people know about angular?
        </p>
      </article>
      @defer (on viewport) {
      <comments />
      } @placeholder {
      <p>Future comments</p>
      } @loading (minimum 2s) {
      <p>Loading comments...</p>
      } @error (){
        <p>Issue with command</p>
      }
    </div>
  `,
  standalone: true,
  imports: [CommentsComponent],
})
export class AppComponent { }

# Router/Routing
import { Component } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';

@Component({
  selector: 'app-root',
  template: `
    <nav>
      <a routerLink="/">Home</a>
      |
      <a routerLink="/user">User</a>
    </nav>
    <router-outlet />
  `,
  standalone: true,
  imports: [RouterOutlet, RouterLink],
})
export class AppComponent { }

# Reaction forms
import { Component } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  template: `
    <form [formGroup]="profileForm" (ngSubmit)="handleSubmit()">
      <input type="text" formControlName="name" />
      <input type="email" formControlName="email" />
      <button type="submit">Submit</button>
    </form>

    <h2>Profile Form</h2>
    <p>Name: {{ profileForm.value.name }}</p>
    <p>Email: {{ profileForm.value.email }}</p>
  `,
  standalone: true,
  imports: [ReactiveFormsModule],
})
export class AppComponent {
  profileForm = new FormGroup({
    name: new FormControl(''),
    email: new FormControl(''),
  });

  handleSubmit() {
    alert(this.profileForm.value.name + ' | ' + this.profileForm.value.email);
  }
}

# Validation form
import { Component } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-root',
  template: `
    <form [formGroup]="profileForm">
      <label for="name">name</label>
      <input type="text" formControlName="name" name="name" />
      <label for="password">password</label>
      <input type="email" formControlName="email" name="password" />
      <button type="submit" [disabled]="!profileForm.valid">Submit</button>
    </form>
  `,
  standalone: true,
  imports: [ReactiveFormsModule],
})
export class AppComponent {
  profileForm = new FormGroup({
    name: new FormControl('', Validators.required),
    email: new FormControl('', Validators.required),
  });
}

# Dependecy Injection
import { Component, inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CarService {
  cars = ['Sunflower GT', 'Flexus Sport', 'Sprout Mach One', "Ferrari"];

  getCars(): string[] {
    return this.cars;
  }

  getCar(id: number) {
    return this.cars[id];
  }
}

@Component({
  selector: 'app-root',
  template: '<p> {{ carService.getCars() }} </p>',
  standalone: true,
})
export class AppComponent {
  carService = inject(CarService);
}

#
# Dependecy Injection with a constructor
#
import { Component, inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CarService {
  cars = ['Sunflower GT', 'Flexus Sport', 'Sprout Mach One', "Ferrari"];

  getCars(): string[] {
    return this.cars;
  }

  getCar(id: number) {
    return this.cars[id];
  }
}

@Component({
  selector: 'app-root',
  template: `
    <p>Car Listing: {{ display }}</p>
  `,
  standalone: true,
})
export class AppComponent {
  display = '';

  constructor(private carService: CarService) {
    this.display = this.carService.getCars().join(' ⭐️ ');
  }
}

# Pipes
import { Component } from '@angular/core';{
  # The path in the URL that triggers this route.
  # Example: "/example" will activate this route.
  path: 'example',

  # The component to render when this route is activated.
  # Example: This will display ExampleComponent for "/example".
  component: ExampleComponent,

  # Custom static data available for this route.
  # You can access this data in your component via ActivatedRoute.
  data: {
    requiresLogin: true,
    customMessage: 'Welcome to the Example Page!'
  },

  # Defines child routes (nested routes).
  # Example: "/example/details" activates ExampleDetailsComponent.
  children: [
    {
      path: 'details',
      component: ExampleDetailsComponent,
      title: 'Details Page'
    }
  ],

  # Guards that determine if the route can be accessed.
  # Example: This route will only activate if AuthGuard returns true.
  canActivate: [AuthGuard],

  # Guards that determine if you can leave the route.
  # Example: SaveChangesGuard will check if changes are unsaved.
  canDeactivate: [SaveChangesGuard],

  # Guards to control lazy loading of the module for this route.
  # Example: AuthGuard will prevent loading if unauthorized.
  canLoad: [AuthGuard],

  # Lazy-load a module when this route is activated.
  # Example: Only loads the module if AuthGuard passes.
  loadChildren: () =>
  import('./example/example.module').then(m => m.ExampleModule),

  # Redirects this route to another path.
  # Example: Redirects "/example" to "/example/details".
  redirectTo: 'details',

  # Determines when guards and resolvers should be re-run.
  # "paramsChange" means they re-run only if the route parameters change.
  runGuardsAndResolvers: 'paramsChange',

  # Resolves data before the route is activated.
  # Example: Fetches data via ExampleResolver and makes it available in the route.
  resolve: {
    exampleData: ExampleResolver
  },

  # Specifies how to match the URL with this path.
  # Example: "full" matches the entire URL exactly, while "prefix" matches just the start.
  pathMatch: 'full',

  # Sets the page title dynamically for the route.
  # Example: "Example Page" will show as the browser tab title.
  title: 'Example Page',

  # Specifies the named outlet this route targets.
  # Example: The route content will load into an outlet named 'sidebar'.
  outlet: 'sidebar',

  # Custom route-matching function for complex path logic.
  # Example: Uses a custom function to decide if this route should match.
  matcher: customMatcherFunction,

  # Defines a URL fragment to navigate to.
  # Example: Appends "#details" to the URL for navigation.
  fragment: 'details'
}

import { LowerCasePipe } from '@angular/common';

@Component({
  selector: 'app-root',
  template: `
    {{ username | lowercase }}
  `,
  standalone: true,
  imports: [LowerCasePipe],
})
export class AppComponent {
  username = 'yOunGTECh';
}

# Pipe Data Formatting
import { Component } from '@angular/core';
import { DecimalPipe, DatePipe, CurrencyPipe } from '@angular/common';

@Component({
  selector: 'app-root',
  template: `
    <ul>
      <li>Number with "decimal" {{ num | number : '3.2-2' }}</li>
      <li>Date with "date" {{ birthday | date : 'medium' }}</li>
      <li>Currency with "currency" {{ cost | currency }}</li>
    </ul>
  `,
  standalone: true,
  imports: [DecimalPipe, DatePipe, CurrencyPipe],
})
export class AppComponent {
  num = 103.1234;
  birthday = new Date(2023, 3, 2);
  cost = 4560.34;
}

# Custom Pipes
import { Component } from '@angular/core';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'reverse',
  standalone: true,
})
export class ReversePipe implements PipeTransform {
  transform(value: string): string {
    let reverse = '';

    for (let i = value.length - 1; i >= 0; i--) {
      reverse += value[i];
    }

    return reverse;
  }
}

@Component({
  selector: 'app-root',
  template: `
    Reverse Machine: {{ word | reverse }}
  `,
  standalone: true,
  imports: [ReversePipe],
})
export class AppComponent {
  word = 'You are a champion';
}

# Routes in app.routes.ts file

import { HomeComponent } from './home/home.component';
import { UserComponent } from './user/user.component';

export const routes: Routes = [
    {
        path: '',
        title: 'App Home Page',
        component: HomeComponent,
    },
    {
        path: 'user',
        title: 'App User Page',
        component: UserComponent,
    },
];

# Unit Tests
These are the "".component.spec.ts files. These are what you want to unit test
in the component .ts files.

Run the ng test command to run tests.




{
  # The path in the URL that triggers this route.
  # Example: "/example" will activate this route.
  path: 'example',

  # The component to render when this route is activated.
  # Example: This will display ExampleComponent for "/example".
  component: ExampleComponent,

  # Custom static data available for this route.
  # You can access this data in your component via ActivatedRoute.
  data: {
    requiresLogin: true,
    customMessage: 'Welcome to the Example Page!'
  },

  # Defines child routes (nested routes).
  # Example: "/example/details" activates ExampleDetailsComponent.
  children: [
    {
      path: 'details',
      component: ExampleDetailsComponent,
      title: 'Details Page'
    }
  ],

  # This points at a routed id value
  children: [
    {
      path: ':id',
      component: BlogPostComponent

    }
  ]

  # Guards that determine if the route can be accessed.
  # Example: This route will only activate if AuthGuard returns true.
  canActivate: [AuthGuard],

  # Guards that determine if you can leave the route.
  # Example: SaveChangesGuard will check if changes are unsaved.
  canDeactivate: [SaveChangesGuard],

  # Guards to control lazy loading of the module for this route.
  # Example: AuthGuard will prevent loading if unauthorized.
  canLoad: [AuthGuard],

  # Lazy-load a module when this route is activated.
  # Example: Only loads the module if AuthGuard passes.
  loadChildren: () =>
  import('./example/example.module').then(m => m.ExampleModule),

  # Redirects this route to another path.
  # Example: Redirects "/example" to "/example/details".
  redirectTo: 'details',

  # Determines when guards and resolvers should be re-run.
  # "paramsChange" means they re-run only if the route parameters change.
  runGuardsAndResolvers: 'paramsChange',

  # Resolves data before the route is activated.
  # Example: Fetches data via ExampleResolver and makes it available in the route.
  resolve: {
    exampleData: ExampleResolver
  },

  # Specifies how to match the URL with this path.
  # Example: "full" matches the entire URL exactly, while "prefix" matches just the start.
  pathMatch: 'full',

  # Sets the page title dynamically for the route.
  # Example: "Example Page" will show as the browser tab title.
  title: 'Example Page',

  # Specifies the named outlet this route targets.
  # Example: The route content will load into an outlet named 'sidebar'.
  outlet: 'sidebar',

  # Custom route-matching function for complex path logic.
  # Example: Uses a custom function to decide if this route should match.
  matcher: customMatcherFunction,

  # Defines a URL fragment to navigate to.
  # Example: Appends "#details" to the URL for navigation.
  fragment: 'details'
}
```
