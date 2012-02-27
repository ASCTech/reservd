class AttributeType < ActiveRecord::Base

  has_many :attributes

  DATATYPES = ['boolean', 'string', 'integer', 'date']

  validates_presence_of :name
  validates_inclusion_of :data_type, :in => DATATYPES, :allow_nil => false
  validates_uniqueness_of :name

  before_save :methodize_name

  def methodize_name
    self[:name] = self[:name].strip
    self[:name] = self[:name].downcase
    self[:name] = self[:name].gsub(/[\s-]/, '_')     #replace all whitespace and hyphens with underscores
    self[:name] = self[:name].gsub(/^[0-9]/, '')     #remove leading digits
    self[:name] = self[:name].gsub(/[^a-z0-9_]/, '') #remove any characters that are not alpha, numeric or underscore
  end

end
