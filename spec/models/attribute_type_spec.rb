require 'spec_helper'

describe AttributeType do
  let(:boolean_type) { create(:boolean_type) }
  let(:date_type)    { create(:date_type) }
  let(:string_type)  { create(:string_type) }
  let(:integer_type) { create(:integer_type) }


  it 'should be valid from FactoryGirl' do
    boolean_type.should be_valid
    date_type.should be_valid
    string_type.should be_valid
    integer_type.should be_valid
  end

  describe 'validations' do

    it 'should not allow attribute types with the same name' do
      AttributeType.create!(:name => 'is_a_thing', :data_type => 'boolean')
          AttributeType.new(:name => 'is_a_thing', :data_type => 'boolean').should_not be_valid
          AttributeType.new(:name => 'is_a_thing', :data_type => 'integer').should_not be_valid
    end

    it 'should validate presence of name' do
      AttributeType.new(:data_type => 'string').should_not be_valid
    end

  end

end
