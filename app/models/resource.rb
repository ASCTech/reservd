class Resource < ActiveRecord::Base

  belongs_to :resource_type
  has_many :attributes

  def method_missing(method, *args, &block)
    super unless attributes.map(&:name).include? method.to_s
 
    attributes.each do |attribute|
      next unless attribute.name == method.to_s
      return attribute.value
    end
    super
  end

end
