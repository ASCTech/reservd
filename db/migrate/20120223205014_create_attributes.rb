class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.references :attribute_type
      t.references :resource
      t.text       :value
      t.timestamps
    end
  end
end
