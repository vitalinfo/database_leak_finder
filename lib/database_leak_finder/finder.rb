module DatabaseLeakFinder
  class Finder
    IGNORED_SYSTEM_TABLES = ['ar_internal_metadata', 'schema_migrations', 'pg_stat_statements']

    def initialize(options)
      @ignored_tables = (options[:ignored_tables] || []).map(&:to_s) + IGNORED_SYSTEM_TABLES
    end

    def process
      return [] unless ActiveRecord::Base.connected?
      filtered_tables.each_with_object({}) do |table, result|
        amount = count_for(table)
        result[table] = amount unless amount.zero?
        result
      end
    end

    private
    def count_for(table)
      ActiveRecord::Base.connection.select_value("SELECT COUNT(*) FROM #{table}").to_i
    rescue
      raise StandardError, "An error occurred while try to count '#{table}'"
    end

    def filtered_tables
      tables - @ignored_tables
    end

    def tables
      ActiveRecord::Base.connection.data_sources
    end
  end
end
