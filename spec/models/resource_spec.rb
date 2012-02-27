require 'spec_helper'

describe Resource do

  let(:resource) { create(:resource) }

  it 'should be valid from FactoryGirl' do
    resource.should be_valid
  end

  describe 'interaction with attributes' do

    let(:string_attribute) { create(:string_attribute) }

    before do
      @int_attr = create(:integer_attribute, :resource => resource, :value => 88)
    end

    it 'should allow accessing an attribute by its name' do
      resource.send(@int_attr.name).should == 88
    end

    it 'should allowing setting the value of an attribute by its name' do
      resource.send("#{@int_attr.name}=", 44)
      resource.send(@int_attr.name).should == 44
    end

  end

  describe 'updating' do

    it 'should be able to update name' do
      new_name = 'This is the new name'
      resource.name = new_name
      resource.save
      resource.name.should == new_name
    end

  end

end
