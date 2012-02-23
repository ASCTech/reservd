class Resource < ActiveRecord::Base

  belongs_to :resource_type
  has_many :attributes

end
