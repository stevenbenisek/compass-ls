# compass-ls

A [Compass](http://compass-style.org/) plugin for listing the content of a 
directory.

## Installation

```bash
gem install compass-ls
```

To load the plugin, simply require it at the top of your configuration file:

```ruby
require 'compass-ls'
```

Next, import the `_compass-ls.scss` partial into your stylesheets:

```sass
@import 'compass-ls';
```

## Function

```sass
@function x-ls($files, $suffix: true) { 
    @return ...
}
```

### Parameters

#### $files

Type: `String`

The file or glob pattern to match against.

#### $suffix

Type: `Boolean`  
Default: `true`

Lets you specify whether or not the file extension should be omitted from the 
returning list items.

### Return

Type: `List`

A comma separated list of file/folder names matching the file pattern.

## Example usage

Given the following folder structure:

```
.
├── src
│   ├── img
│   │   ├── edit.svg
│   │   ├── forward.png
│   │   ├── minus.svg
│   │   ├── move.png
│   │   └── plus.svg
│   └── scss
└── config.rb
```

### Example 1: default, sans extension

```sass
$icons: x-ls('src/img/*');
$png-icons: x-ls('src/img/*.png');
$svg-icons: x-ls('src/img/*.svg');

@debug($icons); // edit, forward, minus, move, plus
@debug($png-icons); // forward, move
@debug($svg-icons); // edit, minus, plus
```

### Example 2: with extension

```sass
$icons: x-ls('src/img/*', false);
$png-icons: x-ls('src/img/*.png', false);
$svg-icons: x-ls('src/img/*.svg', false);

@debug($icons); // edit.svg, forward.png, minus.svg, move.png, plus.svg
@debug($png-icons); // forward.png, move.png
@debug($svg-icons); // edit.svg, minus.svg, plus.svg
```

### Example 3: single file

```sass
$icon: x-ls('src/img/edit.svg');

@debug($icon); // edit
```

### Example 4: inline svg data-uri

```sass
$icons: x-ls('src/img/*.svg', false);

@each $icon in $icons {
    $icon-name: x-ls('src/img/#{$icon}');
    .#{$icon-name} {
        background-image: inline-image('#{$icon}');
    }
}
```

### Example 5: using the compass-config plugin

Instead of hardcoding the images path we can use
[compass-config](https://github.com/stevenbenisek/compass-config) to fetch the 
`images_path` property from the [Compass configuration](http://compass-style.org/help/tutorials/configuration-reference/#configuration-properties).

```sass
$images-path: x-config('images_path');
$icons: x-ls('#{$images-path}/*');

@debug($icons); // edit, forward, minus, move, plus
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
