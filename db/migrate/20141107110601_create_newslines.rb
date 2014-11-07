class CreateNewslines < ActiveRecord::Migration
  def change
    create_table :newslines do |t|
      t.integer :newsline_element_id

      t.timestamps
    end
  end
end
