require 'spec_helper'

describe Resource do

  let(:resource) { create(:resource) }

  it 'should be valid from FactoryGirl' do
    resource.should be_valid
  end

  describe 'interaction with propertys' do

    let(:string_property) { create(:string_propibute) }

    before do
      @int_prop = create(:integer_property, :resource => resource, :value => 88)
    end

    it 'should allow accessing an property by its name' do
      resource.send(@int_prop.name).should == 88
    end

    it 'should allowing setting the value of an property by its name' do
      resource.send("#{@int_prop.name}=", 44)
      resource.send(@int_prop.name).should == 44
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

  describe 'validations' do

    let(:resource_type) { create(:resource_type) }

    it 'should not allow non-existent resource types' do
      Resource.new(:resource_type_id => resource_type.id, :name => 'Resource 1239').should be_valid
      Resource.new(:resource_type_id => 234230948,       :name => 'Resource 1902').should_not be_valid
    end

    it 'should not allow resources of the same resource type to have the same name' do
      attrs = { :resource_type_id => resource_type.id, :name => 'Same name' }
      Resource.create!(attrs)
      Resource.new(attrs).should_not be_valid
    end

  end

end
