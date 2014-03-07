# V(irtual)attributes

Makes virtual attributes easier.

[![Build Status](https://travis-ci.org/mjacobus/vattributes.png?branch=master)](https://travis-ci.org/mjacobus/vattributes)
[![Coverage Status](https://coveralls.io/repos/mjacobus/vattributes/badge.png)](https://coveralls.io/r/mjacobus/vattributes)
[![Code Climate](https://codeclimate.com/github/mjacobus/vattributes.png)](https://codeclimate.com/github/mjacobus/vattributes)
[![Dependency Status](https://gemnasium.com/mjacobus/vattributes.png)](https://gemnasium.com/mjacobus/vattributes)
[![Gem Version](https://badge.fury.io/rb/vattributes.png)](http://badge.fury.io/rb/vattributes)

## Instalation

Add this line to your application's Gemfile:

```ruby
gem 'vattributes'
```

And then execute:

```bash
$ bundle
```

## Usage

Add the vattributes field to the table as a text and run the migration:

```bash
rails g migration AddVattributesToPosts vattributes:text
rake db:migrate
```

```ruby
class Post < ActiveRecord::Base
  vattributes :permalink

  validates :permalink, presence: true
end
```

If you ever need to overrite a setter, or getter, you can do like follows:

```
class Post < ActiveRecord::Base
  vattributes :tags, :permalink

  def tags=(array)
    set_vattribute(:tags, array.join(','))
  end

  def tags
    get_vattribute(:tags).split(',')
  end
end
```

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

** Do not forget to write tests**
