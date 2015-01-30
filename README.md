# Purecss

Pure is a set of small, responsive CSS modules that you can use in every web project realized by the yahoo developer team.
This gem adds Pure CSS 0.5.0 to the Assets Pipeline of Rails 3.2.

Additionally it provides
- a jQuery function that automatically enables the dropdown menu without the need of additional rails packages/frameworks (YUI or others).
- a small optional set of css for right-aligned horizontal menus, CSS carets (font-independent), vertical separators, alerts, ...

I cite directly from [purecss.io](http://purecss.io)
 > CSS with a minimal footprint.
 >
 > Pure is ridiculously tiny. The entire set of modules clocks in at 5.7KB minified and gzipped, without forgoing responsive styles, design, or ease of use. Crafted with mobile devices in mind, it was important to us to keep our file sizes small, and every line of CSS was carefully considered. If you decide to only use a subset of these modules, you'll save even more bytes.

Note: [will_paginate](https://github.com/mislav/will_paginate) is integrated with purecss pagination style using the [purecss-will_paginate](https://github.com/mseri/rails-purecss-will_paginate) gem.

[![Build Status](https://travis-ci.org/mseri/rails-purecss.png?branch=master)](https://travis-ci.org/mseri/rails-purecss)


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

    *= require purecss/<module>



If it is too long for you, you can avoid touching the manifest files and run the generator (with optional parameter responsive/nonresponsive):

    $ rails generate purecss:install

To add the viewport meta in the head of your application.html.erb it is enough to append `--add_viewport_meta` when you run the generator.

## Usage

After the installation you can simply go to [purecss.io](http://purecss.io) and use their styles.

### Custom CSS

Add to your css manifest file, under the ```require purecss``` line:

    *= require purecss-addons

It provides the CSS classes 

- ```pure-custom-caret``` for the dropdown menu (to use if you are not using FontAwsome)
- (no more needed) ```pure-menu-custom-separator-vertical``` to add a vertical separator to the horizontal menu
- ```pure-custom-close``` for nicer ```x``` to close eventual modal views (to display modals, bootstrap-modal works quite well with Pure)
- ```pure-custom-alert```, ```pure-custom-alert-error```, ```pure-custo-alert-success```, ```pure-custom-alert-warning```
- ```pure-menu-pull-right``` to align the menu to the right (must be in the same tag of ```pure-menu```, see [this example](http://jsfiddle.net/xUwCw/)). Thanks to [msweeney](https://github.com/msweeney) for this workaround.

<!--
  The flag *EXPERIMENTAL* means that the functionality is not fully functional, you can try it and use it but its syntax/use could change in a next release. If you have a fix please add a pull request! 
  /-->

### Dropdown Menu

For dropdown menu I developed a small workaround based on [bootstrap-dropdown.js](https://github.com/twitter/bootstrap/blob/master/js/bootstrap-dropdown.js).
It is enough to add the following directive to your js manifest file (application.js):

    //= require purecss-dropdown

and then use the class ```pure-menu-has-children``` for the ```li``` that will contain the submenu, 
add ```data-toggle="dropdown"``` to its label element (tipically an anchor), 
and use the class ```pure-menu-children``` for the ```ul``` that contains the submenu.

I hope it becomes clear with the following example:
```
<header class="header pure-u-1"> 
  <div class="pure-menu pure-menu-open pure-menu-fixed pure-menu-horizontal">
      <div class="pure-menu-heading"><%= link_to "sample app", root_path, id: "logo" %></div>
        <ul>
          <li><%= link_to "Home", root_path %></li>
          <li><%= link_to "Help", help_path %></li>
          <% if signed_in? %>
            <li><%= link_to "Users", users_path %></li>
            <li class="pure-menu-can-have-children pure-menu-has-children">
              <a href="#" data-toggle="dropdown">Account <span class="pure-custom-caret"></span></a>
              <ul class="pure-menu-children">
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

My dropdown menu code do not support dropdown submenus, for that you can use YUI as in purecss.io example, or pull me a workaround :)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
