# Rspec::Ohm

RSpec matchers for [Ohm: Object Hash Mapper](http://ohm.keyvalue.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'rspec-ohm'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-ohm

## Usage

Wire up:

```ruby
RSpec.configure do |config|
  config.include RSpec::Ohm, type: :model
end
```

## Matchers

```ruby
class User < Ohm::Model

end

class Widget < Ohm::Model
  attribute   :name
  index       :name
  unique      :name

  set :users, :User
end

RSpec.describe Widget do
  it do
    expect(subject).to have_attribute(:name)
    expect(subject).to have_attribute(:name).with_index
  end

  it do
    expect(subject).to have_set_of(:users).with_index
    expect(subject).to have_set_of(:users).with_class(User)
  end

  it do
    expect(subject).to have_unique(:name)
  end
end
```

## TODO

1. More matchers!

## Contributing

1. Fork it ( https://github.com/jc00ke/rspec-ohm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
