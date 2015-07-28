# MultiArmedBandit

This repo contains Ruby code for solving Multi-Armed Bandit problems. This includes the following algorithms:

* Softmax
* Epsilon-Greedy (under development)

## Installation

By executing the following line, you can install the gem from the GitHub repo.

    $ gem specific_install -l 'git://github.com/vasilyjp/multi_armed_bandit.git'


## Usage

Include MultiArmedBandit class by putting the following code.
```ruby
require 'multi_armed_bandit'
include MultiArmedBandit
```

Create an object of Softmax class. The first arg is temperature. If we set temperature = 0.0, this will give us deterministic choice of the arm which has highest value. In contrast, if we set temperature = ∞, all actions have nearly the same probability. The second arg is number of arms. In a pracitcal sense, temperature tend to be between 0.01 and 1.0.
```ruby
sm = MultiArmedBandit::Softmax.new(0.01, 3)
```

```ruby
# Trial 1
probs = sm.bulk_update([1000,1000,1000], [72,57,49])
counts = probs.map{|p| (p*3000).round }

# Trial 2
probs = sm.bulk_update(counts, [154,17,32])
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vasilyjp/multi_armed_bandit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

