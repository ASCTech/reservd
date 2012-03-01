require 'spec_helper'

describe Property do

  let(:resource)         { create(:resource) }
  let(:boolean_property) { create(:boolean_property) }
  let(:date_property)    { create(:date_property) }
  let(:string_property)  { create(:string_property) }
  let(:integer_property) { create(:integer_property) }

  it 'should be valid from FactoryGirl' do
    boolean_property.should be_valid
    date_property.should be_valid
    string_property.should be_valid
    integer_property.should be_valid
  end

  describe 'interacting with value' do

    it 'should use the correct column' do
      types = { boolean_property => false, date_property => Date.today, string_property => 'This is a string', integer_property => 43 }
      types.each do |property, new_value|
        property.value.should be_nil
        property.value.should == property.send("#{property.data_type}_value")
        property.update_attribute(:value, new_value)
        property.value.should == new_value
        property.value.should == property.send("#{property.data_type}_value")

        property.value = nil
        property.value.should be_nil
        property.value.should == property.send("#{property.data_type}_value")
        property.value = new_value
        property.value.should == new_value
        property.value.should == property.send("#{property.data_type}_value")
      end
    end

  end

  describe 'creation' do

    let(:boolean_type) { create(:boolean_type) }

    it 'should allow setting value instead of the specific column' do
      attr = Property.create!(:property_type_id => boolean_type, :resource_id => resource, :value => true)
      attr.value.should be_true
      attr.value.should == attr.boolean_value
    end

  end

  describe 'validations' do

    let(:string_type) { create(:string_type) }

    it 'should allow valid records' do
      Property.new(:property_type_id => string_type.id, :resource_id => resource.id).should be_valid
      Property.new(:property_type => string_type, :resource => resource).should be_valid
      boolean_property.property_type_id = string_type.id
      boolean_property.should be_valid
      boolean_property.resource_id = create(:resource).id
      boolean_property.should be_valid
    end

    it 'should validate presence of property type' do
      Property.new(:resource_id => resource.id).should_not be_valid
      Property.new(:resource => resource).should_not be_valid
    end

    it 'should validate presence of resource' do
      Property.new(:property_type_id => string_type.id).should_not be_valid
      Property.new(:property_type => string_type).should_not be_valid
    end

    it 'should validate the existence of the property type' do
      Property.new(:property_type_id => 134908234098).should_not be_valid
      boolean_property.property_type_id = 234234
      boolean_property.should_not be_valid
    end

    it 'should validate the existence of the resource' do
      Property.new(:resource_id => 134908234098).should_not be_valid
      boolean_property.resource_id = 32490823
      boolean_property.should_not be_valid
    end

    it 'should not allow multiple instances of the same property for a single resource' do
      resource.properties.create(string_property.attributes).should be_valid
      resource.properties.new(string_property.attributes).should_not be_valid
    end

    it 'should allow multiple resources to have the same property type' do
      resource.properties.create(string_property.attributes).should be_valid
      create(:resource).properties.create(string_property.attributes).should be_valid
    end

  end

  describe 'delegation' do

    it 'should get data_type from propertyType' do
      boolean_property.data_type.should == boolean_property.property_type.data_type
         date_property.data_type.should ==    date_property.property_type.data_type
      integer_property.data_type.should == integer_property.property_type.data_type
       string_property.data_type.should ==  string_property.property_type.data_type
    end

    it 'should get name from propertyType' do
      boolean_property.name.should == boolean_property.property_type.name
         date_property.name.should ==    date_property.property_type.name
      integer_property.name.should == integer_property.property_type.name
       string_property.name.should ==  string_property.property_type.name

    end

  end

end
