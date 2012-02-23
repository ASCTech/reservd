class AttributeType < ActiveRecord::Base

  has_many :attributes

  DATATYPES = ['boolean', 'string', 'integer', 'date']
  
  validates_inclusion_of :data_type, :in => DATATYPES, :allow_nil => false

end
