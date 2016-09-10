require 'spec_helper'
describe 'NodeJS' do

  context 'with defaults for all parameters' do
    it { should contain_class('NodeJS') }
  end
end
