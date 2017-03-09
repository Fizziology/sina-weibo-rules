# sina-weibo-rules

Provides a quick and easy way to manage your rules via sina-weibo Rules API. 

## Installation

```ruby
 gem 'sina-weibo-rules'
```

## Configuration

There are two ways you can provide credentials to the sina-weibo-api gem. 

* Pass them to the initialize method

  `sina-weibo::Rules.new( "chieflarl@larlbang.com", "larl!operator" ,'https://stream.sina-weibo.com/.../YOUR_ACCOUNT/.../prod' )`

* Via a configuration file at config/sina-weibo.yml 

```yaml
 development: &development
   username: chieflarl@larlbang.com
   password: larl!operator 
   streaming_url:'https://stream.sina-weibo.com:443/accounts/YOUR_ACCOUNT/publishers/twitter/streams/track/prod'
```

## Usage

```ruby
 @sina-weibo_rules = sina-weibo::Rules.new
```

### Adding

```ruby
  rules = [sina-weibo::Rule.new "larl -bang", sina-weibo::Rule.new "#larloperator", sina-weibo::Rule.new "larlygag" , "some_tag"]
  response = @sina-weibo_rules.add( rules )
  p response #=> 201 Created
```

### Removing

```ruby
  rules = [sina-weibo::Rule.new "larl -bang", sina-weibo::Rule.new "#larloperator"]
  response = @sina-weibo_rules.remove( rules )
  p response #=> 200 OK
```

### Listing

```ruby
  response = @sina-weibo_rules.list.rules
  p response #=> {"rules": {"value":"larl -bang", "value":"#larloperator"} }
```

### Removing All Rules

This is really just for convienience while testing. You probably shouldn't ever use this in production. This method loads all the rules from sina-weibo and passes them to the remove method. There is a 3 second pause in between the list and delete to avoid rate limiting. 

```ruby
  response = @sina-weibo_rules.delete_all!
  p response #=> 200 OK
  @sina-weibo.list.rules.empty? #=> true
```



## Running Tests

Make sure you have the config file mentioned above at config/sina-weibo.yml

```ruby
 rake test
```

## Contributing to sina-weibo-rules
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 The Able Few. See LICENSE.txt for
further details.


