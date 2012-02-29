class Property < ActiveRecord::Base

  belongs_to :resource
  belongs_to :property_type

  delegate :data_type, :name, :pretty_name, :to => :property_type

  validates_presence_of :property_type_id, :resource_id
  validates :resource,      :existence => true
  validates :property_type, :existence => true

  def value
    send "#{data_type}_value"
  end

  def value=(val)
    send "#{data_type}_value=", val
  end

end
