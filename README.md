# Phoenix 1.3 with Bootstrap 4 and Font Awesome 4.7

This is an example of using Phoenix with Bootstrap.  One of the example Bootstrap templates is being used.  The main changes to the default install is in /assets/package.json, /assets/brunch-config.js, and /assets/css/* (namely that app.css was renamed to app.scss and some custom css was imported).

To start Phoenix:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## To Install Bootstrap 4 and Font Awesome:

1. Remove the existing Bootstrap 
```
$ rm assets/css/phoenix.css
```
2. Install Bootstrap 4 and Font Awesome
```
$ cd assets
$ npm install --save bootstrap@4.0.0 font-awesome jquery
```
3. Install Sass-Brunch & Copycat-Brunch
```
$ npm install --save-dev sass-brunch copycat-brunch
```
4. Add sass-brunch, font-awesome, and copycat config to assets/brunch-config.js
```
// Configure your plugins
plugins: {
  babel: {
    // Do not use ES6 compiler in vendor code
    ignore: [/vendor/]
  },
  copycat: {
    "fonts": ["node_modules/font-awesome/fonts"]
  },
  sass: {
    options: {
      includePaths: ["node_modules/bootstrap/scss", "node_modules/font-awesome/scss"], // for sass-brunch to @import files
      precision: 8 // minimum precision required by bootstrap
    }
  }
},
```
And the scss folder to the watch path.
```
paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "scss", "js", "vendor"],
    ...
  },
...
```
And finally, add Bootstrap and JQuery to the NPM section:
```
npm: {
    enabled: true,
    globals: {
      // Bootstrap JavaScript requires both '$', 'jQuery'
      $: 'jquery',
      jQuery: 'jquery',
      bootstrap: 'bootstrap' // require Bootstrap JavaScript globally too
    }
  }
```
5. Rename app.css to app.scss
```
$ cd assets/css; mv app.css app.scss
```
6. Import Font Awesome and Bootstrap in app.scss
```
/* This file is for your main application css. */

$fa-font-path: "../fonts";
@import "font-awesome";
@import "bootstrap";
```
7. Make sure your template is up to date with Bootstrap 4 classes.

