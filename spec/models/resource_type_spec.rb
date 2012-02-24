require 'spec_helper'

describe ResourceType do

  let(:resource_type) { create(:resource_type) }

  it 'should be vaild from FactoryGirl' do
    resource_type.should be_valid
  end

end
