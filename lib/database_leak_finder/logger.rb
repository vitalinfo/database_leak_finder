require 'highline'

module DatabaseLeakFinder
  class Logger
    def log(example, leaks)
      puts <<-LOG.strip_heredoc
        \n
        #{HighLine.color('#### Leaking Spec', :red)}
        The spec '#{HighLine.color(spec_path_for(example), :red, :underline)}' leaves the following rows in the database:
      LOG
      leaks.each(&method(:log_leak))
    end

    private
    def spec_path_for(example)
      example.metadata[:example_group][:file_path]
    end

    def log_leak(table, count)
      puts "     - #{HighLine.color(count.to_s, :red)} #{'row'.pluralize(count)} for the #{HighLine.color(table, :white, :underline)} table"
    end
  end
end
