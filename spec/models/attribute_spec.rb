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

end
