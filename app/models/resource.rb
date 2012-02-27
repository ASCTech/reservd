class Resource < ActiveRecord::Base

  belongs_to :resource_type
  has_many :properties

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

end
