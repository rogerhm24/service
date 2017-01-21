class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users,:plan_id,:integer # Adding Plan Id column to the Users Database (1 basic , 2 premium)
  end
end
