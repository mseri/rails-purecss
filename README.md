# Purecss

Pure (purecss.io) is a set of small, responsive CSS modules that you can use in every web project realized by the yahoo developer team.
This gem adds it to the Assets Pipeline of Rails 3.2.

I cite directly from [purecss.io](http://purecss.io)
 > CSS with a minimal footprint.
 >
 > Pure is ridiculously tiny. The entire set of modules clocks in at 5.7KB minified and gzipped, without forgoing responsive styles, design, or ease of use. Crafted with mobile devices in mind, it was important to us to keep our file sizes small, and every line of CSS was carefully considered. If you decide to only use a subset of these modules, you'll save even more bytes.


## Installation

Add this line to your application's Gemfile:

    gem 'purecss'

And then execute:

    $ bundle


Then you can add the following directives to your css manifest file (application.css):

    *= require purecss

for the responsive bundle, or

    *= require purecss-nr

for the non-responsive one.


If you want to include just an individual module (see [purecss.io](http://purecss.io)) add instead

    *= require purecss/<module>.js



If it is too long for you, you can avoid touching the manifest files and run the generator (with optional parameter responsive/nonresponsive):

    $ rails generate purecss:install


## Usage

After the installation you can simply go to [purecss.io](http://purecss.io) and use (or extend) their predefined styles.

Enjoy!

### Dropdown Menu

For dropdown menu I developed a small workaround based on [bootstrap-dropdown.js](https://github.com/twitter/bootstrap/blob/master/js/bootstrap-dropdown.js).
It is enough to add the following directive to your js manifest file (application.js):

    //= require purecss-dropdown

and then use the class ```pure-menu-has-children``` for the ```li``` that will contain the submenu, 
add ```data-toggle="dropdown"``` to its label element (tipically an anchor), 
and use the class ```pure-menu-children``` for the ```ul``` that contains the submenu.

I hope it is clear with the following example:
```
<header class="header pure-u-1"> 
  <div class="pure-menu pure-menu-open pure-menu-fixed pure-menu-horizontal">
        <ul>
          <li><%= link_to "Home", root_path %></li>
          <li><%= link_to "Help", help_path %></li>
          <% if signed_in? %>
            <li><%= link_to "Users", users_path %></li>
            <li class="puren-menu-has-children">
              <a href="#" data-toggle="dropdown">Account</a>
              <ul class="pure-menu-children" role="menu">
                <li><%= link_to "Profile", current_user %></li>
                <li><%= link_to "Settings", edit_user_path(current_user) %></li>
                <li class="pure-menu-separator"></li>
                <li>
                  <%= link_to "Sign Out", signout_path, method: "delete" %>
                </li>
              </ul>
            </li>
          <% else %>
            <li><%= link_to "Sign In", signin_path %></li>
          <% end %>
        </ul>
      </div>
</header>
```

## TODO

I liked the idea of the light and functional Pure CSS and I think it is worthwile to create a gem for it.

I'd like to add
- Helpers for navigation bars, menus, forms, grids, ...
- Integration wit Rails SCSS
- Toolkit to set up website palette in an easy way using SCSS
- Way to keep the css updated
- Any other ideas?


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changelog
- 0.0.3 Added Dropdown script on top of jQuery, corrected README
- 0.0.2 Gem restructured following [Gemify Assets for Rails](http://prioritized.net/blog/gemify-assets-for-rails/), added individual modules, improved size

