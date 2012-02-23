class Attribute < ActiveRecord::Base

  belongs_to :resource
  belongs_to :attribute_type

end
