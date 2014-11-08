class AddNewslineIdToNewslineElements < ActiveRecord::Migration
  def change
    add_column :newsline_elements, :newsline_id, :integer
  end
end
