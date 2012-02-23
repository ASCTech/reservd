class Attribute < ActiveRecord::Base

  belongs_to :resource
  belongs_to :attribute_type

  def value
    send "#{attribute_type.data_type}_value"
  end

end
