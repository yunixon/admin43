class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
