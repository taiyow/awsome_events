class RemoveDatetimeToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :datetime, :string
  end
end
