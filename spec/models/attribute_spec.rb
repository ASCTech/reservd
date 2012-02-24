require 'spec_helper'

describe Attribute do

  let!(:resource)    { create(:resource) }
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

    it 'should use boolean_value for boolean attributes' do
      boolean_attribute.value.should be_nil
      boolean_attribute.value.should == boolean_attribute.boolean_value
      new_value = false
      boolean_attribute.update_attribute(:value, new_value)
      boolean_attribute.value.should == new_value
      boolean_attribute.value.should == boolean_attribute.boolean_value
    end

    it 'should use date_value for date attributes' do
      date_attribute.value.should be_nil
      date_attribute.value.should == date_attribute.date_value
      new_value = Date.today
      date_attribute.update_attribute(:value, new_value)
      date_attribute.value.should == new_value
      date_attribute.value.should == date_attribute.date_value
    end

    it 'should use string_value for date attributes' do
      string_attribute.value.should be_nil
      string_attribute.value.should == string_attribute.string_value
      new_value = 'This is a string value'
      string_attribute.update_attribute(:value, new_value)
      string_attribute.value.should == new_value
      string_attribute.value.should == string_attribute.string_value
    end

    it 'should use integer_value for integer attributes' do
      integer_attribute.value.should be_nil
      integer_attribute.value.should == integer_attribute.integer_value
      new_value = 43
      integer_attribute.update_attribute(:value, new_value)
      integer_attribute.value.should == new_value
      integer_attribute.value.should == integer_attribute.integer_value
    end

  end

end
