class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :employer_id
      t.string :name
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
