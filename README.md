# Undecided

A safe way to evaluate a string boolean expression to make a decision

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'undecided'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install undecided

## Usage

Initialize a decider instance

```ruby
decider = Undecided::Decider.new
```

Call decide method passing an string as a boolean expression and a hash with values (values must be boolean type or (1 or 0)

```ruby
expression = 'A&B'
values = { A:1, B:1 }
decider.decide(expression, values)
# Return true cuz A&B means that (A==true & B==true)
```

ATM the available operators are:
* & = AND
* | = OR
* () = Grouper

Imagine you have a todo list
```ruby
todo_a = {
			A:false,
			B:false,
			C:false
		 }
 # A,B and C are tasks
 # False means that task is incomplete
```
And you have a second todo list but, to start it, some conditions have to be fulfilled. i.e you have finished A and C or A and B. so

```ruby
# Start todo_b if 
 
# common way

if todo_a[:A] == true & todo_a[:C] == true ||  todo_a[:A] == true and todo_a[:c]==true
  # start new todo list
end

# VS

decider = Undecided::decider.new

if decider.decide('A&B|A&C', todo_a)
  # start a new todo list
end

```

You can also evaluate more complex expression i.e
```ruby
rule = 'A&B&!C|(!C|!A)|D&F'
values = { A: 1, B: 1, C: 0, D: 0, F: 0 }

decider = Undecided::Decider.new
decider.decide(rule, values) #Return true
```
 'A&B&!C|(!C|!A)|D&F'


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jotase/undecided.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


