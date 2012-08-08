class RenameAttributeTablesToProperty < ActiveRecord::Migration
  def change
    rename_table :attributes, :properties
    rename_table :attribute_types, :property_types
    rename_column :properties, :attribute_type_id, :property_type_id
  end
end
