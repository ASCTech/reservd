class Resource < ActiveRecord::Base

  belongs_to :resource_type
  has_many :properties
  has_many :property_types, :through => :properties

  validates_uniqueness_of :name, :scope => :resource_type_id
  validates_presence_of :resource_type_id
  validates :resource_type, :existence => true


  def method_missing(method, *args, &block)
    if method.to_s[-1,1] == '='
      properties.each do |property|
        next unless "#{property.name}=" == method.to_s
        return property.value = args[0]
      end
      super
    end

    properties.each do |property|
      next unless property.name == method.to_s
      return property.value
    end
    super
  end

  def available_property_types
    PropertyType.all.reject do |property_type|
      property_types.include? property_type
    end
  end

end
