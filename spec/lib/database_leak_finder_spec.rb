require 'spec_helper'

RSpec.describe DatabaseLeakFinder do
  it { should respond_to :config }

  describe 'should have after hooks' do
    include described_class
    example = self
    it do
      [{hook: '@after_example_hooks', line: 9},
       {hook: '@after_context_hooks', line: 13}].each do |attr|
        proc = example.hooks.instance_variable_get(attr[:hook]).items_and_filters.flatten.first.block
        expect(proc.source_location.first).to match(/database_leak_finder\/lib\/database_leak_finder\.rb\z/)
        expect(proc.source_location.last).to eq attr[:line]
      end
    end
  end

  describe 'should have configs' do
    described_class.config(ignored_tables: ['test'])
    include described_class
    it do
      expect(DatabaseLeakFinder::Handler.send(:finder)
                 .instance_variable_get('@ignored_tables')).to eq ['test', 'ar_internal_metadata', 'schema_migrations']
    end
  end
end