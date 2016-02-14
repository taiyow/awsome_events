class ChangeColumnToEvent < ActiveRecord::Migration
  def change
    change_column :events, :end_time, :datetime, null: false
  end
end
