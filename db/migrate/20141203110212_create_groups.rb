class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :cohort
      t.references :user

      t.timestamps
    end
  end
end
