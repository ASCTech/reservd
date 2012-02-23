class AddResourceTypeToResource < ActiveRecord::Migration
  def change
    add_column :resources, :resource_type_id, :string
  end
end
