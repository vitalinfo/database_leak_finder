# DatabaseLeakFinder [![Circle CI](https://circleci.com/gh/vitalinfo/database_leak_finder.svg?style=svg)](https://circleci.com/gh/vitalinfo/database_leak_finder) 

## Installation

Add the following to your Gemfile:
```ruby
gem 'database_leak_finder'
```

## Usage

Add this line to your `spec_helper.rb`
```ruby
config.include DatabaseLeakFinder
```

### Ignoring Tables
You may have some tables that you don't want to report.

Add this line to your `spec_helper.rb` before `config.include DatabaseLeakFinder`
```ruby
DatabaseLeakFinder.config(ignored_tables: [list of tables])
```

## Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
