class RemoveYearFromCohorts < ActiveRecord::Migration
  def change
    remove_column :cohorts, :year
  end
end
