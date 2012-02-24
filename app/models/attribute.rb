class Attribute < ActiveRecord::Base

  belongs_to :resource
  belongs_to :attribute_type

  delegate :data_type, :to => :attribute_type

  validates_presence_of :attribute_type_id, :resource_id
  validate :resource_exists
  validate :attribute_type_exists

  def value
    send "#{data_type}_value"
  end

  def value=(val)
    send "#{data_type}_value=", val
  end

private

  def resource_exists
    unless Resource.exists?(resource_id)
      errors.add(:base, 'Resource does not exist')
    end
  end

  def attribute_type_exists
    unless AttributeType.exists?(attribute_type_id)
      errors.add(:base, 'Attribute type does not exist')
    end
  end

end
