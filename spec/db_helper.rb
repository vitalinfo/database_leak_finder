require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define(version: 1) do
  create_table "tests", force: true do |t|
    t.string   "value"
  end
end

class Test < ActiveRecord::Base
end