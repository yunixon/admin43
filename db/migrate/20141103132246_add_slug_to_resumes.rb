class AddSlugToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :slug, :string
    add_index :resumes, :slug, unique: true
  end
end
