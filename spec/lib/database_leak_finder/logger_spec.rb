require 'spec_helper'

RSpec.describe DatabaseLeakFinder::Logger do
  subject { described_class.new }

  it do
    should respond_to :log
  end
end