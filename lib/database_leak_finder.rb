require 'database_leak_finder/handler'

module DatabaseLeakFinder
  class << self
    def included(base)
      base.after(:each) do |example|
        DatabaseLeakFinder::Handler.log_example(example)
      end

      base.after(:all) do
        DatabaseLeakFinder::Handler.find_leaks
      end

      DatabaseLeakFinder.config({}) unless DatabaseLeakFinder::Handler.options
    end

    def config(options)
      DatabaseLeakFinder::Handler.config(options)
    end
  end
end