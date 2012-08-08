FactoryGirl.define do

  factory :resource_type do
    name 'Room'
  end

  factory :resource do
    name 'Room of Requirement'
    type nil
    resource_type
  end

  factory :property_type do
    factory :boolean_type do
      name 'has_projector'
      data_type 'boolean'
    end
    factory :string_type do
      name 'description'
      data_type 'string'
    end
    factory :integer_type do
      name 'number_of_seats'
      data_type 'integer'
    end
    factory :date_type do
      name 'date_built'
      data_type 'date'
    end
  end

  factory :property do
    resource
    factory :boolean_property do
      association :property_type, :factory => :boolean_type
    end
    factory :string_property do
      association :property_type, :factory => :string_type
    end
    factory :integer_property do
      association :property_type, :factory => :integer_type
    end
    factory :date_property do
      association :property_type, :factory => :date_type
    end
  end

end
