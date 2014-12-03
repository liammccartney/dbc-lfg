class AddSocratesIdToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :socrates_id, :integer
  end
end
