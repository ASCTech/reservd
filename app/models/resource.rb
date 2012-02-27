class Resource < ActiveRecord::Base

  belongs_to :resource_type
  has_many :attributes

  def method_missing(method, *args, &block)
    if method.to_s[-1,1] == '='
      attributes.each do |attribute|
        next unless "#{attribute.name}=" == method.to_s
        return attribute.value = args[0]
      end
      super
    end

    attributes.each do |attribute|
      next unless attribute.name == method.to_s
      return attribute.value
    end
    super
  end

end
