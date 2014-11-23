class ChangeNewslineStatusType < ActiveRecord::Migration
  def change
    change_column :newslines, :status, :string
  end
end
