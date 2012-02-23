class AddDataTypeColumnsToAttribute < ActiveRecord::Migration
  def change
    remove_column :attributes, :value
    add_column :attributes, :boolean_value, :boolean
    add_column :attributes, :integer_value, :integer
    add_column :attributes, :string_value,  :string
    add_column :attributes, :date_value,    :date
  end
end
