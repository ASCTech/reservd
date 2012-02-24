require 'spec_helper'

describe Attribute do

  let(:resource)          { create(:resource) }
  let(:boolean_attribute) { create(:boolean_attribute) }
  let(:date_attribute)    { create(:date_attribute) }
  let(:string_attribute)  { create(:string_attribute) }
  let(:integer_attribute) { create(:integer_attribute) }

  it 'should be valid from FactoryGirl' do
    boolean_attribute.should be_valid
    date_attribute.should be_valid
    string_attribute.should be_valid
    integer_attribute.should be_valid
  end

  describe 'interacting with value' do

    it 'should use the correct column' do
      types = { boolean_attribute => false, date_attribute => Date.today, string_attribute => 'This is a string', integer_attribute => 43 }
      types.each do |attribute, new_value|
        attribute.value.should be_nil
        attribute.value.should == attribute.send("#{attribute.data_type}_value")
        attribute.update_attribute(:value, new_value)
        attribute.value.should == new_value
        attribute.value.should == attribute.send("#{attribute.data_type}_value")
      end
    end

  end

  describe 'creation' do

    let(:boolean_type) { create(:boolean_type) } 

    it 'should allow setting value instead of the specific column' do
      Attribute.create!(:attribute_type_id => boolean_type, :resource_id => resource, :value => true)
    end

  end

  describe 'validations' do

    let(:string_type) { create(:string_type) }

    it 'should validate presence of attribute type' do
      Attribute.new(:attribute_type_id => 1, :resource_id => 2).should be_valid
      Attribute.new(:attribute_type => string_type, :resource_id => resource).should be_valid
      Attribute.new(:resource_id => 2).should_not be_valid
      Attribute.new(:resource => resource).should_not be_valid
    end

    it 'should validate presence of resource' do
      Attribute.new(:attribute_type_id => 1, :resource_id => 2).should be_valid
      Attribute.new(:attribute_type => string_type, :resource_id => resource).should be_valid
      Attribute.new(:attribute_type_id => 1).should_not be_valid
      Attribute.new(:attribute_type => string_type).should_not be_valid
    end
  end

end
