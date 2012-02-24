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


end
