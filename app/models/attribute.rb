class Attribute < ActiveRecord::Base

  belongs_to :resource
  belongs_to :attribute_type

  delegate :data_type, :name, :to => :attribute_type

  validates_presence_of :attribute_type_id, :resource_id
  validates :resource,       :existence => true
  validates :attribute_type, :existence => true

  def value
    send "#{data_type}_value"
  end

  def value=(val)
    send "#{data_type}_value=", val
  end

end
