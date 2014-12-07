# Croissant

Little rails renderer. Renders your pages in ascii.

## Installation

Gemfile

```ruby
gem 'croissant'
```

## Usage

In controller

```ruby
class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.ascii { render ascii: 'ascii_contents' }
    end
  end
end
```

Also you have to have view for this action.

After it is done - go to url of your action and add extension to render ascii
