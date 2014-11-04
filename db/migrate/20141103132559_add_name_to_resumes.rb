class AddNameToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :name, :string
  end
end
