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

  def update_attribute(name, val)
    if name.to_sym == :value
      update_attribute("#{data_type}_value", val)
    else
      super
    end
  end

  def initialize(attributes=nil, options={})
    if attributes.present? && attributes.symbolize_keys.include?(:value)
      attr_type_data_type = AttributeType.find(attributes[:attribute_type_id]).data_type
      attributes["#{attr_type_data_type}_value"] = attributes.delete(:value)
    end
    super
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
