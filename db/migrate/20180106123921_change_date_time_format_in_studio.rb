class ChangeDateTimeFormatInStudio < ActiveRecord::Migration[5.1]
  def change
    change_column :studios, :opening_time, :time
    change_column :studios, :closing_time, :time
  end
end
