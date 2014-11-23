class ChangeJobStatusType < ActiveRecord::Migration
  def change
    change_column :jobs, :status, :string
  end
end
