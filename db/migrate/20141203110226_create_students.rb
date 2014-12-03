class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :socrates_id
      t.references :cohort

      t.timestamps
    end
  end
end
