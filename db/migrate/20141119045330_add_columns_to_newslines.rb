class AddColumnsToNewslines < ActiveRecord::Migration
  def change
    add_column :newslines, :name, :string
    add_column :newslines, :body, :text
    add_column :newslines, :status, :integer
    remove_column :newslines, :newsline_element_id, :integer
  end
end
