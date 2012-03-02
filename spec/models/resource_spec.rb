require 'spec_helper'

describe Resource do

  let(:resource) { create(:resource) }

  it 'should be valid from FactoryGirl' do
    resource.should be_valid
  end

  describe 'interaction with properties' do

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

  describe 'property types' do

    let!(:integer_type) { create(:integer_type) }
    let!(:boolean_type) { create(:boolean_type) }

    it 'should know which property types can be added' do

      resource.available_property_types.should include(integer_type)
      resource.available_property_types.should include(boolean_type)

      resource.properties.create!(:property_type_id => integer_type.id, :integer_value => 27)
      resource.available_property_types.should_not include(integer_type)
      resource.available_property_types.should     include(boolean_type)

      resource.properties.create!(:property_type_id => boolean_type.id, :boolean_value => true)
      resource.available_property_types.should_not include(integer_type)
      resource.available_property_types.should_not include(boolean_type)
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
