class ChangeResumeStatusType < ActiveRecord::Migration
  def change
    change_column :resumes, :status, :string
  end
end
