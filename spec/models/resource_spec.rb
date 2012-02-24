require 'spec_helper'

describe Resource do

  let(:resource) { create(:resource) }

  it 'should be valid from FactoryGirl' do
    resource.should be_valid
  end

end
