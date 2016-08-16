require 'spec_helper'

RSpec.describe DatabaseLeakFinder::Handler do
  it do
    should respond_to :config
    should respond_to :log_example
    should respond_to :find_leaks
  end
end