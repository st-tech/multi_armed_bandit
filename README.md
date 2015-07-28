# MultiArmedBandit

This repo contains Ruby code for solving Multi-Armed Bandit problems. This includes the following algorithms:

* Epsilon-Greedy
* Softmax (Boltzmann)

Other major algorithms are under development.

## Installation

By executing the following line, you can install the gem file from GitHub.

    $ gem specific_install -l 'git://github.com/vasilyjp/multi_armed_bandit.git'


## Usage

```ruby
require 'multi_armed_bandit'
include MultiArmedBandit

# Create a object
sm = MultiArmedBandit::Softmax.new(0.01, 3)

# Trial 1
probs = sm.bulk_update([1000,1000,1000], [72,57,49])
# Trial 2
probs = sm.bulk_update([1000,1000,1000], [65,46,52])
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vasilyjp/multi_armed_bandit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

