require 'spec_helper'

describe Resource do

  let(:resource) { create(:resource) }

  it 'should be valid from FactoryGirl' do
    resource.should be_valid
  end

  describe 'interaction with attributes' do

    let(:boolean_attribute) { create(:boolean_attribute) }

    it 'should allow accessing an attribute by its name' do
      resource.attributes.create!(boolean_attribute.attributes)
      resource.send(boolean_attribute.name).should == boolean_attribute.value
    end

  end

end
