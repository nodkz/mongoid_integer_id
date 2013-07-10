# MongoidIntegerId

Gives ability to use simple integer ID for Mongoid models (for example, for IDs used in URLs)

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid_integer_id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_integer_id

## Usage

```ruby
class Article
  include Mongoid::Document
  include MongoidIntegerId::Id

  def to_param
    [site_id, name.parameterize].join("-")
  end
end

article = Article.create! name: "Some name", text: "Some text"
article.site_id # => 1
article_path(article) # => "/articles/1-some-name"
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
