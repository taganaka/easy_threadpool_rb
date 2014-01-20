# EasyThreadpool

  This gem has been written keeping semplicity in mind

  It implements Thread Pool Pattern described here http://en.wikipedia.org/wiki/Thread_pool_pattern

  Recommended for I/O activities are easily parallelizable, such as downloading remote resources, web scraping, bulk API calls, etc 

## Installation

Add this line to your application's Gemfile:

    gem 'easy_threadpool'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_threadpool

## Usage

```ruby
require "easy_threadpool"
pool = Thread.pool(10)

20.times {
  pool.process do 
    # Put your slow task here
    sleep rand(0.3..2)
    puts "Task consumed by worker ##{Thread.current[:id]}"
  end
}

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
