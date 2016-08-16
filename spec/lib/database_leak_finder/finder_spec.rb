require 'spec_helper'
require 'db_helper'

RSpec.describe DatabaseLeakFinder::Finder do
  subject { described_class.new({}) }
  it do
    should respond_to :process
  end

  it do
    expect(subject.process).to be_empty
    (rand(10) + 1).times{ Test.create }
    tables = subject.process
    expect(tables).to eq "tests" => Test.count
    Test.destroy_all
  end
end