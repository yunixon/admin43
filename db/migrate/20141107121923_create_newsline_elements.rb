class CreateNewslineElements < ActiveRecord::Migration
  def change
    create_table :newsline_elements do |t|
      t.integer :element_id
      t.string :element_type

      t.timestamps
    end
  end
end
