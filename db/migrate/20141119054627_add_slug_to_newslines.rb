class AddSlugToNewslines < ActiveRecord::Migration
  def change
    add_column :newslines, :slug, :string
    add_index :newslines, :slug, unique: true
  end
end
